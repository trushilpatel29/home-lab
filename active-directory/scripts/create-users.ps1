Import-Module ActiveDirectory

$password = ConvertTo-SecureString "Password123!" -AsPlainText -Force

$domain = "DC=lab,DC=local"

$users = @(
@{First="Amelia"; Last="Carter"; User="acarter"; OU="IT Department"},
@{First="Daniel"; Last="Hughes"; User="dhughes"; OU="IT Department"},
@{First="Sofia"; Last="Bennett"; User="sbennett"; OU="IT Department"},
@{First="Marcus"; Last="Reed"; User="mreed"; OU="IT Department"},

@{First="Olivia"; Last="Turner"; User="oturner"; OU="HR Department"},
@{First="Ethan"; Last="Collins"; User="ecollins"; OU="HR Department"},
@{First="Chloe"; Last="Ramirez"; User="cramirez"; OU="HR Department"},
@{First="Nathan"; Last="Brooks"; User="nbrooks"; OU="HR Department"},

@{First="Isabella"; Last="Foster"; User="ifoster"; OU="Finance Department"},
@{First="Julian"; Last="Price"; User="jprice"; OU="Finance Department"},
@{First="Grace"; Last="Mitchell"; User="gmitchell"; OU="Finance Department"},
@{First="Leo"; Last="Simmons"; User="lsimmons"; OU="Finance Department"},

@{First="Victoria"; Last="Hayes"; User="vhayes"; OU="Management"},
@{First="Cameron"; Last="Bailey"; User="cbailey"; OU="Management"},
@{First="Hannah"; Last="Cooper"; User="hcooper"; OU="Management"},
@{First="Adrian"; Last="Morales"; User="amorales"; OU="Management"},

@{First="Lily"; Last="Patterson"; User="lpatterson"; OU="Workstations"},
@{First="James"; Last="Walker"; User="jwalker"; OU="Workstations"},
@{First="Emily"; Last="Scott"; User="escott"; OU="Workstations"},
@{First="Noah"; Last="Young"; User="nyoung"; OU="Workstations"}

)
foreach ($u in $users) { 
$ouPath = "OU=$($u.OU),$domain"

New-ADUser '
	-Name "$($u.First) $($u.Last)" '
	-GivenName $u.First '
	-Surname $u.Last '
	-SamAccountName $u.uSER '
	-UserPrincipalName "$($u.user)@lab.local"
	-Path $ouPath '
	-AccountPassword $Password '
	-Enabled $true '
	-ChangePasswordAtLogon $false

Write-Host "Created $($u.User) in $($u.OU)"
