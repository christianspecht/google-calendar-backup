# Google Calendar Backup

Command-line tool to make local backups of your Google Calendar (or any other calendar).


## Setup

You need a machine which is able to run [Windows PowerShell](http://microsoft.com/powershell).

Change the values in the [config file](https://github.com/christianspecht/google-calendar-backup/blob/master/Config.xml) as follows:

- `DownloadPath`:  
  The calendar files will be downloaded to this folder

- `SubfolderPerDate`:  
  Valid values are:  
  `0`: The downloaded files will be overwritten on each run  
  `1`: On each run, the files will be saved in a new subfolder with the current date/time. The old files will never be deleted.

- `Calendar`:  
  Multiple items possible. Each one needs:
  - `url`: The calendar's download URL
  - `filename`: The downloaded calendar will be saved with this filename  
    *(note: if you use the same name multiple times, the second file will overwrite the first!)*


## How do I know the download URL for my calendar?

I wrote this tool to download my Google Calendar, so I only know the answer for Google:  
Each Google Calendar has a [private address](https://support.google.com/calendar/answer/37648#private), which is a direct link to the calendar in the [ICalendar format](https://en.wikipedia.org/wiki/ICalendar).  
[Here are the instructions how to get the private address](https://support.google.com/calendar/answer/37648#view_only).


## License

Google Calendar Backup is licensed under the MIT License.