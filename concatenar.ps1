ls 'RDR005_25042022*.txt'
Get-ChildItem 'RDR005_25042022*.txt' -Exclude 'RDR005_25042022 - PP08.TXT' | ForEach-Object{Get-Content $_ -Raw} | Out-File 'RDR005_25042022 - PP08.TXT'
