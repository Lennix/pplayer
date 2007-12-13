;#include "..\Include\IE.au3"
PluginRegister("Updater")

Func Updater_OnPluginLoad()
	Global $Updater_Version = "0.1"
	Global $Updater_Files[1][2]
	Global $Updater_FilesRegistered[1][2]
	Global $Updater_FilesChecked = False
	PluginRegisterMenu("Updater","Updater")
	PluginRegisterSettingsTab("Updater") ; blah
	Updater_Register("http://pplayer.sourceforge.net/access/downloads/Plugins/Updater/Main.au3","Plugins\Updater\Main.au3")
EndFunc

Func Updater_CreateCustomGUI()
	Global $UpdaterGUI = XSkinGUICreate ("PPlayer - Updater", 681+$factorX*2, 396+$factorY*2, $Skin_Folder)
	XSkinIcon($UpdaterGUI,2,StringSplit("Updaterclose|Updaterclose","|"))
	;Global $Updater_oIE = _IECreateEmbedded()
	;Global $Updater_oIE = ObjCreate("Shell.Explorer.2")
	;GUICtrlCreateObj($Updater_oIE, 0+$factorX, 0+$factorY, 456, 392)
	Global $Updater_Edit = GUICtrlCreateEdit("", 464+$factorX, 0+$factorY,209, 289,BitOR($ES_AUTOVSCROLL,$ES_READONLY,$ES_WANTRETURN,$WS_VSCROLL))
	GUICtrlSetData(-1,"Loaded PPlayer - Updater V" & $Updater_Version)
	GUICtrlCreateButton("Check", 464+$factorX, 360+$factorY, 89, 33, 0)
	GUICtrlSetOnEvent(-1,"Updater_ClickedCheck")
	GUICtrlCreateButton("Update", 584+$factorX, 360+$factorY, 89, 33, 0)
	GUICtrlSetOnEvent(-1,"Updater_ClickedUpdate")
	Global $Updater_Progress = GUICtrlCreateProgress(464+$factorX, 328+$factorY, 209, 25)
	Global $Updater_Label = GUICtrlCreateLabel("", 464+$factorX, 296+$factorY, 209, 15)
	;$Updater_oIE.navigate ("http://pplayer.sourceforge.net/access/updater.php?show=news&bg=" & LoadSetting("settings","BkColor","000000") & "&tc=" & LoadSetting("settings","TextColor","000000"))
	;_IENavigate($Updater_oIE,"http://pplayer.sourceforge.net/access/updater.php?show=news&bg=" & LoadSetting("settings","BkColor","000000") & "&tc=" & LoadSetting("settings","TextColor","000000"),0)
EndFunc

Func Updater_CreateSettingsTab() 
	GUICtrlCreateTabItem("Updater")
	GUICtrlCreateGroup("Updater", 8, 32, 473, 324)
	GUICtrlCreateLabel("Autoupdate", 16, 56, 85, 17)
	Global $Updater_Settings_Checkbox = GUICtrlCreateCheckbox("", 264, 56, 209, 17)
	GUICtrlSetOnEvent(-1, "Settings_Change")
	GUICtrlSetState(-1, LoadSetting("Updater","Autoupdate",$GUI_CHECKED))
	GUICtrlCreateGroup("", -99, -99, 1, 1)
EndFunc

Func Updater_OnSettingsSave()
	SaveSetting("Updater","Autoupdate",GUICtrlRead($Updater_Settings_Checkbox))
EndFunc

Func Updater_OnSettingsClose()
	GUICtrlSetState($Updater_Settings_Checkbox,LoadSetting("Updater","Autoupdate",$GUI_CHECKED))
EndFunc

Func Updater_OnPPlayerLoaded()
	If LoadSetting("Updater","Autoupdate",$GUI_CHECKED) Then Updater_ClickedUpdate()
EndFunc
	
Func Updater_OnExit()
	UpdaterClose()
	$Updater_oIE = 0
EndFunc
	
Func Updater()
	GUISetState(@SW_SHOW,$UpdaterGUI)
	GUISetState(@SW_RESTORE, $UpdaterGUI)
EndFunc

Func Updaterclose()
	GUISetState(@SW_Hide,$UpdaterGUI)
EndFunc

