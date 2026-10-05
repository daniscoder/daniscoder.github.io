# 关于作者

我叫 Danis Arslanov，是地震勘探数据处理专家。本站的程序源于我的日常工作：每当某个处理环节耗时太多或容易出错时，
我就为它编写一个工具。这里发布的是其中可能对他人也有用的那些。

## 我使用的软件

- **地震数据处理：**Omega、GeoEast、Vista、Geovation；
- **数据体和剖面浏览：**OpendTect、Petrel；
- **观测系统设计：**Mesa、Пикеза（Pikeza）；
- **平面图和曲面：**Surfer。

## 我如何编写程序

- **Python 和 Qt** - autocrop、lmoToXY、polygon 和 histogram_for_reg 都是用它们编写的；较大的桌面应用程序我用 Qt 和 C++。
- **Delphi 和 Free Pascal** - 早些时候：[ListQC](listqc.md) 和 [gPad](gpad.md) 的早期版本用 Delphi 编写，
  gPad 2.0 用 Free Pascal（Lazarus）编写。
- **打包成单个文件**，适用于 Windows 和 Linux，包括 CentOS 7 这样的旧系统。
- **移植旧程序：**我把 Omega 软件包的速度格式转换工具从 Python 2 和 Tkinter 移植到了 Python 3 和 Qt - 约 200 项操作，
  有 Windows 和 Linux 版本。该工具已投入实际使用，但不公开提供。

## 可以定制的服务

- **为您的任务编写工具** - 与本站程序类似的小程序：支持您所用处理系统的导出格式，适应野外队或处理中心的工作流程。
  适用于 Windows 和 Linux，单个文件，无需安装。
- **日常操作自动化** - 批量处理文件和截图的脚本、格式转换器、数据检查和核对。
- **改进本站的程序** - 增加新的输入数据格式、新的参数、适合您系统的输出。
- **程序本地化** - 把界面和帮助翻译成英文、中文或任何其他语言。

## 联系方式 { #contacts }

- :material-email: 邮箱：[arslanovdk@gmail.com](mailto:arslanovdk@gmail.com)
- :fontawesome-brands-telegram: Telegram：[@ar_dans](https://t.me/ar_dans)
- :fontawesome-brands-github: GitHub：[daniscoder](https://github.com/daniscoder)

使用程序时遇到的问题也可以联系我：文件读不进来、参数不明白、需要其他格式。如果附上出问题的文件，我能更快解决。
如果数据不能外传，几行修改过坐标的数据就够了。
