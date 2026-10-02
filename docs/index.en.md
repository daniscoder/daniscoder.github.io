---
hide:
  - toc
---

# Utilities for Seismic Data Processors

Small programs I wrote for my own work in 2D and 3D seismic data processing. They
save time on routine tasks and help to:

- **present the results** - crop screenshots of sections, maps and spectra for a
  report or a presentation, a whole folder at once;
- **prepare processing parameters** - a near-surface layer model for static
  corrections, the survey boundary polygon, offset classes for 3D
  regularization;
- **check field data** - fix and cross-check SPS files, assess shooting quality
  from recording listings.

All programs are free and need no installation: a program is a single file, just
download and run it. Almost all of them are available for both Windows and
Linux, including old systems such as CentOS 7. Only ListQC, the oldest one, runs
on Windows only. If something does not start, see [How to run](#run) below.

!!! note "Interface language"
    autocrop, lmoToXY, polygon and histogram_for_reg speak English: they follow
    the system language, and the list next to the buttons switches it. gPad and
    ListQC are in Russian so far - menus, buttons, the built-in help and their
    screenshots on this site; where their pages mention a button or a field, its
    Russian caption is given in quotes next to the English name. If needed, a
    program can be localized into any language - [write to me](author.md#contacts).

## Programs { #programs }

<div class="features" markdown>

<div class="feature" markdown>
<div class="feature-text" markdown>

### ![](img/icons/autocrop.png){ .feature-icon } autocrop { #autocrop }

Crops screenshots of sections, gathers, maps and spectra **in batch, a whole folder
at once**. The window title, toolbars, scroll bars and empty space go away, and
**the frame is found automatically** on every screenshot. What remains is **the
image, the image with axes or with all annotations** - ready for a report or a
presentation.

[:octicons-arrow-right-24: Learn more](autocrop.md)

</div>
<div class="feature-image" markdown>

[![autocrop window](img/autocrop_en.png)](autocrop.md)

</div>
</div>

<div class="feature" markdown>
<div class="feature-text" markdown>

### ![](img/icons/lmotoxy.png){ .feature-icon } lmoToXY { #lmotoxy }

**Layered near-surface model** from first breaks. From an LMO file the program
builds **layer boundaries in offsets and layer velocities** at every shot point and
takes the coordinates from SPS - the output files are ready for **static
corrections**.

[:octicons-arrow-right-24: Learn more](lmotoxy.md)

</div>
<div class="feature-image" markdown>

[![lmoToXY window](img/lmotoxy_en.png)](lmotoxy.md)

</div>
</div>

<div class="feature" markdown>
<div class="feature-text" markdown>

### ![](img/icons/polygon.png){ .feature-icon } polygon { #polygon }

**Survey boundary polygon** from a bin export or SPS points. Without a margin it is
**an outline through the outermost points**, with a margin - **a buffer** around the
area, a polygon per area. The result is a file for processing or **a BLN for
Surfer**.

[:octicons-arrow-right-24: Learn more](polygon.md)

</div>
<div class="feature-image" markdown>

[![polygon window](img/polygon_en.png)](polygon.md)

</div>
</div>

<div class="feature" markdown>
<div class="feature-text" markdown>

### ![](img/icons/histogram_for_reg.png){ .feature-icon } histogram_for_reg { #histogram_for_reg }

**Offset distribution histogram** and offset classes for **3D regularization**: a
constant step or **a step by panels** - panels with their own step fitted to the
requested number of classes. **A table of classes** ready for regularization is
written next to the input file.

[:octicons-arrow-right-24: Learn more](histogram_for_reg.md)

</div>
<div class="feature-image" markdown>

[![histogram_for_reg window](img/histogram_en.png)](histogram_for_reg.md)

</div>
</div>

<div class="feature" markdown>
<div class="feature-text" markdown>

### ![](img/icons/gpad.png){ .feature-icon } gPad { #gpad }

**A text editor** for seismic people with **a column mode**: SPS, velocities,
statics and coordinates are edited a whole column at a time rather than line by
line. Plus **SPS tools** - sorting, headers, numbering checks, updates from a
receiver and shot point database - and **a velocity format converter**.

[:octicons-arrow-right-24: Learn more](gpad.md)

</div>
<div class="feature-image" markdown>

[![gPad window](img/gpad.png)](gpad.md)

</div>
</div>

<div class="feature" markdown>
<div class="feature-text" markdown>

### ![](img/icons/listqc.png){ .feature-icon } ListQC { #listqc }

**Quality control of field shooting** from the attributes in a Geovation or
Geocluster listing. The program rates **every record against criteria** and shows a
table with **a quality factor** - you see at once which shot points fail and on
which attribute.

[:octicons-arrow-right-24: Learn more](listqc.md)

</div>
<div class="feature-image" markdown>

[![ListQC window](img/listqc.png)](listqc.md)

</div>
</div>

</div>

## How to run { #run }

Download the file for your system from the program's page. There is no
installation: put the file anywhere and run it from there. On the first start the
program unpacks itself into a temporary folder, so the first start takes a couple
of seconds longer.

**Windows.** Double-click the `.exe`. The programs are not signed with a
certificate, and on the first start Windows may show a SmartScreen window
"Windows protected your PC" - click "More info", then "Run anyway".

**Linux.** You need a system with glibc 2.38 or newer: Ubuntu 24.04 and newer,
Debian 13, Fedora 39 and newer, RHEL, Rocky and Alma 10. On older ones - Ubuntu
22.04, Debian 12, RHEL, Rocky and Alma 8 and 9, Astra Linux - the program will not
start and will say ``version `GLIBC_2.38' not found``. `ldd --version` shows your
version.

For older systems some programs have a separate build - the "Linux (older
systems)" button on the program's page. It is built with Qt5 on CentOS 7 (glibc
2.17) and runs there and on any newer system. autocrop, lmoToXY, polygon
and histogram_for_reg have such a build.

On newer systems with Wayland (KDE, GNOME) the build for older systems may show a
generic icon in the window title instead of the program's icon: that is how Qt5
works under Wayland, and it does not affect the program. If it bothers you, run it
through X11:

```bash
QT_QPA_PLATFORM=xcb ./polygon-legacy
```

The file has no extension. If it came in an archive or from a Windows network
share, the execute permission is lost - restore it and run the program:

```bash
chmod +x polygon
./polygon
```

Qt is packed into the file, but the window needs the system graphics libraries.
A desktop computer usually has them already. If the program does not start and
says it cannot load the Qt platform plugin "xcb", install them - on Debian and
Ubuntu:

```bash
sudo apt install libgl1 libxkbcommon-x11-0 libxcb-cursor0
```

Every program has a Help button («Справка») with the workflow and all parameters,
and an About button («О программе») with the version number.

## Author

Danis Arslanov, seismic data processor. I can write a utility for your task or
extend the programs on this site - see [About the author](author.md).

Email [arslanovdk@gmail.com](mailto:arslanovdk@gmail.com), Telegram
[@ar_dans](https://t.me/ar_dans).
