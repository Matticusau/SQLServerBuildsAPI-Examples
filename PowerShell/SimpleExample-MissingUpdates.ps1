<#
    Script:     Simple Example #2 (Static Value)
    Author:     Matt Lavery
    Url:        http://www.matticus.net
    Created:    21/08/2016
    Version:    0.0.1
    Purpose:    This sample demonstrates a simple test of the SQL Server Builds API with a static value returning missing updates
    
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

# Simulated Test that displays missing update information

# Set the version number to test
$VersionNumber = '12.00.2342.00' # SQL 2014
$VersionNumber = '11.00.2342.00' # SQL 2012

# Call the API to get the known missing updates (released since current version)
$VersionData = Invoke-RestMethod -Uri "http://sqlserverbuildsapi.azurewebsites.net:80/api/SQLVersions?Version=$($VersionNumber)&MissingUpdates=$true";

# return the output, it is already formated as an Array
$VersionData

# or as a table
$VersionData | Format-Table -Property Version,Branch,Update,@{Name="Released";Expression={Get-Date $_.Released -Format 'yyyy-MM-dd'}},Description -AutoSize

