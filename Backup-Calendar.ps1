$config = [xml](get-content .\Config.xml)

$path = $config.Settings.DownloadPath.value

"Download path: " + $path
""

foreach ($calendar in $config.Settings.Calendar)
{
    $finalpath = Join-Path $path $calendar.filename

    "Downloading " + $calendar.url + " to " + $finalpath

    $client = new-object System.Net.WebClient
    $client.DownloadFile($calendar.url, $finalpath)
}