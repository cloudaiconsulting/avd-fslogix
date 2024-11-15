$fileexists = Test-Path -Path 'c:\windows\tmp\fslogix.txt'
 If ($fileexists ) {
    Exit
}
New-Item -Path "$env:TEMP\FSLogix" -ItemType Directory -ErrorAction SilentlyContinue
Invoke-WebRequest -Uri https://aka.ms/fslogix_download -OutFile "$env:TEMP\FSLogix\fslogix.zip"
Expand-Archive "$env:TEMP\FSLogix\fslogix.zip" -DestinationPath "$env:TEMP\FSLogix" -Force
Start-Process -FilePath "$env:TEMP\FSLogix\x64\Release\FSLogixAppsSetup.exe" -ArgumentList "/install /quiet" -Wait -Passthru
New-Item -Path "c:\windows\tmp" -ItemType Directory -ErrorAction SilentlyContinue
New-Item -Path 'c:\windows\tmp\fslogix.txt' -ItemType File -ErrorAction SilentlyContinue
