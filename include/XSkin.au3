; XSkin.au3 v1.3.7 Feb. 12, 2007
; ,,,, Valuater
#cs
	;===============================================================================
	; The following is required
	;===============================================================================
	
	#include <XSkin.au3>
	
	; required, your skin folder location
	$Skin_Folder = FileReadLine(@ScriptDir & "\Skins\Default.txt", 1)
	If Not FileExists($Skin_Folder) Then $Skin_Folder = FileSelectFolder ( "Skin Folders", @ScriptDir & "\Skins", 2)
	
	; option, automatic mouse-over color for "your" controls use $XSkinID[ ]
	; see Autoit Limits in help for GUICtrlSetBkColor()
	Dim $XSkinID[6] ; the amount of controls you want "mouse overed" +1, see example below
	
	; required, set the GUI Width, Height and Title
	$guiWidth  = 400
	$guiHeight = 450
	$guiTitle = "XSkin"
	$guiHeader = 1 ; Title bar,  -1 = show with Max/Min/Close, 0 = show title only, 1 = no show ( optional, default is no show )
	$guiCorners = 25 ; 0 = no rounded corners, ( optional, default is rounded with "arc" of 25)
	
	; required, create the XSkin GUI
	$XSkinGui = XSkinGUICreate( $guiTitle, $guiWidth, $guiHeight, $Skin_Folder, $guiHeader, $guiCorners)
	; or $XSkinGui = XSkinGUICreate( $guiTitle, $guiWidth, $guiHeight, $Skin_Folder) ; uses defaults
	
	; option, create Title Bar Icons - returns array[]
	; 1 = Exit only, 2 = Mnimize/Exit, 3 = Help/Minimize/Exit
	$Icon_Folder = @ScriptDir & "\Skins\Default"
	$XIcon = XSkinIcon($XSkinGui, 2)
	; $XIcon[1] = Exit, $XIcon[2] = Mnimize, $XIcon[3] = Help
	
	; option, in while loop - if you want mouse over control colors and/or Mouseover GUI options below
	; Mouseover()
	
	; Mouseover() options default = no GUI action
	; Mouseover(1) = Fade Active GUI for non use
	; Mouseover(2) = Slide Active GUI to top of Screen for non-use
	; You may add the numbers above, example = Mouseover(1 + 2)
	
	; option, icon button with text - no color
	; XSkinIconButton($BItext, $BIleft, $BItop, $BIwidth, $BIheight, $BIconNum = 0, $BIDLL = "shell32.dll")
	
	; option, you can use the following theme colors
	; $over_color, $btn_color, $bkg_color, $fnt_color
	
	; option, for colored controls use the following.... or you can use autoit commands
	; XSkinButton($Btext, $Bleft, $Btop, $Bwidth, $Bheight, $event_function = "")
	; XSkinButtonSetState($XSkinButton, $XSkinMode); $GUI_HIDE or $GUI_SHOW Only
	; XSkinMsgBox($MBTitle, $MBText); OK & Cancel buttons
	; XSkinMsgBoxOK($MBTitle, $MBText); OK button only
	; XSkinInputBox($IBTitle, $IBText, $IBDefault = "")
	; XSkinProgress($Pleft, $Ptop, $Pwidth, $Pheight)
	; XSkinTrayBox($TBTitle, $TBText)
	;
	;===============================================================================
	; Now.... you are on your own
	;===============================================================================
