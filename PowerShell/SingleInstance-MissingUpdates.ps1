<#
    Script:     Single Instance Example #2
    Author:     Matt Lavery
    Url:        http://www.matticus.net
    Created:    21/08/2016
    Version:    0.0.1
    Purpose:    This sample demonstrates the SQL Server Builds API by first getting the version number from SQL Server
                and returns the missing updates
    
    Disclaimer: This Sample Code is provided for the purpose of illustration only and is not intended to be 
                used in a production environment.  THIS SAMPLE CODE AND ANY RELATED INFORMATION ARE PROVIDED 
                "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED 
                TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR PURPOSE.  We grant 
                You a nonexclusive, royalty-free right to use and modify the Sample Code and to reproduce and 
                distribute the object code form of the Sample Code, provided that You agree: (i) to not use 
                Our name, logo, or trademarks to market Your software product in which the Sample Code is 
                embedded; (ii) to include a valid copyright notice on Your software product in which the 
                Sample Code is embedded; and (iii) to indemnify, hold harmless, and defend Us and Our 
                suppliers from and against any claims or lawsuits, including attorneys’ fees, that arise 
                or result from the use or distribution of the Sample Code.

    Change History
    Version    Who          When           What
    --------------------------------------------------------------------------------------------------
    0.0.1      MLavery      21/08/2016     Initial Coding
    
    
#>

# Live data example of a single instance returning missing updates


# Import the SQL Module
# NOTE: In July 2016 a new module was released therefore there are two methods of this now
# https://blogs.technet.microsoft.com/dataplatforminsider/2016/06/30/sql-powershell-july-2016-update/

    # Method 1: Module as part of SQL Setup.exe
    Push-Location;
    Import-Module SqlPs -DisableNameChecking;
    Pop-Location;

    # Method 2: Module included with SSMS monthly releases
    Import-Module SqlServer;

# Set the SQL Server name (e.g. for default instance just the server name, for named instance format as SERVERNAME\INSTANCE)
$SqlServerName = "localhost"

# Get the version number via appropriate method

    # Method 1: SMO objects
    $Instance = Get-ChildItem -Path "SQLSERVER:\SQL\$SqlServerName";
    $VersionNumber = $Instance.VersionString;

    # Method 2: TSQL
    $VersionNumber = Invoke-Sqlcmd -ServerInstance $SqlServerName -Query "SELECT SERVERPROPERTY('PRODUCTVERSION')";
    $VersionNumber = $VersionNumber.Column1;

# format the number as SQL only returns single 0's
$VersionNumber = $VersionNumber.Replace('.0.','.00.')
if ($VersionNumber.substring($VersionNumber.length - 2) -eq '.0'){$VersionNumber = $VersionNumber.substring(0,$VersionNumber.length - 2);}

# Call the API to get the version information
$VersionData = Invoke-RestMethod -Uri "http://sqlserverbuildsapi.azurewebsites.net:80/api/SQLVersions?Version=$($VersionNumber)&MissingUpdates=$true";

# return the output, it is already formated as an Array
$VersionData

# or as a table
$VersionData | Format-Table -Property Version,Branch,Update,@{Name="Released";Expression={Get-Date $_.Released -Format 'yyyy-MM-dd'}},Description -AutoSize

