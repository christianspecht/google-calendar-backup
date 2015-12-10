$config = [xml](get-content .\Config.xml)

$datesubfolder = $config.Settings.SubfolderPerDate.value
$path = $config.Settings.DownloadPath.value

if ($datesubfolder -eq "1")
{
    $subfolder = Get-Date -format "yyyyMMdd_HHmmss"

    $path = Join-Path $path $subfolder
    New-Item -ItemType Directory -Force -Path $path | Out-Null
}

"Download path: " + $path
""

foreach ($calendar in $config.Settings.Calendar)
{
    $finalpath = Join-Path $path $calendar.filename

    "Downloading " + $calendar.url + " to " + $finalpath

    $client = new-object System.Net.WebClient
    $client.DownloadFile($calendar.url, $finalpath)
}