#ce
#include-once
;Opt("MustDeclareVars", 1)
Dim $CtrlIDA[1], $CtrlIDB[1], $CtrlIDC[1], $CtrlIDMA[3], $CtrlIDMB[3], $XS_gui[1], $Skin_Folder, $Icon_Folder, $iLoop, $XS_debug = 0
Dim $over_color, $btn_color, $bkg_color, $fnt_color, $tile_size, $XS_TMB, $XS_TMA, $SKBox_[2], $XSkinID[1]
Dim $XSolid = 1, $XSlid = 1, $XSlid1, $XSlid2, $XSlid3, $XSlpr, $XS_Isize, $XS_Istyle, $XadjLt, $XadjDn, $XStrans = 200
Dim $GlobalHeader, $GlobalCorners, $Globalcolor, $CtrlButton[1][4]
Dim $StopFirst = True
If $XS_debug Then Opt("TrayIconDebug", 1)
Func XSkinGUICreate($XS_guiTitle, $XS_width, $XS_height,$Skin_Folder, $guiHeader = 1, $guiCorners = 25,$x = -1,$y = -1,$Style = -1,$Ref = -1)
	If $Skin_Folder == $GUI_CHECKED Then
		If $Ref <> -1 Then
			$GUI = GUICreate($XS_guiTitle,$XS_width - $factorX*2,$XS_height - $factorY*2,$x,$y,-1,$Style,$ref)
		Else
			$GUI = GUICreate($XS_guiTitle,$XS_width - $factorX*2,$XS_height - $factorY*2,$x,$y,-1,$Style)
		EndIf
		GUISetBkColor(debug("0x" & LoadSetting("settings","BkColor","000000")))
		GUISetIcon("resource\pplayer.ico",-1)
		$factorX = 5
		$factorY = 5
		Return $GUI
	EndIf
	If Not FileExists($Skin_Folder) Then 
		If FileExists($PP_Dir & "Skins\Carbon") Then Return XSkinGUICreate($XS_guiTitle,$XS_width,$XS_height,$PP_Dir & "Skins\Carbon",$guiHeader,$guiCorners,$x,$y,$Style,$Ref)
		XSkinError("The $Skin_Folder was not found")
	EndIf
	$GlobalCorners = $guiCorners
	$GlobalHeader = $guiHeader
	$bkg_color = IniRead($Skin_Folder & "\Skin.dat", "color", "background", 0xD9F6FF)
	$btn_color = IniRead($Skin_Folder & "\Skin.dat", "color", "button", 0xD9F6FF)
	$over_color = IniRead($Skin_Folder & "\Skin.dat", "color", "mouseover", 0xD9F6FF)
	$fnt_color = IniRead($Skin_Folder & "\Skin.dat", "color", "fontcolor", 0x000000)
	$tile_size = IniRead($Skin_Folder & "\Skin.dat", "settings", "size", 20)
	;$tile_size = $factorX
	$XS_Istyle = IniRead($Skin_Folder & "\Skin.dat", "icon", "style", "Standard")
	$XS_Isize = IniRead($Skin_Folder & "\Skin.dat", "icon", "Isize", 17)
	$XadjLt = IniRead($Skin_Folder & "\Skin.dat", "icon", "adjustleft", 20)
	$XadjDn = IniRead($Skin_Folder & "\Skin.dat", "icon", "adjustdown", 20)
	Local $elements[8]
	If $XS_width < 100 Then $XS_width = 100
	If $XS_height < 50 Then $XS_height = 50
	If $tile_size < 15 Then $tile_size = 15
	For $XS_px = 0 To 7
		$elements[$XS_px] = $Skin_Folder & "\" & $XS_px & ".bmp"
		If Not FileExists($elements[$XS_px]) Then Return XSkinGUICreate($XS_guiTitle,$XS_width,$XS_height,$PP_Dir & "Skins\Carbon",$guiHeader,$guiCorners,$x,$y,$Style,$Ref)
			;XSkinError("A skin picture was not found #" & $XS_px & "  ")
	Next
	If IsArray($XSkinID) And UBound($XSkinID) >= 2 Then $iLoop = 1
	Local $guiHeader2 = $guiHeader
	If $guiHeader >= 1 Then
		$guiHeader2 = $WS_POPUP + $WS_SYSMENU
	ElseIf $guiHeader = 0 Then
		$XS_height = $XS_height + 32
		$XS_width = $XS_width + 6
	EndIf
	ReDim $XS_gui[UBound($XS_gui) + 1]
	$XS_TMA = UBound($XS_gui) - 1
	If $Ref <> -1 Then
		$XS_gui[$XS_TMA] = GUICreate($XS_guiTitle, $XS_width, $XS_height, $x, $y, $guiHeader2,$Style,$Ref)
	Else
		$XS_gui[$XS_TMA] = GUICreate($XS_guiTitle, $XS_width, $XS_height, $x, $y, $guiHeader2,$Style)
	EndIf
	If Not $Globalcolor = 1 Then GUISetBkColor($bkg_color)
	If $guiHeader = 0 Then
		$XS_height = $XS_height - 32
		$XS_width = $XS_width - 6
	EndIf
	GUICtrlCreatePic($elements[0], 0, 0, $tile_size, $tile_size, $WS_CLIPSIBLINGS)
	GUICtrlSetState(-1, $GUI_DISABLE)
	GUICtrlCreatePic($elements[2], ($XS_width - $tile_size), 0, $tile_size, $tile_size, $WS_CLIPSIBLINGS)
	GUICtrlSetState(-1, $GUI_DISABLE)
	GUICtrlCreatePic($elements[5], 0, ($XS_height - $tile_size), $tile_size, $tile_size, $WS_CLIPSIBLINGS)
	GUICtrlSetState(-1, $GUI_DISABLE)
	GUICtrlCreatePic($elements[7], ($XS_width - $tile_size) , ($XS_height - $tile_size), $tile_size, $tile_size, $WS_CLIPSIBLINGS)
	For $XS_i = 0 To (Ceiling($XS_width / $tile_size) - 3)
		GUICtrlCreatePic($elements[1], ($tile_size * ($XS_i + 1)), 0, $tile_size, $tile_size, BitOR($SS_NOTIFY, $WS_CLIPSIBLINGS), $GUI_WS_EX_PARENTDRAG)
		If $XS_i > ((Ceiling($XS_width / $tile_size) - 3) / 3) * 2 Then GUICtrlSetState(-1, $GUI_DISABLE)
		GUICtrlCreatePic($elements[6], ($tile_size * ($XS_i + 1)) , ($XS_height - $tile_size), $tile_size, $tile_size, $WS_CLIPSIBLINGS)
		GUICtrlSetState(-1, $GUI_DISABLE)
	Next
	For $XS_i = 0 To (Ceiling($XS_height / $tile_size) - 3)
		GUICtrlCreatePic($elements[3], 0, ($tile_size * ($XS_i + 1)), $tile_size, $tile_size, $WS_CLIPSIBLINGS)
		GUICtrlSetState(-1, $GUI_DISABLE)
		GUICtrlCreatePic($elements[4], ($XS_width - $tile_size) , ($tile_size * ($XS_i + 1)), $tile_size, $tile_size, $WS_CLIPSIBLINGS)
		GUICtrlSetState(-1, $GUI_DISABLE)
	Next
	GUICtrlCreatePic($elements[0], 0, 0, $tile_size, $tile_size, $WS_CLIPSIBLINGS)
	GUICtrlSetState(-1, $GUI_DISABLE)
	GUICtrlCreatePic($elements[2], ($XS_width - $tile_size), 0, $tile_size, $tile_size, $WS_CLIPSIBLINGS)
	GUICtrlSetState(-1, $GUI_DISABLE)
	GUICtrlCreatePic($elements[5], 0, ($XS_height - $tile_size), $tile_size, $tile_size, $WS_CLIPSIBLINGS)
	GUICtrlSetState(-1, $GUI_DISABLE)
	GUICtrlCreatePic($elements[7], ($XS_width - $tile_size) , ($XS_height - $tile_size), $tile_size, $tile_size, $WS_CLIPSIBLINGS)
	If $XS_debug Then ConsoleWrite("gui = " & $XS_gui[$XS_TMA] & " Error = " & @error & @CRLF)
	If $guiCorners Then _GuiRoundCorners($XS_gui[$XS_TMA], 0, 0, $guiCorners, $guiCorners,$XS_height,$XS_width)
	Return $XS_gui[$XS_TMA]
