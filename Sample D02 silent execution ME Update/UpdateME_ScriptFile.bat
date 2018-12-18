rmdir C:\ASUS_MEFW_Update /Q /S 
mkdir C:\ASUS_MEFW_Update
Xcopy *.* C:\ASUS_MEFW_Update /s /e /Y
C:\ASUS_MEFW_Update\PsExec64.exe -accepteula cmd.exe /c start c:\ASUS_MEFW_Update\FWUpdLcl64.exe -F c:\ASUS_MEFW_Update\ME.bin -ALLOWSV -Y -FORCERESET
exit /b %ERRORLEVEL%
