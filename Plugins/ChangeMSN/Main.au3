#include-once
PluginRegister("ChangeMSN") ; Events will be triggered for ChangeMSN. Syntax: ChangeMSN_EventName
;PluginRegisterEventVars("ChangeMSN","SongInformationLoaded","ActiveSongInfo")

; Events:

Func ChangeMSN_OnPluginLoad()
	PluginRegisterSettingsTab("ChangeMSN") ; Will Call "ChangeMSN_CreateSettingsTab" when creating the settings GUI
EndFunc

Func ChangeMSN_SongInformationLoaded($id,$tag)
	If LoadSetting("ChangeMSN","MSNAct",$GUI_CHECKED) == $GUI_CHECKED Then ChangeMSNMessage("Music", 1, StringReplace(StringReplace(StringReplace(StringReplace(LoadSetting("ChangeMSN","MSN","%t - %a - %i (PPlayer)"), "%g", $tag[4]), "%t", $tag[3]), "%i", $tag[1]), "%a", $tag[2]))
EndFunc

Func ChangeMSN_NextSongNotAvailable($id,$tag)
	ChangeMSNMessage("Music", 0, "")
EndFunc

Func ChangeMSN_SongPlayStopped()
	ChangeMSNMessage("Music", 0, "")
EndFunc

Func ChangeMSN_OnSettingsSave()
	SaveSetting("ChangeMSN","MSNAct",GUICtrlRead($SettingsCheckbox2))
	SaveSetting("ChangeMSN","MSN",GUICtrlRead($SettingsInput3))
EndFunc

Func ChangeMSN_OnSettingsClose()
	GUICtrlSetState($SettingsCheckbox1, LoadSetting("ChangeMSN","MSNAct",$GUI_CHECKED))
	GUICtrlSetData($SettingsInput3, LoadSetting("ChangeMSN","MSN","%t - %a - %i (PPlayer)"))
EndFunc

Func ChangeMSN_OnExit()
	ChangeMSNMessage("Music", 0, "")
EndFunc

Func ChangeMSN_OnPluginsRegistered()
	If PluginExists("Updater") Then Updater_Register("http://pplayer.sourceforge.net/access/downloads/Plugins/ChangeMSN/Main.au3","Plugins\ChangeMSN\Main.au3")
EndFunc

; Funcs: 

; Start Coords: 8,32 Max length 473, 355
Func ChangeMSN_CreateSettingsTab() 
	GUICtrlCreateTabItem("MSN")
	Global $SettingsGroup2 = GUICtrlCreateGroup("MSN", 8, 32, 473, 121)
	Global $SettingsLabel5 = GUICtrlCreateLabel("MSN Status Text", 16, 56, 85, 17)
	Global $SettingsCheckbox2 = GUICtrlCreateCheckbox("", 264, 56, 209, 17)
	GUICtrlSetOnEvent(-1, "Settings_Change")
	GUICtrlSetState(-1, LoadSetting("ChangeMSN","MSNAct",$GUI_CHECKED))
	Global $SettingsLabel6 = GUICtrlCreateLabel("Text", 40, 80, 25, 17)
	Global $SettingsInput3 = GUICtrlCreateInput(LoadSetting("ChangeMSN","MSN","%t - %a - %i (PPlayer)"), 264, 80, 209, 21)
	GUICtrlSetOnEvent(-1, "Settings_Change")
	Global $SettingsLabel7 = GUICtrlCreateLabel("Info: The parameters are:" & @CRLF & "%i: Artist -- %t: Track -- %a: Album -- %g: Genre", 16, 112, 453, 81)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	If GUICtrlRead($SettingsCheckbox2) == $GUI_UNCHECKED Then
		GUICtrlSetState($SettingsInput3, $GUI_DISABLE)
		GUICtrlSetState($SettingsLabel6, $GUI_DISABLE)
	Else
		GUICtrlSetState($SettingsInput3, $GUI_ENABLE)
		GUICtrlSetState($SettingsLabel6, $GUI_ENABLE)
	EndIf
EndFunc

Func ChangeMSNMessage($szType, $bEnable, $szText)
	If LoadSetting("ChangeMSN","MSNAct",$GUI_CHECKED) == $GUI_UNCHECKED Then Return ""
	; $szType: "Music","Games","Office"
	Local Const $szFormat = "PPlayer\\0%s\\0%d\\0{0}\\0%s\\0\\0\\0\\0\\0"
	Local Const $WM_COPYDATA = 0x4A
	Local $szMessage
	Local $iSize
	Local $pMem
	Local $stCopyData
	Local $hWindow

	$szMessage = StringFormat($szFormat, $szType, $bEnable, $szText)

	;; Create a unicode string ;;
	$iSize = StringLen($szMessage) + 1
	$pMem = DllStructCreate("ushort[" & $iSize & "]")
	For $i = 0 To $iSize
		DllStructSetData($pMem, 1, Asc(StringMid($szMessage, $i, 1)), $i)
	Next
	DllStructSetData($pMem, 1, 0, $iSize)

	;; Create the COPYDATASTRUCT ;;
	$stCopyData = DllStructCreate("uint;uint;ptr")
	DllStructSetData($stCopyData, 1, 0x547) ;dwData = MSN magic number
	DllStructSetData($stCopyData, 2, ($iSize * 2)) ;cbData = Size of the message
	DllStructSetData($stCopyData, 3, DllStructGetPtr($pMem)) ;lpData = Pointer to the message

	;; Send the WM_COPYDATA message ;;
	$hWindow = DllCall("user32", "hwnd", "FindWindowExA", "int", 0, "int", 0, "str", "MsnMsgrUIManager", "int", 0)
	While ($hWindow[0])
		DllCall("user32", "int", "SendMessageA", "hwnd", $hWindow[0], "int", $WM_COPYDATA, "int", 0, "ptr", DllStructGetPtr($stCopyData))
		$hWindow = DllCall("user32", "hwnd", "FindWindowExA", "int", 0, "hwnd", $hWindow[0], "str", "MsnMsgrUIManager", "int", 0)
	WEnd

	;; Cleanup ;;
	$pMem = 0
	$stCopyData = 0
EndFunc   ;==>ChangeMSNMessage