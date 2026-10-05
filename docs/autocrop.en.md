# autocrop

**Automatic batch cropping of screenshots**

The utility processes screenshots in batch when you prepare materials for
reports and presentations. It handles images with gathers, sections, slices,
schematics, maps and spectra.

For every file the program finds the useful part of the image by itself: it drops
the window title, toolbars, scroll bars, the status bar and empty margins. The
crop frame is calculated separately for each screenshot, so one folder may hold
windows of different programs and of different sizes.

The output is a ready picture in one of three variants:

- the image only;
- the image with axes;
- the image with all annotations: titles, axis names and the color bar.

If all screenshots are taken in the same window at the same scale, you can set the
frame by hand: draw it once with the mouse on the preview, and it is applied to
every file. Pictures that are too large can be scaled down proportionally to a
given size on saving, and the output format can be PNG, JPG or BMP.

The resulting files are ready to be pasted into reports and presentations.

![autocrop window](img/autocrop_en.png)

## Download

[:material-microsoft-windows: Windows](https://github.com/daniscoder/daniscoder.github.io/releases/download/autocrop/autocrop.exe){ .md-button .md-button--primary }
[:material-linux: Linux](https://github.com/daniscoder/daniscoder.github.io/releases/download/autocrop/autocrop){ .md-button }
[:material-linux: Linux (older systems)](https://github.com/daniscoder/daniscoder.github.io/releases/download/autocrop/autocrop-legacy){ .md-button }

The Linux version is for systems with glibc 2.38 or newer: Ubuntu 24.04 and
newer, Debian 13, Fedora 39 and newer, RHEL, Rocky and Alma 10. For older systems -
CentOS 7, RHEL, Rocky and Alma 8 and 9, Ubuntu 22.04, Debian 12, Astra Linux -
there is the "Linux (older systems)" build: it is built with Qt5 and runs on any
system with glibc 2.17 or newer ([details](index.md#run)).

The current version is 1.3. To try the program, you can download synthetic
window screenshots; the illustrations below are made from them:

- [synth_section.png](examples/autocrop/synth_section.png) - a section with two
  rows of labels above the image, a time scale on both sides and a color bar on
  the left;
- [synth_map.png](examples/autocrop/synth_map.png) - a map with axes on the left
  and at the bottom, a scroll bar inside the plot area and a color table on the
  right;
- [synth_spectrum.png](examples/autocrop/synth_spectrum.png) - a spectrum with a
  title and axis names.

## Cropping variants

On every screenshot the program finds three frames at once and shows them on the
preview. The selected variant is drawn with a thick line.

- **Image** (green frame) - the data area only, exactly along its border. If a
  map has no frame, the border is found from the axes and the outermost data
  points. A scroll bar inside the plot area is always cut off.
- **With axes** (red frame) - adds the tick labels above and below the data
  area, however many rows there are, and the values of the vertical axis. In
  width the frame ends at the edge of these values, so row names on the left
  stay outside.
- **With annotations** (blue frame) - everything around the image: titles, axis
  names, color bars, tables and labels above a map.

![Section: synth_section.png](img/autocrop_section.png)

![Map: synth_map.png](img/autocrop_map.png)

![Spectrum: synth_spectrum.png](img/autocrop_spectrum.png)

For the variants with axes and with annotations you set a **margin** - a few
pixels of space around the frame. The image without axes is cut exactly along its
border, with no margin.

## Manual mode

When all screenshots are alike - the same window at the same scale - it is easier
to set the frame yourself. On the Manual tab you enter a rectangle in screenshot
pixels: X, Y, width and height. It is cut from every file, and whatever falls
outside a screenshot is simply dropped.

The easiest way is to draw the frame with the mouse right on the preview: drag an
edge or a corner to resize it, drag from inside to move it, and click outside the
frame to start a new one. The arrow keys move the frame by 10 pixels, with
Shift - by one.

![Manual: synth_section.png](img/autocrop_manual_en.png)

## Output and shrinking

Cropped screenshots are saved under the same names to the output folder. By
default it is the `cropped` folder next to the screenshots, but you can choose
any. If the folder field is left empty, the result goes next to the original
file with `_cr` added to the name. The program never overwrites the original
screenshots.

The output format is the same as the screenshot or PNG, JPG, BMP. PNG suits window
screenshots best: the file is smaller and nothing is lost. The "256-color
palette" checkbox in the Settings... window makes a PNG another 2-4 times smaller.
The JPG quality is set there too: below 85 small labels get visibly blurred.

The "Shrink to" option limits the longer side of the result: if a picture is
larger than the given size, it is scaled down proportionally. The final size,
after cropping and shrinking, is shown under the preview.

You can process the selected screenshots or all screenshots of the folder at
once. The work runs in parallel on all processor cores.

## Working with files

The left part of the window is a folder browser. Screenshots are shown as
thumbnails, a list or a detailed list with the image size, file size and date.
Folders open with a double click.

Files and folders can be copied, cut and pasted, including between the program
and Explorer, renamed (F2), deleted to the trash, and new folders can be created.
All actions are available as buttons above the list, in the right-click menu and
with the usual keyboard shortcuts.

## Command line

When started with arguments, the program works without a window. This is handy
for processing from scripts:

```
autocrop screenshot.png folder_with_screenshots -k axes -f png -o cropped
```

Main options:

- `-k all|axes|image` - cropping variant: with annotations, with axes or the
  image only;
- `-o` - output folder; `-o ""` - next to the screenshot, with `_cr` in the name;
- `-f png|jpg|bmp` - output format;
- `-m` - margin;
- `-q` - JPG quality, `--palette` - PNG with a 256-color palette;
- `--box X Y W H` - manual mode: cut this rectangle from all screenshots;
- `--max-side` - shrink to the given longer side.

`autocrop -h` prints the full list of options.

## Version history

| Version | What's new |
|---|---|
| 1.3 | Chinese interface (Simplified): the language follows the system and can be switched in the window |
| 1.2 | English interface: the language follows the system and can be switched in the window |
| 1.1 | Manual cropping: one rectangle for all screenshots, with the mouse in the preview or with arrow keys; shrinking by the longer side; format settings in their own window |
| 1.0 | First version: three cropping levels, a window with a file browser and a frame preview, batch processing on all cores, console mode |
