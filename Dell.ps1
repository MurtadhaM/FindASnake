# Downloading the fiels from the server
Invoke-WebRequest -Uri "https://downloads.dell.com/serviceability/catalog/SupportAssistInstaller.exe" -OutFile "c:\windows\temp\SupportAssist.exe"
Invoke-WebRequest -Uri "https://github.com/MurtadhaM/FindASnake/raw/main/DBUTIL.exe" -OutFile "c:\windows\temp\DBUTIL.exe"
Invoke-WebRequest -Uri "https://github.com/MurtadhaM/FindASnake/raw/main/Command.exe" -OutFile "c:\windows\temp\Command.exe"


# Installing the files silently
cmd.exe /c  "c:\windows\temp\SupportAssist.exe /s /v /S" 
& cmd.exe /c  "c:\windows\temp\DBUTIL.exe /f /s"
& cmd.exe /c "c:\windows\temp\Command.exe /f /s" 