EndFunc   ;==>XSkinGUICreate
Func Mouseover($XSHover = 0)
	Local $XS_msg, $XS_Hvr, $XSlid0
	For $XS_t = 1 To $XS_TMA
		;If $XS_debug Then ToolTip("Window Number = " & $XS_t & @CRLF & "XSkin GUI # = " & $XS_gui[$XS_t] & @CRLF & "Window State = " & WinGetState($XS_gui[$XS_t]), 10, 10, "XSkin Debug Mode = On", 1)
		If WinActive($XS_gui[$XS_t]) Then
			$XS_msg = GUIGetCursorInfo($XS_gui[$XS_t])
			For $XS_x = 1 To UBound($CtrlIDA) - 1
				If IsArray($XS_msg) And $XS_msg[4] == $CtrlIDA[$XS_x]Then
					GUICtrlSetBkColor($CtrlIDA[$XS_x], $over_color)
					While IsArray($XS_msg) And $XS_msg[4] == $CtrlIDA[$XS_x]
						$XS_msg = GUIGetCursorInfo($XS_gui[$XS_t])
						If IsArray($XS_msg) And $XS_msg[2] = "1" Then
							GUICtrlSetStyle($CtrlIDB[$XS_x], $SS_ETCHEDFRAME)
							Sleep(170)
							GUICtrlSetStyle($CtrlIDB[$XS_x], $SS_NOTIFY + $SS_GRAYRECT)
							If $CtrlIDC[$XS_x] = "" Then ExitLoop
							Call($CtrlIDC[$XS_x])
						EndIf
						Sleep(5)
					WEnd
					GUICtrlSetBkColor($CtrlIDA[$XS_x], $btn_color)
					$XSlpr = 0
					Return
				EndIf
			Next
			If WinActive($XS_gui[$XS_t]) And IsArray($XS_msg) And $iLoop Then
				For $XS_s = 1 To UBound($XSkinID) - 1
					If $XSkinID[$XS_s] == $XS_msg[4]Then
						GUICtrlSetBkColor($XSkinID[$XS_s], $over_color)
						While WinActive($XS_gui[$XS_t]) And IsArray($XS_msg)
							$XS_msg = GUIGetCursorInfo($XS_gui[$XS_t])
							If $XS_msg[4] <> $XSkinID[$XS_s]Then ExitLoop
							Sleep(5)
						WEnd
						GUICtrlSetBkColor($XSkinID[$XS_s], $GUI_BKCOLOR_TRANSPARENT)
						$XSlpr = 0
					EndIf
				Next
			EndIf
			If $XSHover = 1 Or $XSHover = 3 Then
				$XS_Hvr = WinGetPos($XS_gui[$XS_t])
				If WinActive($XS_gui[$XS_t]) And IsArray($XS_msg) And IsArray($XS_Hvr) Then
					If $XS_msg[0] < 0 Or $XS_msg[1] < 0 Or $XS_msg[0] > $XS_Hvr[2] Or $XS_msg[1] > $XS_Hvr[3] Then
						If $XSolid Then
							$XSlpr = $XSlpr + 1
							If $XSlpr < 150 Then ExitLoop
							$XSlpr = 0
							$XSolid = 0
							For $XS_fd = 254 To $XStrans Step - 1
								WinSetTrans($XS_gui[$XS_t], "", $XS_fd)
								Sleep(10)
							Next
						EndIf
					ElseIf $XSolid = 0 Then
						$XSolid = 1
						WinSetTrans($XS_gui[$XS_t], "", 255)
					EndIf
				EndIf
			EndIf
			If $XSHover = 2 Or $XSHover = 3 Then
				$XS_Hvr = WinGetPos($XS_gui[$XS_t])
				If WinActive($XS_gui[$XS_t]) And IsArray($XS_msg) And IsArray($XS_Hvr) Then
					If $XS_msg[0] < 0 Or $XS_msg[1] < 0 Or $XS_msg[0] > $XS_Hvr[2] Or $XS_msg[1] > $XS_Hvr[3] Then
						If $XSlid Then
							$XSlpr = $XSlpr + 1
							If $XSlpr < 300 Then ExitLoop
							$XSlpr = 0
							$XSlid = 0
							$XSlid0 = $XS_Hvr[3] - $tile_size
							$XSlid1 = $XS_Hvr[1]
							$XSlid2 = $XSlid0 - $XSlid0 - $XSlid0
							For $XS_H = $XSlid1 To $XSlid2 Step - 1
								WinMove($XS_gui[$XS_t], "", $XS_Hvr[0], $XS_H)
							Next
						EndIf
					ElseIf $XSlid = 0 Then
						$XSlid = 1
						For $XS_H = $XSlid2 To $XSlid1 Step 1
							WinMove($XS_gui[$XS_t], "", $XS_Hvr[0], $XS_H)
						Next
					EndIf
				EndIf
			EndIf
		EndIf
		Sleep(5)
	Next
