#
# Simple script to pull down the Minio Binary for deployment. 
# 

#Github and other sites now require tls1.2 without this line the script will fail with an SSL error. 
[Net.ServicePointManager]::SecurityProtocol = "tls12, tls11, tls"

$url = "https://dl.minio.io/server/minio/release/windows-amd64/minio.exe"

Write-Host "Downloading Minio Binary from: " -foregroundcolor Green
Write-Host $url

$minioPath = "/../ApplicationPackageRoot/MinioServicePkg/Code/minio.exe"
$outfile = Join-Path $PSScriptRoot $minioPath

Invoke-WebRequest -Uri $url -OutFile $outfile -UseBasicParsing

Write-Host "Download complete, files:" -foregroundcolor Green
Write-Host $outfile