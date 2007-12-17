;Come on baby don't be shy!
;hRhR
#cs ChangeLog
	Well I just started this to submit some bugs:
	1. When PPlayer starts MiniMode automatically opens.. (maybe change this)
	2. When PPlayer starts MiniMode's Icon is "Pause"
	3. You should include the event SongPlayStarted / SongPlayStopped for changing the icon
#ce

#include-once
PluginRegister("MiniPPlayer")

Func MiniPPlayer_OnPluginLoad()
	;PluginRegisterMenu("PPlayer Mini mode", "PPlayer Mini mode") This is useless (it registers a menuitem in PPlayer's menu) First param is the name and second the function to call on click
EndFunc   ;==>MiniPPlayer_OnPluginLoad

Func MiniPPlayer_CreateCustomGUI()
	Global $MiniPPlayerGui = GUICreate("PPlayer Mini Mode", 360, 47, 193, 125, -1, BitOR($WS_EX_TOOLWINDOW, $WS_EX_TOPMOST, $WS_EX_WINDOWEDGE))
	GUISetBkColor(0xA6CAF0)
	Global $MiniPPlayerLabel1 = GUICtrlCreateLabel("", 3, 5, 297, 23)
	GUICtrlSetFont(-1, 12, 800, 0, "Arial")
	Global $MiniPPlayerLabel2 = GUICtrlCreateLabel("", 3, 26, 235, 17)
	Global $MiniPPlayerIcon1 = GUICtrlCreateIcon($PP_IcoFolder, 6, 316, 6, 32, 32, BitOR($SS_NOTIFY, $WS_GROUP))
	;If WMGetState() = "Paused"  Then GUICtrlSetImage($MiniPPlayerIcon1, $PP_IcoFolder, 6) (This event is called then PPlayer starts... WMGetState will be Stopped or nothing)
	GUICtrlSetOnEvent(-1, "MiniPPlayerIconClicked")
	GUISetState(@SW_SHOW)
	WinSetTrans("PPlayer Mini Mode", "", 225)
EndFunc   ;==>MiniPPlayer_CreateCustomGUI

Func MiniPPlayer_SongInformationLoaded($id, $songinfo)
	GUICtrlSetData($MiniPPlayerLabel1, $songinfo[3])
	GUICtrlSetData($MiniPPlayerLabel2, $songinfo[1])
EndFunc   ;==>MiniPPlayer_SongInformationLoaded

Func MiniPPlayerIconClicked()
	If WMGetState() == "Paused"  Then
		GUICtrlSetImage($MiniPPlayerIcon1, $PP_IcoFolder, 7)
	Else
		GUICtrlSetImage($MiniPPlayerIcon1, $PP_IcoFolder, 6)
	EndIf
	Pause()
EndFunc   ;==>MiniPPlayerIconClicked

Func MiniPPlayer_SongPlayPaused()
	GUICtrlSetImage($MiniPPlayerIcon1, $PP_IcoFolder, 7)
EndFunc   ;==>MiniPPlayer_SongPlayPaused

Func MiniPPlayer_SongPlayResumed()
	GUICtrlSetImage($MiniPPlayerIcon1, $PP_IcoFolder, 6)
EndFunc   ;==>MiniPPlayer_SongPlayResumed