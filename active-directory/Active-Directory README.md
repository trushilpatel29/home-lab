# Project 1 - Active Directory Lab

## Overview
Deployed a fully functioning Active Directory 
environment using Windows Server 2025 as a Domain 
Controller with a Windows 11 Enterprise client 
joined to the domain.

## Environment
| Component | Details |
|---|---|
| Domain Controller | DC01 — Windows Server 2025 |
| Client Machine | Client01 — Windows 11 Enterprise |
| Domain | lab.local |
| DC01 IP | 192.168.2.10 (static) |
| Client IP Range | 192.168.2.100-200 (DHCP) |
| Virtualisation | VirtualBox NAT Network |

## What Was Built
- Windows Server 2025 VM deployed as DC01
- Active Directory Domain Services installed
- lab.local domain and forest created
- DNS Server configured and verified
- DHCP Server installed with scope 192.168.2.100-200
- 5 Organisational Units created
- 20 user accounts created via PowerShell
- 4 security groups created and populated
- Windows 11 Enterprise VM deployed as Client01
- Client01 joined to lab.local domain
- Domain user login verified on Client01

## Skills Demonstrated
- Windows Server 2025 deployment and configuration
- Active Directory installation and management
- DNS and DHCP configuration
- PowerShell automation for AD management
- Virtual networking with VirtualBox
- Domain join process
- Helpdesk tasks — password resets, account 
  management, user creation, OU management

## Security Findings
**Finding 1 - MachineAccountQuota Misconfiguration**
Default value of 10 allows regular domain users to join up to 10 computers to the domain without admin credentials. Remediated by setting quota to 0 via PowerShell.

**Finding 2 - Account Lockout Policy Not Configured**
Default threshold of 0 allows unlimited login attempts — brute force vulnerability. Configured Account Lockout Policy via Default Domain Policy GPO with threshold set to 3 attempts.

## Problems Encountered & Fixed
| Problem | Cause | Fix |
|---|---|---|
| Black screen on VM boot | EFI conflict with boot order | Disabled EFI, set optical as first boot |
| Internet lost after static IP | IP didn't match VirtualBox NAT range | Created NAT Network, updated IP range |
| TPM 2.0 error Windows 11 | EFI settings triggering hardware check | Registry bypass via LabConfig key |
| VirtualBox DHCP conflict | Two DHCP servers on same network | Disabled VirtualBox built in DHCP |
| Domain join with wrong credentials | Used standard user not Administrator | Used Administrator credentials |

## PowerShell Scripts
| Script | Purpose |
|---|---|
| create-users.ps1 | Creates 20 AD users across 5 OUs |
| add-group-members.ps1 | Adds users to security groups |
| verify-groups.ps1 | Verifies group membership |
| helpdesk-tasks.ps1 | Common helpdesk AD tasks |
| security-fixes.ps1 | AD security misconfigurations identified and fixed | 

All can be found in Scripts Folder.

## AI Tools Used
Claude AI (Anthropic) used as a troubleshooting and 
learning aid throughout this project including network 
diagnostics, PowerShell scripting and identifying 
security misconfigurations. All solutions were tested, 
verified and understood independently.

## Full Documentation
Complete writeup with screenshots available at:
https://burnt-hardcover-86e.notion.site/Home-Labs-3594b835185080dfb924fb719696888e?source=copy_link

## Key Concepts Learned
- Active Directory architecture and components
- DNS dependency for AD functionality
- DHCP scope configuration and authorisation
- Static IP requirements for servers
- PowerShell automation for AD management
- Virtual networking and VM communication
- Domain join process and requirements
- MachineAccountQuota security misconfiguration
- Troubleshooting methodology for VM environments
