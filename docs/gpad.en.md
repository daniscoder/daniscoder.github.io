# gPad

**A text editor for geophysicists**

The editor combines the standard features for plain text with specialized tools
for the text formats used in seismic exploration: SPS acquisition geometry,
velocity tables, static corrections and coordinates. It has a column mode and a
set of functions for SPS files.

Such files are organized in columns, and they are edited by columns: changes are
applied to a whole column rather than to each line separately.

![gPad: an SPS file with the X column selected](img/gpad.png)

## Download

[:material-microsoft-windows: Windows](https://github.com/daniscoder/daniscoder.github.io/releases/download/gPad/gPad.exe){ .md-button .md-button--primary }
[:material-linux: Linux](https://github.com/daniscoder/daniscoder.github.io/releases/download/gPad/gPad){ .md-button }

The current version is 2.0. No installation is needed: the program is a single
file, like the other programs on this site. To try the editor, you can download
the sample [synth.sps](examples/synth.sps); the screenshot above is made from it.

The Linux version also runs on old systems such as CentOS 7, but it needs the GTK2
library. A desktop computer usually has it already; if not, it can be installed
like this:

```bash
sudo apt install libgtk2.0-0t64   # Ubuntu 24.04, Debian 13
sudo apt install libgtk2.0-0      # Ubuntu 22.04, Debian 12
sudo yum install gtk2             # CentOS, RHEL, Rocky, Alma
```

## Plain text

For plain text the editor offers the standard set of features:

- several files open at once in tabs, a list of recent files, opening several
  files on one page;
- support for encodings and Windows, Unix and Mac line endings;
- find and replace, including regular expressions and within a selection;
- bookmarks: ten numbered ones and free ones; all lines with a bookmark or,
  the other way round, without one can be deleted;
- sorting lines, including multi-level sorting by columns;
- removing empty lines, duplicates and lines by a mask; changing case; splitting
  a large file into parts.

## Columns

Column mode and block selection extend the standard features of the editor when
working with column formats. The following operations are available for a column:

- typing text from the keyboard right into a column: what you type goes into all
  lines of the column below the cursor at once, at the same position;
- inserting, deleting, cutting and shifting a column; aligning it left, right or
  center;
- inserting numbering with a given first number, step and leading zeros;
- arithmetic on a column and a summary of it: number of values, minimum, maximum,
  mean and sum;
- inserting a column from the clipboard or splitting delimited text into
  fixed-width columns;
- selecting lines by the values in a column.

## SPS

SPS files have their own set of tools:

- the SPS format is configurable: revision, field positions, comment character.
  The standard Rev 0 and Rev 2.1 formats are included, with conversion between
  them;
- sorting, finding the current shot point in S and X files, selecting and
  clearing columns of SPS R, S and X;
- working with headers: remove comments, bring them to the standard, insert extra
  information - Julian day, time, indices, codes;
- numbering checks: unify record numbers, show missing ones;
- removing reshoots of shot points;
- building SPS S and R from SPS X, and for 2D - SPS R and S from the coordinates of
  line bend points;
- a receiver and shot point database with import and export via text, Excel or
  the clipboard. SPS files are updated from it: coordinates from survey data,
  static corrections, hole depths and uphole times, 2D spreads;
- export to a Geocluster library.

## Velocities

The built-in converter translates the LVI, Handvel and V5 velocity formats into
one another in any direction.

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
