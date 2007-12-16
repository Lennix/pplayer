#include <String.au3>
$ActiveFunc = "Error"
$msg = ""
$msg2 = ""
$FH = FileOpen("..\pplayer.au3",0)
$line = 0
While 1
	$Input = FileReadLine($FH)
	$line +=1
	If @error Then ExitLoop
	If StringLeft($Input,4) == "Func" Then
		$Input = _StringBetween($Input,"Func ",")")
		If Not @Error Then 
			$ActiveFunc = $Input[0] & ")"
			If StringInstr($ActiveFunc,"Plugin") Then
				debug($ActiveFunc & "@ Line " & $line)
				$msg2 &= StringLeft($ActiveFunc,StringInStr($ActiveFunc,"(")-1)
				$Params = _StringBetween($ActiveFunc,"(",")")
				$Params = StringSplit($Params[0],",")
				For $i = 1 To $Params[0]
					$msg2 &= "|" & $Params[$i]
				Next
				$msg2 &= "||"
			EndIf
		EndIf
	ElseIf StringInStr($Input,"PluginTriggerWithNr") Then
		$Input = _StringBetween($Input,'PluginTriggerWithNr(',')')
		If Not @Error Then
			$Info = StringSplit($Input[0],",")
			$msg &= $ActiveFunc & "|" & $info[1]
			For $i = 3 To $info[0]
				$msg &= "|" & $info[$i]
			Next
			$msg &= "||"
		EndIf
	ElseIf StringInStr($Input,"PluginTrigger") Then
		$Input = _StringBetween($Input,'PluginTrigger(',')')
		If Not @Error Then
			$Info = StringSplit($Input[0],",")
			$msg &= $ActiveFunc & "|" & $info[1]
			For $i = 2 To $info[0]
				$msg &= "|" & $info[$i]
			Next
			$msg &= "||"
		EndIf
	EndIf
WEnd
FileClose($FH)
$msg = StringTrimRight(StringReplace($msg,'"',""),2)
$msg2 = StringTrimRight(StringReplace($msg2,'"',""),2)
ConsoleWrite(@CRLF & $msg)
ConsoleWrite(@CRLF & $msg2)
Request("http://pplayer.sourceforge.net/access/events.php?submit=events&text=" & $msg)
Request("http://pplayer.sourceforge.net/access/events.php?submit=funcs&text="& $msg2)

Func Request($URL, $Wait = 5)
	FileDelete(@TempDir & "PPlayerDL.tmp")
	InetGet($URL, @TempDir & "PPlayerDL.tmp", 1, 1)
	$Timer = TimerInit()
	While @InetGetActive
		If $Wait > 0 And TimerDiff($Timer) / 1000 > $Wait Then
			SetError(1)
			Return ""
		EndIf
		Sleep(10)
	WEnd
	If @InetGetBytesRead < 1 Then Return SetError(1, 0, "")
	Return FileRead(@TempDir & "PPlayerDL.tmp")
EndFunc   ;==>Request

Func debug($String)
	ConsoleWrite(@CRLF & ">Debug: " & $String)
	Return $String
EndFunc   ;==>debug