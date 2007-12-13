#include-once
PluginRegister("Lyrics")

Func Lyrics_OnPluginLoad()
	PluginRegisterMenu("Lyrics","Lyrics")
EndFunc

Func Lyrics_CreateCustomGUI()
	Global $factor = (IniRead($Skin_Folder & "\Skin.dat","settings","size",20)-0)/2
	Global $LyricsGUI = XSkinGUICreate("PPlayer - Lyrics", 633+$factorX*2, 465+$factorY*2,$Skin_Folder,1,25,-1,-1,-1,$MainGUI)
	XSkinIcon($LyricsGUI,3,StringSplit("LyricsClose|LyricsClose|LyricsHelp","|"))
	Global $LyricsEdit = GUICtrlCreateEdit("", 0+$factorX, 50+$factorY, 633, 415, BitOR($ES_AUTOVSCROLL,$ES_AUTOHSCROLL,$ES_READONLY,$ES_WANTRETURN,$WS_HSCROLL,$WS_VSCROLL))
	GUICtrlCreateLabel("Artist:", 8+$factorX, 18+$factorY, 62, 17)
	Global $LyricsInput1 = GUICtrlCreateInput("", 72+$factorX, 18+$factorY, 177, 21)
	GUICtrlCreateLabel("Track:", 256+$factorX, 18+$factorY, 48, 17)
	Global $LyricsInput2 = GUICtrlCreateInput("", 304+$factorX, 18+$factorY, 257, 21)
	GUICtrlCreateButton("Load", 568+$factorX, 18+$factorY, 65, 25, 0)
	GUICtrlSetOnEvent(-1,"LoadLyrics")
EndFunc

Func Lyrics_OnExit()
	GUIDelete($LyricsGUI)
EndFunc

Func Lyrics_OnPluginsRegistered()
	If PluginExists("Updater") Then Updater_Register("http://pplayer.sourceforge.net/access/downloads/Plugins/Lyrics/Main.au3","Plugins\Lyrics\Main.au3")
EndFunc

Func Lyrics()
	EnterLyrics()
	GUISetState(@SW_SHOW,$LyricsGUI)
	GUISetState(@SW_RESTORE,$LyricsGUI)
	LoadLyrics()
EndFunc

Func LyricsClose()
	GUISetState(@SW_HIDE,$LyricsGUI)
EndFunc

Func LyricsHelp()
	ShellExecute("http://pplayer.wiki.sourceforge.net/Lyrics")
EndFunc

Func EnterLyrics()
	GUIctrlSetData($LyricsInput1,$ActiveSongInfo[1])
	GUIctrlSetData($LyricsInput2,$ActiveSongInfo[3])
EndFunc

Func LoadLyrics()
	$Artist = GUICtrlRead($LyricsInput1)
	$Track = GUICtrlRead($LyricsInput2)
	GUICtrlSetData($LyricsEdit,"Loading")
	; StringUpper(StringLeft($Artist,1)) & StringLower(StringTrimLeft($Artist,1)) & ":" &
	$Input = Request("http://lyricwiki.org/" & $Artist & ":" & $Track)
	If StringInStr($Input,"There is currently no text in this page") Then
		GUICtrlSetData($LyricsEdit,"No lyrics available")
	Else
		$Lyrics = _StringBetween($Input,'<div id="lyric">','</div>')
		If IsArray($Lyrics) Then 
			GUICtrlSetData($LyricsEdit,StringReplace($Lyrics[0],"<br/>",@CRLF))
		Else
			GUICtrlSetData($LyricsEdit,"No lyrics available")
		EndIf
	EndIf
EndFunc