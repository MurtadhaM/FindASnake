



$iisObject = new-object System.DirectoryServices.DirectoryEntry("IIS://localhost/smtpsvc/1")
$relays = $iisObject.Properties["RelayIpList"].Value


$bindingFlags = [Reflection.BindingFlags] "Public, Instance, GetProperty"
#Filter the list to only include the IP addresses
$ipList = ($relays.GetType().InvokeMember("IPGrant", $bindingFlags, $null, $relays, $null))


# $stagingarray =  foreach ($line in  $csv.split() ) {echo $line}
$file3 = "c:\windows\temp\current-ips.csv"
$read = New-Object System.IO.StreamReader($file3)
$serverarray3 = @()
while (($line = [string[]]($read.ReadLine()) -ne $null))
  {
    $serverarray3 += $line
  }
$read.Dispose()
$iplist = ($serverarray3 | select-object -unique) | sort-object -descending   




[Object[]] $ipArray = @()
$ipArray += , $ipList


# Establish the write connection to the IIS SMTP object and update
$bindingFlags = [Reflection.BindingFlags] "Public, Instance, SetProperty"
$ipList = $relays.GetType().InvokeMember("IPGrant", $bindingFlags, $null, $relays, $ipArray);

$iisObject.Properties["RelayIpList"].Value = $relays
$iisObject.CommitChanges()