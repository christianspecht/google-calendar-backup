"Google Calendar Backup"
"https://github.com/christianspecht/google-calendar-backup"
""

$config = [xml](get-content .\Config.xml)

$datesubfolder = $config.Settings.SubfolderPerDate.value
$path = $config.Settings.DownloadPath.value

if (!(test-path $path))
{
    "Download path doesn't exist: " + $path
    start-sleep -s 10
    break
}

if ($datesubfolder -eq "1")
{
    $subfolder = Get-Date -format "yyyyMMdd_HHmmss"

    $path = Join-Path $path $subfolder
    New-Item -ItemType Directory -Force -Path $path | Out-Null
}

"Download path: " + $path
""

start-sleep -s 3

foreach ($calendar in $config.Settings.Calendar)
{
    $finalpath = Join-Path $path $calendar.filename

    "Downloading " + $calendar.url + " to " + $finalpath

    $client = new-object System.Net.WebClient
    $client.DownloadFile($calendar.url, $finalpath)
}