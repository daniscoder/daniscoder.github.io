---
hide:
  - toc
---

# 地震数据处理实用工具

这些小程序是我为自己处理二维和三维地震数据而编写的。它们把日常操作自动化，帮助完成三项主要任务：

- **整理成果** - 裁剪剖面、平面图和频谱的屏幕截图，用于报告或演示，而且可以一次处理整个文件夹；
- **准备处理参数** - 为静校正建立近地表模型，构建工区边界多边形，为三维规则化划分偏移距组；
- **检查野外数据** - 修改和核对 SPS 文件，根据记录班报评价放炮质量。

所有程序均免费，无需安装：每个工具就是一个文件，下载后即可运行。几乎所有程序都提供 Windows 和
Linux 版本，包括 CentOS 7 这样的旧系统。唯一的例外是 ListQC，它是这里最早的一个工具，只能在
Windows 下运行。如果有程序无法启动，请参阅下面的[“如何运行”](#run)一节。

!!! note "界面语言"
    autocrop、lmoToXY、polygon 和 histogram_for_reg 支持中文（简体）：语言跟随系统，也可以用按钮旁的列表切换。
    gPad 和 ListQC 目前只有俄文 - 菜单、按钮、内置帮助以及本站上的截图都是俄文；在它们的页面中提到按钮或字段时，
    会在中文名称旁的引号中给出俄文名称。如有需要，程序可以翻译成任何语言 - [请联系我](author.md#contacts)。

## 程序 { #programs }

<div class="features" markdown>

<div class="feature" markdown>
<div class="feature-text" markdown>

### ![](img/icons/autocrop.png){ .feature-icon } autocrop { #autocrop }

**批量自动裁剪截图**，适用于道集、剖面、切片、平面图和频谱的截图。程序为每张截图自动找出有用图像的区域，
去掉窗口标题、工具栏、滚动条和空白边。输出为**仅图像、含坐标轴的图像或含全部注释的图像**，可直接用于报告或演示。
对于相同的截图有**手动模式**，对于过大的图片可以**缩小**。

[:octicons-arrow-right-24: 详细了解](autocrop.md)

</div>
<div class="feature-image" markdown>

[![autocrop 窗口](img/autocrop_zh.png)](autocrop.md)

</div>
</div>

<div class="feature" markdown>
<div class="feature-text" markdown>

### ![](img/icons/lmotoxy.png){ .feature-icon } lmoToXY { #lmotoxy }

**根据初至建立层状近地表模型**，用于为静校正计算模块 Refraction Miser 或 Refraction Tomo 设置参数。
程序根据 PickWorks 的 LMO 数据在每个炮点上求出**以偏移距表示的层界面和各层速度**，坐标取自 SPS。

[:octicons-arrow-right-24: 详细了解](lmotoxy.md)

</div>
<div class="feature-image" markdown>

[![lmoToXY 窗口](img/lmotoxy_zh.png)](lmotoxy.md)

</div>
</div>

<div class="feature" markdown>
<div class="feature-text" markdown>

### ![](img/icons/polygon.png){ .feature-icon } polygon { #polygon }

根据面元导出或 SPS 点构建**工区边界多边形**：**经过最外侧点的轮廓**或**向区域外外扩的轮廓**。
如果有几个区域，程序会自动识别并**为每个区域构建多边形**。输出为用于处理的文件和 **Surfer 的 BLN 文件**。

[:octicons-arrow-right-24: 详细了解](polygon.md)

</div>
<div class="feature-image" markdown>

[![polygon 窗口](img/polygon_zh.png)](polygon.md)

</div>
</div>

<div class="feature" markdown>
<div class="feature-text" markdown>

### ![](img/icons/histogram_for_reg.png){ .feature-icon } histogram_for_reg { #histogram_for_reg }

**用于三维规则化的偏移距分布分析。**程序将偏移距**按等步长或分段步长**划分为组，显示直方图并保存
**分组表** - 可直接用作规则化的输入数据。分段步长的区段会按指定的组数自动选取。

[:octicons-arrow-right-24: 详细了解](histogram_for_reg.md)

</div>
<div class="feature-image" markdown>

[![histogram_for_reg 窗口](img/histogram_zh.png)](histogram_for_reg.md)

</div>
</div>

<div class="feature" markdown>
<div class="feature-text" markdown>

### ![](img/icons/gpad.png){ .feature-icon } gPad { #gpad }

**面向地球物理人员的文本编辑器**：既有普通文本的标准功能，也有处理地震勘探格式的工具 - SPS 观测系统、
速度表、静校正量和坐标。这类文件**按列**编辑，而不是逐行编辑；SPS 有**专门的一组功能**，速度有**格式转换器**。

[:octicons-arrow-right-24: 详细了解](gpad.md)

</div>
<div class="feature-image" markdown>

[![gPad 窗口](img/gpad.png)](gpad.md)

</div>
</div>

<div class="feature" markdown>
<div class="feature-text" markdown>

### ![](img/icons/listqc.png){ .feature-icon } ListQC { #listqc }

根据 Geovation 或 Geocluster 班报中的属性进行**野外放炮质量控制**。程序**按给定标准评价每一炮**，
并输出带**质量系数**的表格：一眼就能看出哪些炮点未通过检查，具体是哪个属性不合格。

[:octicons-arrow-right-24: 详细了解](listqc.md)

</div>
<div class="feature-image" markdown>

[![ListQC 窗口](img/listqc.png)](listqc.md)

</div>
</div>

</div>

## 如何运行 { #run }

从程序页面下载适合您系统的文件。无需安装：文件可以放在任意文件夹中并从那里运行。首次运行时程序会解压到临时目录，
因此第一次启动要多花几秒钟。

**Windows。**双击运行 `.exe`。程序没有用证书签名，因此首次运行时 Windows 可能会显示 SmartScreen 窗口
“Windows 已保护你的电脑”。在其中点击“更多信息”，然后点击“仍要运行”。

**Linux。**需要 glibc 2.38 或更新版本的系统：Ubuntu 24.04 及更新版本、Debian 13、Fedora 39 及更新版本、
RHEL、Rocky 和 Alma 10。在更旧的系统上 - Ubuntu 22.04、Debian 12、RHEL、Rocky 和 Alma 8 与 9、
Astra Linux - 程序无法启动，并会显示消息 ``version `GLIBC_2.38' not found``。可以用 `ldd --version`
命令查看 glibc 版本。

对于旧系统，部分程序有单独的版本 - 程序页面上的“Linux（旧系统）”按钮。它在 CentOS 7（glibc 2.17）上用 Qt5
构建，可以在该系统及所有更新的系统上运行。autocrop、lmoToXY、polygon 和 histogram_for_reg 有这种版本。

在使用 Wayland 的新系统（KDE、GNOME）上，旧系统版本的窗口标题中可能显示通用图标而不是程序图标。这是 Qt5 在
Wayland 下的工作方式，不影响程序使用。如果介意，可以通过 X11 运行：

```bash
QT_QPA_PLATFORM=xcb ./polygon-legacy
```

Linux 版程序文件没有扩展名。如果文件来自压缩包，或是从 Windows 网络共享文件夹复制的，执行权限会丢失。
恢复权限后运行程序：

```bash
chmod +x polygon
./polygon
```

Qt 已打包在文件中，但窗口需要系统图形库。有桌面环境的计算机通常已经安装了它们。如果程序无法启动并提示无法加载
Qt 平台插件“xcb”，请安装这些库；在 Debian 和 Ubuntu 中这样安装：

```bash
sudo apt install libgl1 libxkbcommon-x11-0 libxcb-cursor0
```

**Linux 上的中文。**如果看到的是方块而不是汉字，说明系统中没有中文字体。安装字体后重新启动程序：Ubuntu 和
Debian 中用 `sudo apt install fonts-wqy-microhei`，CentOS 7 中用 `sudo yum install wqy-microhei-fonts`。

每个程序都有“帮助”按钮（介绍操作步骤和全部参数）以及“关于”按钮（显示版本号）。

## 作者

我叫 Danis Arslanov，是地震勘探数据处理专家。我可以为您的任务编写工具，或改进本站的程序 - 详见
[关于作者](author.md)页面。

邮箱 [arslanovdk@gmail.com](mailto:arslanovdk@gmail.com)，Telegram
[@ar_dans](https://t.me/ar_dans)。
