#include-once
PluginRegister("Podcast")

Func Podcast_OnPluginLoad()
	PluginRegisterMenu("Podcast","Podcast")
	pod_check()	
EndFunc

Func Podcast_OnExit()
	If IniRead("db\settings.ini", "GUIStati", "Podcast", "Close") == "Open" Then
		$Pos = WinGetPos("PPlayer - Podcast")
		If Not @error Then
			_IniWrite("db\settings.ini", "window", "podx", $Pos[0])
			_IniWrite("db\settings.ini", "window", "pody", $Pos[1])
		EndIf
	EndIf
	GUIDelete($PodcastGUI)
EndFunc

Func Podcast_OnPluginsRegistered()
	If PluginExists("Updater") Then Updater_Register("http://pplayer.sourceforge.net/access/downloads/Plugins/Podcast/Main.au3","Plugins\Podcast\Main.au3")
EndFunc

Func Podcast_CreateCustomGUI()
	Global $factor = (IniRead($Skin_Folder & "\Skin.dat","settings","size",20)-0)/2
	Global $PodcastGUI = XSkinGUICreate("PPlayer - Podcast", 400+$factorX*2, 200+$factorY*2,$Skin_Folder,1,25, IniRead("db\settings.ini", "window", "podx", -1), IniRead("db\settings.ini", "window", "pody", -1), -1, $MainGUI)
	GUISetBkColor("0x" & GetOpt("BkColor"))
	XSkinIcon($PodcastGUI,3,StringSplit("Podcastclose|Podcastclose|PodcastHelp","|"))
	$message = "Podcast Informationen:" & @CRLF & @CRLF & _
			"To use Podcast on PPlayer you need the (RSS)XMLFeed Adress of the Podcast" & @CRLF & _
			"For eg. Dastum's PodCast: http://www.gcast.com/u/Dastum/main.xml"
	Global $PodcastLabel = GUICtrlCreateLabel($message, 10+$factorX, 100+$factorY, 390, 100)
	GUICtrlSetColor(-1, "0x" & GetOpt("TextColor"))
	GUICtrlCreateButton("Load", 310+$factorX, 20+$factorY, 50, 20, 0)
	GUICtrlSetOnEvent(-1, "PodcastInput")
	GUICtrlCreateButton("Play", 310+$factorX, 50+$factorY, 50, 20)
	GUICtrlSetOnEvent(-1, "Podcastplay")
	Global $PodcastFeedURL = GUICtrlCreateCombo("", 10+$factorX, 20+$factorY, 290, 20)
	Global $PodcastPodcasts = GUICtrlCreateCombo("", 10+$factorX, 50+$factorY, 290, 20)
	For $i = 1 To IniRead("db\podcast.ini", "podcast", 0, 0)
		If StringLen(IniRead("db\podcast.ini", "podcast", $i, "")) > 0 Then _GUICtrlComboBox_AddString($PodcastFeedURL, IniRead("db\podcast.ini", "podcast", $i, ""))
	Next
	$PodcastNotify = GUICtrlCreateButton("Notify", 10+$factorX, 75+$factorY, 50, 20)
	GUICtrlSetOnEvent(-1, "Podcastnotify")
	GUICtrlCreateButton("Delete", 65+$factorX, 75+$factorY, 50, 20)
	GUICtrlSetOnEvent(-1, "Podcastdelete")
	If IniRead("db\settings.ini", "GUIStati", "Podcast", "Close") == "Open" Then Podcast()
EndFunc   ;==>PodcastBuild

Func Podcast()
	GUISetState(@SW_SHOW, $PodcastGUI)
	GUISetState(@SW_RESTORE, $PodcastGUI)
	pod_check()	
	_IniWrite("db\settings.ini", "GUIStati", "Podcast", "Open")
EndFunc   ;==>Podcast

Func Podcastclose()
	GUISetState(@SW_HIDE, $PodcastGUI)
	_IniWrite("db\settings.ini", "GUIStati", "Podcast", "Close")
EndFunc   ;==>Podcastclose

Func PodcastHelp()
	ShellExecute("http://pplayer.wiki.sourceforge.net/PodCast")
EndFunc

Func Podcastnotify()
	$Sel = _GUICtrlComboBox_GetCurSel($PodcastFeedURL)
	If StringLen($Sel) > 0 Then
		InetGet($Sel, "db\PodCast.ppd", 1)
		$PodCastTitle = _StringBetween(FileRead("db\Podcast.ppd"), "<title>", "</title>")
		If IniRead("db\podcast.ini", "notify", $PodCastTitle[0] & ".ppd", 0) == 1 Then
			_IniWrite("db\podcast.ini", "notify", $PodCastTitle[0] & ".ppd", 0)
			Info("Notify on " & $PodCastTitle[0] & " deactivated!")
		Else
			_IniWrite("db\podcast.ini", "notify", $PodCastTitle[0] & ".ppd", 1)
			Info("Notify on " & $PodCastTitle[0] & " activated!")
		EndIf
	EndIf
EndFunc   ;==>Podcastnotify

