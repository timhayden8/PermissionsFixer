function permissionsfixer
{
    param($Filepath)
    $folderlist = get-childitem "$filepath"
    $domainadmin = ([Security.Principal.WindowsIdentity]::GetCurrent()).name
    foreach ($folder in $folderlist)
    {
        $fullpath = $folder.fullname
        $name = [string]$folder.name
        if ((test-path ($fullpath+"\desktop")))
        {
            takeown.exe /f ($fullpath+"\desktop") /r /d Y
            icacls ($fullpath+"\desktop") /grant "Domain Admins":F /T
            icacls ($fullpath+"\desktop") /grant $name":F" /T
            icacls ($fullpath+"\desktop") /grant $domainadmin":F" /T
            icacls ($fullpath+"\desktop") /setowner $name   
        }
        if ((test-path ($fullpath+"\documents")))
        {
            takeown.exe /f ($fullpath+"\documents") /r /d Y
            icacls ($fullpath+"\documents") /grant "Domain Admins":F /T
            icacls ($fullpath+"\documents") /grant $name":F" /T
            icacls ($fullpath+"\documents") /grant $domainadmin":F" /T
            icacls ($fullpath+"\documents") /setowner $name  
        }
        if ((test-path ($fullpath+"\pictures")))
        {
            takeown.exe /f $folder.fullname"\pictures" /r /d Y
            icacls ($fullpath+"\pictures") /grant "Domain Admins":F /T
            icacls ($fullpath+"\pictures") /grant $name":F" /T
            icacls ($fullpath+"\pictures") /grant $domainadmin":F" /T
            icacls ($fullpath+"\pictures") /setowner $name   
        }
    }
}
permissionsfixer -filepath (read-host "Enter file path in quotes")