$i=0; Get-Content C:\log_r061\robo_indisp_a.log -ReadCount 1000000 | %{$i++; $_ | Out-File C:\log_r061\robo_indisp_a$i.log}