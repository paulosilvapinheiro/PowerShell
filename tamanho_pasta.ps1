$directory="C:\Users\331675\downloads"

Get-ChildItem -force $directory -Directory -Recurse -ErrorAction SilentlyContinue | % { $_.fullname }

Get-ChildItem –force $directory –Recurse -ErrorAction SilentlyContinue | measure Length -s -ErrorAction SilentlyContinue | Select-Object -Property @{name='Directory';expression={$directory}}, @{n="Size(GB)";e={[math]::Round((($_.Sum)/1GB),2)}}