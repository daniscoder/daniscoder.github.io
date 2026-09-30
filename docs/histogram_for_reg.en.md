# histogram_for_reg

Offset distribution histogram for planning 3D regularization of seismic data. The
program splits offsets into classes, shows a histogram and writes a table of
classes next to the input file, ready to be passed to 3D regularization.

![histogram_for_reg window](img/histogram_en.png)

## Download

[:material-microsoft-windows: Windows](https://github.com/daniscoder/daniscoder.github.io/releases/download/histogram_for_reg/histogram_for_reg.exe){ .md-button .md-button--primary }
[:material-linux: Linux](https://github.com/daniscoder/daniscoder.github.io/releases/download/histogram_for_reg/histogram_for_reg){ .md-button }
[:material-linux: Linux (older systems)](https://github.com/daniscoder/daniscoder.github.io/releases/download/histogram_for_reg/histogram_for_reg-legacy){ .md-button }

The Linux version is for systems with glibc 2.38 or newer: Ubuntu 24.04+, Debian
13, Fedora 39+, RHEL, Rocky and Alma 10. For older ones - CentOS 7, RHEL, Rocky and
Alma 8 and 9, Ubuntu 22.04, Debian 12, Astra Linux - use the "Linux (older
systems)" build: it is built with Qt5 and runs on any system with glibc 2.17 or
newer ([details](index.md#run)).

Version 1.4.0. Sample data - synthetic offset distributions:
[synth_offsets_1.txt](examples/synth_offsets_1.txt) (the pictures below are drawn
from it) and [synth_offsets_2.txt](examples/synth_offsets_2.txt).

## Input data

A text file with two columns: offset (SOURCE_DETECT_DIST) and number of traces
(STACK_WORD). Columns are separated by spaces, any number of them.

```
 SOURCE_DETECT_DIST.G STACK_WORD
            -3976.000          2
            -3975.000          1
            -3974.000          3
```

The first line is skipped only if it is not numbers - a file without a header is
read in full. The sign of an offset only tells the side of the shot point, so
offsets are taken as absolute values and equal ones are added up.

## Constant step

Classes of equal width. Near offsets can be merged into a first class several
steps wide, far offsets - into a last class starting from a given offset.

![Constant step](img/histogram_const_en.png)

## Step by panels

Offsets are split into panels: the step is constant within a panel and changes from
panel to panel - coarse at near offsets, fine in the dense middle, coarser again
towards far offsets. Classes hold about the target number of traces, as with
equal-population classes, but within a panel the classes are regular - and there
are fewer Kirchhoff migration artifacts than when every class has its own width.

![Step by panels](img/histogram_step_en.png)

- **Number of offset classes** - how many classes
  the histogram will have. Exactly that many, if the other parameters allow it;
  otherwise the program warns you and takes the nearest possible number.
- **Base step** - panel steps are multiples of it. The smaller it
  is, the closer the classes are to equal population, but the longer the fitting.
- **Max panels** and **Min classes per panel** - limits for the fitting.

The Fit button fills the panel table "from offset - step" from the
data: panels are found by exhaustive search so that the number of traces in each
class deviates from the target as little as possible. The table can be edited by
hand and the histogram rebuilt.

## Result

A window with the histogram - it can be zoomed and saved as an image - and a text
file next to the input one: `<name>_<step>.txt` for a constant step,
`<name>_step<classes>.txt` for a step by panels. It has four columns: first offset of
the class, last offset, class center and number of traces.

```
    0   36   25   4080
   37   61   50   4089
   62   86   75  12217
```

The window size and all fields are remembered between runs.

## Version history

| Version | What's new |
|---|---|
| 1.4.0 | English interface: the language follows the system and can be switched in the window |
| 1.3.0 | Step by panels gives exactly the requested number of classes; later - a Qt5 build for CentOS 7 and other old Linux systems |
| 1.2.0 | "Max offset class width" is a common histogram setting; the variable step is replaced by step by panels |
| 1.1.0 | Step by panels: panels with a constant step, a panel table and its fitting |
| 1.0.0 | First version: constant and variable step |
