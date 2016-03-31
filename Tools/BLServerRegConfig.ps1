Configuration BLAppRegChange
{
	param ($MachineName)

	Node $MachineName
	{
		Registry RegistryDeleteTempDirs
		{
			Ensure = "Present"  # You can also set Ensure to "Absent"
			Key = "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server"
			ValueName = "DeleteTempDirsOnExit"
			ValueData = "0"
			ValueType = "Dword"
		}

		Registry RegistryPerSessionTempDir
		{
			Ensure = "Present"  # You can also set Ensure to "Absent"
			Key = "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server"
			ValueName = "PerSessionTempDir"
			ValueData = "0"
			ValueType = "Dword"
		}
	}
}