EndFunc   ;==>Mouseover
Func XSkinButton($Btext, $Bleft, $Btop, $Bwidth, $Bheight, $event_function = "")
	ReDim $CtrlButton[UBound($CtrlButton) + 1][4]
	Local $ButtonIndex = UBound($CtrlButton) - 1
	$CtrlButton[$ButtonIndex][0] = GUICtrlCreateLabel("", $Bleft, $Btop, $Bwidth, $Bheight, $SS_BLACKRECT)
	GUICtrlSetCursor(-1, 0)
	$CtrlButton[$ButtonIndex][2] = GUICtrlCreateLabel("", $Bleft, $Btop, $Bwidth - 1, $Bheight - 1, $SS_WHITERECT)
	$CtrlButton[$ButtonIndex][3] = GUICtrlCreateLabel("", $Bleft + 1, $Btop + 1, $Bwidth - 2, $Bheight - 2, $SS_GRAYRECT)
	$CtrlButton[$ButtonIndex][1] = GUICtrlCreateLabel($Btext, $Bleft + 1, $Btop + 1, $Bwidth - 3, $Bheight - 3, $SS_NOTIFY & $SS_CENTER)
	GUICtrlSetBkColor(-1, $btn_color)
	GUICtrlSetColor(-1, $fnt_color)
	If Not StringInStr($event_function, "XSkinMBI") Then
		ReDim $CtrlIDA[UBound($CtrlIDA) + 1]
		$CtrlIDA[UBound($CtrlIDA) - 1] = $CtrlButton[$ButtonIndex][1]
		ReDim $CtrlIDB[UBound($CtrlIDB) + 1]
		$CtrlIDB[UBound($CtrlIDB) - 1] = $CtrlButton[$ButtonIndex][0]
		ReDim $CtrlIDC[UBound($CtrlIDC) + 1]
		$CtrlIDC[UBound($CtrlIDC) - 1] = $event_function
	Else
		If StringInStr($event_function, "XSkinMBI1") Then
			$CtrlIDMA[1] = $CtrlButton[$ButtonIndex][1]
			$CtrlIDMB[1] = $CtrlButton[$ButtonIndex][0]
		Else
			$CtrlIDMA[2] = $CtrlButton[$ButtonIndex][1]
			$CtrlIDMB[2] = $CtrlButton[$ButtonIndex][0]
		EndIf
	EndIf
	Return $ButtonIndex
