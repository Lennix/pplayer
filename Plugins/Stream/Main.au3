PluginRegister("Stream")

Func Stream_OnPluginLoad()
	PluginRegisterMenu("Stream","Stream")
	$StreamPlaying = 0
EndFunc

Func Stream_OnPluginsRegistered()
	If PluginExists("Updater") Then Updater_Register("http://pplayer.sourceforge.net/access/downloads/Plugins/Stream/Main.au3","Plugins\Stream\Main.au3")
EndFunc
	
Func Stream_CreateCustomGUI()
	StreamBuild()
	ObjEvent($pobj,"Stream_Event_")
EndFunc

Func Stream_OnExit()
	If IniRead("db\settings.ini", "GUIStati", "Stream", "Close") == "Open" Then
		$Pos = WinGetPos("PPlayer - Stream")
		If Not @error Then
			_IniWrite("db\settings.ini", "window", "Streamx", $Pos[0])
			_IniWrite("db\settings.ini", "window", "Streamy", $Pos[1])
		EndIf
	EndIf
	GUIDelete($StreamGUI)
EndFunc

Func Stream_SongIsStream($id,$filepath)
	Stream_Play($id,$filepath)
	$SongCapturedbyPlugin = True
EndFunc

Func Stream_Play($id, $Filepath)
	$URL = $Filepath
	$playing = True
	$LeaveWhile = False
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
	$StreamPlaying = True
	PluginTrigger("SongPlayStarted",$id,$filepath)
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
	
	$Status = _StringBetween(debug($pObj.status), '"', '"')
	If Not @error Then
		IniWrite("db\Stream.ini",$URL,"URL",$URL)
		IniWrite("db\Streams.ini",$URL,"Adress",$Filepath)
		IniWrite("db\Streams.ini",$URL,"Name",$Status[0])
		$Sel = _GUICtrlListView_FindInText($StreamListView,$URL)
		_GUICtrlListView_SetItemText($StreamListView,$Sel,$Filepath,2)
		_GUICtrlListView_SetItemText($StreamListView,$Sel,$Status[0])
	EndIf
	UpdateLabelAction(WMGetState ())
	While $playing And Not $LeaveWhile And WMGetState() == "Playing"
		Sleep(100)
	WEnd
	WMStop()
	UnFocus($id)
	$StreamPlaying = False
EndFunc   ;==>PlayStream

Func Stream_Event_MediaChange($Item)
	Dim $tag[9]
	$tag[3] = WMGetTitle($pObj.currentMedia)
	$tag[1] = WMGetArtist($pObj.currentMedia)
	$tag[2] = WMGetAlbum($pObj.currentMedia)
	$tag[4] = WMGetGenre($pObj.currentMedia)
	$tag[5] = "Stream"
	$tag[6] = $liste[$activelistid]
	$tag[7] = 0
	$tag[8] = 10
	For $i = 1 To 8
		If StringLen($tag[$i]) == 0 Then $tag[$i] = "Stream"
	Next
	UpdateList($activelistid, $tag[3], "")
	Dim $similar[1]
	$similar[0] = 0
	UpdateLabelInfo($tag, $similar)
	PluginTrigger("SongInformationLoaded",$activelistid,$tag)
	WebAnnounce($tag)
EndFunc

Func Stream_Event_Buffering($State)
	debug("Buffering on " & $pobj.network.bufferingProgress)
	debug("Download on " & $Pobj.network.downloadProgress)
EndFunc

