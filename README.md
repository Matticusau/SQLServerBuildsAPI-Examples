# SQLServerBuildsAPI-Examples
A collection of samples code for using my the SQL Server Builds API

## About the API

The SQL Server Builds API provides SQL Server Version information and known support life-cycle information. As it is a personal project of mine the data is currently manually maintained based on known sources. The main objective of the tool is to enhance health check and project planning type processes, it is not intended for licensing or other legal auditing processes.

For more information on the SQL Server Builds API read the [blog post](http://blog.matticus.net/2016/08/new-sql-server-builds-api-improve-your.html)

## PowerShell Examples

### Simple static value example
* PowerShell/SimpleExample-VersionInfo.ps1
* PowerShell/SimpleExample-MissingUpdates.ps1

### Single Instance
* PowerShell/SingleInstance-VersionInfo.ps1
* PowerShell/SingleInstance-MissingUpdates.ps1

### Multiple Instances
* PowerShell/MultipleInstances-VersionInfo.ps1
* PowerShell/MultipleInstances-MissingUpdates.ps1


## C# Examples

### APIClientDemo
* A Windows Form demo of querying the API


## Versions

### Unreleased

* None

### 0.0.0.2

* Added more examples
    * APIClientDemo c# Windows Form example 

### 0.0.0.1

* Initial release
    * PowerShell examples

## Contributing
If you are interested in contributing please check out common DSC Resources [contributing guidelines](https://github.com/PowerShell/DscResource.Kit/blob/master/CONTRIBUTING.md). These are the standards I try and adopt for my work as well.

## License
These exampels are released under the [MIT License](https://github.com/Matticusau/SQLServerBuildsAPI-Examples/blob/master/LICENSE)


