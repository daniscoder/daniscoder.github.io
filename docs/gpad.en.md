# gPad

A text editor for seismic people: everything you need for plain text, plus a
column mode and tools for SPS files. Column formats - SPS, velocities, statics,
coordinates - are edited a whole column at a time rather than line by line.

![gPad: an SPS file with the X column selected](img/gpad.png)

## Download

[:material-microsoft-windows: Windows](https://github.com/daniscoder/daniscoder.github.io/releases/download/gPad/gPad.exe){ .md-button .md-button--primary }
[:material-linux: Linux](https://github.com/daniscoder/daniscoder.github.io/releases/download/gPad/gPad){ .md-button }

Version 2.0. No installation: a single file, like the other programs on this
site. Sample data - [synth.sps](examples/synth.sps), the screenshot is made from
it.

The Linux version runs even on old systems such as CentOS 7, but it needs the
GTK2 library. A desktop computer usually has it; if not:

```bash
sudo apt install libgtk2.0-0t64   # Ubuntu 24.04, Debian 13
sudo apt install libgtk2.0-0      # Ubuntu 22.04, Debian 12
sudo yum install gtk2             # CentOS, RHEL, Rocky, Alma
```

## Text

- Several files in tabs, recent files, opening several files into one page.
- Encodings, Windows, Unix and Mac line endings.
- Find and replace, including regular expressions and within a selection.
- Bookmarks: ten numbered ones and free ones; delete all lines with or without a
  bookmark.
- Sorting lines, including multi-level sorting by columns.
- Removing empty lines, duplicates, lines by a mask; changing case; splitting a
  large file into parts.

## Columns

Column mode and block selection - what ordinary editors lack for column
formats.

- Insert, delete, cut, shift a column; align it left, right or center.
- Insert numbering: first number, step, leading zeros.
- Arithmetic on a column and a summary of it: count, minimum, maximum, mean,
  sum.
- A column from the clipboard; splitting delimited text into fixed-width
  columns.
- Selecting lines by column values.

## SPS

- The SPS format is configurable: revision, field positions, comment character.
  Standard Rev 0 and Rev 2.1 formats are included, with conversion between them.
- Sorting, finding the current shot point in S and X files, selecting and
  clearing columns of SPS R, S and X.
- Headers: remove comments, bring to the standard, insert extra information -
  Julian day, time, indices, codes.
- Numbering checks: unify record numbers, show missing ones.
- Removing reshoots of shot points.
- SPS S and R from SPS X; SPS R and S for 2D from the coordinates of line bend
  points.
- A receiver and shot point database: import from text, Excel or the clipboard,
  export to the same. SPS files are updated from it: coordinates from survey
  data, static corrections, hole depths and uphole times, 2D spreads.
- Export to a Geocluster library.

## Velocities

A velocity format converter: LVI, Handvel, V5 - in any direction.

## Version history

| Version | What's new |
|---|---|
| 2.0 | Rewritten in Free Pascal with Lazarus: Windows and Linux, 64-bit |
| 1.5 | The Delphi version, Windows only, 32-bit |

The old version 1.5.61 with an installer for 32-bit Windows:
[Setup_gPad_v1.5.61.exe](https://github.com/daniscoder/daniscoder.github.io/releases/download/gPad/Setup_gPad_v1.5.61.exe).
It is no longer supported or updated - take it only if something is missing in
2.0.

What is missing in 2.0 can be added if needed - write what you lack
([contacts](author.md#contacts)).