EndFunc   ;==>XSkinButton
Func XSkinButtonSetState($XSkinButton, $XSkinMode)
	Local $i
	If $XSkinButton > 0 And $XSkinButton < UBound($CtrlButton) Then
		For $i = 0 To 3
			GUICtrlSetState($CtrlButton[$XSkinButton][$i], $XSkinMode)
		Next
	EndIf
EndFunc   ;==>XSkinButtonSetState
Func XSkinProgress($Pleft, $Ptop, $Pwidth, $Pheight)
	Local $XS_n, $PControl
	If StringInStr(@OSTYPE, "WIN32_NT") Then
		$XS_n = DllCall("uxtheme.dll", "int", "GetThemeAppProperties")
		DllCall("uxtheme.dll", "none", "SetThemeAppProperties", "int", 0)
	EndIf
	$PControl = GUICtrlCreateProgress($Pleft, $Ptop, $Pwidth, $Pheight,$PBS_SMOOTH,$WS_EX_CLIENTEDGE )
	GUICtrlSetBkColor($PControl, $over_color)
	GUICtrlSetColor($PControl, $btn_color)
	GUICtrlSetLimit(-1, 100, 0)
	If StringInStr(@OSTYPE, "WIN32_NT") And IsArray($XS_n) Then
		DllCall("uxtheme.dll", "none", "SetThemeAppProperties", "int", $XS_n[0])
	EndIf
	Return $PControl
