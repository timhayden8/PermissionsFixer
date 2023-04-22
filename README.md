# PermissionsFixer
When migrating data between servers, there can sometimes be issues with usershares used in folder redirection. Folder redireciton GPOs often give the user  exclusive rights to the folder. This can be a time consuming process to resolve.
This script first pulls a list of folders under a given path. This script assumes that the FOLDERS will MATCH the UPN of the user they're assigned to. This script will not work if this is not the case. 
It then takes ownership of the folder, assigns full control permissions to the domain admin account, the original owner, and all "Domain Admins". It then reassigns ownership back to the original owner. 
