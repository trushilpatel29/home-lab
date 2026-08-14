# Project 3 - Helpdesk Ticketing System

## Overview
Deployed and operated a functioning IT service desk using osTicket on a ubuntu server VM, integrated into the existing Active Directory lab. The system was used to raise, triage, resolve and close realistic support tickets.

## Environment
| Component | Details |
|---|---|
| Ticketing Host | HELPDESK01 — Ubuntu Server 24.04.4 LTS |
| Domain Controller | DC01 — Windows Server 2025 (DNS, DHCP) |
| Client Machine | Client01 — Windows 11 Enterprise |
| HELPDESK01 IP | 192.168.2.20 (static) |
| Domain | lab.local |
| Virtualisation | VirtualBox NAT Network |
| Stack | Apache, MySQL, PHP 8.3, osTicket v1.18.4 |

## What was built
- Ubuntu Server 24.04.4 LTS VM deployed as HELPDESK01
- LVM storage configured
- static IP set via netplan, DNS pointed at DC01
- SSH configured for remote administration
- LAMP stack installed (Apache, MySQL, PHP + required extensions)
- osTicket database and dedicated least-privilege MySQL user created
- osTicket v1.18.4 deployed and installed via web installer
- Post-install hardening applied (file permissions, config lockdown)
- Departments, help topics and agent access configured
- Five realistic tickets raised, triaged, resolved and closed

## Skills demonstrated
- Linux server deployment and configuration
- LAMP stack installation and web application hosting
- MySQL database creation and least privilege user management
- Static IP configuration
- DNS integration with Active Directory
- SSH remote server administration
- Post-install security hardening
- IT support ticket handling

## Security practices applied
**Least privilege - Database Access**
osTicket was given a dedicated MySQL user scoped to only its own database and restriction to localhost connections, rather than using the root account.

**Post-install hardening**
Config file set to read only (644), least privilege file premissions applied across the application tree, installer directory confirmed absent.

## Problems Encountered & Fixed
| Problem | Cause | Fix |
|---|---|---|
| No network during install | IPv4 not enabled on adapter | Enabled IPv4, DHCP lease obtained |
| netplan "expected sequence" | Missing space after hyphen in YAML | Corrected YAML list syntax |
| Could not resolve DC01 by name | Missing DNS search domain | Added search: lab.local to netplan |
| Client01 lost network | DC01 (DHCP) powered off, dropped to APIPA | Started DC01, renewed lease |
| SSH from host timed out | NAT Network isolates host from guests | Added port forward 127.0.0.1:2222 → :22 |
| Could not log into staff panel | Password reset not applying (silent) | Reset bcrypt hash via shell variable |
| Could not save agent profile | osTicket rejects .local email TLD | Changed agent email to valid TLD |

## Key concepts learnt
- Ubuntu Server installation and configuration
- LVM storage
- Host to guest port forwarding
- SSH for remote server administration
- LAMP stack deployment
- PHP extension dependencies for web applications
- MySQL database and least privilege user creation
- Post-install hardening and file permissions
- Account lockout as a brute force control
- Ticket Triaging by impact and urgency

## AI tools used
Claude AI used as a troubleshooting and learning aid throughout this project including Linux configuration, network and DNS diagnostics, database setup and security hardening. All solutions were tested, verified and understood independently.

## Full Documentation
Complete writeup with screenshots available at:
https://burnt-hardcover-86e.notion.site/Project-3-Helpdesk-Ticketing-system-3ab4b83518508061bee8c5b5cd4faa01
