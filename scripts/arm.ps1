$CURRENTDIR = (Get-Location).Path
$Command = "docker"
$Parms = "run -it --rm -v ${CURRENTDIR}:/workspace -w /workspace -e CROSS_TRIPLE=arm multiarch/crossbuild:dev"
$Prms = $Parms.Split(" ")
Start-Process "$Command" $Prms