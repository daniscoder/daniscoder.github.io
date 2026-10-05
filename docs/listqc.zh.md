# ListQC

**野外放炮质量控制**

这个工具用于根据处理系统计算出的属性对野外放炮进行质量控制。

程序读取带质量属性的作业班报，按给定标准评价每一张野外记录，并输出带质量系数的表格。结果一目了然：
立即能看出哪些炮点未通过检查，具体是哪个属性不合格。

![ListQC：共炮点表，信噪比低的记录被高亮](img/listqc.png)

!!! note "适用于旧系统的程序"
    ListQC 是为 Geovation 和 Geocluster（CGG）编写的：由这些系统中的作业计算属性，程序解析它们的班报。
    程序已不再开发，按原样发布。界面只有俄文。

## 下载

[:material-microsoft-windows: Windows](https://github.com/daniscoder/daniscoder.github.io/releases/download/ListQC/ListQC.exe){ .md-button .md-button--primary }

当前版本为 3.5，仅限 Windows。无需安装：程序就是一个文件。它是 32 位程序，但也能在 64 位 Windows 上运行。

示例是计算属性的作业及其生成的班报：

| 系统 | 作业 | 班报 |
|---|---|---|
| Geocluster | [Job_Geocluster.xjj](examples/listqc/Job_Geocluster.xjj) | [List_Geocluster.list](examples/listqc/List_Geocluster.list) |
| Geovation | [Job_Geovation.gsl](examples/listqc/Job_Geovation.gsl) | [List_Geovation.list](examples/listqc/List_Geovation.list) |

示例中的服务器名、用户名、项目名和坐标都已修改。

## 操作步骤

1. 在 Geovation 或 Geocluster 中运行类似示例的作业：它计算质量属性并写入班报。
2. 通过“文件 - 导入 - 炮点班报”或“检波点班报”（«Файл - Импорт - Листинг ПВ» / «Листинг ПП»）
   将班报导入 ListQC。
3. 设置标准，程序会评价每一张记录。
4. 以程序自身的格式保存结果，或导出。

## 属性和标准

属性对近偏移距和远偏移距分别计算：信号振幅和频率、环境噪声振幅和频率、信噪比。此外还有面波振幅和频率、
信号与面波之比以及总的环境噪声水平。表格按共炮点和共检波点、分别对近偏移距和远偏移距建立；显示哪些列可以配置。

每个属性有两个阈值：对信号 - 最小值和允许值，对噪声 - 最大值和允许值。据此为每张记录计算质量系数。
未满足标准的属性在表格中高亮显示，这样的记录质量系数为 0。

![标准：信号频率 10 和 20 Hz，信噪比 5 和 10](img/listqc_criteria.png)

本页的截图就是这样标出近偏移距信噪比低于 10 的炮点的。

## 导入

班报中的炮点号按二维（只有桩号）或三维（线号和桩号；自动拆分或按桩号长度拆分）解析。班报中哪个标识号下写的是哪个属性，
在设置中指定。导入前可以预览班报。

![导入设置](img/listqc_import.png)

## 保存和导出

结果以程序自身的格式保存，之后可以再次打开。整个表格或仅当前页可以导出到 Microsoft Excel、OpenOffice.org Calc
或文本文件。

![导出](img/listqc_export.png)

在 Excel 中表格的表头与程序中相同：

![在 Excel 中的导出结果](img/listqc_export_excel.png)
