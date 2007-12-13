#NoTrayIcon
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_outfile=resource\updater.new.ppe
#AutoIt3Wrapper_Res_Comment=More details at pplayer.net.ms
#AutoIt3Wrapper_Res_Description=PPlayer Beta
#AutoIt3Wrapper_Res_Fileversion=0.9.0.0
#AutoIt3Wrapper_Res_LegalCopyright=Pascal Kuehne
#AutoIt3Wrapper_Res_Field=Email|pascal.kuehne at googlemail dot com
#AutoIt3Wrapper_Res_Field=Compile Date|%date% %time%
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
$UpdaterUpdated = False
$Input = StringSplit(Request("http://pplayeronline.pp.funpic.de/update.php?filelist=go"),"|")
If $Input[0] == 2 Then
	$files = StringSplit($Input[1],";")
	Global $dates = StringSplit($Input[2],";")
	For $i = 1 To $files[0]
		CheckFile($files[$i],$i)
	Next
EndIf

If $CmdLine[0] > 0 Then
	run('pplayer.exe "' & $CmdLine[1] & '"') 
Else
	run("pplayer.exe")
EndIf
If Not $UpdaterUpdated Then IniWrite("db\settings.ini","infos","lastupdate",@HOUR)
Exit

Func CheckFile($file,$nr)
	$filepath = $file
	If Not FileExists($file) Then 
		If FileExists("resource\" & $file) Then 
			$filepath = "resource\" & $file
		Else
			Update($file,"resource\" & $file)
			Return True
		EndIf
	EndIf
	If FileGetTime($filepath,0,1) < $dates[$nr] Then Update($file,$filepath)
EndFunc

Func Update($file,$filepath)
	If $file == "updater.new.ppe" Then $UpdaterUpdated = True
	ProgressOn("PPlayer Updater","Updating...","Updating " & $file & "...")
	InetGet("http://pplayeronline.pp.funpic.de/downloads/" & $file,$filepath,1,1)
	$Size = InetGetSize("http://pplayeronline.pp.funpic.de/downloads/" & $file)
	While @InetGetActive
		sleep(10)
		ProgressSet(@InetGetBytesRead/$Size*100)
	WEnd
	ProgressOff()
EndFunc

Func Request($URL, $Wait = 5)
	InetGet($URL,@TempDir & "PPlayerDL.tmp",1,1)
	$size = InetGetSize($URL)
	$Timer = TimerInit()
	While @InetGetActive
		If $Wait > 0 And TimerDiff($Timer) / 1000 > $Wait Then
			SetError(1)
			Return ""
		EndIf
	WEnd
	return FileRead(@TempDir & "PPlayerDL.tmp")
EndFunc   ;==>Request