#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_icon=icos\database.ico
#AutoIt3Wrapper_outfile=resource\database.exe
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

#include <GUIConstants.au3>
#include <include\XSkin.au3>
#include <SQLite.au3>
#include <SQLite.dll.au3>

Opt("TrayAutoPause",0)
Opt("TrayOnEventMode",1)
Opt("TrayMenuMode",1)

Global $hQuery, $aRow, $sMsg, $Create = False,$hidden = False,$Update = False,$Working = False,$Get = False,$Error = False

Global $PP_Dir = @ScriptDir & "\..\"
If Not @Compiled Then $PP_Dir = @ScriptDir & "\"
FileChangeDir($PP_Dir)

debug($PP_Dir)

Global $dbversion = "0.9"

$Skin_Folder = $PP_Dir & "Skins\" & IniRead("db\settings.ini","settings","skin","Carbon")
$Icon_Folder = $PP_DIR & "Skins\Default"

Global $oMyError = ObjEvent("AutoIt.Error", "MyErrFunc")
Database()

DirCreate("db")

_SQLite_Startup ()
_SQLite_Open ("db\PPlayer.db")
If FileGetSize("db\PPlayer.db") == 0 Then 
	_SQLite_Exec (-1, "CREATE TABLE IF NOT EXISTS Songs (Artist,Album,Track,Genre,Filetype,Path,LastPlayed,Rating);") ; CREATE a Table
	_SQLite_Exec(-1, "CREATE TABLE IF NOT EXISTS SongView (Played,Artist,Album,Track,Genre,Duration);") ; CREATE a Table
	$Create = True
EndIf

