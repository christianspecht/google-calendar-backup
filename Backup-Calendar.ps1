$config = [xml](get-content .\Config.xml)

$config.Settings.DownloadPath.value

foreach ($calendar in $config.Settings.Calendar)
{
    $calendar.filename
}