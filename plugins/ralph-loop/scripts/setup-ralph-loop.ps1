param(
    [Parameter(ValueFromRemainingArguments = $true)]
    [string[]]$ArgsList
)

$promptParts = New-Object System.Collections.Generic.List[string]
$maxIterations = 5
$completionPromise = $null

for ($i = 0; $i -lt $ArgsList.Count; $i++) {
    $arg = $ArgsList[$i]
    switch ($arg) {
        "--max-iterations" {
            if ($i + 1 -ge $ArgsList.Count) {
                throw "--max-iterations requires a value"
            }
            $i++
            if (-not [int]::TryParse($ArgsList[$i], [ref]$maxIterations) -or $maxIterations -lt 1) {
                throw "--max-iterations must be an integer"
            }
        }
        "--completion-promise" {
            if ($i + 1 -ge $ArgsList.Count) {
                throw "--completion-promise requires a value"
            }
            $i++
            $completionPromise = $ArgsList[$i]
        }
        default {
            $promptParts.Add($arg)
        }
    }
}

$prompt = ($promptParts -join " ").Trim()
if ([string]::IsNullOrWhiteSpace($prompt)) {
    throw "No task prompt provided"
}

$stateDir = ".copilot"
$stateFile = Join-Path $stateDir "ralph-loop.local.md"

if (-not (Test-Path $stateDir)) {
    New-Item -ItemType Directory -Path $stateDir | Out-Null
}

$completionField = if ([string]::IsNullOrWhiteSpace($completionPromise)) { "null" } else { '"' + $completionPromise.Replace('"', '\"') + '"' }
$startedAt = (Get-Date).ToUniversalTime().ToString("yyyy-MM-ddTHH:mm:ssZ")

@"
---
active: true
iteration: 1
max_iterations: $maxIterations
completion_promise: $completionField
started_at: "$startedAt"
---

$prompt
"@ | Set-Content -Path $stateFile -Encoding UTF8

Write-Output "Ralph loop activated"
Write-Output "State file: $stateFile"
Write-Output "Iteration: 1"
Write-Output ("Max iterations: " + ($(if ($maxIterations -gt 0) { $maxIterations } else { "unlimited" })))
if ($completionPromise) {
    Write-Output "Completion promise: $completionPromise"
}