If $CmdLine[0] > 0 Then
	If IniRead("db\settings.ini","infos","dbversion",0) > 0 Then
		XSkinTrayBox("PPlayer - Database","Your database will get updated now. This may take a few minutes")
	Else
		XSkinTrayBox("PPlayer - Database","Your Database will be created now. This may take a few minutes")
	EndIf
	If DriveStatus("C:\") = "READY" Then
		GUICtrlSetData($Database_Dir,"C:")
		DatabaseWork()
	EndIf
	If DriveStatus("D:\") = "READY" Then 
		GUICtrlSetData($Database_Dir,"D:")
		DatabaseWork()
	EndIf
	If DriveStatus("E:\") = "READY" Then 
		GUICtrlSetData($Database_Dir,"E:")
		DatabaseWork()
	EndIf
	XSkinTrayBox("PPlayer - Database","Database successfully created")
	Exit 0
EndIf

While 1
	Switch GUIGetMsg()
		Case $Database_Icon[1]
			GUIDelete($Database_GUI)
			_SQLite_Close()
			_SQLite_Shutdown()
			Exit 0
		Case $Database_Icon[2]
			Hide()
		Case $Database_Icon[3]
			ShellExecute("http://pplayer.wiki.sourceforge.net/Database")
		Case $Button1
			DatabaseWork()
		Case $Button2
			_SQLite_Exec(-1,"DROP TABLE Songs")
			_SQLite_Exec (-1, "CREATE TABLE IF NOT EXISTS Songs (Artist,Album,Track,Genre,Filetype,Path,LastPlayed,Rating);") ; CREATE a Table
			$Create = True
			Info("Your database has been cleared! Click search to readd songs")
		Case $Button3
			_SQLite_Exec(-1,"DROP TABLE SongView")
			_SQLite_Exec(-1, "CREATE TABLE IF NOT EXISTS SongView (Played,Artist,Album,Track,Genre,Duration);") ; CREATE a Table
			Info("Your statistic has been cleared!")
		Case $Database_Choose
			GUICtrlSetData($Database_Dir,FileSelectFolder("Choose a folder that contains music","",3,IniRead("db\settings.ini","infos","lastdir","")))
	EndSwitch
	Mouseover(1)
WEnd

;Choose a folder that contains music and press search. PPlayer will add the found songs to the database. 
Func Database()
	TraySetOnEvent(-13,"Show")
	TraySetState(2)
	Global $factorY = _GetExtProperty($Skin_Folder & "\1.bmp",28)
	$factorY = StringLeft($factorY,StringInStr($factorY," ")-1)
	If $factorY < IniRead($Skin_Folder & "\Skin.dat","settings","size",20) Then $factorY = IniRead($Skin_Folder & "\Skin.dat","settings","size",20)
	Global $factorX = _GetExtProperty($Skin_Folder & "\3.bmp",27)
	$factorX = StringLeft($factorX,StringInStr($factorX," ")-1)
	If $factorX < IniRead($Skin_Folder & "\Skin.dat","settings","size",20) Then $factorX = IniRead($Skin_Folder & "\Skin.dat","settings","size",20)
	Global $Database_GUI = XSkinGUICreate("PPlayer - Database", 474 + $factorX*2, 337 + $factorY,$Skin_Folder)
	Global $Database_Icon = XSkinIcon($Database_GUI,3)
	Global $Database_Info = GUICtrlCreateLabel("", 0+ $factorX, 40, 468, 84)
	GUICtrlSetData(-1,"Choose a folder that contains music and press search. PPlayer will add the found songs to the database.")
	Global $Database_Dir = GUICtrlCreateInput(IniRead("db\settings.ini","infos","lastdir",""), 0+ $factorX, 128, 385, 21)
	Global $Database_Choose = GUICtrlCreateButton("Choose", 392+ $factorX, 128, 81, 25, 0)
	Global $Button1 = GUICtrlCreateButton("Search", 168+ $factorX, 288, 137, 41, 0)
	Global $Button2 = GUICtrlCreateButton("Clear Database", 8+ $factorX, 304, 105, 25, 0)
	Global $Button3 = GUICtrlCreateButton("Clear Statistic", 360+ $factorX, 304, 105, 25, 0)
	Global $Database_Progress = GUICtrlCreateProgress(0+ $factorX, 256, 473, 25, $PBS_SMOOTH)
	Global $Label1 = GUICtrlCreateLabel("", 0+ $factorX, 160, 100, 89)
	Global $Label2 = GUICtrlCreateLabel("", 104+ $factorX, 160, 268, 89)
	Global $OSVersion = @OSVersion
	GUISetState(@SW_SHOW)
EndFunc

Func Hide()
	$hidden = True
	GUISetState(@SW_HIDE,$Database_GUI)
	TraySetState()
EndFunc

Func Show()
	TraySetState(2)
	$hidden = False
	GUISetState(@SW_SHOW,$Database_GUI)
	GUISetState(@SW_RESTORE,$Database_GUI)
EndFunc

Func DatabaseWork()
	Global $Begin = TimerInit()
	$dir = GUICtrlRead($Database_Dir)
	If Not FileExists($dir) Then
		GUICtrlSetData($Label1,"Invalid directory")
		Return False
	EndIf
	If StringRight($dir,1) == "\" Then $Dir = StringTrimRight($Dir,1)
	IniWrite("db\settings.ini","infos","lastdir",$dir)
	GUICtrlSetData($Label1,"Scanning..." & @CRLF & "This may take some time")
	$Files = _FileSearch($dir,"*.mp3;*.wma;*.ogg",0,'',True)
	GUICtrlSetData($label1,"Adding files..." & @CRLF & "Time left: " & @CRLF & "Estimated time: " & @CRLF & "Time gone: " & @CRLF & @CRLF & "Percent:")
	Global $TotalTime = TimerInit()
	Global $FilesFound = $Files[0]
	Global $Suc = 0
	For $i = 1 To $Files[0]
		If Not IsFloat($i/20) Then 
			DatabaseProgressSet($i)
		ElseIf GUIGetMsg() == $Database_Icon[1] Then
			GUIDelete($Database_GUI)
			_SQLite_Close()
			_SQLite_Shutdown()
			Exit 0
		EndIf
		AddFile($Files[$i])
	Next
	IniWrite("db\settings.ini","infos","dbversion",$dbversion)
	FileDelete("db\similar.ini")
	GUICtrlSetData($Database_Progress,100)
	GUICtrlSetData($Label2,"")
	GUICtrlSetData($Label1,"Done" & @CRLF & "Successfully added " & $Suc & "/" & $Files[0] & " Files" & @CRLF & "in " & CalcTime(Round(TimerDiff($Begin)/1000)) & ".")
EndFunc

Func DatabaseProgressSet($nr)
	$percent = Round($Nr / $FilesFound * 100)
	$Time = TimerDiff($TotalTime) /1000
	$Est = Round(($Time / $nr * $FilesFound))
	$Gone = Round(TimerDiff($Begin)/1000)
	GUICtrlSetData($Label2,@CRLF & CalcTime($Est-Round($Time)) & @CRLF & CalcTime($Est) & @CRLF & CalcTime($Gone) & @CRLF & @CRLF & $percent & "%")
	GUICtrlSetData($Database_Progress,$percent)
EndFunc

Func CalcTime($time)
	$min = Int($time / 60)
	$sec = Int($time) - $min*60
	$time = ""
	If $min > 1 Then
		$time &= $min & " minutes"
	ElseIf $min == 1 Then
		$time &= "1 minute"
	EndIf
	If $min > 0 And $sec > 0 Then $time &= " and "
	If $sec > 1 Then
		$time &= $sec & " seconds"
	ElseIf $sec == 1 Then
		$time &= "1 second"
	EndIf
	return $time
EndFunc

Func _GetInterpret($path)
	If $OSVersion == "WIN_VISTA" Then
		return _GetExtProperty($path,13)
	Else
		return _GetExtProperty($path,16)
	EndIf
EndFunc

Func _GetExtProperty($sPath, $iProp)
	Local $sFile, $sDir, $oShellApp, $oDir, $oFile, $aProperty, $sProperty
	$sFile = StringTrimLeft($sPath, StringInStr($sPath, "\", 0, -1))
	$sDir = StringTrimRight($sPath, (StringLen($sPath) - StringInStr($sPath, "\", 0, -1)))
	$oShellApp = ObjCreate ("shell.application")
	$oDir = $oShellApp.NameSpace($sDir)
	$oFile = $oDir.Parsename($sFile)
	$sProperty = $oDir.GetDetailsOf ($oFile, $iProp)
	If $sProperty = "" Then
		Return "Unknown"
	Else
		Return $sProperty
	EndIf
EndFunc

Func AddFile($file)
	If Not (_GetInterpret($file) == "Unknown") Then
		If Not $Create Then
			Dim $Query[1]
			_SQlite_Query (-1, 'SELECT Artist FROM Songs WHERE Path = "' & $file & '";', $hQuery)
			_SQLite_FetchData ($hQuery, $Query)
			_SQLite_QueryFinalize($hQuery)
			If StringLen($Query[0]) > 0 Then Return False
		EndIf
		$message = ""
		$tag = ReadFileInfo($file)
		ReDim $tag[9]
		$tag[6] = $file
		$tag[7] = 0
		$tag[8] = 10
		For $i = 1 To 8
			$message &= '"' & StringReplace($tag[$i],'"',"'") & '",'
		Next
		$message = StringTrimRight($message,1)
		_SQLite_Exec (-1, "INSERT INTO Songs (Artist,Album,Track,Genre,Filetype,Path,LastPlayed,Rating) VALUES (" & $message & ");") ; INSERT Data
		$Suc += 1
	EndIf
EndFunc

Func ReadFileInfo($file)
	Local $tag[8]
	If $OSVersion == "WIN_XP" Then
		$tag[1] = _GetExtProperty($file, 16)
		$tag[2] = _GetExtProperty($file, 17)
		$tag[3] = _GetExtProperty($file, 10)
		$tag[4] = _GetExtProperty($file, 20)
	ElseIf $OSVersion == "WIN_VISTA" Then
		$tag[1] = _GetExtProperty($file, 13)
		$tag[2] = _GetExtProperty($file, 14)
		$tag[3] = _GetExtProperty($file, 21)
		$tag[4] = _GetExtProperty($file, 16)
	EndIf
	$tag[5] = _GetExtProperty($file, 2)
	Return $tag
EndFunc

Func MyErrFunc()
	;ErrorLog("An Objecterror occurred")
	$Error = True
EndFunc   ;==>MyErrFunc

Func ErrorLog($String)
	$Ran = Random(10,100,1)
	While IniRead("db\DBError.log",@MDAY & "." & @MON,@HOUR & ":" & @MIN & ":" & @SEC & ":" & $Ran,"") <> ""
		$Ran = Random(10,100,1)
	WEnd
	IniWrite("db\DBError.log",@MDAY & "." & @MON,@HOUR & ":" & @MIN & ":" & @SEC & ":" & $Ran,$String)
EndFunc

Func _FileSearch($sPath, $sFilter = '*.*', $iFlag = 0, $sExclude = '', $iRecurse = False)
    ;Verify folder exists
    If Not FileExists($sPath) Then Return SetError(1, 1, '')
   
    ;Set file filter to default
    If $sFilter = -1 Or $sFilter = Default Then $sFilter = '*.*'

    ;Set folder/file flag to default
    If $iFlag = -1 Or $iFlag = Default Then $iFlag = 0

    ;Set exclude filter to default
    If $sExclude = -1 Or $sExclude = Default Then $sExclude = ''

    ;Declare characters not allowed in file filter or exclude filter
    Local $aBadChar[6] = ['\', '/', ':', '>', '<', '|']

    ;Check file filter and exclude filter for bad characters
    For $iCC = 0 To 5
        If StringInStr($sFilter, $aBadChar[$iCC]) Or StringInStr($sExclude, $aBadChar[$iCC]) Then Return SetError(2, 2, '')
    Next

    ;Verify file filter isn't just empty space
    If StringStripWS($sFilter, 8) = '' Then Return SetError(2, 2, '')

    ;Verify file flag is 0(Files and folders),1(Files), or 2(Folders)
    If Not ($iFlag = 0 Or $iFlag = 1 Or $iFlag = 2) Then Return SetError(3, 3, '')

    ;Append semi-colon to file filter (multiple filters allowed)
    If Not StringInStr($sFilter, ';') Then $sFilter &= ';'

    ;Split file filter string into array with whitespace removed (Filters with spaces will not work!)
    Local $aSplit = StringSplit(StringStripWS($sFilter, 8), ';'), $sRead
    ;Loop through file filters
    For $iCC = 1 To $aSplit[0]
        ;Skip empty filters
        If StringStripWS($aSplit[$iCC], 8) = '' Then ContinueLoop

        ;Check if leftmost character is a period and ????
        If StringLeft($aSplit[$iCC], 1) = '.' And UBound(StringSplit($aSplit[$iCC], '.')) - 2 = 1 Then
            ;Set current file filter to wildcards
            $aSplit[$iCC] = '*' & $aSplit[$iCC]
        EndIf

        Local $iPid

        ;Recursive search if $iRecurse is set true
        If Not $iRecurse Then
            $iPid = Run(@ComSpec & ' /c ' & 'dir "' & $sPath & '\' & $aSplit[$iCC] & '" /b /o-e /od', '', @SW_HIDE, 6)
        Else
            $iPid = Run(@Comspec & ' /c dir /b /s /a "' & $sPath & '\' & $aSplit[$iCC] & '"', '', @SW_HIDE, 6)
        EndIf

        ;Capture output from dir command
        While 1
            $sRead &= StdoutRead($iPid)
            If @error Then ExitLoop
        WEnd
    Next

    ;Verify dir result isn't whitespace
    If StringStripWS($sRead, 8) = '' Then Return SetError(4, 4, '')

    ;Split search results by line
    Local $aFSplit = StringSplit(StringTrimRight(StringStripCR($sRead), 1), @LF)
    Local $sHold

    ;Loop through results array
    For $iCC = 1 To $aFSplit[0]
        ;If exclusion filter is greater than zero
        If $sExclude And StringLeft(StringTrimLeft($aFSplit[$iCC], StringInStr($aFSplit[$iCC], '\', 0, -1)), StringLen(StringReplace($sExclude, '*', ''))) = StringReplace($sExclude, '*', '') Then
            ContinueLoop
        EndIf

        ;Check result against file/folder flag
        Switch $iFlag
            Case 0 ;Files and folders
                $sHold &= $aFSplit[$iCC] & Chr(1)

            Case 1 ;Files ONLY
                If StringInStr(FileGetAttrib($aFSplit[$iCC]), 'd') Then ContinueLoop
                $sHold &= $aFSplit[$iCC] & Chr(1)

                ;Add item to listview, show size in mb
                GUICtrlCreateListViewItem ( $aFSplit[$iCC] & "|" & StringFormat("%.2f mb", FileGetSize($aFSplit[$iCC]) / 1048576), $ListView)

            Case 2 ;Folders ONLY
                If Not StringInStr(FileGetAttrib($aFSplit[$iCC]), 'd') Then ContinueLoop
                $sHold &= $aFSplit[$iCC] & Chr(1)
        EndSwitch
    Next

    ;If # of characters in result is greater than 1, split by Start of Header special character and return
    If StringTrimRight($sHold, 1) Then
        Return StringSplit(StringTrimRight($sHold, 1), Chr(1))
    EndIf

   
    Return SetError(4, 4, '')
   
EndFunc

Func Info($Text, $Extra = 0)
	Return MsgBox(64 + $Extra, "PPlayer -- Info", $Text)
EndFunc   ;==>Info

Func debug($String)
	ConsoleWrite(@CRLF & ">Debug: " & $String)
	Return $String
EndFunc   ;==>debug