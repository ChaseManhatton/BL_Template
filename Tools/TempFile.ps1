Configuration CreateServerIDFile
{
    param ($MachineName)
    Node $MachineName
    {
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