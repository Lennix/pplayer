Global $pObj = 0
Global $vlcPaused = False

Func VLCStartUp()
	If $pObj = 0 Then 
		$pObj = ObjCreate("VideoLAN.VLCPlugin.1")
	Else
		SetError(1)
	EndIf
EndFunc

Func VLCShutdown()
	$pObj = 0
EndFunc

Func VLCPlay($Filename)
	If $pObj <> 0 Then
		VLCShutdown()
		VLCStartUp()
		$pObj.MRL = $Filename
		$pObj.play()
		$vlcPaused = False
	Else
		SetError(1)
	EndIf
EndFunc

Func VLCStop()
	If $pObj <> 0 Then
		$pObj.stop()
	Else
		SetError(1)
	EndIf
EndFunc

Func VLCPause()
	If $pObj <> 0 Then
		$pObj.pause()
		$vlcPaused = True
	Else
		SetError(1)
	EndIf
EndFunc

Func VLCResume()
	If $pObj <> 0 Then
		$pObj.play()
		$vlcPaused = False
	Else
		SetError(1)
	EndIf
EndFunc

Func VLCGetState()
	If $pObj <> 0 Then
		If $pObj.playing Then
			If $vlcPaused Then
				Return "Paused"
			Else
				Return "Playing"
			EndIf
		Else
			If $vlcPaused Then
				Return "Paused"
			Else
				Return "Test"
			EndIf
		EndIf
	Else
		SetError(1)
	EndIf
EndFunc

Func VLCGetDuration()
	If $pObj <> 0 Then
		Return Int($pObj.length/1000)
	Else
		SetError(1)
	EndIf
EndFunc

Func VLCGetPosition()
	If $pObj <> 0 Then
		Return Int($pObj.time/1000)
	Else
		SetError(1)
	EndIf
EndFunc

Func VLCSetPosition($Pos)
	If $pObj <> 0 Then
		$pObj.time = $pos
	Else
		SetError(1)
	EndIf
EndFunc

Func VLCSetVolume($Vol)
	If $pObj <> 0 Then
		$pObj.volume = $vol
	Else
		SetError(1)
	EndIf
EndFunc