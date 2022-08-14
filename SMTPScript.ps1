#<-------------------------------------------------------------------------------------------------------------------------------------------------------------->
#                   Export the current list of IP addresses to a CSV
#
#-------------------------------------------------------------------------------------------------------------------------------------------------------------->

#Establish connection to the IIS SMTP object and pull the current server list
$iisObject = new-object System.DirectoryServices.DirectoryEntry("IIS://localhost/smtpsvc/1")
# Get the current list of allowed servers/hosts 
$relays = $iisObject.Properties["RelayIpList"].Value
$bindingFlags = [Reflection.BindingFlags] "Public, Instance, GetProperty"
#Filter the list to only include the IP addresses
$ipList = ($relays.GetType().InvokeMember("IPGrant", $bindingFlags, $null, $relays, $null))
#Now export the current server list to a file both for audit and script purposes
$iplist | out-file -filepath "c:\windows\temp\current-ips.csv" -Force
# write the current server list to terminal
Write-Host "Current IP List:" $ipList
#Exporting the current IP list to a file for audit purposes
Write-Host "Exporting current IP list to c:\windows\temp\current-ips.csv"

#<-------------------------------------------------------------------------------------------------------------------------------------------------------------->
#                   READING THE IPs FROM THE CSV FILE
#
#-------------------------------------------------------------------------------------------------------------------------------------------------------------->


# Read and parse the new IP list from the file
#read in to an array from a .csv file the IP addresses you want to import the format is x.x.x.x, x.x.x.x in the file
$file1 = "c:\windows\temp\IPs-To-Import.csv"
$read = New-Object System.IO.StreamReader($file1)
$serverarray1 = @()
while (($line = [string[]]($read.ReadLine()) -ne $null))
  {
    $serverarray1 += $line
  }
$read.Dispose()


#<-------------------------------------------------------------------------------------------------------------------------------------------------------------->
#                   Merge the new IP list with the current IP list
#
#-------------------------------------------------------------------------------------------------------------------------------------------------------------->

$csv-test =@(
 

'10.10.0.0, 255.255.0.0.0
192.101.100.0, 255.255.255.0
172.0.0.0, 255.255.0.0
10.10.10.9, 255.255.255.0
'
)

echo $csv-test


#read in the file that has the current IP list and added to a multi-line object array
$file2 = "c:\windows\temp\IP_Current.csv"
$read = New-Object System.IO.StreamReader($file2)
$serverarray2 = @()
while (($line = [string[]]($read.ReadLine()) -ne $null))
  {
    $serverarray2 += $line
  }
$read.Dispose()

#Merge the two arrays
$stagingarray = $serverarray1 + $serverarray2


#<-------------------------------------------------------------------------------------------------------------------------------------------------------------->
#                   Combine the new IP list with the current IP list and remove duplicates
#
#-------------------------------------------------------------------------------------------------------------------------------------------------------------->

$stagingarray | select-object -unique | out-file -filepath "c:\windows\temp\Master-IPs.csv" -Force



#<-------------------------------------------------------------------------------------------------------------------------------------------------------------->
#                   Import the new IP list into the IIS SMTP object
#   
#-------------------------------------------------------------------------------------------------------------------------------------------------------------->
#read in the data from the file and assign to the $IPlist object
$file3 = "c:\windows\temp\Master-IPs.csv"
$read = New-Object System.IO.StreamReader($file3)
$serverarray3 = @()
while (($line = [string[]]($read.ReadLine()) -ne $null))
  {
    $serverarray3 += $line
  }
$read.Dispose()
$iplist = $serverarray3

# This is important, we need to pass an object array of one element containing our ipList array
[Object[]] $ipArray = @()
$ipArray += , $ipList


#<-------------------------------------------------------------------------------------------------------------------------------------------------------------->
#                   Change the IP list in the IIS SMTP object
#
#-------------------------------------------------------------------------------------------------------------------------------------------------------------->
# Establish the write connection to the IIS SMTP object and update



$bindingFlags = [Reflection.BindingFlags] "Public, Instance, SetProperty"
$ipList = $relays.GetType().InvokeMember("IPGrant", $bindingFlags, $null, $relays, $ipArray);

$iisObject.Properties["RelayIpList"].Value = $relays
$iisObject.CommitChanges()





$iisObject = new-object System.DirectoryServices.DirectoryEntry("IIS://localhost/smtpsvc/1")
# Get the current list of allowed servers/hosts 
$relays = $iisObject.Properties["RelayIpList"].Value
$bindingFlags = [Reflection.BindingFlags] "Public, Instance, GetProperty"
#Filter the list to only include the IP addresses
$ipList = ($relays.GetType().InvokeMember("IPGrant", $bindingFlags, $null, $relays, $null))
#Now export the current server list to a file both for audit and script purposes
$iplist | out-file -filepath "c:\windows\temp\current-ips.csv" -Force
# write the current server list to terminal
Write-Host "Current IP List:" $ipList
#Exporting the current IP list to a file for audit purposes
Write-Host "Exporting current IP list to c:\windows\temp\current-ips.csv"


#ADD THE NEW IP LIST HERE WITH NO SPACES:

$csv =@(
    '10.10.0.0,255.255.0.0.0
    192.101.100.0,255.255.255.0
    172.0.0.0,255.255.0.0
    10.10.10.9,255.255.255.0
    '
)
