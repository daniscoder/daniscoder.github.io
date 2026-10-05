# lmoToXY

**Building a layered near-surface model from first breaks to parameterize the
static correction modules Refraction Miser or Refraction Tomo**

The utility builds a layered near-surface model from first-break data. The input
is an LMO file from PickWorks: at every shot point the program finds layer
boundaries in offsets and computes layer velocities.

The X/Y coordinates are taken from an SPS file. The program writes two output
files:

- a file with layer offsets - for refraction statics from first breaks;
- a file with layer velocities.

![lmoToXY window after a run on the samples](img/lmotoxy_en.png)

## Download

[:material-microsoft-windows: Windows](https://github.com/daniscoder/daniscoder.github.io/releases/download/lmoToXY/lmoToXY.exe){ .md-button .md-button--primary }
[:material-linux: Linux](https://github.com/daniscoder/daniscoder.github.io/releases/download/lmoToXY/lmoToXY){ .md-button }
[:material-linux: Linux (older systems)](https://github.com/daniscoder/daniscoder.github.io/releases/download/lmoToXY/lmoToXY-legacy){ .md-button }

The Linux version is for systems with glibc 2.38 or newer: Ubuntu 24.04 and
newer, Debian 13, Fedora 39 and newer, RHEL, Rocky and Alma 10. For older systems -
CentOS 7, RHEL, Rocky and Alma 8 and 9, Ubuntu 22.04, Debian 12, Astra Linux -
there is the "Linux (older systems)" build: it is built with Qt5 and runs on any
system with glibc 2.17 or newer ([details](index.md#run)).

The current version is 1.2.0. To try the program, you can download a synthetic
pair of files: [synth_lmo.txt](examples/synth_lmo.txt) and
[synth.sps](examples/synth.sps) - 270 shot points and a three-layer model.

## Input data

**The LMO file** consists of blocks of lines, one block per shot point. Columns
are separated by tabs: shot point number, minimum offset, maximum offset,
intercept time in ms and velocity in m/s. The shot point number is given only in
the first line of a block; in the other lines this column is empty, and the line
starts with a tab:

```
1001101	1.0	238.8	0.00	620.0
	238.8	1305.6	255.00	1835.1
	1305.6	1.0E7	575.67	3341.0
```

This data is copied from PickWorks after LMO picking and saved to a text file as
is: the columns must stay separated by tabs.

The lines of one block are pieces of one continuous first-break traveltime curve:
the time at the end of a piece equals the time at the start of the next one.

**The SPS file** holds shot point records with fixed character positions: shot
line - positions 2-17, shot point - 18-25, X - 47-55, Y - 56-65. Line and point
are joined into the shot point number, which must match the number in the LMO
file. If your crew uses other columns or positions, you can change them in the
"Columns and positions" window.

## Computation

Each piece of the traveltime curve goes to the layer whose velocity range it falls
into. The ranges are set in a table; by default there are three layers: 400-1200,
1200-2200 and 2200-5600 m/s. Layer boundaries are found in one of two ways:

- **least squares** - the traveltime curve is fitted with a polyline, one straight
  segment per layer;
- **velocity threshold** - the boundary is placed where the apparent velocity
  crosses the middle of the gap between the ranges of adjacent layers.

The number of layers is the same at every shot point. If a layer is missing in
the data at a shot point, it is filled with a window one rounding step wide, from
neighboring shot points, or by fitting all layers - the way is chosen in the
settings. The computation runs in the background, and the progress and results
go to the log.

## Output

The program writes two files - to the chosen output folder or next to the LMO
file. The data in them go in blocks by layer:

```
<name>_offset.txt:    <layer> <X> <Y> <min.offset> <max.offset>   from layer 2
<name>_velocity.txt:  <layer> <X> <Y> <velocity>                  from layer 1
```

The offset file starts with the second layer, the velocity file with the first.

If one folder holds the results of several projects, the "Merge" button
combines them into one `_offset` file and one `_velocity` file. Points repeated
by coordinates are skipped.

## Version history

| Version | What's new |
|---|---|
| 1.2.0 | Chinese interface (Simplified): the language follows the system and can be switched in the window |
| 1.1.0 | English interface: the language follows the system and can be switched in the window |
| 1.0.0 | First version as a separate program: windows in Qt Designer, an icon, help, builds for Windows and Linux; later - a Qt5 build for CentOS 7 and other old Linux systems |
