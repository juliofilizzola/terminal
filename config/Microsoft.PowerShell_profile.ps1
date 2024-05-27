$MaximumHistoryCount = 20000

Import-Module PSReadLine
Import-Module Get-ChildItemColor
Import-Module Terminal-Icons
Import-Module DockerCompletion

# config from oh-my-posh
& ([ScriptBlock]::Create((oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\cert.omp.json" --print) -join "`n"))

# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
    Import-Module "$ChocolateyProfile"
}

# config PowerShell autocomplete

Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward

# config PowerShell autocomplete toolTip
Set-PSReadLineOption -ShowToolTips
Set-PSReadLineOption -PredictionSource History

function cdd() { Set-Location "C:\Downloads" }
function cdp() { Set-Location "C:\Users\Julio\Documents\REPO" }
function cdpd() { Set-Location "C:\Users\Julio\Documents\REPO" }

function opd() { open "C:\Downloads" }
function opp() { open "C:\Users\Julio\Documents\REPO" }

function edp() { code $PROFILE }
function edh() { code "$HOME\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt" }
function eds() { code "$HOME\AppData\Local\oh-my-posh\spaceship.omp.json" }
