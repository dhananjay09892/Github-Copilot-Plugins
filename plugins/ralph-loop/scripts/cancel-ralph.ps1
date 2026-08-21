$stateFile = ".copilot/ralph-loop.local.md"

if (-not (Test-Path $stateFile)) {
    Write-Output "No active Ralph loop found."
    exit 0
}

$content = Get-Content -Path $stateFile -Raw
$iteration = "unknown"

if ($content -match "(?m)^iteration:\s*(\d+)") {
    $iteration = $Matches[1]
}

Remove-Item -Path $stateFile -Force
Write-Output "Cancelled Ralph loop (was at iteration $iteration)."
