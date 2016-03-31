#
# InitSQLDataDrives.ps1
#

Initialize-Disk 2;Start-Sleep -s 2;New-Partition -DiskNumber 2 -UseMaximumSize -DriveLetter Z;Start-Sleep -s 2;Format-Volume -DriveLetter Z -FileSystem NTFS -NewFileSystemLabel DATA -Confirm:$false
Initialize-Disk 3;Start-Sleep -s 2;New-Partition -DiskNumber 3 -UseMaximumSize -DriveLetter Y;Start-Sleep -s 2;Format-Volume -DriveLetter Y -FileSystem NTFS -NewFileSystemLabel LOG -Confirm:$false