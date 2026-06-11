# Common helpdesk tasks performed on a daily basis
# in a corporate Active Directory environment
# ================================================


# ------------------------------------------------
# TASK 1 — Reset a User Password
# Scenario: User has forgotten their password
# ------------------------------------------------
Set-ADAccountPassword `
-Identity "sbennett" `
-Reset `
-NewPassword (ConvertTo-SecureString "NewPassword123!" -AsPlainText -Force)

# Verify password was reset
Get-ADUser -Identity "sbennett" | Select Name, SamAccountName


# ------------------------------------------------
# TASK 2 — Unlock a Locked Account
# Scenario: User locked out after failed attempts
# ------------------------------------------------

# Find all locked accounts across the domain
Search-ADAccount -LockedOut | Select Name, SamAccountName, LockedOut

# Unlock a specific user
Unlock-ADAccount -Identity "sbennett"

# Unlock all locked accounts at once
Search-ADAccount -LockedOut | Unlock-ADAccount

# Verify account is unlocked
Get-ADUser -Identity "sbennett" | Select Name, LockedOut


# ------------------------------------------------
# TASK 3 — Disable a User Account
# Scenario: Employee has left the company
# ------------------------------------------------
Disable-ADAccount -Identity "sbennett"

# Verify account is disabled
Get-ADUser -Identity "sbennett" | Select Name, Enabled


# ------------------------------------------------
# TASK 4 — Re-enable a User Account
# Scenario: Account needs reinstating
# ------------------------------------------------
Enable-ADAccount -Identity "sbennett"

# Verify account is enabled
Get-ADUser -Identity "sbennett" | Select Name, Enabled


# ------------------------------------------------
# TASK 5 — Create a New User
# Scenario: New employee joining the company
# ------------------------------------------------
New-ADUser `
-Name "John Smith" `
-GivenName "John" `
-Surname "Smith" `
-SamAccountName "jsmith" `
-UserPrincipalName "jsmith@lab.local" `
-Path "OU=IT Department,DC=lab,DC=local" `
-AccountPassword (ConvertTo-SecureString "Password123!" -AsPlainText -Force) `
-Enabled $true

# Verify user was created
Get-ADUser -Identity "jsmith" | Select Name, SamAccountName, Enabled


# ------------------------------------------------
# TASK 6 — Move User Between OUs
# Scenario: Employee changing department
# ------------------------------------------------
Move-ADObject `
-Identity "CN=John Smith,OU=IT Department,DC=lab,DC=local" `
-TargetPath "OU=HR Department,DC=lab,DC=local"

# Verify user was moved
Get-ADUser -Identity "jsmith" | Select Name, DistinguishedName


# ------------------------------------------------
# TASK 7 — Add User to a Group
# Scenario: User needs access to department resources
# ------------------------------------------------
Add-ADGroupMember -Identity "HR-Staff" -Members "jsmith"

# Verify user was added to group
Get-ADGroupMember -Identity "HR-Staff" | Select Name


# ------------------------------------------------
# TASK 8 — Find All Locked Accounts
# Scenario: Multiple users reporting login issues
# ------------------------------------------------
Search-ADAccount -LockedOut | Select Name, SamAccountName, LockedOut

# Unlock all locked accounts at once
Search-ADAccount -LockedOut | Unlock-ADAccount

# Verify no accounts remain locked
Search-ADAccount -LockedOut | Select Name, SamAccountName
