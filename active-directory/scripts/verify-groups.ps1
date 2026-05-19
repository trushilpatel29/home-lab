# Verify IT-Admins members
Write-Host "IT-Admins Members:" -ForegroundColor Cyan
Get-ADGroupMember -Identity "IT-Admins" | Select Name


# Verify HR-Staff members
Write-Host "HR-Staff Members:" -ForegroundColor Cyan
Get-ADGroupMember -Identity "HR-Staff" | Select Name


# Verify Finance-Staff members
Write-Host "Finance-Staff Members:" -ForegroundColor Cyan
Get-ADGroupMember -Identity "Finance-Staff" | Select Name


# Verify Managers members
Write-Host "Managers Members:" -ForegroundColor Cyan
Get-ADGroupMember -Identity "Managers" | Select Name
