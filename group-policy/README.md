# Project 2 — Group Policy

## Overview
Configured and managed multiple Group Policy Objects 
(GPOs) to enforce security settings, user restrictions 
and environment configuration across the lab.local 
domain. Included a troubleshooting exercise diagnosing 
a deliberately broken GPO.

## Environment
Standard lab environment (DC01 + Client01 on lab.local).
- DC01 — Domain Controller (Group Policy Management)
- Client01 — Windows 11 client (where policies apply)

## GPOs Configured

| GPO | Type | Purpose |
|---|---|---|
| Password Policy | Computer (Default Domain Policy) | Enforce strong password requirements |
| Desktop Wallpaper | User | Standard corporate wallpaper |
| Mapped Network Drive | User (Preference) | Auto-map shared drive at login |
| Block Control Panel | User | Restrict access to Control Panel/Settings |
| Screen Lock Timeout | User | Auto-lock screen after inactivity |

## Key Skills Demonstrated
- Creating and linking GPOs in Group Policy Management
- Understanding User vs Computer Configuration
- Understanding Policies vs Preferences
- Domain-wide password policy configuration
- Security hardening through user restrictions
- GPO troubleshooting with gpresult and gpupdate
- Reading gpresult HTML reports to diagnose issues
- Security Filtering and its effect on GPO application

## Troubleshooting Exercise
Deliberately broke the Block Control Panel GPO by 
removing Authenticated Users from Security Filtering, 
then diagnosed and fixed it:
- Confirmed the break (Control Panel accessible again)
- Used gpresult /r to confirm GPO no longer applied
- Generated gpresult /h report showing GPO inaccessible
- Re-added Authenticated Users to restore the GPO
- Verified fix via gpresult and functional test

## Problems Encountered & Fixed

| Problem | Cause | Fix |
|---|---|---|
| Custom GPO password settings not applying | Password policy only works via Default Domain Policy | Configured password policy in Default Domain Policy |
| Wallpaper GPO not applying (gpresult N/A) | User Config GPO linked to OU with only computer accounts | Linked GPO at domain level to reach users |
| gpresult access denied | Writing to C:\ root needs elevated permissions | Saved report to user Desktop |
| gpresult path not found in PowerShell | %userprofile% is CMD syntax, not PowerShell | Used full path |

## Key Concepts Learned
- Password policy can only be set via Default Domain 
  Policy or Fine-Grained Password Policies
- Difference between User and Computer Configuration
- Difference between Policies (enforced) and Preferences 
  (changeable)
- User Configuration policies must be linked where user 
  accounts are located
- Security Filtering controls which users/computers a 
  GPO applies to
- GPO troubleshooting using gpupdate and gpresult
- Environment variable syntax differs between Command 
  Prompt and PowerShell

## AI Tools Used
Claude AI (Anthropic) used as a troubleshooting and 
learning aid throughout this project including 
diagnosing GPO application issues and explaining Group 
Policy concepts. All solutions were tested, verified 
and understood independently.

## Full Documentation
Complete writeup with screenshots available at:
https://burnt-hardcover-86e.notion.site/Project-2-Group-Policy-3594b8351850801c8b38cc6cb2e74ba7?source=copy_link

## Status: ✅ Complete
