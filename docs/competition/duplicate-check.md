# 严格语义查重与选题记录

日期：2026-10-16。范围：本机永久项目注册表（224个章节）、MoonCakes CLI/包页、GitHub 仓库与代码索引、moonbitlang/awesome-moonbit。按本地 osc2026-guide 的 Project Research Guide 执行。查询/原始 JSON、下载源码与接口留在仓库外审计目录；下表为可公开摘要，不含凭据。

## 需求落地与完成门槛

依据：Apple plist 为应用包/配置文件实际交换格式，Python 标准库 plistlib 提供成熟跨生态基线；本轮发现 MoonBit proton 真实生成 Info.plist/LaunchAgent，Typst 真实读取 plist 主题。因此配置读写需求并非仅凭关键词推测。没有用户访谈或真实采用量数据，三类复用价值是基于这些现有工作流的工程推断，不冒称已有客户。

- 打包系统：Info.plist XML → typed tree、Test/Replace → binary artifact → 解码检查版本。
- 迁移工具：带 Data/Date 的 binary → XML → typed tree；不能表示的类型显式失败。
- 元数据浏览器：binary UID 路径查询 → 语义变更计划 → 事务回放；不执行归档对象。

基线与完成标准：binary trailer/对象表、XML plist 类型、保序字典、整数/Unicode/date/data 边界；用 Python plistlib 两个方向独立核验，且三个消费者流程可运行。核心是 typed codec 与结构编辑，不是借 XML 库套固定模板。范围与不支持内容见 README；达到代码行数不替代这些验收。

## 三个不同领域候选

八维分别为广度、用户多样性、复用、低重合风险、实现深度、可验证性、工期可行性、维护性，1–5分（越高越好，主观工程评估，非实测指标）。硬失败不由总分抵消。

| 候选 | 八维分值 | 总分 | 门禁 |
|---|---|---|---|
| gettext PO/MO 本地化运行时 | 5/5/5/1/4/5/4/4 | 33 | 淘汰：成熟直接重合 |
| vCard 联系人交换 | 4/4/4/1/4/5/4/4 | 30 | 淘汰：直接重合 |
| binary/XML typed plist 与结构编辑 | 4/4/5/4/5/5/4/4 | 35 | 通过有界查重，自动选择 |

