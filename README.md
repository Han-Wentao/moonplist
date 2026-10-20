# MoonPlist

纯 MoonBit 的 Apple Property List 类型化读写与结构编辑库。支持 `bplist00` 二进制和 plist 1.0 XML，面向应用打包、配置交换、元数据检查工具，而不是 macOS 系统设置写入器。

模块：`Han-Wentao/moonplist@0.1.1` · Apache-2.0 · 无第三方运行时依赖。

## 安装与最小使用

```sh
moon add Han-Wentao/moonplist@0.1.1
```

在消费方 `moon.pkg` 加入 `import { "Han-Wentao/moonplist" }`。可在可抛出错误的上下文调用：

```moonbit
let value = @moonplist.decode_xml("<plist><dict><key>name</key><string>demo</string></dict></plist>")
let edited = @moonplist.insert(value, "/version", @moonplist.Integer(2L))
let bytes = @moonplist.encode(edited, @moonplist.Binary)
assert_true(@moonplist.lookup(@moonplist.decode(bytes), "/version") == @moonplist.Integer(2L))
```

`main` 中须用 `try { ... } catch { ... }` 处理 `PlistError`，完整可运行代码见 `examples/workflows/main.mbt`。不依赖文件系统，调用方负责读取/保存 `Bytes`。

## 数据模型与接口

`Value` 区分 `Null / Boolean / Integer(Int64) / Unsigned(UInt64) / Real(Double) / Text / Data(Bytes) / Date(Double) / Uid(UInt64) / List / Dict`。Date 是自 2001-01-01 UTC 起的秒数；Unsigned 仅用于大于 Int64 最大值的整数。字典保序，键必须唯一且为字符串。公开数组可变，不能宣称深度不可变；编辑函数不改变输入，但未修改子树与 Copy 结果可能共享存储。

- `decode / encode / convert / detect_format`：字节入口；非 binary 头尝试 XML，不识别 OpenStep 文本。
- `decode_binary / encode_binary / inspect_binary`：对象表、引用宽度、trailer 及类型化值。
- `decode_xml / encode_xml(pretty=...)`：XML 字符串入口。
- `parse_pointer / format_pointer / lookup`：RFC 6901 转义路径；数组下标拒绝前导零，插入支持 `-`。
- `insert / replace / remove`：字典 upsert、数组插入、存在性检查；不能删除根。
- `apply_patch`：Add / Replace / Remove / Test / Copy / Move 顺序执行；失败不返回部分结果，也不修改输入。Move 不能移动到自己的子路径，同数组索引按删除后的数组解释。
- `diff`：生成可回放的语义补丁；字典递归，数组变化整体 Replace，不承诺最短编辑距离。
- `equivalent`：对有效无环树比较；忽略字典顺序，保持整数/实数类型区别，NaN 视为相等；不是通用循环图比较器。
- `parse_date / format_date`、base64/hex 编解码及 `validate`。

完整签名见根目录 `pkg.generated.mbti`。

## 三个下游闭环

运行 `moon run examples/workflows --target wasm-gc` 或 `--target js`：

1. **打包工具**：输入 Info.plist XML，先 Test 版本再修改版本、添加布尔配置，输出 binary；重新解码断言新版本。
2. **配置迁移**：输入含二进制 Data 与 UTC Date 的 binary，转换 XML 后重新解码，断言类型和值保留，而不是先丢成 JSON 字符串。
3. **元数据检查器**：查询 binary 中 UID，生成并回放配置差分；尝试转 XML 时收到明确错误，不把 UID 偷换成整数。

三个流程输出均以断言为验收，不执行操作系统配置变更。UID 只是整数标记，**不是 NSKeyedArchiver 对象反序列化**。

## 支持矩阵与明确边界

