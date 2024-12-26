#$directory="C:\Users\331675\downloads"

#Get-ChildItem -force $directory -Directory -Recurse -ErrorAction SilentlyContinue | % { $_.fullname }

#Get-ChildItem -force $directory -Recurse -ErrorAction SilentlyContinue | measure Length -s -ErrorAction SilentlyContinue | Select-Object -Property @{name='Directory';expression={$directory}}, @{n="Size(GB)";e={[math]::Round((($_.Sum)/1GB),2)}}


#Parameters
$path = "C:\Users\331675\Downloads"
$outputFile ="C:\Users\331675\FolderSize.csv"
 
#Get all Folders, Sub-Folders recursively
$folders = Get-ChildItem -Path $Path -Directory -Recurse
 
#Loop through each folder to Find the size
$FolderSizes = foreach ($folder in $folders) {
    $size = (Get-ChildItem -Path $folder.FullName -File -Recurse | Measure-Object -Property Length -Sum).Sum
    $sizeInMB = $size / 1GB
 
    #Collect Data
    [PSCustomObject]@{
        FolderName = $folder.FullName
        SizeInGB = [Math]::Round($sizeInMB,2)
    }
}
#Export the Result to CSV
$FolderSizes | Format-table
$FolderSizes | Export-Csv -Path $outputFile -NoTypeInformation -Delimiter ';'


#Read more: https://www.sharepointdiary.com/2021/07/get-folder-size-in-powershell.html#ixzz8uxJG1U00