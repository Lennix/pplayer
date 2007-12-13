#include <GUIConstants.au3>
#include <String.au3>

#cs
# Little Test programm to Scan PPlayer.au3 for language stuff...
# Does not work thaaat good
#ce

Opt("GUIOnEventMode", 1)
#Region ### START Koda GUI section ### Form=
Global $Form1 = GUICreate("Form1", 633, 430, 193, 125)
Global $Edit1 = GUICtrlCreateEdit("", 0, 0, 633, 385)
GUICtrlSetData(-1, "Edit1")
Global $Button1 = GUICtrlCreateButton("Button1", 8, 392, 137, 33, 0)
GUICtrlSetOnEvent(-1,"Scan")
Global $Button2 = GUICtrlCreateButton("Button2", 176, 392, 169, 33, 0)
GUICtrlSetOnEvent(-1,"Save")
Global $Button3 = GUICtrlCreateButton("Button3", 368, 392, 153, 33, 0)
GUICtrlSetOnEvent(-1,"Convert")
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	Sleep(100)
WEnd

Func Scan()
	ConsoleWrite("starting...")
	$Text = StringSplit(GUICtrlRead($Edit1),@CRLF)
	$count = 0
	$msg = ""
	For $i = 1 To $Text[0]
		If StringInStr($Text[$i],"GUI") And StringInStr($Text[$i],'"') Then
			$Get = _StringBetween($Text[$i],'"','"')
			For $i2 = 0 To UBound($Get) - 1
				If MsgBox(4,"Get?",$Get[$i2]) == 6 Then $msg &= $Get[$i2] & @CRLF
			Next
		EndIf
	Next
	GUICtrlSetData($Edit1,$msg)
EndFunc

Func Save()
	$Text = StringSplit(GUICtrlRead($Edit1),@CRLF)
	$count = 0
	For $i = 1 To $Text[0]
		If StringLen($Text[$i]) > 0 Then
			$count += 1
			IniWrite("lang.ini",1,$count,$Text[$i])
		EndIf
	Next
EndFunc

Func Convert()
	$FH = FileOpen("settings.au3",0)
	$FHW = FileOpen("pplayer2.au3",2)
	$count = 1
	$marker = '"' & IniRead("lang.ini",1,$count,"") & '"'
	While 1
		$Input = FileReadLine($FH)
		If @Error Then ExitLoop
		While 1
			If StringInStr($Input,$Marker) Then
				ConsoleWrite(@CRLF & "+> Input: " & $input & " -- Marker: " & $Marker)
				$Input = StringReplace($Input,$Marker,"GetLang(1," & $count & ")")
				$count += 1
				$marker = '"' & IniRead("lang.ini",1,$count,"") & '"'
			ElseIf StringInStr($Input,StringTrimRight($Marker,1) & ' "') Then
				ConsoleWrite(@CRLF & "+> Input: " & $input & " -- Marker: " & StringTrimRight($Marker,1) & ' "')
				$Input = StringReplace($Input,StringTrimRight($Marker,1) & ' "',"GetLang(1," & $count & ")")
				$count += 1
				$marker = '"' & IniRead("lang.ini",1,$count,"") & '"'
			Else
				ConsoleWrite(@CRLF & "!> Input: " & $input & " -- Marker: " & $Marker)
				ExitLoop
			EndIf
		WEnd
		FileWriteLine($FHW,$Input)
	WEnd
	FileClose($FHW)
	FileClose($FH)
EndFunc

#cs
PPlayer - Settings
General
Design
Backgroundcolor
Textcolor
BkColor
Choose
TextColor
Choose
Transparency
Settings_Change
On/Off-Animation
MSN
MSN Status Text
Text
MSN
Info: The parameters are:
%i: Artist -- %t: Track -- %a: Album -- %g: Genre
Language
Language:
PlayMode
General
Time to block a song until its played again (min)
Song-Popup (Notification)
Similar Bands available for search:
SongView
URLs
Direct-URL:
BBCode: (Forum)
HTMLCode: (Blog/Website etc)
Settings
Nickname:
Text:
I am listening to: %i - %a - %t
Info
PPlayer Songview publishes the song you're actually listening to. 
Just copy one of the adresses into your Forumsignature (BBCode) or onto a Blogpost (HTML or BBCode) 
You're friends will then be able to see what you're actually listening to.
You should specify your Username so everbody understands who you are.
Tags: %i = Artist, %t = Track, %a = Album
Skin
Skin
Here you can select a new skin for PPlayer
Select a skin above to get more information about it.
Press apply to save the skin.
Apply
Cancel
Report a Bug
#ce