Func PodcastInput()
	GUICtrlSetData($PodcastLabel, "Loading")
	GUICtrlSetData($PodcastPodcasts, "")
	$Sel = GUICtrlRead($PodcastFeedURL)
	If Not StringLen($Sel) Then
		GUICtrlSetData($PodcastLabel, "Loading Failed")
		Return False
	EndIf
	InetGet($Sel, "db\PodCast.ppd", 1, 1)
	While @InetGetActive
		GUICtrlSetData($PodcastLabel, GUICtrlRead($PodcastLabel) & ".")
		Sleep(500)
	WEnd
	$Programs = _StringBetween(FileRead("db\PodCast.ppd"), "<item>", "</item>")
	For $i = 0 To UBound($Programs) - 1
		$Title = _StringBetween($Programs[$i], "<title>", "</title>")
		If Not @error And StringLen($Title[0]) Then _GUICtrlComboBox_AddString($PodcastPodcasts, $Title[0])
	Next
	If StringInStr(_GUICtrlComboBox_GetList($PodcastFeedURL), $Sel) == 0 Then
		$pods = IniRead("db\podcast.ini", "podcast", 0, 0) + 1
		_IniWrite("db\podcast.ini", "podcast", 0, $pods)
		_IniWrite("db\podcast.ini", "podcast", $pods, $Sel)
		_GUICtrlComboBox_AddString($PodcastFeedURL, $Sel)
	EndIf
	$PodCastTitle = _StringBetween(FileRead("db\PodCast.ppd"), "<title>", "</title>")
	If Not @error Then
		FileCopy("db\PodCast.ppd", "Radio\" & $PodCastTitle[0] & ".ppd", 1)
		_IniWrite("db\podcast.ini", "URL", $PodCastTitle[0] & ".ppd", $Sel)
		$Pod_Notified = False
	Else
		GUICtrlSetData($PodcastLabel, "Loading Failed")
	EndIf
	GUICtrlSetData($PodcastLabel, "Loaded")
EndFunc   ;==>PodcastInput

Func Podcastplay()
	; Podcast download einführen
	If _GUICtrlComboBox_GetCurSel($PodcastPodcasts) < 0 Then
		Error("No Podcast chosen")
		Return ""
	EndIf
	$Programs = _StringBetween(FileRead("db\Podcast.ppd"), "<item>", "</item>")
	$URL = _StringBetween($Programs[_GUICtrlComboBox_GetCurSel($PodcastPodcasts) ], '<enclosure url="', '"')
	$Name = StringTrimLeft($URL[0], StringInStr($URL[0], "/", 1, -1))
	If PluginExists("Stream") Then
		SetList($URL[0])
	Else
		Podcastload($URL[0], "Radio\" & $Name)
		SetList( "Radio\" & $Name)
		sleep(5000)
		GUIDelete($Download_GUI)
	EndIf
EndFunc   ;==>Podcastplay

Func Podcastload($URL, $path)
	Global $Download_GUI = GUICreate("PPlayer Downloader", 500, 150)
	GUISetBkColor("0x" & IniRead("db\settings.ini", "settings", "opt6", "000000"))
	$Download_Label = GUICtrlCreateLabel("Loading...",90, 10, 400, 110)
	GUICtrlSetColor(-1, "0x" & IniRead("db\settings.ini", "settings", "opt7", "FFFFFF"))
	GUICtrlCreateLabel("Downloading..." & @CRLF & "URL: " & @CRLF & @CRLF & "Loaded: " & @CRLF & "Time left:" & @CRLF & "Done: ",10,10,80,110)
	GUICtrlSetColor(-1, "0x" & IniRead("db\settings.ini", "settings", "opt7", "FFFFFF"))
	$Download_Progress = GUICtrlCreateProgress(10, 120, 480, 20)
	GUISetState(@SW_SHOW)
	$size = InetGetSize($URL)
	If @Error Then
		GUICtrlSetData($Download_Label, "Download failed")
		return False
	Else
		$Start = TimerInit()
		InetGet($URL, $path, 1, 1)
		If StringLen($URL) > 60 Then 
			$URL = StringLeft($URL,60) & @CRLF & StringRight(StringTrimLeft($URL,60),StringLen($URL)-60)
		Else
			$URL &= @CRLF
		EndIf
		If $size == 0 Then $size = InetGetSize($URL)
		While @InetGetActive == 1
			If GUIGetMsg() == -3 Then Exit
			Sleep(10)
			$Message = @CRLF & $URL & @CRLF & _
			Round(@InetGetBytesRead / 1048576,1) & "MB/" & Round($size / 1048576,1) & "MB @ " & Int((@InetGetBytesRead/1024)/(TimerDiff($Start)/1000)) & "kb/s" & @CRLF
			If $size > 0 Then
				$Message &= Round((Round(TimerDiff($Start)/1000,2)/Round(@InetGetBytesRead / $size * 100))*(100-Round(@InetGetBytesRead / $size * 100))) & " seconds" & @CRLF & _
				Round(@InetGetBytesRead / $size * 100) & "%"
			Else
				$Message &= "--" & @CRLF & "--"
			EndIf
			GUICtrlSetData($Download_Label,$Message)
			GUICtrlSetData($Download_Progress, Round(@InetGetBytesRead / $size * 100))
		WEnd
	EndIf
	return True
EndFunc   ;==>Podcastload

Func Podcastdelete()
	_IniWrite("db\podcast.ini", "podcast", _GUICtrlComboBox_GetCurSel($PodcastFeedURL) + 1, "")
	_GUICtrlComboBox_DeleteString($PodcastFeedURL, _GUICtrlComboBox_GetCurSel($PodcastFeedURL))
	Info("Podcast deleted")
EndFunc   ;==>Podcastdelete

Func pod_check()
	$search = FileFindFirstFile("Radio\*.ppd")
	While 1
		$file = FileFindNextFile($search)
		If @error Then
			FileClose($search)
			ExitLoop
		EndIf
		If IniRead("db\podcast.ini", "notify", $file, 0) == 1 Then
			If InetGetSize(IniRead("db\podcast.ini", "URL", $file, "")) > FileGetSize("Radio\" & $file) Then
				$Pod_Notified = True
				Info("Podcast " & StringReplace($file, ".ppd", "") & " got updated!")
			EndIf
		EndIf
	WEnd
	FileClose($search)
	FileDelete("temp.dat")
EndFunc   ;==>pod_check