#Fix 1 - MachineAccountQuota Misconfiguration

Set-ADDomain -Identity lab.local -Replace @{"ms-DS-MachineAccountQuota"="0"}
