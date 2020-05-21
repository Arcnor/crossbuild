$CURRENTDIR = (Get-Location).Path
$Command = "docker"
$Parms = "run -it --rm -v ${CURRENTDIR}:/workspace -w /workspace -e CROSS_TRIPLE=armhf multiarch/crossbuild:buster"
$Prms = $Parms.Split(" ")
Start-Process "$Command" $Prms