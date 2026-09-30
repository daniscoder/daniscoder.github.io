# Seismic Processing Utilities

Small programs I wrote for my own work in 2D and 3D seismic data processing. They
save time on routine tasks and help to:

- **prepare processing parameters** - offset classes for 3D regularization, the
  survey boundary polygon, a near-surface layer model for static corrections;
- **check field data** - fix and cross-check SPS files, assess shooting quality
  from recording listings;
- **present the results** - crop screenshots of sections, maps and spectra for a
  report or a presentation, a whole folder at once.

All programs are free and need no installation: a program is a single file, just
download and run it. Almost all of them are available for both Windows and
Linux, including old systems such as CentOS 7. Only ListQC, the oldest one, runs
on Windows only. If something does not start, see [How to run](#run) below.

!!! note "The programs speak Russian"
    Menus, buttons and the built-in help of the programs are in Russian, and the
    screenshots on this site show that interface. Where a page mentions a button
    or a field, its Russian caption is given in quotes next to the English name.

<div class="grid cards" markdown>

-   :material-chart-histogram:{ .lg .middle } **[histogram_for_reg](histogram_for_reg.md)**

    ---

    Offset distribution histogram and offset classes for 3D regularization:
    a constant step or a step by panels - panels with a constant step fitted to the
    requested number of classes.

-   :material-vector-polygon:{ .lg .middle } **[polygon](polygon.md)**

    ---

    Survey boundary polygon from a bin export or SPS points: an outline through
    the outermost points or a buffer with a margin, a polygon per area, a file
    for processing or for Surfer.

-   :material-layers-triple:{ .lg .middle } **[lmoToXY](lmotoxy.md)**

    ---

    Layered near-surface model from first breaks: layer boundaries in offsets
    and layer velocities at every shot point, coordinates from SPS - for static
    corrections.

-   :material-crop:{ .lg .middle } **[autocrop](autocrop.md)**

    ---

    Batch cropping of screenshots with seismic data, maps and spectra: keeps the
    image, the image with axes or with all annotations - without the window
    title, toolbars and scroll bars.

-   :material-file-document-edit:{ .lg .middle } **[gPad](gpad.md)**

    ---

    A text editor with a column mode and SPS tools: sorting, headers, numbering
    checks, updates from a receiver and shot point database, a velocity format
    converter.

-   :material-check-decagram:{ .lg .middle } **[ListQC](listqc.md)**

    ---

    Quality control of field shooting: attributes from a Geovation or Geocluster
    listing, every record rated against criteria, a quality factor.

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
2.17) and runs there and on any newer system. histogram_for_reg, polygon, lmoToXY
and autocrop have such a build.

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
