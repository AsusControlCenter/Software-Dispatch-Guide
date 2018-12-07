# Software-Dispatch-Guide
ASUS Control Center (ACC) provide various elastic methods to execute command or install progress on remote managed devices.  
Through this powerful method assist you reduce a lot of onsite install **application** time.  
(`Important!` the **application** itself have to support silent install command or accept unattend file)

## Related Online training video
 - How to upload your software to software pool?   [Software Pool](https://www.youtube.com/watch?v=gIYsaWSM8jk&t=0s&list=PLI1j8qlptDvIqajLOS9OveggyTcWLDJ3i&index=28 "Software Pool")
 - How to dispatch your software to one device?    [Software Dispatch](https://youtu.be/qba_tdvPF8E?list=PLI1j8qlptDvIqajLOS9OveggyTcWLDJ3i&t=219 "Software Dispatch")
 - How to dispatch your software to multi-devices? [Centrailzed Software Dispatch](https://www.youtube.com/watch?v=uBptddU84T4&list=PLI1j8qlptDvIqajLOS9OveggyTcWLDJ3i&index=28 "Centrailzed Software Dispatch")

## Prepare your softwrare package  
This session will explain how to prepare customization software package for ASUS Control Center.  

---
### Step 1. Uderstatnding the difference between the _Script File_ and _Install File_

Before you uploading the **Script File** & **Install file** to software pool.  
- **Script File** :  
    Script File extention can be **.bat** (for Windows) or **.sh** (for Linux).  
    Here you can put the `command` executed on remote managed device.  
    Or you can put the command about how the **Install File** be installed.  
    The `ACC Agent` , will download the Scipt File form `ACC Server` and use the **NT AUTHORITY\SYSTEM** 
    [privileges](https://docs.microsoft.com/en-us/windows/desktop/services/localsystem-account "privileges" ) to execute it.  
    
- **Install File** (option) :  
    `Install File` means the file you want to install on remote managed device.  
    The file extention can be **.msi** 、**.msu** 、**.exe** 、**.zip** (if your install file contain required libs etc.)
---         
### Step 2. Chose the correct Software Package deliver path
Identify which software deliver path is match your software behavior.  
- **Path A 、** silent execute a command line (Script File Only)
- **Path B 、** silent install .msi file
- **Path C 、** silent install .msu file
- **Path D 、** silent install a pakcage ( if the sw containes many files we can zip them to one .zip)  
We will show you some sample in different Path.  

---
#### Path A、 execute command mode

##### `Sample A01` use command to restart a Service
This sample shows how to write a short command to restart a windows update service (wuauserv).

**Script File :**  
**RestartWindosUpdateService.bat** content : 
```cmd
net stop wuauserv
net start wuauserv
```
>more command reference can check [here](https://www.windows-commandline.com/start-stop-service-command-line)  
![image](/resources/images/SampleA01.png)  

---  

##### `Sample A02` use command to add a test account to local user
This sample shows how to add a test account and give initial password through command.

**Script File :**  
**AddTestUser.bat** content : 
```cmd
net user test pwd1234 /add
```  
>more command reference can check [here](https://www.windows-commandline.com/add-user-from-command-line "Reference")  

     
---
#### Path C、 through command to install *.msi file
installMSI.bat
```cmd
msiexec.exe /i yourmsifile.msi /q
```

#### Path D、 through command to install *.msi file
installMSU.bat
```cmd
wusa.exe yourmsifile.msu
```

### Step 3. Upload to the software pool

### Step 4. Test it on your develop maching

### Basic Software dispatch flow.
1. Upload the package to the Software pool
2. Back to the ClientInfor OverView , select the target device.
3. Enter Softeware function 
