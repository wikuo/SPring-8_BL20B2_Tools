#Execute in scan/raw, not in scan/raw/001/raw

$NumberOfScans = 5

$SingleSliceRecoSlice = 750

$PixelSize = 7.99
$RotationAngleRecoVolume = 0

for ($i = 1; $i -le $NumberOfScans; $i++)
{
	# Convert 1, 2, 3 etc. to 001, 002, 003 etc., then enter folder and run conv.bat
	$FolderNumber = '{0:d3}' -f $i
	cd $FolderNumber
	
	cd raw
	./conv
	
	# Reconstruct a single slice (1st argument of ct_rec_g_c, slice 750 in this case, zero-indexed), and stores each line as an element in an array $SingleRecoTerminalOutput
	$SingleRecoTerminalOutput = ct_rec_g_c $SingleSliceRecoSlice
		
	# Calls the 2nd element of $SingleRecoTerminalOutput, splits the tab-separated values in the string to a new array and stores it in a variable
	$SingleRecoTerminalOutputSecondLine = $SingleRecoTerminalOutput[1].Split()
	$CenterOfRotation = $SingleRecoTerminalOutputSecondLine[2]
	
	cd ..
	mkdir rec
	
	# Reconstruct the whole volume
	hp_tg_g_c raw $PixelSize $CenterOfRotation $RotationAngleRecoVolume rec
	
	cd ..
}
