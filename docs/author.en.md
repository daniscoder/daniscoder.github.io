# About the author

My name is Danis Arslanov, and I am a seismic data processing specialist. The
programs on this site grew out of my everyday work: whenever a processing step
took too much time or was easy to get wrong, I wrote a utility for it. The ones
published here are those that may be useful to others too. The largest of them,
[seisboard](seisboard.md), brings work with 2D/3D geometry, static corrections, maps and
quality attributes together on a single board - from survey design and fold computation
to decomposing and stitching static solutions. I use it in my own work, including on
surveys of tens of millions of traces.

## What I work with

- **seismic data processing:** Omega, GeoEast, Vista, Geovation;
- **viewing volumes and sections:** OpendTect, Petrel;
- **survey design:** Mesa, Pikeza;
- **maps and surfaces:** Surfer.

## How I write programs

- **C++, Python and Qt** - my main stack. With C++ and Qt I write large desktop
  applications such as [gPad 3.0](gpad.md). [seisboard](seisboard.md) and the utilities
  autocrop, lmoToXY, polygon and histogram_for_reg are written in Python and Qt.
- **Finished programs, not scripts** - seisboard is released as a full product: an
  installer, automatic updates, help with search and printing, sessions, a full version
  with a key and a free demo.
- **Builds for Windows and Linux** - I build programs as a single executable or with an
  installer, including support for old systems such as CentOS 7.
- **Porting legacy programs** - I moved the velocity format conversion utility of the
  Omega package from Python 2 and Tkinter to Python 3 and Qt (about 200 operations,
  builds for Windows and Linux). The utility is fully working but is not publicly
  available.
- **Delphi and Free Pascal** - used in past projects: [ListQC](listqc.md) and the
  first versions of [gPad](gpad.md) were written in Delphi, and gPad 2.0 in Free
  Pascal (Lazarus).

## What you can order

- **A utility for your task** - a small program in the spirit of the ones on this
  site: supporting the export format of your processing system, fitting the
  workflow of a field crew or a processing center. For Windows and Linux - a single
  file with no installation, or with an installer.
- **Automation of routine operations** - scripts for batch processing of files
  and screenshots, format converters, data checks and cross-checks.
- **Extensions of the programs on this site** - adding a new input format, a new
  parameter, output for your system.
- **Localization of the programs** - the interface and help in English, Chinese
  or any other language.

## Contacts { #contacts }

- :material-email: Email: [arslanovdk@gmail.com](mailto:arslanovdk@gmail.com)
- :fontawesome-brands-telegram: Telegram: [@ar_dans](https://t.me/ar_dans)
- :fontawesome-brands-github: GitHub: [daniscoder](https://github.com/daniscoder)

Write with questions about working with the programs too: a file does not load, a
parameter is unclear, another format is needed. If you attach the file that caused
the problem, I will sort it out faster. If the data cannot be shared, a few lines
with changed coordinates are enough.
