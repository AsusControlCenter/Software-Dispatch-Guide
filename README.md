# Software-Dispatch-Guide
This document will show you how to pack your own software package for ASUS Control Center.

## Identify the Package Path
ASUS Control Center provide a elastic method to remote execute your installation progress.
Before make your own software pool.
You have to identify which SW deliver path is fit your software.

- silent execute a command line `Path A`
- silent install .msi file `Path B`
- silent install .msu file `Path C`
- silent install .exe file `Path D`

### Path A、 execute command mode

RestartWindosUpdateService.bat
```cmd
net stop wuauserv
net start wuauserv
```
upload it to the sowftware pool
![Alt text](resources/test.jpg?raw=true "Path A")
![Alt text](https://goo.gl/NciLBx "Path A")

### Path B、 through command to install *.msi file
install.bat
```cmd
msiexec.exe 
```

## Basic Software dispatch flow.
1. Upload the package to the Software pool
2. Back to the ClientInfor OverView , select the target device.
3. Enter Softeware function 
