# Software-Dispatch-Guide
This document will show you how to pack your own software package for ASUS Control Center.

## Identify the Package Path

### Path A、 execute command mode

RestartWindosUpdateService.bat
```cmd
net stop wuauserv
net start wuauserv
```
### Path B、 through command to install *.msi file
install.bat
```cmd
msiexec.exe 
```

## Basic Software dispatch flow.
1. Upload the package to the Software pool
2. Back to the ClientInfor OverView , select the target device.
3. Enter Softeware function 
