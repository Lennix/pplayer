#cs
# PPlayer
# by pascal257 aka. Pascal Kühne (pascal dot kuehne at gmail dot com)
# This code is under GPL - You can take parts for free but have to give credit!
#ce

#include <SQLite.au3>
#include <SQLite.dll.au3>
#include <GUIConstants.au3>

Global $aResult,$iRows,$iColumns
_SQLite_Startup()

$DbFilename="..\db\PPlayer.db"
   
If _SQLite_Open($DbFilename)=0 Then;cancel pressed or file doesn't exist.
    MsgBox(16,"Error","Error opening the database file")
    Exit
EndIf

If _SQLite_GetTable2d(-1,"Select * From SQLITE_MASTER",$aResult,$iRows,$iColumns) <> $SQLite_OK Then;can't query the table - may be encrypted or not a SQLite database.
    MsgBox(16,"Error","This file does not appear to be a vaild SQLite database.")
    Exit
EndIf

Global $TableNames[1]=["0"];an array that just contains the names of the available tables - quickly transformed into $TableNameStr to populate the combo box.
For $i=1 To $iRows
    If $aResult[$i][0] = "Table" Then
        $TableNames[0]+=1
        ReDim $TableNames[$TableNames[0]+1]
        $TableNames[$TableNames[0]]=$aResult[$i][1]
    EndIf
Next

$MainGUI=GUICreate("View a SQLite database",640,480)
GUICtrlCreateLabel("Table names:",5,7,100,20)
Local $TableNameStr=""
For $i=1 To $TableNames[0]
    $TableNameStr&="|"&$TableNames[$i]
Next
$TableSelectCombo=GUICtrlCreateCombo("",110,5,525,20,$CBS_DROPDOWNLIST)
GUICtrlSetData(-1,$TableNameStr)
$TableDisplayList=GUICtrlCreateListView("|",5,30,630,445)
Global $ListViewItems[1]=["0"]

GUISetState()

While 1
    $msg=GUIGetMsg()
    Switch $msg
        Case $TableSelectCombo;new table selected for display
            For $i=1 To $ListViewItems[0]
                GUICtrlDelete($ListViewItems[$i])
            Next
            Global $ListViewItems[1]=["0"]
            If _SQLite_GetTable2d(-1,"Select * From "&GUICtrlRead($TableSelectCombo)&";",$aResult,$iRows,$iColumns) = $SQLite_OK Then
                GUICtrlDelete($TableDisplayList)
				ProgressOn("PPlayer - DBView","Loading " & GUICtrlRead($TableSelectCombo) & " " & $iRows & " entries")
                Local $HeaderStr=$aResult[0][0]
                For $i=1 To $iColumns-1
                    $HeaderStr&="|"&$aResult[0][$i]
                Next
                $TableDisplayList=GUICtrlCreateListView($HeaderStr,5,30,630,445)
                For $i=1 To $iRows
					ProgressSet($i/$iRows*100,$i)
					If GUIGetMsg() == $GUI_EVENT_CLOSE Then Exit 0
					Local $ItemStr=$aResult[$i][0]
                    For $n=1 To $iColumns-1
                        $ItemStr&="|"&$aResult[$i][$n]
                    Next
                    $ListViewItems[0]+=1
                    Redim $ListViewItems[$ListViewItems[0]+1]
                    $ListViewItems[$ListViewItems[0]]=GUICtrlCreateListViewItem($ItemStr,$TableDisplayList)
                Next
				ProgressOff()
            EndIf
        Case $GUI_EVENT_CLOSE
            Exit
    EndSwitch
WEnd