EndFunc   ;==>XSkinProgress
Func XSkinMsgBoxOK($MBTitle, $MBText)
	XSkinMsgBox($MBTitle, $MBText, "", 4)
EndFunc   ;==>XSkinMsgBoxOK
Func XSkinMsgBox($MBTitle, $MBText, $IBDefault = "", $IBNotify = "",$SleepTime = "")
	Local $XS_msg
	If $MBTitle = "" Or $MBText = "" Then Return
	If $SleepTime = "" Then $SleepTime = (StringLen($MBText) * 50) + 1000
	Local $MBwidth, $MBHeight, $MBInfo, $MBHA = 0, $XS_label, $IBInput
	$MBInfo = StringSplit($MBText, @CRLF)
	$MBwidth = StringLen($MBInfo[1])
	$MBHeight = ($MBInfo[0] * 15) + 70
	For $MBi = 2 To $MBInfo[0]
		If StringLen($MBInfo[$MBi]) > $MBwidth Then $MBwidth = StringLen($MBInfo[$MBi])
	Next
	If StringLen($MBTitle) > $MBwidth Then $MBwidth = StringLen($MBTitle)
	$MBwidth = ($MBwidth * 4.5) + ($tile_size * 2) + 55
	$MBHeight = $MBHeight + ($tile_size * 2)
	If $IBNotify = 2 Then $MBHeight = $MBHeight + 30
	If $MBwidth < 280 Then $MBwidth = 280
	If $IBNotify = 3 Then $MBHA = 40
	ReDim $SKBox_[UBound($SKBox_) + 1]
	$XS_TMB = UBound($SKBox_) - 1
	$SKBox_[$XS_TMB] = XSkinGUICreate($MBTitle, $MBwidth, $MBHeight - $MBHA, $Skin_Folder, $GlobalHeader, $GlobalCorners)
	If $StopFirst Then
		$StopFirst = False
		return
	EndIf
	For $MBl = 1 To $MBInfo[0]
		$XS_label = GUICtrlCreateLabel($MBInfo[$MBl], $tile_size + 20, $tile_size + (15 * $MBl))
		GUICtrlSetColor(-1, $fnt_color)
	Next
	If $IBNotify = 3 Then
		WinMove($SKBox_[$XS_TMB], "", (@DesktopWidth - $MBwidth) - 10, (@DesktopHeight - $MBHeight))
		WinSetOnTop($SKBox_[$XS_TMB], "", 1)
		DllCall("user32.dll", "int", "AnimateWindow", "hwnd", $SKBox_[$XS_TMB], "int", 300, "long", 0x00040008);slide-in from bottom
		Sleep($SleepTime)
		DllCall("user32.dll", "int", "AnimateWindow", "hwnd", $SKBox_[$XS_TMB], "int", 2000, "long", 0x00090000);fade-out
		GUIDelete($SKBox_[$XS_TMB])
		$SKBox_[$XS_TMB] = ""
		Return
	EndIf
	If $IBNotify = 2 Then $IBInput = GUICtrlCreateInput($IBDefault, $tile_size + 20, $MBHeight - ($tile_size + 70), $MBwidth - (($tile_size * 2) + 40), 20)
	If $IBNotify = 4 Then
		XSkinButton("&OK", ($MBwidth / 2) - 35, $MBHeight - ($tile_size + 40), 70, 25, "XSkinMBI1")
	Else
		XSkinButton("&OK", $MBwidth / 5, $MBHeight - ($tile_size + 40), 70, 25, "XSkinMBI1")
		XSkinButton("&CANCEL", ($MBwidth / 5) * 2.8, $MBHeight - ($tile_size + 40), 70, 25, "XSkinMBI2")
	EndIf
	GUISetState()
	WinSetOnTop($SKBox_[$XS_TMB], "", 1)
	DllCall("user32.dll", "int", "MessageBeep", "int", 0x44444444)
	While 1
		For $XS_x = 1 To 2
			$XS_msg = GUIGetCursorInfo($SKBox_[$XS_TMB])
			If IsArray($XS_msg) And $XS_msg[4] == $CtrlIDMA[$XS_x]Then
				GUICtrlSetBkColor($CtrlIDMA[$XS_x], $over_color)
				While IsArray($XS_msg) And $XS_msg[4] == $CtrlIDMA[$XS_x]
					$XS_msg = GUIGetCursorInfo($SKBox_[$XS_TMB])
					If IsArray($XS_msg) And $XS_msg[2] = "1" Then
						GUICtrlSetStyle($CtrlIDMB[$XS_x], $SS_ETCHEDFRAME)
						Sleep(190)
						If $IBNotify = 2 And $XS_x = 1 Then $XS_x = GUICtrlRead($IBInput)
						GUIDelete($SKBox_[$XS_TMB])
						$SKBox_[$XS_TMB] = ""
						Return $XS_x
					EndIf
					Sleep(10)
				WEnd
				GUICtrlSetBkColor($CtrlIDMA[$XS_x], $btn_color)
				ExitLoop
			EndIf
		Next
		Sleep(10)
	WEnd
