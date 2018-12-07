# Software-Dispatch-Guide
ASUS Control Center provide various elastic methods to remote execute your command or install progress.
Through this powerful method assist you reduce a lot of onsite install application time.
(Application have to support silent install command or accept unatend file.)

This document will show you how to pack your own software package for ASUS Control Center.
We suggest you can watch the related video first.



## Identify the Package Path
Before making your own software package.
You have to identify which SW deliver path is fit your software.

* [Path A、 execute command mode](#Path-A)
- silent execute a command line (Batch Script) .bat / .sh `Path A`  
- silent execute .exe file `Path B`
- silent install .msi file `Path C`
- silent install .msu file `Path D`
- silent install a pakcage ( if the sw containes many files we can zip them to one .zip) `Path E`

## Block Elements
### Path A、 execute command mode

RestartWindosUpdateService.bat
```cmd
net stop wuauserv
net start wuauserv
```
upload it to the sowftware pool
 ![Alt text](resources/test.jpg?raw=true "Path A")

### Path C、 through command to install *.msi file
installMSI.bat
```cmd
msiexec.exe /i yourmsifile.msi /q
```

### Path D、 through command to install *.msi file
installMSU.bat
```cmd
wusa.exe yourmsifile.msu
```

## Basic Software dispatch flow.
1. Upload the package to the Software pool
2. Back to the ClientInfor OverView , select the target device.
3. Enter Softeware function 
