<#
    Script:     Simple Example #1 (Static Value)
    Author:     Matt Lavery
    Url:        http://www.matticus.net
    Created:    21/08/2016
    Version:    0.0.1
    Purpose:    This sample demonstrates a simple test of the SQL Server Builds API with a static value
    
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

# Simulated Test

# Set the version number to test
$VersionNumber = '12.00.2342.00' # SQL 2014
$VersionNumber = '11.00.2342.00' # SQL 2012

# Call the API to get the version information
$VersionData = Invoke-RestMethod -Uri "http://sqlserverbuildsapi.azurewebsites.net/api/SQLVersions?Version=$($VersionNumber)";
$VersionData = Invoke-RestMethod -Uri "http://sqlserverbuildsapi.azurewebsites.net:80/api/SQLVersions?Version=$($VersionNumber)&MissingUpdates=$true";

# Want to improve your Health Check script, calculate the health of Support Status
if ($VersionData.ExtendedSupportEnd -le (Get-Date)) {$SupportStatus = 'Critical'}
elseif ($VersionData.MainstreamSupportEnd -le (Get-Date)) {$SupportStatus = 'Warning'}
else {$SupportStatus = 'Ok'}

# format the output data string
$OutputData = @"
Instance = $($Instance.Name)
Version = $($VersionData.Version)
Product = $($VersionData.Product)
Branch = $($VersionData.Branch)
Update = $($VersionData.Update)
MainstreamSupportEnd = $($VersionData.MainstreamSupportEnd)
ExtendedSupportEnd = $($VersionData.ExtendedSupportEnd)
SupportStatus = $($SupportStatus)
"@

# Return the hashtable
ConvertFrom-StringData -StringData $OutputData;
