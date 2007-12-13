#NoTrayIcon
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_icon=icos\download.ico
#AutoIt3Wrapper_outfile=resource\download.exe
#AutoIt3Wrapper_Res_Comment=More details at pplayer.net.ms
#AutoIt3Wrapper_Res_Description=PPlayer Database
#AutoIt3Wrapper_Res_Fileversion=0.9.0.0
#AutoIt3Wrapper_Res_LegalCopyright=Pascal Productions
#AutoIt3Wrapper_Res_Field=Email|pascal.kuehne at googlemail dot com
#AutoIt3Wrapper_Res_Field=Compile Date|%date% %time%
#AutoIt3Wrapper_Run_AU3Check=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

#cs
    PPlayer is a media player offering many amazing features. It combines Podcasts,Streaming and an intuitive musicsearch in a user designed interface.
    Copyright (C) 2007  Pascal Kühne

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
	
	For a list of contributors please visit:
	http://pplayer.wiki.sourceforge.net/Contributors
#ce

Global $PP_Dir = RegRead("HKEY_CURRENT_USER\Software\PPlayer", "DIR")
	If StringLen($PP_Dir) == 0 Then
		$PP_Dir = RegRead("HKEY_CURRENT_USER\Software\PascalPlayer", "DIR")
		If StringLen($PP_Dir) == 0 Then $PP_Dir = @WorkingDir
		RegWrite("HKEY_CURRENT_USER\Software\PPlayer","DIR","REG_SZ",$PP_Dir)
	EndIf
	If StringRight($PP_Dir,1) == "\" Then
		
	Else
		$PP_Dir &= "\"
	EndIf

If $CmdLine[0] > 0 Then
	If $CmdLine[0] > 2 Then
		If Download($CmdLine[1],$CmdLine[2]) Then 
			TrayTip("PPlayer - Podcast","Download successful" & @CRLF & StringTrimLeft($CmdLine[2], StringInStr($CmdLine[2], "/", 1, -1)) & " is available now",5)
			sleep(5000)
		EndIf
	Else
		Download($CmdLine[1],$CmdLine[2])
	EndIf
	Sleep(1000)
	GUIDelete($Download_GUI)
Else
	MsgBox(0,"PPlayer Downlaoder -- Error","This program is for internal use only!")
EndIf

Func Download($URL, $path)
	Global $Download_GUI = GUICreate("PPlayer Downloader", 500, 150)
	GUISetBkColor("0x" & IniRead("db\settings.ini", "settings", "opt6", "000000"))
	GUISetState(@SW_SHOW)
	$Download_Label = GUICtrlCreateLabel("Loading...",90, 10, 400, 110)
	GUICtrlSetColor(-1, "0x" & IniRead("db\settings.ini", "settings", "opt7", "FFFFFF"))
	GUICtrlCreateLabel("Downloading..." & @CRLF & "URL: " & @CRLF & @CRLF & "Loaded: " & @CRLF & "Time left:" & @CRLF & "Done: ",10,10,80,110)
	GUICtrlSetColor(-1, "0x" & IniRead("db\settings.ini", "settings", "opt7", "FFFFFF"))
	$Download_Progress = GUICtrlCreateProgress(10, 120, 480, 20)
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
EndFunc   ;==>Download

Func SetList($path)
	UDPStartUp()
	$Socket = UDPOpen("127.0.0.1", 1848)
	UDPSend($Socket, $path)
	UDPCloseSocket($Socket)
	UDPShutdown()
EndFunc