EndFunc   ;==>XSkinMsgBox
Func XSkinInputBox($IBTitle, $IBText, $IBDefault = "")
	Local $IBinput1 = XSkinMsgBox($IBTitle, $IBText, $IBDefault, 2)
	Return $IBinput1
EndFunc   ;==>XSkinInputBox
Func XSkinTrayBox($TBTitle, $TBText,$Sleep = "")
	If StringInStr($TBText, @CRLF) Then Return
	XSkinMsgBox($TBTitle, $TBText, "", 3,$Sleep)
EndFunc   ;==>XSkinTrayBox
Func XSkinIcon(ByRef $XS_hWin, $XS_cH = 1,$XS_EventFunc = "")
	If $Skin_Folder == $GUI_CHECKED Then
		If UBound($XS_EventFunc) > 0 Then
			If UBound($XS_EventFunc) > 2 Then GUISetOnEvent($GUI_EVENT_MINIMIZE,$XS_EventFunc[2],$XS_hWin)
			If UBound($XS_EventFunc) > 1 Then GUISetOnEvent($GUI_EVENT_CLOSE,$XS_EventFunc[1],$XS_hWin)
		EndIf
		Return True
	EndIf
	If $XS_cH > 3 Or $XS_hWin = "" Then Return
	Local $XS_b, $XS_IPos1 = $XS_Isize, $XSIPos, $XS_winB[$XS_cH + 1]
	If StringRight($Icon_Folder, 1) <> "\" Then $Icon_Folder &= "\"
	$XSIPos = WinGetPos($XS_hWin)
	For $XS_b = 1 To UBound($XS_winB) - 1
		$XS_winB[$XS_b] = GUICtrlCreateButton("", ($XSIPos[2] - $XadjLt) - $XS_IPos1, $XadjDn, $XS_Isize, $XS_Isize, BitOR($BS_BITMAP, $WS_VISIBLE), $WS_EX_TOPMOST)
		If IsArray($XS_EventFunc) Then GUICtrlSetOnEvent(-1,$XS_EventFunc[$XS_b])
		Local $iret = GUICtrlSetImage(-1, $Icon_Folder & $XS_Istyle & $XS_b & ".bmp")
		If Not FileExists($Icon_Folder & $XS_Istyle & $XS_b & ".bmp") Then GUICtrlSetImage($XS_winB[$XS_b], $Icon_Folder & "Standard" & $XS_b & ".bmp")
		$XS_IPos1 += $XS_Isize
	Next
	Return $XS_winB
