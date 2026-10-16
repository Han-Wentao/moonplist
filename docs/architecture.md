# 架构

1. model 定义保序 typed tree 与边界，不经 JSON 中转。
2. binary_header 先核验 trailer、表宽度、数量和所有偏移；decode 递归展开引用，用 active 栈拒绝循环、访问计数限制 DAG；writer 收集对象及字典键再确定引用宽度，生成偏移表及 trailer。
3. xml_text 处理字符/实体；xml_read 为受限前向 token reader，按上下文构建类型；xml_write 按真实 UTF-8 输出增量计数，无法表示的类型直接失败。
4. format 在 Bytes 与 XML UTF-8/UTF-16 之间桥接。date 为 Gregorian 日历与2001秒数转换，data_text 提供严格 base64/hex。
5. pointer 解析转义并约束数组下标；edit 重建路径祖先，patch 在局部变量中依次编辑；diff 以字典键生成确定性变化，数组整体替换。

性能取舍：树不缓存引用身份；重复引用按展开预算计数。小型配置字典线性查找，diff/等价比较可能二次复杂度；不宣称大数据库性能。没有流式大文件或零拷贝接口。

公共接口由 moon info 生成；examples/workflows 仅用公开接口，examples/interop 为固定种子合成夹具。所有示例、测试和生成接口均不计核心实现行数。
