# Software-Dispatch-Guide
ASUS Control Center provide various elastic methods to execute command or install progress on remote managed devices.  
Through this powerful method assist you reduce a lot of onsite install **application** time.  
(`Important!` the **application** itself have to support silent install command or accept unattend file)

## Related Online training video
 - How to upload your software to software pool?   [Software Pool](https://www.youtube.com/watch?v=gIYsaWSM8jk&t=0s&list=PLI1j8qlptDvIqajLOS9OveggyTcWLDJ3i&index=28 "Software Pool")
 - How to dispatch your software to one device?    [Software Dispatch](https://youtu.be/qba_tdvPF8E?list=PLI1j8qlptDvIqajLOS9OveggyTcWLDJ3i&t=219 "Software Dispatch")
 - How to dispatch your software to multi-devices? [Centrailzed Software Dispatch](https://www.youtube.com/watch?v=uBptddU84T4&list=PLI1j8qlptDvIqajLOS9OveggyTcWLDJ3i&index=28 "Centrailzed Software Dispatch")
 
## Identify the Package Path
This session will explain you how to prepare customization  software package for ASUS Control Center.  
Before you uploading the **script file** & **install file** to software pool.  
- script file :
- install file :


At the fisrt , you have to identify which software deliver path is fit your software behavior.  

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
