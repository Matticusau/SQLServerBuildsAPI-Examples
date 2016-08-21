<#
    Script:     Multiple Instance Example #1
    Author:     Matt Lavery
    Url:        http://www.matticus.net
    Created:    21/08/2016
    Version:    0.0.1
    Purpose:    This sample demonstrates the SQL Server Builds API by first getting the version number from SQL Server
                and summarises the missing updates
    
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

# Live data example of multiple instances including missing updates


# Import the SQL Module
# NOTE: In July 2016 a new module was released therefore there are two methods of this now
# https://blogs.technet.microsoft.com/dataplatforminsider/2016/06/30/sql-powershell-july-2016-update/

    # Method 1: Module as part of SQL Setup.exe
    Push-Location;
    Import-Module SqlPs -DisableNameChecking;
    Pop-Location;

    # Method 2: Module included with SSMS monthly releases
    Import-Module SqlServer;

# Set the Server name hosting the SQL instances to check
$ServerName = "localhost"

$results = @{};

# Using the SMO object loop over the discovered instances
Foreach ($Instance in (Get-ChildItem -Path SQLSERVER:\SQL\localhost))
{

    # Get the version number via appropriate method

    # Method 1: SMO objects (recommended as we already have the object)
    $VersionNumber = $Instance.VersionString;

    # Method 2: TSQL (rather than pass the ServerInstance param you could navigate to the path first)
    #$VersionNumber = Invoke-Sqlcmd -ServerInstance "$($Instance.Name)\$($Instance.InstanceName)" -Query "SELECT SERVERPROPERTY('PRODUCTVERSION')";
    #$VersionNumber = $VersionNumber.Column1;

    # format the number as SQL only returns single 0's
    $VersionNumber = $VersionNumber.Replace('.0.','.00.')
    if ($VersionNumber.substring($VersionNumber.length - 2) -eq '.0'){$VersionNumber = $VersionNumber.substring(0,$VersionNumber.length - 2);}

    # Call the API to get the version information
    $VersionData = Invoke-RestMethod -Uri "http://sqlserverbuildsapi.azurewebsites.net:80/api/SQLVersions?Version=$($VersionNumber)&MissingUpdates=$true";

    # Build a little hashtable to hold the data
    $tmpResult = [Ordered]@{
                    NumMissingUpdates = $VersionData.Count;
                    MissingUpdates = $VersionData;
                }
    
    # add our data to the overal results
    $results.Add("$($Instance.Name)\$($Instance.InstanceName)", $tmpResult);

} # foreach $instance


# return the results in a summarised table
$results | Format-Table -Property Name,@{Name='NumMissingUpdates'; Expression={$results[$_.Name].NumMissingUpdates}}
