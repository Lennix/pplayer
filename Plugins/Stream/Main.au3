PluginRegister("Stream")

Func Stream_OnPluginLoad()
	PluginRegisterMenu("Stream","Stream")
EndFunc

Func Stream_OnPluginsRegistered()
	If PluginExists("Updater") Then Updater_Register("http://pplayer.sourceforge.net/access/downloads/Plugins/Stream/Main.au3","Plugins\Stream\Main.au3")
EndFunc
	
Func Stream_CreateCustomGUI()
	StreamBuild()
EndFunc

Func Stream_SongIsStream($id,$filepath)
	Stream_Play($id,$filepath)
	$SongCapturedbyPlugin = True
EndFunc

Func Stream_Play($id, $Filepath)
	$Type = StringTrimLeft($Filepath, StringInStr($Filepath, ".", 1, -1))
	If StringInStr("pls|asx|php",$Type) > 0 Then
		$Found = False
		$Input = StringSplit(Request($Filepath),@CRLF)
		For $i = 1 To $Input[0]
			If StringInStr($Input[$i],"http") Then
				$Filepath = debug(StringTrimLeft($Input[$i],StringInStr($Input[$i],"http")-1))
				$Found = True
				ExitLoop
			EndIf
		Next
		If Not $Found Then
			Error("Error loading stream")
			;$LeaveWhile = True
			Return ""
		EndIf
	EndIf
	If $next_sound <> 0 Then
		$active_sound = $next_sound
	Else
		Stop()
		$active_sound = Play($Filepath)
	EndIf
	PluginTrigger("SongPlayStarted",$id,$filepath)
	$playing = True
	$LeaveWhile = False
	$next_sound = 0
	If WMGetState() == "Paused" Then Pause()
	Focus($id)
	$Timer = TimerInit()
	While 1
		Switch WMGetState ()
			Case "Ready"
				$active_sound = Play($Filepath)
			Case "Stopped"
				Return ""
			Case "Playing"
				ExitLoop
		EndSwitch
		If $playing == False Or $LeaveWhile Then ExitLoop
		If TimerDiff($Timer) / 1000 > 30 Then
			Error("Couldn't connect to server")
			;$LeaveWhile = True
			Return ""
		EndIf
		UpdateLabelAction(WMGetState ())
		Sleep(100)
	WEnd
	Dim $tag[9]
	$Status = _StringBetween(debug($pObj.status), '"', '"')
	If Not @error Then
		$tag[3] = $Status[0]
		$tag[1] = "Stream"
		$tag[2] = "Stream"
		$tag[4] = "Stream"
		$tag[5] = "Stream"
		$tag[6] = $Filepath
		$tag[7] = 0
		$tag[8] = 10
		UpdateList($id, $tag[3], "")
		Dim $similar[1]
		$similar[0] = 0
		UpdateLabelInfo($tag, $similar)
		PluginTrigger("SongInformationLoaded",$id,$tag)
		WebAnnounce($tag)
	EndIf
	UpdateLabelAction(WMGetState ())
	While $playing And Not $LeaveWhile
		Sleep(100)
	WEnd
	WMStop()
EndFunc   ;==>PlayStream

Func StreamBuild()
	Global $StreamGUI = XSkinGUICreate("PPlayer - Stream", 300+$factorX*2, 100+$factorY*2,$Skin_Folder,1,25, IniRead("db\settings.ini", "window", "Streamx", -1), IniRead("db\settings.ini", "window", "Streamy", -1), -1, $MainGUI)
	GUISetBkColor("0x" & GetOpt("BkColor"))
	XSkinIcon($StreamGUI,3,StringSplit("StreamClose|StreamClose|StreamHelp","|"))
	GUICtrlCreateButton("Play", 10+$factorX, 50+$factorY, 100, 50, 0)
	GUICtrlSetOnEvent(-1, "StreamAdd")
	Global $StreamURL = GUICtrlCreateCombo("", 10+$factorX,20+$factorY, 280, 20)
	For $i = 1 To IniRead("db\settings.ini", "Stream", 0, 0)
		If StringLen(IniRead("db\settings.ini", "Stream", $i, "")) > 0 Then _GUICtrlComboBox_AddString($StreamURL, IniRead("db\settings.ini", "Stream", $i, ""))
	Next
	If IniRead("db\settings.ini", "GUIStati", "Stream", "Close") == "Open" Then Stream()
EndFunc   ;==>StreamBuild

Func Stream()
	GUISetState(@SW_SHOW, $StreamGUI)
	GUISetState(@SW_RESTORE, $StreamGUI)
	_IniWrite("db\settings.ini", "GUIStati", "Stream", "Open")
EndFunc   ;==>Stream

Func StreamClose()
	GUISetState(@SW_HIDE, $StreamGUI)
	_IniWrite("db\settings.ini", "GUIStati", "Stream", "Close")
EndFunc   ;==>StreamClose

Func StreamHelp()
	ShellExecute("http://pplayer.wiki.sourceforge.net/Stream")
EndFunc

Func StreamAdd()
	$Sel = GUICtrlRead($StreamURL)
	If StringInStr(_GUICtrlComboBox_GetList($StreamURL), $Sel) == 0 Then
		$pods = IniRead("db\settings.ini", "Stream", 0, 0) + 1
		_IniWrite("db\settings.ini", "Stream", 0, $pods)
		_IniWrite("db\settings.ini", "Stream", $pods, $Sel)
		_GUICtrlComboBox_AddString($StreamURL, $Sel)
	EndIf
	SetList($Sel)
EndFunc   ;==>StreamPlay

Func _IsNumber($String)
	$Ret = True
	$Len = StringLen($String)
	For $i = 1 To $Len
		If Not StringMid($String,$i,1) == 0 And Not StringMid($String,$i,1) == 1 And Not StringMid($String,$i,1) == 2 And Not StringMid($String,$i,1) == 3 And Not StringMid($String,$i,1) == 4 And Not StringMid($String,$i,1) == 5 And Not StringMid($String,$i,1) == 6 And Not StringMid($String,$i,1) == 7 And Not StringMid($String,$i,1) == 8 And Not StringMid($String,$i,1) == 9 Then $Ret = False
	Next
	Return $Ret
EndFunc