| 类型/能力 | binary | XML |
|---|---|---|
| bool、signed64 / unsigned64 整数 | 支持 | 支持 |
| IEEE real（含非有限值、负零） | 读32/64，写64 | 支持；NaN payload 不保留 |
| Unicode / Data / 有序字典 / 数组 | 支持 | 支持 |
| UTC 日期 | 有限 Double 秒，含小数 | 年1–9999、整秒 UTC；小数秒拒绝 |
| Null / UID64 | 支持 | 显式 Unsupported |
| UTF-8 / UTF-16 XML | 不适用 | 字节入口支持 BOM/常见 UTF-16 起始模式 |

XML 支持预定义/数字实体、注释、ASCII XML 名称的处理指令目标、元素内 CDATA、标准 Apple PUBLIC DTD 的原样声明或无外部标识的 `DOCTYPE plist`。不请求网络，不解析内部 DTD、不加载外部实体；非标准 DTD 写法拒绝。XML 是为 plist 设计的受限解析器，不是任意 XML 文档验证器，也不实现命名空间、任意属性、其他编码或 XML 1.1。声明仅接受 UTF-8/UTF-16；不提供声明与原始传输编码严格一致性证明。

binary 不支持集合、任意精度整数、超过64位 UID、非字符串字典键、归档对象实例化或 legacy OpenStep ASCII。只遍历根可达对象；验证全部对象偏移，但不保证未引用对象体合法，也不要求对象区间互不重叠。不保持引用共享身份、原始对象ID、字节布局或 NaN payload。解码后再写是类型化重建，不是原文件无损补丁。

## 限制与安全

`Limits::default()`：输入/输出 16 MiB、对象访问100000、容器元素100000、深度64（可配置1–256）。binary 引用图按**展开访问**预算，拒绝循环，防止小表重复引用指数膨胀。XML/二进制解码及编码检查字节和结构边界。`validate` 的单字符串检查使用 UTF-16 长度；实际 XML 输入/输出另检查 UTF-8 字节。并非严格内存配额：字符串转换、输出片段、调用方已建数组可能提前分配；不建议对不受信任输入取消限制。

错误为 `Invalid / Limit / Unsupported / PathError`，消息不保证稳定，也不提供统一字节定位。调用方负责并发控制，禁止在校验/编码时修改共享 Value。详见 `SECURITY.md`。

## 本地验证

已使用 moon 0.1.20261012 / moonc 0.10.15 验证。需要 Node 和 Python ≥3.8 运行 JS/差分门禁。

```sh
moon info
moon fmt --check
moon check --target wasm-gc --deny-warn
moon test --target wasm-gc --deny-warn
moon test --target js --deny-warn
moon run examples/workflows --target js
python scripts/differential.py
```

0.1.1 有 76 个命名测试（0.1.0 为 44 个），含畸形二进制、逐字节变异、XML 实体/声明、事务失败与差分回放。差分脚本用固定种子601016生成188个合成输入：Python plistlib → MoonPlist 与 MoonPlist → Python 各188次语义核验；覆盖整数边界、UTF-16代理对、Data、整秒/小数日期、UID/null及宽对象表。Python XML 输入的 CR/LF 以其解析结果为基准，写出方向另检查字符串与负零；不是全面标准认证或性能测试。

0.1.1 修复二进制对象数临界值、3/5/6/7 字节宽度、XML 长前导零字符引用、转义路径与差分中间态限额，以及 XML 注释/处理指令/文档外内容的词法校验。新增合法 XML 正控制、数组编辑模型、特殊键路径和512组 IEEE 位模式回归。`examples/interop/main.mbt` 是脚本生成的测试夹具，不计核心代码量。

CI 对 wasm-gc / wasm / js / native 做严格检查和构建，wasm-gc / js / Ubuntu native 运行测试与三个流程；wasm 仅编译。安装官方当前稳定版，版本会在日志中打印，未来版本可能有兼容性差异。最新真实结果见仓库 Actions，不能仅由徽章/本地命令推断通过。

## 参考与竞赛工程记录

原创实现，未复制 Python/Typst/Pkl 实现代码。参考边界见 `NOTICE`，选题矩阵、源码对比与检索限制见 `docs/competition/duplicate-check.md`。AI 参与情况见 `AI-USE.md`。不声称生态唯一，不自动上传中文申报书或完成报名。
