#include "..\Include\IE.au3"

PluginRegister("Debugger")

Func Debugger_OnPluginLoad()
	Global $XT_oIE
	PluginRegisterMenu("Debugger","Debugger")
EndFunc

Func Debugger_CreateCustomGUI()
	Global $DebuggerGUI = XSkinGUICreate ("PPlayer - Debugger", 500+$factorX*2, 400+$factorY*2, $Skin_Folder)
	XSkinIcon($DebuggerGUI,2,StringSplit("Debuggerclose|Debuggerclose","|"))
	$XSkin_Console = XSkinConsole($DebuggerGUI, 0+$factorX, 0+$factorY, 500, 400)
	XSkinText("PPlayer - Debugger started @ PPlayer Version " & $version)
EndFunc

Func Debugger_SongPlayStarted($id,$filepath)
	XSkinText("Now playing: " & $filepath)
EndFunc

Func Debugger_SongLoadingInformation($id,$filepath)
	XSkinText("Looking for information: " & $filepath)
EndFunc

Func Debugger_SongNotInDB($id,$Filepath)
	XSkinText("Song is not in DB")
EndFunc

Func Debugger_SongNotAddableToDB($id,$filepath)
	XSkinText("Unable to add song!","red")
EndFunc

Func Debugger_SongAddedToDB($id,$filepath)
	XSkinText("Song added to DB")
EndFunc

Func Debugger_SongInDB($id,$tag)
	XSkinText("Song is in DB")
EndFunc

Func Debugger_SongNoSimilarBands($id,$tag)
	XSkinText("Unable to load similar bands!","red")
EndFunc

Func Debugger_OnPluginsRegistered()
	If PluginExists("Updater") Then Updater_Register("http://pplayer.sourceforge.net/access/downloads/Plugins/Debugger/Main.au3","Plugins\Debugger\Main.au3")
EndFunc

Func XSkinConsole($XT_GUI, $left, $top, $width, $height)
    ;_IEErrorHandlerRegister()
    $XT_oIE = _IECreateEmbedded()
    If Not IsHWnd($XT_GUI) Then
        $XT_GUI = GUICreate("", $width + (2 * $left), $height + (2 * $top))
        GUISetState()
    EndIf
    $XT_ActiveX = GUICtrlCreateObj($XT_oIE, $left, $top, $width, $height)
    _IENavigate($XT_oIE, "about:blank")
	_IEErrorHandlerRegister()
    Return $XT_ActiveX
EndFunc   ;==>XSkinConsole

Func XSkinText($msg = "", $color = "black", $size = "3")
    If $msg == "CLR"  Then Return _IEDocWriteHTML($XT_oIE, "")
	$msg = @Hour & ":" & @MIN & ":" & @SEC & ": " & $msg
    Return _IEDocWriteHTML($XT_oIE, _IEDocReadHTML($XT_oIE) & '<font color="' & $color & '" size=' & $size & '>' & $msg & '</font><br>')
EndFunc   ;==>XSkinText

Func Debuggerclose()
	GUISetState(@SW_Hide,$DebuggerGUI)
EndFunc

Func Debugger()
	GUISetState(@SW_SHOW,$DebuggerGUI)
	GUISetState(@SW_RESTORE, $DebuggerGUI)
EndFunc