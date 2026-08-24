$stateFile = ".copilot/ralph-loop.local.md"

if (-not (Test-Path $stateFile)) {
    Write-Output "No active Ralph loop found. Run /ralph-loop to start one."
    exit 0
}

$content = Get-Content -Path $stateFile -Raw
$iteration = "unknown"
$maxIterations = "unknown"
$completionPromise = "none"
$taskPrompt = ""

if ($content -match "(?m)^iteration:\s*(\d+)") {
    $iteration = $Matches[1]
}

if ($content -match "(?m)^max_iterations:\s*(.+)") {
    $maxIterations = $Matches[1].Trim()
}

if ($content -match "(?m)^completion_promise:\s*(.+)") {
    $completionPromise = $Matches[1].Trim()
    if ($completionPromise -eq 'null') { $completionPromise = 'none' }
}

if ($content -match '(?s)---\r?\n(?:.*?\r?\n)*?---\r?\n(?<prompt>.*)$') {
    $taskPrompt = $Matches['prompt'].Trim()
}

Write-Output "Continuing active Ralph loop"
Write-Output "State file: $stateFile"
Write-Output "Iteration: $iteration"
Write-Output "Max iterations: $maxIterations"
Write-Output "Completion promise: $completionPromise"

if (-not [string]::IsNullOrWhiteSpace($taskPrompt)) {
    Write-Output ""
    Write-Output "Current task prompt:"
    Write-Output $taskPrompt
}
