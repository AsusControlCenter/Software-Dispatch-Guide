# Software Dispatch Guide
ASUS Control Center (ACC) provide various elastic methods to execute command or install progress on remote managed devices.  
Through this powerful method assist you reduce a lot of onsite install **application** time.  
(`Important!` the **application** itself have to support silent install command or accept unattend file)

## Related Online training video
 - How to upload your software to software pool?   [Software Pool](https://www.youtube.com/watch?v=gIYsaWSM8jk&t=0s&list=PLI1j8qlptDvIqajLOS9OveggyTcWLDJ3i&index=28 "Software Pool")
 - How to dispatch your software to one device?    [Software Dispatch](https://youtu.be/qba_tdvPF8E?list=PLI1j8qlptDvIqajLOS9OveggyTcWLDJ3i&t=219 "Software Dispatch")
 - How to dispatch your software to multi-devices? [Centralized Software Dispatch](https://www.youtube.com/watch?v=uBptddU84T4&list=PLI1j8qlptDvIqajLOS9OveggyTcWLDJ3i&index=28 "Centralized Software Dispatch")

## Prepare your software package  
This session will explain how to prepare customization software package for ASUS Control Center.  

---
### Step 1. Understanding the difference between the _Script File_ and _Setup File_

Before you uploading the **Script File** & **Install file** to software pool.  
- **Script File** :  
    Script File extention can be **.bat** (for Windows).  
    Here you can put the `command` executed on remote managed device.  
    Or you can put the command about how the **Script File** be installed.  
    The `ACC Agent` , will download the Scipt File form `ACC Server` and use the **NT AUTHORITY\SYSTEM** 
    [privileges](https://docs.microsoft.com/en-us/windows/desktop/services/localsystem-account "privileges" ) to execute it.  
    
- **Setup File** (optional) :  
    `Setup File` means the file you want to install on remote managed device.  
    The file extension can be **.msi** 、**.msu** 、**.exe** 、**.zip** (if your install file contain required libs etc.)
---         
### Step 2. Choose the correct Software Package deliver path
Identify which software deliver path is match your software behavior.  
We will provide some example in each Path.  

- **Path A 、** silent execute a batch command
    - Sample A01 use command to restart a Service
    - Sample A02 use command to add a test account to local user
    
- **Path B 、** silent install .msi file
    - Sample B01 silent install 7-Zip
    - Sample B02 silent install Google Chrome Browser
    
- **Path C 、** silent install .msu file
    - Sample C02 silent install msu
    
- **Path D 、** silent install a package ( if the software contains many files , we can zip them to one .zip)  
    - Sample D01 silent install UltraVNC

---

## Path A : silent execute a batch command

##### `Sample A01` use command to restart a Service
This sample shows how to write a short command about restart a windows update service (wuauserv).

- **Script File :**  
**RestartWindosUpdateService.bat** content : 
```cmd
net stop wuauserv
net start wuauserv
```
>more command reference can check [here](https://www.windows-commandline.com/start-stop-service-command-line)

![image](/resources/images/SampleA01.png)  

***

##### `Sample A02` use command to add a test account to local user
This sample shows how to add a test account and give initial password through command.

- **Script File :**  
**AddTestUser.bat** content : 
```cmd
net user test pwd1234 /add
```  
>more command reference can check [here](https://www.windows-commandline.com/add-user-from-command-line "Reference")

![image](/resources/images/SampleA02.png)  

***


## Path B、 silent install .msi file
In this path , `Script File` will write the **msiexec.exe** command about **silent install** the `Setup File`

##### `Sample B01` silent install 7-Zip
This sample shows how to write a short command to silent install 7-zip utility.  
`Important` in stardand **.msi** file through the installer **[msiexec.exe](https://docs.microsoft.com/en-us/windows/desktop/Msi/command-line-options "Reference")** use paramater **/q** will install the program in quite mode. 

- **Script File :**  
**install.bat** content : 
```cmd
msiexec.exe /i 7zip.msi /q
```

- **Setup File :**  
**7zip.msi**  
You can download latest version from 7-Zip [official site](https://www.7-zip.org/download.html) and rename to 7zip.msi  
Please remember to download the .msi format  
>more command reference can check 
>7-Zip Silent install command [7-Zip Silent Install](https://www.7-zip.org/faq.html "Reference")  
>MS msi installer command [msiexec](https://docs.microsoft.com/en-us/windows/desktop/Msi/command-line-options "Reference")  

![image](/resources/images/SampleB01.png)  

***

##### `Sample B02` silent Google Chrome Browser
This sample shows how to write a short command about silent install Google Chrome Browser.  
`Important` in stardand **.msi** file use paramater **/q** will install the program in quite mode. 

- **Script File :**  
**install.bat** content : 
```cmd
msiexec.exe /i googlechromestandaloneenterprise64.msi /q
```

- **Setup File :**  
**googlechromestandaloneenterprise64.msi**  
You can download latest version from Chrome Browser for Enterprise [official site](https://enterprise.google.com/intl/en-us/chrome/chrome-browser/)  
Please remember to download the standalone edition and .msi format  
>more command reference can check
>MS msi installer command [msiexec](https://docs.microsoft.com/en-us/windows/desktop/Msi/command-line-options "Reference")  

![image](/resources/images/SampleB02.png)  

***


#### Path C、 through command to install .msu file  
In this path , `Script File` will write the **wusa.exe** command about **silent install** the `Setup File`

##### `Sample C01` silent install .msu file
This sample shows how to write a short command to silent install .msu file  
`Important` in stardand **.msu** file through the installer **[wusa.exe](https://support.microsoft.com/en-us/help/934307/description-of-the-windows-update-standalone-installer-in-windows)** use paramater **/q** will install the program in quite mode. 

- **Script File :**  
**installMSU.bat** content : 
```cmd
wusa.exe /q yourmsu.msu
```

- **Setup File :**  
**yourmsu.msu**  
>more command reference can check
>MS msu installer command [wusa.exe](https://support.microsoft.com/en-us/help/934307/description-of-the-windows-update-standalone-installer-in-windows)  

![image](/resources/images/SampleC01.png)  

***

#### Path Path D 、 silent install a package ( if the software contains many files , we can zip them to one .zip) 
Sometimes your setup file will not just a .exe or .msi file.  
It may contains libraries like .DLLs or config file .ini  
In this scenario we can pack them into one **.Zip** file.
In this path , `Script File` will write the command how to **silent install** the `Setup File`  
`Important` ACC Agent will zutomatically unzip the `Setup File` pack in the same directory as `Script File`  

##### `Sample D01` silent install UltraVNC 
This sample shows how to write a command about silent install UltraVNC.  
Due to UltraVNC support load configuration file from external, so our demostration is  
to pack the ultravnc.exe and ultravnc.ini to a zip file to be Setup File.

- **Script File :**  
**install.bat** content : 
```cmd
UltraVNC_1_2_23_X86_Setup.exe /silent /loadinf="ultravnc.ini"
```

- **Setup File :**  
Zip the **UltraVNC_1_2_23_X86_Setup.exe**  , **ultravnc.ini** to **SetupSource.zip**   
The name of .zip file is up to you.  
Here we use SetupSource.zip be the sample.

>more command reference can check
>UltraVNC installer command [UltraVnc Installation](http://www.uvnc.com/install/installation.html#automate)  

![image](/resources/images/SampleD01.png)  

***


### Step 3. Upload to the software pool

### Step 4. Test it on your develop maching