Func Updater_ClickedCheck()
	$FilesRegged = Ubound($Updater_FilesRegistered)-1
	GUICtrlSetData($Updater_Progress,0)
	$Updater_FilesChecked = True
	ReDim $Updater_Files[1][2]
	Updater_log("Connecting to Updateserver...")
	;$Updater_oIE.navigate ("http://pplayer.sourceforge.net/access/updater.php?show=news&bg=" & LoadSetting("settings","BkColor","000000") & "&tc=" & LoadSetting("settings","TextColor","000000"))
	$Files = StringSplit(Request("http://pplayer.sourceforge.net/access/updater.php?show=filelist"),"|")
	If $Files[0]-1 == 0 Then
		sleep(3000)
		$Files = StringSplit(Request("http://pplayer.sourceforge.net/access/updater.php?show=filelist"),"|")
	EndIf
	Updater_Log("Checking " & (($FilesRegged) + ($Files[0]-1)) & " files for updates...")
	For $i = 1 To $FilesRegged
		GUICtrlSetData($Updater_Progress,$i/($FilesRegged)*100)
		$Input = StringSplit(Request("http://pplayer.sourceforge.net/access/updater.php?show=filetime&file=" & StringReplace($Updater_FilesRegistered[$i][0],"\","/")),"<pexit>")
		If $Input > 0 And FileGetTime($Updater_FilesRegistered[$i][0],0,1) < $Input Then 
			ReDim $Updater_Files[Ubound($Updater_Files)+1][2]
			$Updater_Files[UBound($Updater_Files)-1][0] = $Updater_FilesRegistered[$i][0]
			$Updater_Files[UBound($Updater_Files)-1][1] = $Updater_FilesRegistered[$i][1]
			Updater_Log("Update available for " & $Updater_FilesRegistered[$i][0])
		EndIf
	Next
	For $i = 1 To $Files[0]-1
		GUICtrlSetData($Updater_Progress,$i/($Files[0]-1)*100)
		$Input = StringSplit($Files[$i],";")
		If $Input[0] > 1 Then
			GUICtrlSetData($Updater_Label,"Checking " & $Input[1])
			If $Input[2] > 0 And FileGetTime($Input[1],0,1) < $Input[2] Then
				ReDim $Updater_Files[Ubound($Updater_Files)+1][2]
				$Updater_Files[UBound($Updater_Files)-1][0] = $Input[1]
				$Updater_Files[UBound($Updater_Files)-1][1] = "http://pplayer.sourceforge.net/access/downloads/" & StringReplace($Input[1],"\","/")
				Updater_Log("Update available for " & $Input[1])
			EndIf
		Else
			Updater_log("Unable to check " & $Input[1])
		EndIf
	Next
	If Ubound($Updater_Files) == 1 Then 
		Updater_log("No updates available")
	Else
		Updater_log("Check finished")
	EndIf
EndFunc

Func Updater_ClickedUpdate()
	If Not $Updater_FilesChecked Then Updater_ClickedCheck()
	If Ubound($Updater_Files) > 1 Then
		Updater_log("Updating files...")
		For $i = 1 To Ubound($Updater_Files)-1
			If StringLen($Updater_Files[$i][0]) > 0 Then 
				$msg = "Updating " & $Updater_Files[$i][0]
				Updater_Log($msg)
				FileDelete(@TempDir & "PPlayerDownload")
				InetGet($Updater_Files[$i][1],@TempDir & "PPlayerDownload",1,1)
				$Size = InetGetSize($Updater_Files[$i][1])
				While @InetGetActive
					GUICtrlSetData($Updater_Label,$msg & ": " & Round(@InetGetBytesRead/$size*100,2))
					GUICtrlSetData($Updater_Progress,@InetGetBytesRead/$size*100)
					sleep(10)
				WEnd
				If FileGetSize(@TempDir & "PPlayerDownload") > 0 Then FileCopy(@TempDir & "PPlayerDownload",$Updater_Files[$i][0],9)
			EndIf
		Next
		Updater_Log("Installation is up to date!")
	EndIf
	GUICtrlSetData($Updater_Label,"Installation is up to date!")
	GUICtrlSetData($Updater_Progress,100)
	$Updater_FilesChecked = False
EndFunc

Func Updater_Log($Text)
	GUICtrlSetData($Updater_Edit,GUICtrlRead($Updater_Edit) & @CRLF & $Text)
EndFunc

Func Updater_Register($URL,$Path)
	ReDim $Updater_FilesRegistered[Ubound($Updater_FilesRegistered)+1][2]
	$Updater_FilesRegistered[UBound($Updater_FilesRegistered)-1][0] = $Path
	$Updater_FilesRegistered[UBound($Updater_FilesRegistered)-1][1] = $URL
EndFunc