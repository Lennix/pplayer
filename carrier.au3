#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_icon=icos\pplayer.ico
#AutoIt3Wrapper_outfile=pplayer.exe
#AutoIt3Wrapper_Res_Comment=More details at pplayer.net.ms
#AutoIt3Wrapper_Res_Description=PPlayer Beta
#AutoIt3Wrapper_Res_Fileversion=0.9.0.0
#AutoIt3Wrapper_Res_LegalCopyright=Pascal Kuehne
#AutoIt3Wrapper_Res_Field=Email|pascal.kuehne at googlemail dot com
#AutoIt3Wrapper_Res_Field=Compile Date|%date% %time%
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

If $CmdLine[0] > 0 Then
	Run(@AutoItExe & ' /AutoIt3ExecuteScript "' & @ScriptDir & "\" & 'pplayer.au3"' & ' "' & $CmdLine[1] & '"')
Else
	Run(@AutoItExe & ' /AutoIt3ExecuteScript "' & @ScriptDir & "\" & 'pplayer.au3"')
EndIf