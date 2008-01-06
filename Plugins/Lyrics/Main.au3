#include-once
PluginRegister("Lyrics")

Func Lyrics_OnPluginLoad()
	PluginRegisterMenu("Lyrics","Lyrics")
EndFunc

Func Lyrics_CreateCustomGUI()
	_SQLite_Exec(-1, "CREATE TABLE IF NOT EXISTS Lyrics (Artist,Track,Lyrics);") ; CREATE a Table
	Global $LyricsGUI = XSkinGUICreate("PPlayer - Lyrics", 467+$factorX*2, 372+$factorY*2,$Skin_Folder,1,25,-1,-1,-1,$MainGUI)
	XSkinIcon($LyricsGUI,3,StringSplit("LyricsClose|LyricsClose|LyricsHelp","|"))
	Global $LyricsEdit = GUICtrlCreateEdit("", 0+$factorX, 16+$factorY, 465, 353, BitOR($ES_AUTOVSCROLL,$ES_AUTOHSCROLL,$ES_READONLY,$ES_WANTRETURN,$WS_HSCROLL,$WS_VSCROLL))
	GUICtrlCreateLabel("Artist:", 0+$factorX, 0+$factorY, 30, 17)
	Global $LyricsInput1 = GUICtrlCreateInput("", 32+$factorX, 0+$factorY, 137, 17,$ES_READONLY)
	GUICtrlCreateLabel("Track:", 176+$factorX, 0+$factorY, 35, 17)
	Global $LyricsInput2 = GUICtrlCreateInput("", 216+$factorX, 0+$factorY, 137, 17,$ES_READONLY)
	GLobal $LyricsCheckbox1 = GUICtrlCreateCheckbox("AutoLoad Lyrics", 360+$factorX, 0+$factorY, 97, 17)
	GUICtrlSetOnEvent(-1,"LyricsChange")
EndFunc

Func Lyrics_OnExit()
	GUIDelete($LyricsGUI)
EndFunc

Func Lyrics_OnPluginsRegistered()
	If PluginExists("Updater") Then Updater_Register("http://pplayer.sourceforge.net/access/downloads/Plugins/Lyrics/Main.au3","Plugins\Lyrics\Main.au3")
EndFunc
	
Func Lyrics_SongInformationLoaded($id,$tag)
	GUIctrlSetData($LyricsInput1,$tag[1])
	GUIctrlSetData($LyricsInput2,$tag[3])
	If LoadSetting("lyrics","autoload",$GUI_UNCHECKED) == $GUI_CHECKED Then
		$Lyrics = RequestLyrics($tag[1],$tag[3])
		If @Error Or @extended == 2 Then Return True
		debug("Saving Lyric into Database")
		_SQLite_Exec(-1, 'INSERT INTO Lyrics (Artist,Track,Lyrics) VALUES ("' & $tag[1] & '","' & $tag[3] & '","' & $Lyrics & '");')
	EndIf
EndFunc

Func Lyrics()
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

Func LyricsChange()
	SaveSetting("lyrics","autoload",GUICtrlRead($LyricsCheckbox1))
EndFunc

Func LoadLyrics()
	$Artist = GUICtrlRead($LyricsInput1)
	$Track = GUICtrlRead($LyricsInput2)
	GUICtrlSetData($LyricsEdit,"Loading")
	$Lyrics = RequestLyrics($Artist,$Track)
	If Not @Error Then
		GUICtrlSetData($LyricsEdit,$Lyrics)
	Else
		GUICtrlSetData($LyricsEdit,"No lyrics available")
	EndIf
EndFunc

Func RequestLyrics($Artist,$Track)
	Dim $Query[1]
	_SQLite_Query(-1,'SELECT Lyrics FROM Lyrics WHERE Artist = "' & $Artist & '" AND Track = "' & $Track & '";',$hQuery)
	_SQLite_FetchData($hQuery, $Query)
	_SQLite_QueryFinalize($hQuery)
	If StringLen($Query[0]) > 0 Then Return SetError(0,2,$Query[0])
	Debug("Lyrics not in database")
	; StringUpper(StringLeft($Artist,1)) & StringLower(StringTrimLeft($Artist,1)) & ":" &
	$Input = Request("http://lyricwiki.org/" & $Artist & ":" & $Track)
	If StringInStr($Input,"There is currently no text in this page") Then
		Return SetError(1,0,0)
	Else
		$Lyrics = _StringBetween($Input,'<div id="lyric">','</div>')
		If IsArray($Lyrics) Then 
			Return StringReplace($Lyrics[0],"<br/>",@CRLF)
		Else
			Return SetError(1,0,0)
		EndIf
	EndIf
EndFunc