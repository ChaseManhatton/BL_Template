Configuration IISConfig
{
  param ($MachineName)

  Node $MachineName
  {
    #Install the IIS Role
    WindowsFeature IIS
    {
      Ensure = “Present”
      Name = “Web-Server”
    }

    #Install ASP.NET 4.5
    WindowsFeature ASP
    {
      Ensure = “Present”
      Name = “Web-Asp-Net45”
    }

     WindowsFeature WebServerManagementConsole
    {
        Name = "Web-Mgmt-Console"
        Ensure = "Present"
    }

    File CreateFile {
        DestinationPath = 'C:\inetpub\wwwroot\serverid.txt'
        Ensure = "Present"
        Contents = $MachineName
    }

    Log AfterDirectoryCopy
    {
        # The message below gets written to the Microsoft-Windows-Desired State Configuration/Analytic log
        Message = "Finished running the file resource with ID CreateFile"
        DependsOn = "[File]CreateFile" # This means run "CreateFile" first.
    }
  }
}