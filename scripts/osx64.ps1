$CURRENTDIR = (Get-Location).Path
$Command = "docker"
$Parms = "run -it --rm -v ${CURRENTDIR}:/workspace -w /workspace -e CROSS_TRIPLE=osx64 multiarch/crossbuild:buster"
$Prms = $Parms.Split(" ")
Start-Process "$Command" $Prms