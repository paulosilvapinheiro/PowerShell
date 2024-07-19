(Get-Content -path "xtracao_motor_FICO.csv" -Raw) -replace '\,',';' | Set-Content -Path xtracao_motor_FICO_2.csv 
