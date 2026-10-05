# gPad

**面向地球物理人员的文本编辑器**

这个编辑器把普通文本的标准功能与处理地震勘探文本格式的专门工具结合在一起：SPS 观测系统、速度表、静校正量和坐标。
它有列模式和一组处理 SPS 文件的功能。

这类文件按列组织，也按列编辑：修改作用于整列，而不是逐行分别进行。

![gPad：选中 X 列的 SPS 文件](img/gpad.png)

## 下载

[:material-microsoft-windows: Windows](https://github.com/daniscoder/daniscoder.github.io/releases/download/gPad/gPad.exe){ .md-button .md-button--primary }
[:material-linux: Linux](https://github.com/daniscoder/daniscoder.github.io/releases/download/gPad/gPad){ .md-button }

当前版本为 2.0。无需安装：与本站其他程序一样，程序就是一个文件。程序界面目前只有俄文。要试用编辑器，
可以下载示例 [synth.sps](examples/synth.sps)；上面的截图就是用它制作的。

Linux 版也能在 CentOS 7 这样的旧系统上运行，但需要 GTK2 库。有桌面环境的计算机通常已经有了；如果没有，可以这样安装：

```bash
sudo apt install libgtk2.0-0t64   # Ubuntu 24.04, Debian 13
sudo apt install libgtk2.0-0      # Ubuntu 22.04, Debian 12
sudo yum install gtk2             # CentOS, RHEL, Rocky, Alma
```

## 普通文本

对于普通文本，编辑器提供标准的功能：

- 在选项卡中同时打开多个文件，最近文件列表，在一个页面中打开多个文件；
- 支持各种编码以及 Windows、Unix 和 Mac 换行符；
- 查找和替换，包括正则表达式和在选区内查找；
- 书签：十个编号书签和任意书签；可以删除所有带书签的行，或者反过来删除所有不带书签的行；
- 行排序，包括按列的多级排序；
- 删除空行、重复行和按掩码删除行；转换大小写；把大文件拆分成几部分。

## 列

在处理按列排列的格式时，列模式和块选择扩展了编辑器的标准功能。对列可以进行以下操作：

- 直接在列中用键盘输入文本：输入的内容会同时写入光标下方该列所有行的同一位置；
- 插入、删除、剪切和移动列；左对齐、右对齐或居中；
- 按给定的起始号、步长和前导零插入编号；
- 对列进行算术运算并汇总：数值个数、最小值、最大值、平均值和总和；
- 从剪贴板插入列，或把带分隔符的文本拆分为固定宽度的列；
- 按列中的值选择行。

## SPS

SPS 文件有专门的一组工具：

- SPS 格式可配置：版本、字段位置、注释符。内置标准的 Rev 0 和 Rev 2.1 格式，并可相互转换；
- 排序，在 S 和 X 文件中查找当前炮点，选择和清除 SPS R、S、X 的列；
- 处理文件头：删除注释，使其符合标准，插入附加信息 - 儒略日、时间、索引、代码；
- 编号检查：统一记录号，显示缺失的编号；
- 删除炮点的重复放炮；
- 根据 SPS X 生成 SPS S 和 R，对于二维 - 根据测线拐点坐标生成 SPS R 和 S；
- 检波点和炮点数据库，可以通过文本、Excel 或剪贴板导入和导出。可以用它更新 SPS 文件：测量坐标、静校正量、
  井深和井口时间、二维排列；
- 导出为 Geocluster 库。

## 速度

内置的转换器可以在 LVI、Handvel 和 V5 速度格式之间任意互相转换。

## 版本历史

| 版本 | 新内容 |
|---|---|
| 2.0 | 用 Free Pascal 和 Lazarus 重写：Windows 和 Linux，64 位 |
| 1.5 | Delphi 版本，仅限 Windows，32 位 |

带安装程序的 32 位 Windows 旧版本 1.5.61：
[Setup_gPad_v1.5.61.exe](https://github.com/daniscoder/daniscoder.github.io/releases/download/gPad/Setup_gPad_v1.5.61.exe)。
它已不再支持和更新 - 只有在 2.0 中缺少某些功能时才使用。

2.0 中缺少的功能可以根据需要添加 - 请告诉我您需要什么（[联系方式](author.md#contacts)）。
