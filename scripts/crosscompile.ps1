function show-menu {
	[void][reflection.assembly]::Load('System.Windows.Forms, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')
	$formShowmenu = New-Object 'System.Windows.Forms.Form'
	$combobox1 = New-Object 'System.Windows.Forms.ComboBox'
	
	$combobox1_SelectedIndexChanged = {
		$script:var = $combobox1.SelectedItem
		$formShowmenu.Close()
	}
	
	$formShowmenu.Controls.Add($combobox1)
	$formShowmenu.AutoScaleDimensions = New-Object system.drawing.size 6, 13
	$formShowmenu.AutoScaleMode = 'Font'
	$formShowmenu.ClientSize = New-Object system.drawing.size 284, 70
	
	#add single item
	[void]$combobox1.Items.Add('arm')
	[void]$combobox1.Items.Add('arm64')
	[void]$combobox1.Items.Add('armhf')
	[void]$combobox1.Items.Add('linux')
	[void]$combobox1.Items.Add('mips')
	[void]$combobox1.Items.Add('osx32')
	[void]$combobox1.Items.Add('osx64')
	[void]$combobox1.Items.Add('osx64h')
	[void]$combobox1.Items.Add('powerpc')
	[void]$combobox1.Items.Add('win32')
	[void]$combobox1.Items.Add('win64')
	
	$combobox1.Location = New-Object system.drawing.point 45, 25
	$combobox1.Size = New-Object system.drawing.size 187, 21
	$combobox1.add_SelectedIndexChanged($combobox1_SelectedIndexChanged)
	
	$formShowmenu.ShowDialog() | out-null
	if($var){
		$CURRENTDIR = (Get-Location).Path
		$Command = "docker"
		$Parms = "run -it --rm -v ${CURRENTDIR}:/workspace -w /workspace -e CROSS_TRIPLE=${var} multiarch/crossbuild:buster"
		$Prms = $Parms.Split(" ")
		Start-Process "$Command" $Prms
	}
}
show-menu