;Come on baby don't be shy!
;hRhR
#cs ChangeLog
	Well I just started this to submit some bugs:
	1. When PPlayer starts MiniMode automatically opens.. (maybe change this)
	2. When PPlayer starts MiniModes Icon is "Pause"
	3. You should include the event SongPlayStarted / SongPlayStopped for changing the icon
#ce

#include-once
PluginRegister("MiniPPlayer")

Func MiniPPlayer_OnPluginLoad()
	PluginRegisterMenu("MiniPPlayer_Open", "MiniPPlayer") ;This is useless (it registers a menuitem in PPlayer's menu) First param is the function to call on click and second the name of the item
EndFunc   ;==>MiniPPlayer_OnPluginLoad

Func MiniPPlayer_CreateCustomGUI()
	Global $MiniPPlayerGui = GUICreate("PPlayer Mini Mode", 368, 46, -1, -1, -1, BitOR($WS_EX_TOOLWINDOW, $WS_EX_TOPMOST, $WS_EX_WINDOWEDGE))
	GUISetBkColor(0xA6CAF0)
	GUISetOnEvent($GUI_EVENT_CLOSE,"MiniPPlayer_Close")
	Global $MiniPPlayerLabel1 = GUICtrlCreateLabel("", 3, 5, 252, 23)
	GUICtrlSetFont(-1, 12, 800, 0, "Arial")
	Global $MiniPPlayerLabel2 = GUICtrlCreateLabel("", 3, 26, 235, 17)
	Global $MiniPPlayerIcon1 = GUICtrlCreateIcon($PP_IcoFolder, 6, 288, 0, 48, 48, BitOR($SS_NOTIFY, $WS_GROUP)) ;Play/Pause
	GUICtrlSetOnEvent(-1, "MiniPPlayerIconClicked")
	Global $MiniPPlayerIcon2 = GUICtrlCreateIcon($PP_IcoFolder, 8, 256, 8, 32, 32, BitOR($SS_NOTIFY, $WS_GROUP)) ;Prev
	GUICtrlSetOnEvent(-1,"PrevInList") ; Internal function of PPlayer
	Global $MiniPPlayerIcon3 = GUICtrlCreateIcon($PP_IcoFolder, 5, 336, 8, 32, 32, BitOR($SS_NOTIFY, $WS_GROUP)) ;Next
	GUICtrlSetOnEvent(-1,"NextInList") ; Internal function of PPlayer	
	WinSetTrans("PPlayer Mini Mode", "", 225)
EndFunc   ;==>MiniPPlayer_CreateCustomGUI

Func MiniPPlayer_Close()
	GUISetState(@SW_HIDE,$MiniPPlayerGui)
EndFunc

Func MiniPPlayer_Open()
	GUISetState(@SW_SHOW,$MiniPPlayerGui)
EndFunc

Func MiniPPlayer_SongInformationLoaded($id, $songinfo)
	GUISetState(@SW_SHOW, $MiniPPlayerGui)
	GUICtrlSetData($MiniPPlayerLabel1, $songinfo[3])
	GUICtrlSetData($MiniPPlayerLabel2, $songinfo[1])
EndFunc   ;==>MiniPPlayer_SongInformationLoaded

Func MiniPPlayer_OnPluginsRegistered()
	If PluginExists("Updater") Then Updater_Register("http://pplayer.sourceforge.net/access/downloads/Plugins/MiniPPlayer/Main.au3","Plugins\MiniPPlayer\Main.au3")
EndFunc

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

Func MiniPPlayer_SongPlayStopped()
	GUICtrlSetData($MiniPPlayerLabel1, "")
	GUICtrlSetData($MiniPPlayerLabel2, "")
EndFunc

Func MiniPPlayer_OnExit()
	GUIDelete($MiniPPlayerGui)
EndFunc