- [YanFangNie/moongettext@0.1.1](https://mooncakes.io/docs/YanFangNie/moongettext)：实际读 README、plural_rule.mbt、plural_test.mbt，PO/MO、plural/runtime 的核心任务已经覆盖，不另建改名替代。
- [haol-05/moon-vcard@0.3.0](https://mooncakes.io/docs/haol-05/moon-vcard)：实际读 README、vcard.mbt 与测试；注册表另有 angela/vcf，不因换账户或改标题放行。
- plist：有完整 binary/XML typed codec 的跨生态基线，但下列 MoonBit 相邻项目的核心任务不同。

## 查询与限制

MoonCakes `moon search ... --limit 100`：gettext/localization/i18n、vcard、plist/bplist、property list/propertylist/binary plist/bplist00、CFPropertyList/NSKeyedArchiver、Info.plist/LaunchAgent。另行排除了 stl/mesh、recurrence、survival、VCD、EXIF、kriging 等有现存项目方向；它们只到 metadata 筛选，不冒称逐份源码审核。

GitHub `per_page=100`：仓库 `plist language:MoonBit`、`property list moonbit`、`moonplist`；代码 bplist00/plistlib/parse_plist/read_plist/CFPropertyList 及行为反向检索。读取官方 awesome 清单、相邻仓库树、README、关键源码/测试或生成接口。

精确 plist/bplist00 等结果少，但广义 `binary property list language:MoonBit`（非引号精确短语）返回336项，**只读取第一页100项**；不视为穷尽。Moon search 的模糊关键词可能命中无关包，单模块匹配包展示也可能截断（如 snn_mbt 的78个匹配包只展示5个）；根据 metadata 判断领域，不用无关结果冒充完整源审。GitHub 默认索引有延迟，不覆盖私有/未索引仓库。检索失败、零命中、同名仓库不存在都不是绝对唯一证明。

2026-10-16 最后一次反向检查：`moon search plist --limit 100` 4模块，bplist 无模块；GitHub moonplist 仓库0项；`encode_binary plist language:MoonBit` 两个文件，实际读取 bobzhang/asciidoctor.mbt 的 pdf/rouge/keywords_wbtest.mbt 与 php_keywords.mbt，命中来自语法高亮词表（sqlite_udf_encode_binary / rplist），不是 plist codec。此时本项目尚未上传，后续搜索出现本项目属于自身预留，不算外部重复。

## 相邻能力矩阵（实际源码，不只比较名称）

| 项目 / 已核查证据 | 用户与任务 / 核心行为 | 输入输出 / 维护证据 | 重合分类与差异 |
|---|---|---|---|
| [typst.mbt syntect/settings.mbt](https://github.com/moonbitlang/typst.mbt/blob/main/syntect/settings.mbt) 与 syntect/pkg.generated.mbti | 主题配置读取；XML → JSON-like Settings | read_plist 明确拒绝 bplist00；无 binary writer、typed Date/Data/UID 双向模型 | 高度相邻的XML输入，不是直接完整替代；新项目独立typed codec可供主题读取层使用 |
| [mizchi/pkl-mbt](https://github.com/mizchi/pkl-mbt)，eval_render_plist.mbt 与 README | Pkl evaluator value → XML plist renderer | 单向渲染，不提供 binary decoder 与通用文档编辑 | 同方向不同功能；把通用二进制codec放进Pkl解释器会反向引入业务依赖 |
| [auto_launch@0.1.14](https://mooncakes.io/docs/moonbit-community/auto_launch)，proton sys/auto_launch/auto_launch.mbt | 跨平台启动注册，macOS XML模板 | 1890下载（本次查询快照，不是成熟度证明）；无通用typed decoder | 同方向不同功能；库可作为未来依赖，但不重复注册器 |
| [proton_package@0.4.0](https://mooncakes.io/docs/moonbit-community/proton_package)，package/lib/macos.mbt | 应用包构建与Info.plist输出 | 272下载（查询快照），定制模板输出 | 同方向不同功能；不与packager争夺核心任务 |
| moondesk / AnkerScale / moonflux 的 README | desktop/scale/deployment文档中使用plist | README中为启动或部署文件，未见通用codec声明 | 仅文档关联；未把其所有源码均已审计作为结论 |
| CPython plistlib | 通用跨生态成熟参考 | binary/XML双向、UID支持 | 非MoonBit生态重复，作为独立差分基准；不声称超越其兼容性 |

具体版本、下载量为查询时快照。Typst/read_plist 的源码和接口已读取；没有把整仓库所有测试均审计作为证据。Pkl及proton源码只用于查重，不复制、未验证其所有许可证；本项目代码按Apache-2.0原创发布，不混入权属未确认的代码。

## 独立建设判断与登记

独立库以纯核心包对接打包/主题/Pkl/检查器，避免依赖任何一方应用模型；binary typed object table、64-bit/UID/date/data、资源边界与事务路径编辑是独立主体，优于在单一模板发射器或解释器里硬塞完整codec。XML读取交集被明确承认，不以附加少量函数掩盖核心重复。

结论仅为：在以上已记录检索与源码边界内，未发现成熟、维护中的 MoonBit binary/XML typed plist 双向库直接替代本项目。不能证明绝对唯一，也不能保证未来没有新包。预留已在实现前持排他锁原子写入共享注册表；旧项目与历史均保留。只有实际发布和消费者验收完成后才能标记 completed。


## 2026-10-20 补丁发布前复核

在保留原候选、历史和选题边界的前提下，重新执行8个MoonCakes查询（每个limit100）：`plist`、`bplist`、`propertylist`、`NSKeyedArchiver`、`plistlib`、`CFPropertyList`、`binary plist`、`Info.plist`；另执行5个GitHub仓库/代码反向检索（每页100，排除本仓库）：plist仓库、bplist00代码、plist名称/说明/README、PropertyList代码、decode_binary+plist代码，并重新读取永久注册表。

- 当前MoonCakes结果包括本项目、proton/auto_launch/packaging，以及关键词误匹配的Bencode、JS Object、仿真项目；Bencode是BitTorrent格式，不是Apple plist。
- 实际复读Typst `syntect/settings.mbt`（明确拒绝binary，XML到Settings，Data报错）及Pkl的XML渲染实现：承认XML处理交集，但不是typed binary/XML双向编解码及结构编辑的直接替代。
- 读取proton的macOS打包/辅助程序plist模板、auto_launch rendering，以及justjavac auto-launch rendering；读取MoUI打包、lepus打包、cbhook服务和mukuro服务的plist相关实现，均为具体Info.plist/LaunchAgent XML生成，不是通用binary读写库。
- MoonDesk/moonflux/AnkerScale沿用先前README/元数据筛选；没有将其冒称为全源码审计。当前awesome清单也已复读。

结果：**在所记录的当前检索和源码覆盖范围内，未发现成熟维护的直接替代项目，继续维护MoonPlist**。这不证明全球唯一或其它项目全部源码无重合；XML读取和模板生成的真实功能交集不予隐瞒。原始检索、源码blob/SHA和比对证据保存在仓库外验收记录，不上传私人申报书。
