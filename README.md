Install-WSUS
============

This is trivial powershell module to install WSUS(Windows Server Update Services).
## Get started ##
1. Deploy module folder "Install-WSUS" under your powershell modules folder.
1. Open your PowerShell console.
1. Type
```
  Import-Module Install-WSUS
  Install-WSUS <PUT-COMPUTERNAME-TO-INSTALL>
```
To specify download cache folder.
```
  Install-WSUS <PUT-COMPUTERNAME-TO-INSTALL> -ContentPath <PATH-TO-CONTENT-FOLDER>
```
1. Connect the server with wsus management tool and download all updates you need.
1. Relax