Func StreamBuild()
	Global $Streams[IniRead("db\settings.ini", "Stream", 0, 0)+1]
	Global $StreamGUI = XSkinGUICreate("PPlayer - Stream", 532+$factorX*2, 323+$factorY*2, $Skin_Folder,1,25, IniRead("db\settings.ini", "window", "Streamx", -1), IniRead("db\settings.ini", "window", "Streamy", -1), -1, $MainGUI)
	XSkinIcon($StreamGUI,3,StringSplit("StreamClose|StreamClose|StreamHelp","|"))
	Global $StreamListView = GUICtrlCreateListView("Name      |Adress                                                   |IP          ", 0+$factorX, 0+$factorY, 481, 321)
	GUICtrlCreateIcon($PP_IcoFolder, 1,486+$factorX, 8+$factorY, 32, 32)
	GUICtrlSetOnEvent(-1,"StreamAdd")
	GUICtrlCreateIcon($PP_IcoFolder, 9, 486+$factorX, 49+$factorY, 32, 32)
	GUICtrlSetOnEvent(-1,"StreamDel")
	GUICtrlCreateButton("Queue", 486+$factorX, 95+$factorY, 40, 32)
	GUICtrlSetOnEvent(-1,"StreamQueue")
	GUICtrlCreateButton("Play", 486+$factorX, 136+$factorY, 40, 32)
	GUICtrlSetOnEvent(-1,"StreamPlay")
	
	$CM = GUICtrlCreateContextMenu($StreamListView)
	GUICtrlCreateMenuItem("Add", $CM)
	GUICtrlSetOnEvent(-1, "StreamAdd")
	GUICtrlCreateMenuItem("Delete", $CM)
	GUICtrlSetOnEvent(-1, "Streamdel")
	GUICtrlCreateMenuItem("Play", $CM)
	GUICtrlSetOnEvent(-1, "StreamPlay")
	GUICtrlCreateMenuItem("Queue", $CM)
	GUICtrlSetOnEvent(-1, "StreamQueue")
	If IniRead("db\settings.ini", "GUIStati", "Stream", "Close") == "Open" Then Stream()
	$Secs = IniReadSectionNames("db\Streams.ini")
	If @Error Then Return ""
	For $i = 1 To $Secs[0]
		$Streams[$i] = GUICtrlCreateListViewItem(IniRead("db\Streams.ini", $Secs[$i],"Name", "Unknown") & "|" & IniRead("db\Streams.ini", $Secs[$i], "URL", "") & "|" & IniRead("db\Streams.ini", $Secs[$i],"Adress", IniRead("db\Streams.ini", $Secs[$i], "URL", "")),$StreamListView)
	Next
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
	$Sel = InputBox("PPlayer - Stream","Please enter the adress of the stream you want to add")
	If @Error Or StringLen($Sel) == 0 Then Return ""
	If _GUICtrlListView_FindInText($StreamListView,$Sel) == -1 Then
		_IniWrite("db\Streams.ini", $Sel,"URL",$Sel)
		ReDim $Streams[Ubound($Streams)+1]
		$Streams[UBound($Streams)-1] = GUICtrlCreateListViewItem(IniRead("db\Streams.ini", $Sel,"Name", "Unknown") & "|" & IniRead("db\Streams.ini", $Sel, "URL", $Sel) & "|" & IniRead("db\Streams.ini", $Sel,"Adress", IniRead("db\Streams.ini", $Sel, "URL", $sel)),$StreamListView)
	Else
		Error("This stream is already in list")
	EndIf
EndFunc   ;==>StreamPlay

Func StreamDel()
	$ItemSel = _GUICtrlListView_GetSelectedIndices($StreamListView, True)
	If $ItemSel[0] > 0 Then
		For $i = 1 To $ItemSel[0]
			IniDelete("db\Streams.ini",_GUICtrlListView_GetItemText($StreamListView,$ItemSel[$i],1))
			GUICtrlDelete($Streams[$ItemSel[$i]+1])
		Next
	EndIf
EndFunc   ;==>StreamPlay

Func StreamPlay()
	$ItemSel = _GUICtrlListView_GetSelectedIndices($StreamListView, True)
	If $ItemSel[0] > 0 Then
		For $i = 1 To $ItemSel[0]
			SetList(_GUICtrlListView_GetItemText($StreamListView,$ItemSel[$i],2))
		Next
		Focus(_GUICtrlListView_GetItemCount($lieder)-1)
		Play_active()
	EndIf
EndFunc

Func StreamQueue()
	$ItemSel = _GUICtrlListView_GetSelectedIndices($StreamListView, True)
	If $ItemSel[0] > 0 Then
		For $i = 1 To $ItemSel[0]
			SetList(_GUICtrlListView_GetItemText($StreamListView,$ItemSel[$i],2))
		Next
	EndIf
EndFunc