EndFunc   ;==>XSkinIcon
Func XSkinIconButton($BItext, $BIleft, $BItop, $BIwidth, $BIheight, $BIconNum = 0, $BIDLL = "shell32.dll")
	If $BIconNum <> 0 Then GUICtrlCreateIcon($BIDLL, $BIconNum, $BIleft + 5, $BItop + (($BIheight - 16) / 2), 16, 16)
	If $BIconNum <> 0 Then GUICtrlSetState(-1, $GUI_DISABLE)
	Local $XS_btnx = GUICtrlCreateButton("  " & $BItext, $BIleft, $BItop, $BIwidth, $BIheight, $WS_CLIPSIBLINGS)
	Return $XS_btnx
EndFunc   ;==>XSkinIconButton
Func _GuiRoundCorners($h_win, $i_x1, $i_y1, $i_x3, $i_y3,$i_x2,$i_y2) ; thanks gafrost
	Local $XS_pos, $XS_ret, $XS_ret2
	$XS_pos = WinGetPos($h_win)
	$XS_ret = DllCall("gdi32.dll", "long", "CreateRoundRectRgn", "long", $i_x1, "long", $i_y1, "long", $XS_pos[2], "long", $XS_pos[3], "long", $i_x3, "long", $i_y3)
	If $XS_ret[0]Then
		$XS_ret2 = DllCall("user32.dll", "long", "SetWindowRgn", "hwnd", $h_win, "long", $XS_ret[0], "int", 1)
	EndIf
EndFunc   ;==>_GuiRoundCorners
Func XSkinError($XE_msg)
	MsgBox(262208, "XSkin Error", $XE_msg, 5)
	Exit
EndFunc   ;==>XSkinError
Func XSkinAnimate($Xwnd, $Xstate = 1, $Xstyle = 0, $Xtrans = 0, $Xspeed = 1000)
	If $Skin_Folder == $GUI_CHECKED Then 
		Switch $Xstate
			Case 1
				GUISetState(@SW_SHOW,$Xwnd)
			Case 2
				GUISetState(@SW_HIDE,$Xwnd)
		EndSwitch
		Return True
	EndIf
    ; $Xstate  - 1 = Show, 2 = Hide, "" = No State Set
    ; $Xstyle - 1=Fade, 3=Explode, 5=L-Slide, 7=R-Slide, 9=T-Slide, 11=B-Slide, 13=TL-Diag-Slide, 15=TR-Diag-Slide, 17=BL-Diag-Slide, 19=BR-Diag-Slide
    Local $Xpick = StringSplit('80000,90000,40010,50010,40001,50002,40002,50001,40004,50008,40008,50004,40005,5000a,40006,50009,40009,50006,4000a,50005', ",")
    If Not WinExists($Xwnd) Then XSkinError("XSkinAnimate, $Xwnd - Window not found   ")
    If $Xstyle > $Xpick[0] Then XSkinError("XSkinAnimate, $Xstyle max is 19  ")
    If $Xstyle <> 0 Then Local $ret = DllCall("user32.dll", "int", "AnimateWindow", "hwnd", $Xwnd, "int", $Xspeed, "long", "0x000" & $Xpick[$Xstyle])
    If $Xtrans <> 0 Then WinSetTrans($Xwnd, "", $Xtrans)
    If $Xstate = 1 Then GUISetState(@SW_SHOW, $Xwnd)
    If $Xstate = 2 Then GUISetState(@SW_HIDE, $Xwnd)
    If $Xstyle <> 0 Then Return $ret
EndFunc   ;==>XSkinAnimate