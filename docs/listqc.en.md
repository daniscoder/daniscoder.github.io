# ListQC

**Quality control of field shooting**

The utility is meant for quality control of field shooting from the attributes
computed by the processing system.

The program reads a job listing with quality attributes, rates every field record
against the given criteria and shows a table with a quality factor. The result is
easy to read: you see at once which shot points fail the check and on which
attribute exactly.

![ListQC: common shot table, records with low S/N highlighted](img/listqc.png)

!!! note "A program for older systems"
    ListQC is made for Geovation and Geocluster (CGG): a job in these systems
    computes the attributes, and the program parses their listing. It is no longer
    developed and is published as is.

## Download

[:material-microsoft-windows: Windows](https://github.com/daniscoder/daniscoder.github.io/releases/download/ListQC/ListQC.exe){ .md-button .md-button--primary }

The current version is 3.5, for Windows only. No installation is needed: the
program is a single file. It is 32-bit but runs on 64-bit Windows too.

The samples are jobs that compute the attributes and the listings they produce:

| System | Job | Listing |
|---|---|---|
| Geocluster | [Job_Geocluster.xjj](examples/listqc/Job_Geocluster.xjj) | [List_Geocluster.list](examples/listqc/List_Geocluster.list) |
| Geovation | [Job_Geovation.gsl](examples/listqc/Job_Geovation.gsl) | [List_Geovation.list](examples/listqc/List_Geovation.list) |

Server, user and project names and coordinates in the samples are changed.

## Workflow

1. In Geovation or Geocluster, run a job like the samples: it computes the
   quality attributes and writes them to the listing.
2. Import the listing into ListQC via File - Import - Shot point listing or
   Receiver point listing («Файл - Импорт - Листинг ПВ» / «Листинг ПП»).
3. Set the criteria, and the program rates every record.
4. Save the result in the program's own format or export it.

## Attributes and criteria

The attributes are computed separately for near and far offsets: signal amplitude
and frequency, ambient noise amplitude and frequency, signal-to-noise ratio. There
are also ground roll amplitude and frequency, the signal to ground roll ratio and
the overall ambient noise level. Tables are built by common shot and by common
receiver, separately for near and far offsets; which columns to show is
configurable.

Every attribute has two thresholds: for the signal - the minimum and the
acceptable values, for noise - the maximum and the acceptable values. From them
every record gets a quality factor. An attribute that fails its criterion is
highlighted in the table, and the quality factor of such a record becomes 0.

![Criteria: signal frequency 10 and 20 Hz, S/N 5 and 10](img/listqc_criteria.png)

The screenshots on this page mark this way the shot points whose
signal-to-noise ratio at near offsets is below 10.

## Import

The shot point number in the listing is parsed as 2D (station only) or as 3D (line
and station; split automatically or by station length). Which attribute is
written under which identification number in the listing is set in the settings.
The listing can be previewed before import.

![Import settings](img/listqc_import.png)

## Saving and export

The result is saved in the program's own format, and it can be opened again. The
whole table or only the current page can be exported to Microsoft Excel,
OpenOffice.org Calc or a text file.

![Export](img/listqc_export.png)

In Excel the table gets the same header as in the program:

![Export result in Excel](img/listqc_export_excel.png)
