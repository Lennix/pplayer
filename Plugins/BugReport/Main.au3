#include-once
;#include "..\include\IE.au3"
PluginRegister("BugReport")

Func BugReport_OnPluginLoad()
	PluginRegisterMenu("BugReport","BugReport")
EndFunc

Func BugReport_OnExit()
	If IniRead("db\settings.ini", "GUIStati", "BugReport", "Close") == "Open" Then
		$Pos = WinGetPos("PPlayer - BugReport")
		If Not @error Then
			_IniWrite("db\settings.ini", "window", "podx", $Pos[0])
			_IniWrite("db\settings.ini", "window", "pody", $Pos[1])
		EndIf
	EndIf
	GUIDelete($BugReportGUI)
	$BugReport_oIE = 0
EndFunc

Func BugReport_OnPluginsRegistered()
	If PluginExists("Updater") Then Updater_Register("http://pplayer.sourceforge.net/access/downloads/Plugins/BugReport/Main.au3","Plugins\BugReport\Main.au3")
EndFunc

Func BugReport_CreateCustomGUI()
	Global $BugReportGUI = XSkinGUICreate("PPlayer - Bugreport", 633+$FactorX*2, 447+$FactorY*2,$Skin_Folder)
	XSkinIcon($BugReportGUI,3,StringSplit("BugReportclose|BugReportclose|BugReportHelp","|"))
	GUICtrlCreateGroup("Report", 0+$FactorX, 0+$FactorY, 185, 49)
	Global $BugReportRadio[3]
	$BugReportRadio[0] = GUICtrlCreateRadio("Bugs", 8+$FactorX, 16+$FactorY, 49, 17)
	$BugReportRadio[1] = GUICtrlCreateRadio("Features", 56+$FactorX, 16+$FactorY, 65, 17)
	$BugReportRadio[2] = GUICtrlCreateRadio("Plugins", 120+$FactorX, 16+$FactorY, 57, 17)
	For $i = 0 To 2
		GUICtrlSetOnEvent($BugReportRadio[$i],"BugReportChoosen")
	Next
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	$BugReportLabel1 = GUICtrlCreateLabel("", 192+$FactorX, 0+$FactorY, 235, 49)
	Global $BugReport_oIE
	;Global $BugReport_oIE = _IECreateEmbedded()
	;Global $BugReport_oIE = ObjCreate("Shell.Explorer.2")
	;If IsObj($BugReport_oIE) Then GUICtrlCreateObj($BugReport_oIE, 0+$FactorX, 56+$FactorY, 624, 384)
	If LoadSetting("GUIStati","BugReport","Close") == "Open" Then BugReport()
EndFunc   ;==>BugReportBuild

Func BugReport()
	GUISetState(@SW_SHOW, $BugReportGUI)
	GUISetState(@SW_RESTORE, $BugReportGUI)
	_IniWrite("db\settings.ini", "GUIStati", "BugReport", "Open")
EndFunc   ;==>BugReport

Func BugReportclose()
	GUISetState(@SW_HIDE, $BugReportGUI)
	_IniWrite("db\settings.ini", "GUIStati", "BugReport", "Close")
EndFunc   ;==>BugReportclose

Func BugReportHelp()
	ShellExecute("http://pplayer.wiki.sourceforge.net/BugReport")
EndFunc

Func BugReportChoosen()
	Switch @GUI_CtrlId
		Case $BugReportRadio[0]
			$Url = "http://sourceforge.net/tracker/?func=add&group_id=206085&atid=996243"
		Case $BugReportRadio[1]
			$URL = "http://sourceforge.net/tracker/?func=add&group_id=206085&atid=996246"
		Case $BugReportRadio[2]
			$URL = "http://sourceforge.net/tracker/?func=add&group_id=206085&atid=996245"
	EndSwitch
	If IsObj($BugReport_oIE) Then
		$BugReport_oIE.navigate($URL)
	Else
		ShellExecute($URL)
	EndIf
EndFunc