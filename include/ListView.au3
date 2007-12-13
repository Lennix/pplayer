 ;_GUICtrlListView.au3 _126  
#include-once
#cs Old includes
	#include <GuiConstants.au3>
	#include <GuiListView.au3>
	#include <misc.au3>
	#include <file.au3>
	#include <Process.au3>
	#Include <GuiTab.au3>
	#include <Constants.au3>
	#include <Date.au3>
#ce
	#include "default\GuiConstants.au3"
	#include "default\GuiListView.au3"
	#include "default\misc.au3"
	#include "default\file.au3"
	#include "default\Process.au3"
	#Include "default\GuiTab.au3"
	#include "default\Constants.au3"
	#include "default\Date.au3"
;~ #include "Array2D.au3" ; originally only needed for Win9x, to avoid QuickSort.vbs call inside Sort func
#region
;rem change; _GUICtrlSetImage,_GUIListViewClose(),_GUICtrlCreateListView,__GUICtrlListViewSort   ;(and ,_GUICtrlCreateListViewItem - may already be changed by "replace")
Global $ar_LISTVIEWs[1], $ar_LISTVIEW[4001], $ar_LISTVIEWArray[4001], $s_LISTVIEWSortOrder = "DESC", $i_LISTVIEWNumItemsView, $i_LISTVIEWPrevcolumn = -1
Global $B_DESCENDING[1], $GUICtrlSetImage = 0, $i_DefaultIconNumber = 4000, $s_ExtTempPrev, $s_ExtDefault, $i_OrderColumn;,$nIcon,$szIconFile
Global $Liste, $s_AnswerFileFind = @ScriptDir & "\FindFiles.txt", $i_GUISetCheckBoxes, $i_LVColIndex, $iLV_IndexColumn, $LV_Listview
#cs
Global Const $WM_NOTIFY = 0x004E;,$hide_state = 0
Global Const $NM_FIRST = 0
Global Const $NM_LAST = (-99)
Global Const $NM_OUTOFMEMORY = ($NM_FIRST - 1)
Global Const $NM_CLICK = ($NM_FIRST - 2)
Global Const $NM_DBLCLK = ($NM_FIRST - 3)
#ce
#endregion
Func _GUISetCheckBoxesPresent($i_Set=1)
	$i_GUISetCheckBoxes = $i_Set
	Return $i_GUISetCheckBoxes
EndFunc   ;==>_GUISetCheckBoxesPresent
Func _GUICtrlCreateListView($s_Header, $i_left = 50, $i_top = 50, $i_width = 50, $i_height = 50, $i_style = -1, $i_exStyle = -1);, $i_style=$LVS_SHOWSELALWAYS, $LVS_SINGLESEL , $i_exStyle=0)
	local $i_NumCols
	If $i_style = -1 Then $i_style = $LVS_SHOWSELALWAYS
	StringReplace($s_Header, "|", "<")
	$i_NumCols = @extended
	If $i_NumCols > 251 Then
		$i_Pos = StringInStr($s_Header, "|", 0, 251)
		$s_Header = StringLeft($s_Header, $i_Pos - 1)
	EndIf
	If $i_GUISetCheckBoxes Then $s_Header &= "|ChBx"
	$ar_LISTVIEWArray[0] = $s_Header; must declare header this way
	$s_Header = $ar_LISTVIEWArray[0]
	$LV_Listview = GUICtrlCreateListView($s_Header, $i_left, $i_top, $i_width, $i_height, $i_style, $i_exStyle)
	$GUICtrlSetImage = 0
	ReDim $ar_LISTVIEWs[UBound($ar_LISTVIEWs) + 1]
	$ar_LISTVIEWs[UBound($ar_LISTVIEWs) - 1] = $LV_Listview
	Return $LV_Listview
EndFunc   ;==>_GUICtrlCreateListView
Func _GUICtrlCreateListViewIndexed($s_Header, $i_left = 50, $i_top = 50, $i_width = 50, $i_height = 50, $i_style = -1, $i_exStyle = -1, $i_LVColIndex = 0);, $i_style=$LVS_SHOWSELALWAYS, $LVS_SINGLESEL , $i_exStyle=0)
	StringReplace($s_Header, "|", "<")
	$i_NumCols = @extended
	If $i_NumCols > 251 Then
		$i_Pos = StringInStr($s_Header, "|", 0, 251)
		$s_Header = StringLeft($s_Header, $i_Pos - 1)
	EndIf
	If $i_style = -1 Then $i_style = $LVS_SHOWSELALWAYS
	$i_LVColIndex = 1
	$ar_LISTVIEWArray[0] = $s_Header & "|Index  "; must declare header this way
	If $i_GUISetCheckBoxes Then $ar_LISTVIEWArray[0] &= "|ChBx"
	$s_Header = $ar_LISTVIEWArray[0]
	$LV_Listview = GUICtrlCreateListView($s_Header, $i_left, $i_top, $i_width, $i_height, $i_style, $i_exStyle)
	$iLV_IndexColumn = _GUICtrlListView_GetColumnCount($LV_Listview) - 1
	If $i_GUISetCheckBoxes Then $iLV_IndexColumn -= 1
	$GUICtrlSetImage = 0
	ReDim $ar_LISTVIEWs[UBound($ar_LISTVIEWs) + 1]
	$ar_LISTVIEWs[UBound($ar_LISTVIEWs) - 1] = $LV_Listview
	Return $LV_Listview
EndFunc   ;==>_GUICtrlCreateListViewIndexed
Func __GUICtrlListView_InsertColumn($listviewF, $i_col, $s_text = "Index", $i_justification = 0, $i_width = 25);, $i_style=$LVS_SHOWSELALWAYS, $LVS_SINGLESEL , $i_exStyle=0)
	$ar_LISTVIEWArray[0] &= "|" & $s_text; must declare header this way
	Return _GUICtrlListView_InsertColumn($listviewF, $i_col, $s_text, $i_justification, $i_width)
EndFunc   ;==>__GUICtrlListViewInsertColumn
Func _GUICtrlCreateListViewItem($s_Trim, $listviewfunc, $dossierfunc = "c:", $i_Brief = 0, $i_LVColIndex = 0)
	local $i_NumCols
	StringReplace($s_Trim, "|", "<"); doesn't replace; ony to count number of cols
	$i_NumCols = @extended
	If $i_NumCols > 251 Then
		$i_Pos = StringInStr($s_Trim, "|", 0, 251)
		$s_Trim = StringLeft($s_Trim, $i_Pos - 1)
	EndIf
	$i_LISTVIEWNumItemsView += 1
	If $i_LVColIndex Then $s_Trim &= "|" & $i_LISTVIEWNumItemsView - 1
	If $i_GUISetCheckBoxes=1 Then $s_Trim &= "|0"
	If $i_GUISetCheckBoxes=2 Then $s_Trim &= "|1"
	If $i_Brief Then
		$ar_LISTVIEWArray[$i_LISTVIEWNumItemsView] = $s_Trim
		$ar_LISTVIEW[$i_LISTVIEWNumItemsView] = GUICtrlCreateListViewItem($s_Trim, $listviewfunc)
		Return
	EndIf
	If $i_LISTVIEWNumItemsView >= UBound($ar_LISTVIEWArray) Then
		If $i_LISTVIEWNumItemsView <= 4000 Then ReDim $ar_LISTVIEW[UBound($ar_LISTVIEW) + 1]
		ReDim $ar_LISTVIEWArray[UBound($ar_LISTVIEWArray) + 1]
	EndIf
	$ar_LISTVIEWArray[$i_LISTVIEWNumItemsView] = $s_Trim
	If $i_LISTVIEWNumItemsView <= 4000 Then
		$ar_LISTVIEW[$i_LISTVIEWNumItemsView] = GUICtrlCreateListViewItem($s_Trim, $listviewfunc)
	Else
		_GUICtrlListView_InsertItem($listviewfunc, -1, $s_Trim)
	EndIf
	If $GUICtrlSetImage Then
		Local $szIconFile, $nIcon
		$ar_TMpImage = StringSplit($s_Trim, "|")
		$szIconFile = $dossierfunc & $ar_TMpImage[1]
		$s_ExtTemp = StringRight($ar_TMpImage[1], 4)
		If Not ($s_ExtTemp = $s_ExtDefault) Then
			$nIcon = 0
			If StringInStr(FileGetAttrib($ar_TMpImage[1]), "D") Then
				$nIcon = 3
			Else
				FileGetIcon($szIconFile, $nIcon, $ar_TMpImage[1])
			EndIf
			$s_ExtTempPrev = $s_ExtTemp
			_GUICtrlSetImage(-1, $szIconFile, $nIcon)
		EndIf
	EndIf
EndFunc   ;==>_GUICtrlCreateListViewItem
Func _GUIGetCheckBoxes($listviewfunc)
	Local $s_CheckBoxes
	If Not $i_GUISetCheckBoxes Then Return
	For $i = 0 To _GUICtrlListView_GetItemCount($listviewfunc) - 1
		$i_Checked = _GUICtrlListView_GetItemChecked($listviewfunc, $i)
		$ar_LISTVIEWArray[$i + 1] = StringTrimRight($ar_LISTVIEWArray[$i + 1], 1) & $i_Checked
		$s_CheckBoxes &= $i_Checked
	Next
	;MsgBox(0,"","GET $s_CheckBoxes="&$s_CheckBoxes)
EndFunc   ;==>_GUIGetCheckBoxes
Func _Array2DCreateFromArrayStrings($ar1_Array_Strings, $i_Base = 0)
	$code = 'function Array2DCreate( byref ar1Strings,Base)'
	$code &= @LF & '	dim r,c,intPointer,ar2ArrayStrings()'
	$code &= @LF & '	aRowArray = split(ar1Strings(intPointer),"|")'
	$code &= @LF & '	ReDim preserve ar2ArrayStrings(ubound(aRowArray),ubound(ar1Strings))'
	$code &= @LF & '		For r = 0 To ubound(ar1Strings) '
	$code &= @LF & '		aRowArray = split(ar1Strings(r),"|")'
	$code &= @LF & '			For c = 0 To ubound(aRowArray)'
	$code &= @LF & '						ar2ArrayStrings(c,r) = aRowArray(c)'
	$code &= @LF & '			Next'
	$code &= @LF & '		Next'
	$code &= @LF & '	Array2DCreate=ar2ArrayStrings'
	$code &= @LF & 'End function   '
	$vbs = ObjCreate("ScriptControl")
	$vbs.language = "vbscript"
	$vbs.addcode ($code)
	$ar6_Array = $vbs.run ("Array2DCreate", $ar1_Array_Strings, $i_Base)
	$vbs = ""
	Return $ar6_Array
EndFunc   ;==>_Array2DCreateFromArrayStrings
Func _CreateLVCompare2(ByRef $listviewC, $ar_listviewAF, $i_ColA, $ar_listviewBF, $i_ColB, $i_QuickF)
	_LockAndWait3()
	__GUICtrlListView_DeleteAllItems($listviewC, 1)
	$ar2_ArrayA = _Array2DCreateFromArrayStrings($ar_listviewAF)
	$ar2_ArrayB = _Array2DCreateFromArrayStrings($ar_listviewBF)
	$i_counter = 1
	For $x = 1 To UBound($ar_listviewAF) - 1
		$found = False
		$s_item1 = $ar2_ArrayA[$x][$i_ColA]
		For $y = $i_counter To UBound($ar_listviewBF) - 1
			$s_item2 = $ar2_ArrayB[$y][$i_ColB]
			If StringUpper($s_item1) == StringUpper($s_item2) Then
				$i_counter = $y + 1
				$found = True
				ExitLoop
			ElseIf StringUpper($s_item1) < StringUpper($s_item2) Then
				$i_counter = $y
				ExitLoop
			EndIf
		Next
		If Not $found Then _GUICtrlCreateListViewItem($ar_listviewAF[$x], $listviewC, -1, $i_QuickF, 0); "1" forces correct ListView; else uses last accessed
	Next
	$Coll = 0
	If $i_LVColIndex Then $Coll = $iLV_IndexColumn
	__GUICtrlListView_Sort($listviewC, -1, $Coll + 1) ; "1,1" forces ascending, not current ArrayListView
	_ResetLockWait3()
EndFunc   ;==>_CreateLVCompare2
Func _ListViewGetTextArray($listviewF, $i_Sorted = 0, $i_DeleteLV = 0)
	If $i_Sorted Then __GUICtrlListView_Sort($listviewF, -1, $i_Sorted - 1, 0)
	$ar_listV = $ar_LISTVIEWArray
	If $i_DeleteLV > -1 Then __GUICtrlListView_DeleteAllItems(-1, $i_DeleteLV)
	;if $i_DeleteLV then redim $ar_listV[1]
	Return $ar_listV
EndFunc   ;==>_ListViewGetTextArray
Func _ListViewReDraw(ByRef $listviewF, $ar_listviewF, $i_QuickF)
	_LockAndWait3()
	__GUICtrlListView_DeleteAllItems($listviewF, 1)
	For $x = 1 To UBound($ar_listviewF) - 1
		_GUICtrlCreateListViewItem($ar_listviewF[$x], $listviewF, -1, $i_QuickF)
	Next
	_ResetLockWait3()
EndFunc   ;==>_ListViewReDraw
Func _deleteduplicate(ByRef $LV_Listview, $i_DupesCol)
	$time1 = _NowTime(3)
	Local $s_Binary
	$timerstamp1 = TimerInit()
	__GUICtrlListView_Sort($LV_Listview, $B_DESCENDING, $i_DupesCol, 0);,3)
	$ar_TempF = _ArrayDeleteDupes($ar_LISTVIEWArray, $iLV_IndexColumn)
	$s_Binary = $ar_TempF[UBound($ar_TempF) - 1]
	ReDim $ar_TempF[UBound($ar_TempF) - 1]
	ConsoleWrite("b4refresh :" & Round(TimerDiff($timerstamp1)) & " mseconds " & @LF)
	_LockAndWait3()
	Local $a
	$i_Quick = 0
	If Not UBound($ar_LISTVIEWArray) - 1 < 4000 And Not $GUICtrlSetImage And Not $i_GUISetCheckBoxes Then $i_Quick = 1
	$timerstamp2 = TimerInit()
	$i_Count = UBound($ar_LISTVIEWArray) - 1
	If ($i_Count - UBound($ar_TempF) - 1 < 50 And $i_Count > 2000) Or ($i_Count - UBound($ar_TempF) - 1 < 20 And $i_Count > (4000 - $i_Count - 200)) Then
		;=================================================
		ConsoleWrite(" START delete indiv LV1 items :" & Round(TimerDiff($timerstamp2)) & " mseconds " & @LF)
		ConsoleWrite(" $i_Count-UBound($ar_TempF)-1 < 50 :" & $i_Count - UBound($ar_TempF) - 1 & @LF)
		ConsoleWrite(" UBound($ar_LISTVIEWArray)-1 :" & UBound($ar_LISTVIEWArray) - 1 & @LF)
		For $b = StringLen($s_Binary) To 1 Step - 1
			If StringMid($s_Binary, $b, 1) == "0" Then
				__GUICtrlListView_DeleteItem($LV_Listview, $i_Count + 1 - $b - $a)
				$a += 1
			EndIf
		Next
		ConsoleWrite(" LV delete indiv LV1 " & $a & " items :" & Round(TimerDiff($timerstamp2)) & " mseconds " & @LF)
	ElseIf UBound($ar_TempF) - 1 > (4000 - $i_Count - 200) Then
		GUICtrlSetState($LV_Listview, $GUI_HIDE)
		__GUICtrlListView_DeleteAllItems($LV_Listview)
		ConsoleWrite(" START delete indiv LV1 " & $a & " items :" & Round(TimerDiff($timerstamp2)) & " mseconds " & @LF)
		$LV_Listview = _GUICtrlCreateListView($ar_LISTVIEWArray[0], 10, 10, 200, 150);,$LVS_SORTDESCENDING)
		For $c = 0 To UBound($ar_TempF) - 1
			_GUICtrlCreateListViewItem($ar_TempF[$c], $LV_Listview, -1, $i_Quick)
		Next
		ConsoleWrite("Refresh LV recreate LV1 " & $c & " items :" & Round(TimerDiff($timerstamp2)) & " mseconds " & @LF)
	Else
		GUICtrlSetState($LV_Listview, $GUI_HIDE)
		__GUICtrlListView_DeleteAllItems($LV_Listview, 0)
		ConsoleWrite(" START GUICtrlSetState LV1 " & $a & " items :" & Round(TimerDiff($timerstamp2)) & " mseconds " & @LF)
		$LV_Listview = _GUICtrlCreateListView("col1        |col2|col3|Index  ", 10, 10, 200, 150);,$LVS_SORTDESCENDING)
		For $c = 0 To UBound($ar_TempF) - 1
			_GUICtrlCreateListViewItem($ar_TempF[$c], $LV_Listview, -1, $i_Quick)
		Next
		ConsoleWrite("Refresh; GUICtrlSetState " & $c & "; LV2 :" & Round(TimerDiff($timerstamp2)) & " mseconds " & @LF)
	EndIf
	_GUICtrlListView_HideColumn($LV_Listview, $iLV_IndexColumn)
	_ResetLockWait3()
	__GUICtrlListView_Sort($LV_Listview, -1, $iLV_IndexColumn)
	;=================================================
	ConsoleWrite("_FirstList :" & Round(TimerDiff($timerstamp1)) & " mseconds " & @LF)
	;MsgBox(0, "time", "_FirstList :" & Round(TimerDiff($timerstamp1)) & " mseconds ")
	$timerstampt = TimerInit()
	ConsoleWrite("_2List :" & Round(TimerDiff($timerstampt)) & " mseconds " & @LF)
EndFunc   ;==>_deleteduplicate
Func _ArrayDeleteDupes(ByRef $ar_Array, $i_iIndexColumn = 1)
	$code = 'function DeleteDupes(arlistview,iIndexColumn)'
	$code &= @LF & '	dim x,Itemtxt1,Itemtxt1Index,sBinTemp  ,count,linesplit,sBin'
	$code &= @LF & '	linesplit=split(arlistview(0),"|")'
	$code &= @LF & '	count = ubound (arlistview)'
	$code &= @LF & '	For x = count  To 1 Step - 1'
	$code &= @LF & '		Itemtxt1 = GUICtrllistviewGetItemText (arlistview, x, 0)';,"arlistview items")
	$code &= @LF & '		Itemtxt1Index = csng(GUICtrllistviewGetItemText (arlistview, x, iIndexColumn))';,"arlistview items")
	$code &= @LF & '		sBinTemp = "1"'
	$code &= @LF & '		do '
	$code &= @LF & '			If x > 1 Then'
	$code &= @LF & '				Itemtxt2 = GUICtrllistviewGetItemText (arlistview, x - 1, 0)';,"arlistview items")
	$code &= @LF & '				Itemtxt2Index = csng(GUICtrllistviewGetItemText (arlistview, x - 1, iIndexColumn))'
	$code &= @LF & '				If Ucase(Itemtxt1) = Ucase(Itemtxt2) Then'
	$code &= @LF & '					sBinTemp = sBinTemp &"0"'
	$code &= @LF & '					If Itemtxt2Index < Itemtxt1Index Then ';change item if index number smallest'
	$code &= @LF & '						Itemtxt1Index = Itemtxt2Index'
	$code &= @LF & '						sBinTemp = Replace(Left(sBinTemp, Len(sBinTemp)-1), "1", "0") & "1"'
	$code &= @LF & '					End If'
	$code &= @LF & '					count =count- 1'
	$code &= @LF & '					x =x- 1'
	$code &= @LF & '				End If'
	$code &= @LF & '			End If'
	$code &= @LF & '		 Loop Until (Ucase(Itemtxt1) <> Ucase(Itemtxt2)) Or x = 1'
	$code &= @LF & '		sBin = sBin&sBinTemp'
	$code &= @LF & '	Next'
	$code &= @LF & '	Dim ArrayTemp(), b, countList, a'
	$code &= @LF & '		countList=UBound(arlistview)'
	$code &= @LF & '		redim preserve ArrayTemp(Len(sBin))'
	$code &= @LF & '		for b=Len(sBin) to 1 step -1'
	$code &= @LF & '			if mid(sBin,b,1)="1" Then'
	$code &= @LF & '				ArrayTemp(a)= arlistview(countList+1-b)'
	$code &= @LF & '				a=a+1'
	$code &= @LF & '			End If'
	$code &= @LF & '		next'
	$code &= @LF & '		redim preserve ArrayTemp(a)'
	$code &= @LF & '		ArrayTemp(a)=sBin'
	$code &= @LF & '		DeleteDupes= ArrayTemp'
	$code &= @LF & 'end function'
	$code &= @LF & 'function GUICtrllistviewGetItemText (array, iItem, iSubItem)'
	$code &= @LF & '	dim  count1'
	$code &= @LF & '	If (iSubItem = -1) Then'; return all the subitems in the item selected'
	$code &= @LF & '		GUICtrllistviewGetItemText= array(iItem)'
	$code &= @LF & '	Else'
	$code &= @LF & '		arlistviewSubItem=Split(array(iItem),"|")'
	$code &= @LF & '		count1 = UBound(arlistviewSubItem)'
	$code &= @LF & '		If (iSubItem <= count1) Then '; return the subitem in the item selected'
	$code &= @LF & '			GUICtrllistviewGetItemText= arlistviewSubItem(iSubItem)'
	$code &= @LF & '		Else '; subitem is out of range'
	$code &= @LF & '			GUICtrllistviewGetItemText= 0'
	$code &= @LF & '		End If'
	$code &= @LF & '	End If'
	$code &= @LF & 'end function'
	$vbs = ObjCreate("ScriptControl")
	$vbs.language = "vbscript"
	$vbs.addcode ($code)
	Return $vbs.run ("DeleteDupes", $ar_Array, $i_iIndexColumn)
	$vbs = ""
EndFunc   ;==>_ArrayDeleteDupes
Func __GUICtrlListView_Sort($lv, $BDESCdummy, $i_OrderColumn, $i_ReDraw = 1, $i_CheckForNull = 0)
	Local $szIconFile, $s_Blank = " "
	If Not $i_LISTVIEWNumItemsView Then Return
	If $i_LISTVIEWPrevcolumn <> $i_OrderColumn Then $s_LISTVIEWSortOrder = "DESC"
	$ar_Size = StringSplit($ar_LISTVIEWArray[0], "|")
	For $rr = 1 To UBound($ar_Size) - 2
		$s_Blank &= "| "
	Next
;~ 	MsgBox(0,"","$s_Blank="&$s_Blank)
;~ 	MsgBox(0,"","$ar_LISTVIEWArray[0]="&$ar_LISTVIEWArray[0])
	_LockAndWait3()
	If $GUICtrlSetImage Then ; sort with icon display
		If $i_LISTVIEWNumItemsView <> UBound($ar_LISTVIEWArray) Then
			If $i_LISTVIEWNumItemsView <= 4000 Then ReDim $ar_LISTVIEW[$i_LISTVIEWNumItemsView + 1]
			ReDim $ar_LISTVIEWArray[$i_LISTVIEWNumItemsView + 1]
		EndIf
		$timerstampsort = TimerInit()
		If $i_LISTVIEWPrevcolumn = $i_OrderColumn And (Not $i_GUISetCheckBoxes) Then
			_ArrayReverse($ar_LISTVIEWArray, 1)
			ConsoleWrite("reverse:" & TimerDiff($timerstampsort) & " mseconds to search." & @LF)
		Else
			If $i_GUISetCheckBoxes Then _GUIGetCheckBoxes($lv)
			If @OSTYPE <> "WIN32_NT" Or @ComputerName = "MININT-JVC" Then
				_Quick_SortColumnME($ar_LISTVIEWArray, 0, UBound($ar_LISTVIEWArray) - 1, $i_OrderColumn + 1)
			Else
;~ 			_Quick_SortColumnME( $ar_LISTVIEWArray,0, ubound($ar_LISTVIEWArray)-1,$i_OrderColumn+1)
				_Quick_SortColumn($ar_LISTVIEWArray, 1, UBound($ar_LISTVIEWArray) - 1, $i_OrderColumn + 1)
			EndIf
			If $i_LISTVIEWPrevcolumn = $i_OrderColumn And $s_LISTVIEWSortOrder == "DESC" And $i_GUISetCheckBoxes Then _ArrayReverse($ar_LISTVIEWArray, 1)
		EndIf
		If $i_ReDraw Then
			$ar_Orig = $ar_LISTVIEWArray
			__GUICtrlListView_DeleteAllItems($lv)
			ConsoleWrite("aft __GUICtrlListViewDeleteAllItems $s_LISTVIEWSortOrder:" & $s_LISTVIEWSortOrder & @LF)
			$timerstamp = TimerInit()
			If $i_GUISetCheckBoxes Then _GUICtrlListView_SetItemChecked($lv, -1, 0); zero all
			For $a = 1 To UBound($ar_Orig) - 1
				$s_DataItem = $ar_Orig[$a]
				If $i_GUISetCheckBoxes Then $s_Trim = StringTrimRight($s_DataItem, 2)
				If Not $i_GUISetCheckBoxes Then $s_Trim = $s_DataItem
				_GUICtrlCreateListViewItem($s_Trim, $lv)
				If $i_GUISetCheckBoxes Then $i_Checked = Number(StringRight($s_DataItem, 1))
				If $i_GUISetCheckBoxes And $i_Checked Then _GUICtrlListView_SetItemChecked($lv, $a - 1)
			Next
			If $i_LISTVIEWNumItemsView <> UBound($ar_LISTVIEWArray) Then
				If $i_LISTVIEWNumItemsView <= 4000 Then ReDim $ar_LISTVIEW[$i_LISTVIEWNumItemsView + 1]
				ReDim $ar_LISTVIEWArray[$i_LISTVIEWNumItemsView + 1]
			EndIf
			$i_LISTVIEWPrevcolumn = $i_OrderColumn
			ConsoleWrite("aFT LISTVIEW img:" & TimerDiff($timerstamp) & " mseconds to search." & @LF)
		EndIf
	Else
		If $i_LISTVIEWPrevcolumn = $i_OrderColumn And $s_LISTVIEWSortOrder == "DESC" And (Not $i_GUISetCheckBoxes) Then
			$timerstamp = TimerInit()
			If $i_GUISetCheckBoxes Then _GUICtrlListView_SetItemChecked($lv, -1, 0); zero all
			For $a = 1 To UBound($ar_LISTVIEWArray) - 1
				$s_DataItem = $ar_LISTVIEWArray[UBound($ar_LISTVIEWArray) - $a]
				If $i_GUISetCheckBoxes Then $s_Trim = StringTrimRight($s_DataItem, 2)
				If Not $i_GUISetCheckBoxes Then $s_Trim = $s_DataItem
				If $a <= 4000 And Not $i_CheckForNull Then
					GUICtrlSetData($ar_LISTVIEW[$a], $s_Trim)
				ElseIf $a <= 4000 And $i_CheckForNull Then
					GUICtrlSetData($ar_LISTVIEW[$a], $s_Blank)
					GUICtrlSetData($ar_LISTVIEW[$a], $s_Trim)
				Else
					_GUICtrlListView_DeleteItem($lv, $a - 1)
					_GUICtrlListView_InsertItem($lv, $a - 1, $s_Trim)
				EndIf
				If $i_GUISetCheckBoxes Then $i_Checked = Number(StringRight($s_DataItem, 1))
				If $i_GUISetCheckBoxes And $i_Checked Then _GUICtrlListView_SetItemChecked($lv, UBound($ar_LISTVIEWArray) - $a - 3)
			Next
			ConsoleWrite("aft _ArrayReverse DESC :" & TimerDiff($timerstamp) & " mseconds to search." & @LF)
		ElseIf $i_LISTVIEWPrevcolumn = $i_OrderColumn And $s_LISTVIEWSortOrder == "ASC" And (Not $i_GUISetCheckBoxes) Then
			$timerstamp = TimerInit()
			If $i_GUISetCheckBoxes Then _GUICtrlListView_SetItemChecked($lv, -1, 0); zero all
			For $a = 1 To UBound($ar_LISTVIEWArray) - 1
				$s_DataItem = $ar_LISTVIEWArray[$a]
				If $i_GUISetCheckBoxes Then $s_Trim = StringTrimRight($s_DataItem, 2)
				If Not $i_GUISetCheckBoxes Then $s_Trim = $s_DataItem
				If $a <= 4000 And Not $i_CheckForNull Then
					GUICtrlSetData($ar_LISTVIEW[$a], $s_Trim)
				ElseIf $a <= 4000 And $i_CheckForNull Then
					GUICtrlSetData($ar_LISTVIEW[$a], $s_Blank)
					GUICtrlSetData($ar_LISTVIEW[$a], $s_Trim)
				Else
					_GUICtrlListView_DeleteItem($lv, $a - 1)
					_GUICtrlListView_InsertItem($lv, $a - 1, $s_Trim)
				EndIf
				If $i_GUISetCheckBoxes Then $i_Checked = Number(StringRight($s_DataItem, 1))
				If $i_GUISetCheckBoxes And $i_Checked Then _GUICtrlListView_SetItemChecked($lv, $a - 1)
			Next
			ConsoleWrite("aft _ArrayReverse ASC :" & TimerDiff($timerstamp) & " mseconds to search." & @LF)
		Else
			If $i_LISTVIEWNumItemsView + 1 < UBound($ar_LISTVIEWArray) Then
				If $i_LISTVIEWNumItemsView <= 4000 Then ReDim $ar_LISTVIEW[$i_LISTVIEWNumItemsView + 1]
				ReDim $ar_LISTVIEWArray[$i_LISTVIEWNumItemsView + 1]
			EndIf
			Local $Line1, $s_ListHeader, $sHeader, $EmptyLine; $szFile
			$timerstampsort = TimerInit()
			If $i_GUISetCheckBoxes Then _GUIGetCheckBoxes($lv)
			If @OSTYPE <> "WIN32_NT" Or @ComputerName = "MININT-JVC" Then
				_Quick_SortColumnME($ar_LISTVIEWArray, 0, UBound($ar_LISTVIEWArray) - 1, $i_OrderColumn + 1)
			Else
;~ 			_Quick_SortColumnME( $ar_LISTVIEWArray,0, ubound($ar_LISTVIEWArray)-1,$i_OrderColumn+1)
				_Quick_SortColumn($ar_LISTVIEWArray, 1, UBound($ar_LISTVIEWArray) - 1, $i_OrderColumn + 1)
			EndIf
			If $i_LISTVIEWPrevcolumn = $i_OrderColumn And $s_LISTVIEWSortOrder == "ASC" And $i_GUISetCheckBoxes Then _ArrayReverse($ar_LISTVIEWArray, 1)
			ConsoleWrite("$i_LISTVIEWPrevcolumn :" & $i_LISTVIEWPrevcolumn & @LF)
			ConsoleWrite("$i_OrderColumn :" & $i_OrderColumn & @LF)
			ConsoleWrite("$s_LISTVIEWSortOrder :" & $s_LISTVIEWSortOrder & @LF)
			ConsoleWrite("aft sort :" & TimerDiff($timerstampsort) & " mseconds to search." & @LF)
			If $i_ReDraw Then
				$timerstamp = TimerInit()
				If $i_GUISetCheckBoxes Then _GUICtrlListView_SetItemChecked($lv, -1, 0); zero all
				For $a = 1 To UBound($ar_LISTVIEWArray) - 1
					$s_DataItem = $ar_LISTVIEWArray[$a]
					If $i_GUISetCheckBoxes Then $s_Trim = StringTrimRight($s_DataItem, 2)
					If Not $i_GUISetCheckBoxes Then $s_Trim = $s_DataItem
					If $a <= 4000 And Not $i_CheckForNull Then
						GUICtrlSetData($ar_LISTVIEW[$a], $s_Trim)
					ElseIf $a <= 4000 And $i_CheckForNull Then
						GUICtrlSetData($ar_LISTVIEW[$a], $s_Blank)
						GUICtrlSetData($ar_LISTVIEW[$a], $s_Trim)
					Else
						_GUICtrlListView_DeleteItem($lv, $a - 1)
						_GUICtrlListView_InsertItem($lv, $a - 1, $s_Trim)
					EndIf
					If $i_GUISetCheckBoxes Then $i_Checked = Number(StringRight($s_DataItem, 1))
					If $i_GUISetCheckBoxes And $i_Checked Then _GUICtrlListView_SetItemChecked($lv, $a - 1)
				Next
				$i_LISTVIEWPrevcolumn = $i_OrderColumn
				If Not $i_GUISetCheckBoxes Then $s_LISTVIEWSortOrder = "ASC"
				ConsoleWrite("aFT LISTVIEW :" & TimerDiff($timerstamp) & " mseconds to search." & @LF)
			EndIf
		EndIf
	EndIf
	_ResetLockWait3()
	GUISetState()
	$s_LISTVIEWSortOrder = _Iif($s_LISTVIEWSortOrder == "ASC", "DESC", "ASC")
EndFunc   ;==>__GUICtrlListViewSort
Func __GUICtrlListView_GetItemCount($LV_Listview)
	If $i_LISTVIEWNumItemsView <> UBound($ar_LISTVIEWArray) - 1 Then
		If $i_LISTVIEWNumItemsView <= 4000 Then ReDim $ar_LISTVIEW[$i_LISTVIEWNumItemsView + 1]
		ReDim $ar_LISTVIEWArray[$i_LISTVIEWNumItemsView + 1]
	EndIf
	Return UBound($ar_LISTVIEWArray) - 1
EndFunc   ;==>__GUICtrlListView_GetItemCount
Func _ArrayDeleteVBS(ByRef $ar_Array, $i_iIndexRow = 1)
	$code = 'function ArrayDelete(arlistview,iIndexRow)'
	$code &= @LF & '	dim iLoop,count'
	$code &= @LF & '	count = ubound (arlistview)'
	$code &= @LF & '     For iLoop = iIndexRow to UBound(arlistview) - 1'
	$code &= @LF & '       arlistview(iLoop) = arlistview(iLoop + 1)'
	$code &= @LF & '     Next'
	$code &= @LF & '	redim preserve arlistview(count-1)'
	$code &= @LF & '	ArrayDelete= arlistview'
	$code &= @LF & 'end function'
	$vbs = ObjCreate("ScriptControl")
	$vbs.language = "vbscript"
	$vbs.addcode ($code)
	$ar_Array = $vbs.run ("ArrayDelete", $ar_Array, $i_iIndexRow)
	$vbs = ""
EndFunc   ;==>_ArrayDeleteVBS
Func __GUICtrlListView_DeleteItem($LV_Listview, $i_Item, $i_DeleteGUI = 1)
	;$i_Item+=1; as $ar_LISTVIEWArray and $ar_LISTVIEW are 1-based to keep header as zero
	$i_LISTVIEWNumItemsView -= 1
;~ 	MsgBox(0,"","$ar_LISTVIEWArray[$i_Item]="&$ar_LISTVIEWArray[$i_Item])
	;ReDim $ar_LISTVIEW[UBound($ar_LISTVIEW)-1]
	_ArrayDeleteVBS($ar_LISTVIEW, $i_Item)
	_ArrayDeleteVBS($ar_LISTVIEWArray, $i_Item)
;~ 	_ArrayDelete($ar_LISTVIEW, $i_Item)
;~ 	_ArrayDelete($ar_LISTVIEWArray, $i_Item)
	If $i_DeleteGUI Then _GUICtrlListView_DeleteItem($LV_Listview, $i_Item - 1)
EndFunc   ;==>__GUICtrlListView_DeleteItem
Func __GUICtrlListView_GetItemText($h_listview, $i_Item, $i_SubItem = -1)
	Local $count,$ar_ListViewSubItem
	$i_Item += 1; as $ar_LISTVIEWArray and $ar_LISTVIEW are 1-based to keep header as zero
	If ($i_SubItem == -1) Then; return all the subitems in the item selected
		Return $ar_LISTVIEWArray[$i_Item]
	Else
		ConsoleWrite("$ar_LISTVIEWArray[$i_Item]="&$ar_LISTVIEWArray[$i_Item]&@LF&"$i_Item"&$i_Item&@LF)
		$ar_ListViewSubItem = StringSplit($ar_LISTVIEWArray[$i_Item], "|")
		$count = UBound($ar_ListViewSubItem) - 1
		If ($i_SubItem < $count) Then; return the subitem in the item selected
			Return $ar_ListViewSubItem[$i_SubItem + 1]
		Else; subitem is out of range
			Return $LV_ERR
		EndIf
	EndIf
EndFunc   ;==>__GUICtrlListView_GetItemText
Func _FileSetIconDefault($lv, $s_FileExt = "AnswerFindLines2.txt", $s_Extnlocal = ".")
	Local $szIconFile, $nIcon
	;MsgBox(0,"","in loop $s_Extnlocal="&$s_Extnlocal)
	If $s_FileExt = "AnswerFindLines2.txt" Or $s_FileExt = -1 Then $s_FileExt = @ScriptDir & "\AnswerFindLines2.txt"
	If $s_Extnlocal == "." Or $s_Extnlocal = -1 Then
		;MsgBox(0,"","in loop calling _MaxExtension")
		$s_Extnlocal = _MaxExtension($s_FileExt)
	EndIf
	$s_ExtDefault = $s_Extnlocal
	;_GUICtrlSetImage(-1, "mmcndmgr.dll", $nIcon)
	;MsgBox(0,"","in loop $s_ExtDefault="&$s_ExtDefault)
	FileGetIcon($szIconFile, $nIcon, $s_Extnlocal)
	_GUICtrlSetImage($lv, $szIconFile, $nIcon)
EndFunc   ;==>_FileSetIconDefault
Func FileGetIcon(ByRef $szIconFile, ByRef $nIcon, $szFile)
	Dim $szRegDefault = "", $szDefIcon = ""
	$szExt = StringRight($szFile, 4)
	$szRegDefault = RegRead("HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\" & $szExt, "ProgID")
	If $szRegDefault = "" Then $szRegDefault = RegRead("HKCR\" & $szExt, "")
	If $szRegDefault <> "" Then $szDefIcon = RegRead("HKCR\" & $szRegDefault & "\DefaultIcon", "")
	If $szDefIcon = "" Then
		$szIconFile = "shell32.dll"
	ElseIf $szDefIcon <> "%1" Then
		$arSplit = StringSplit($szDefIcon, ",")
		If IsArray($arSplit) Then
			$szIconFile = $arSplit[1]
			If $arSplit[0] > 1 Then $nIcon = $arSplit[2]
		Else
			Return 0
		EndIf
	EndIf
	Return 1
EndFunc   ;==>FileGetIcon
Func _GUICtrlSetImage($LV_Listview, $dll, $num, $Tree = -1)
	If $i_LISTVIEWNumItemsView <= $i_DefaultIconNumber Then
		GUICtrlSetImage($LV_Listview, $dll, $num)
		If $Tree = -1 Then $GUICtrlSetImage = 1
	EndIf
EndFunc   ;==>_GUICtrlSetImage
Func _GUIListViewClose()
	__GUICtrlListView_DeleteAllItems(-1, 0)
EndFunc   ;==>_GUIListViewClose
Func __GUICtrlListView_DeleteAllItems($lv, $s_Delete = 1)
	If $s_Delete Then _GUICtrlListView_DeleteAllItems($lv)
	If $i_LISTVIEWNumItemsView <> UBound($ar_LISTVIEWArray) Then
		If $i_LISTVIEWNumItemsView <= 4000 Then ReDim $ar_LISTVIEW[$i_LISTVIEWNumItemsView + 1]
		ReDim $ar_LISTVIEWArray[$i_LISTVIEWNumItemsView + 1]
	EndIf
	$s_Header = $ar_LISTVIEWArray[0]
	ReDim $ar_LISTVIEWArray[1]
	ReDim $ar_LISTVIEW[1]
	ReDim $ar_LISTVIEWArray[4001]
	;MsgBox(0,"","$s_Header="&$s_Header)
	$ar_LISTVIEWArray[0] = $s_Header; must declare header this way
	ReDim $ar_LISTVIEW[4001]
	;$s_LISTVIEWSortOrder="DESC"
	$i_LISTVIEWNumItemsView = 0
	$i_LISTVIEWPrevcolumn = -1
EndFunc   ;==>__GUICtrlListView_DeleteAllItems
Func _GUIListViewReDim()
	If $i_LISTVIEWNumItemsView <> UBound($ar_LISTVIEWArray) Then
		If $i_LISTVIEWNumItemsView <= 4000 Then ReDim $ar_LISTVIEW[$i_LISTVIEWNumItemsView + 1]
		ReDim $ar_LISTVIEWArray[$i_LISTVIEWNumItemsView + 1]
	EndIf
EndFunc   ;==>_GUIListViewReDim
Func _LockAndWait3()
	Local $Cursor_WAIT
	GUISetState(@SW_LOCK)
	GUISetCursor($Cursor_WAIT, 1)
EndFunc   ;==>_LockAndWait3
Func _ResetLockWait3()
	Local $Cursor_ARROW
	GUISetState(@SW_UNLOCK)
	GUISetCursor($Cursor_ARROW, 1)
EndFunc   ;==>_ResetLockWait3
Func _Quick_SortColumn(ByRef $ar_Array, $First, $Last, $i_ViewColNum = 1)
	$code = "function Quick_SortColumn1(ByRef SortArray, First, Last,i_ViewColNum)"
	$code &= @LF & "	dim strWrite,ar_Col,ar_Column()"
	$code &= @LF & "	ReDim Preserve ar_Column(ubound(SortArray))"
	$code &= @LF & "	Dim intPointer, booIsNumeric: booIsNumeric = True"
	$code &= @LF & "	For intPointer = First To Last"
	$code &= @LF & '		ar_Col = Split( SortArray(intPointer), "|", -1,0 )'
	$code &= @LF & "		If Not IsNumeric( ar_Col(i_ViewColNum) ) Then"
	$code &= @LF & "			booIsNumeric = False"
	$code &= @LF & "			Exit For"
	$code &= @LF & "		End If"
	$code &= @LF & "	Next"
	$code &= @LF & "	For intPointer = First To Last"
	$code &= @LF & '		ar_Col = Split( SortArray(intPointer), "|", -1,0 )'
	$code &= @LF & '			If booIsNumeric Then'
	$code &= @LF & "			ar_Column(intPointer)  = CSng( ar_Col(i_ViewColNum) )"
	$code &= @LF & "		else"
	$code &= @LF & "			ar_Column(intPointer)  =  ar_Col(i_ViewColNum)"
	$code &= @LF & "		End If"
	$code &= @LF & "	Next"
	$code &= @LF & "	Quick_SortColumn  SortArray, ar_Column,First, Last,i_ViewColNum "
	$code &= @LF & "	Quick_SortColumn1= SortArray"
	$code &= @LF & "End function   "
	$code &= @LF & "function Quick_SortColumn(ByRef SortArray, ByRef ar_Column, First, Last,i_ViewColNum)"
	$code &= @LF & "	dim Low,High,collitem,ar_Col"
	$code &= @LF & "	dim Temp,List_Separator"
	$code &= @LF & "	Low = First"
	$code &= @LF & "	High = Last"
	$code &= @LF & "	List_Separator=ar_Column((First + Last) / 2)"
	$code &= @LF & "	Do"
	$code &= @LF & "		While (ar_Column(Low) < List_Separator)"
	$code &= @LF & "			Low = Low + 1"
	$code &= @LF & "		WEnd"
	$code &= @LF & "		While (ar_Column(High) > List_Separator)"
	$code &= @LF & "			High = High - 1"
	$code &= @LF & "		WEnd"
	$code &= @LF & "		If (Low <= High) Then"
	$code &= @LF & "			Temp = SortArray(Low)"
	$code &= @LF & "			SortArray(Low) = SortArray(High)"
	$code &= @LF & "			SortArray(High) = Temp"
	$code &= @LF & "			Temp = ar_Column(Low)"
	$code &= @LF & "			ar_Column(Low) = ar_Column(High)"
	$code &= @LF & "			ar_Column(High) = Temp"
	$code &= @LF & "			Low = Low + 1"
	$code &= @LF & "			High = High - 1"
	$code &= @LF & "		End If"
	$code &= @LF & "	Loop While (Low <= High)"
	$code &= @LF & "	If (First < High) Then Quick_SortColumn  SortArray, ar_Column,First, High,i_ViewColNum "
	$code &= @LF & "	If (Low < Last) Then Quick_SortColumn  SortArray, ar_Column,Low, Last,i_ViewColNum "
	$code &= @LF & "End function   "
	$vbs = ObjCreate("ScriptControl")
	$vbs.language = "vbscript"
	$vbs.addcode ($code)
	;$ar_LISTVIEWArray = 	$vbs.run("Quick_SortColumn1",$ar_LISTVIEWArray, $First, $Last,$i_ViewColNum-1)
	$ar_Array = $vbs.run ("Quick_SortColumn1", $ar_Array, $First, $Last, $i_ViewColNum - 1)
	$vbs = ""
EndFunc   ;==>_Quick_SortColumn
Func _Quick_SortColumnME(ByRef $ar_Array, $First, $Last, $i_ViewColNum = 1)
	$s_FileForArraySort = @ScriptDir & "\ParseME.txt"
	$s_FileSorted = @ScriptDir & "\sArrayFile.txt"
	FileDelete($s_FileSorted)
	$code = 'dim arGUI()'
	$code &= @LF & 'redim preserve argui(0)'
	$code &= @LF & 'Dim a,arg,argument,argu(2):Set argument = WScript.Arguments'
	$code &= @LF & 'for each arg in argument'
	$code &= @LF & '	argu(a)=arg'
	$code &= @LF & '	a=a+1'
	$code &= @LF & 'next'
	$code &= @LF & 'FileToSort=argu(0):FirstA=csng(argu(1)):i_ViewColNumA=Csng(argu(2))'
	$code &= @LF & 'SortArrayA=FileToArray(FileToSort)'
	$code &= @LF & 'redim preserve SortArrayA(ubound(SortArrayA)-1)'
	$code &= @LF & 'LastA=ubound(SortArrayA)'
;~ 	$code &= @LF & 	'wscript.echo LastA'
;~ 	$code &= @LF & 	'wscript.echo SortArrayA(ubound(SortArrayA))'
	$code &= @LF & 'SortColumn SortArrayA, FirstA, LastA,i_ViewColNumA'
	$code &= @LF & 'Dim sArrayFile: sArrayFile="' & $s_FileSorted & '"'
	$code &= @LF & 'FileFromArray sArrayFile,SortArrayA'
	$code &= @LF & 'function SortColumn(ByRef SortArray, First, Last,i_ViewColNum)'
	$code &= @LF & "	dim strWrite,ar_Col,ar_Column()"
	$code &= @LF & "	ReDim Preserve ar_Column(ubound(SortArray))"
	$code &= @LF & "	Dim intPointer, booIsNumeric: booIsNumeric = True"
	$code &= @LF & "	For intPointer = First To Last"
	$code &= @LF & '		ar_Col = Split( SortArray(intPointer), "|", -1,0 )'
	$code &= @LF & "		If Not IsNumeric( ar_Col(i_ViewColNum) ) Then"
	$code &= @LF & "			booIsNumeric = False"
	$code &= @LF & "			Exit For"
	$code &= @LF & "		End If"
	$code &= @LF & "	Next"
	$code &= @LF & "	For intPointer = First To Last"
	$code &= @LF & '		ar_Col = Split( SortArray(intPointer), "|", -1,0 )'
	$code &= @LF & '			If booIsNumeric Then'
	$code &= @LF & "			ar_Column(intPointer)  = CSng( ar_Col(i_ViewColNum) )"
	$code &= @LF & "		else"
	$code &= @LF & "			ar_Column(intPointer)  =  ar_Col(i_ViewColNum)"
	$code &= @LF & "		End If"
	$code &= @LF & "	Next"
	$code &= @LF & "	Quick_SortColumn  SortArray, ar_Column,First, Last,i_ViewColNum "
	$code &= @LF & "	SortColumn= SortArray"
	$code &= @LF & "End function   "
	$code &= @LF & "function Quick_SortColumn(ByRef SortArray, ByRef ar_Column, First, Last,i_ViewColNum)"
	$code &= @LF & "	dim Low,High,collitem,ar_Col"
	$code &= @LF & "	dim Temp,List_Separator"
	$code &= @LF & "	Low = First"
	$code &= @LF & "	High = Last"
	$code &= @LF & "	List_Separator=ar_Column((First + Last) / 2)"
	$code &= @LF & "	Do"
	$code &= @LF & "		While (ar_Column(Low) < List_Separator)"
	$code &= @LF & "			Low = Low + 1"
	$code &= @LF & "		WEnd"
	$code &= @LF & "		While (ar_Column(High) > List_Separator)"
	$code &= @LF & "			High = High - 1"
	$code &= @LF & "		WEnd"
	$code &= @LF & "		If (Low <= High) Then"
	$code &= @LF & "			Temp = SortArray(Low)"
	$code &= @LF & "			SortArray(Low) = SortArray(High)"
	$code &= @LF & "			SortArray(High) = Temp"
	$code &= @LF & "			Temp = ar_Column(Low)"
	$code &= @LF & "			ar_Column(Low) = ar_Column(High)"
	$code &= @LF & "			ar_Column(High) = Temp"
	$code &= @LF & "			Low = Low + 1"
	$code &= @LF & "			High = High - 1"
	$code &= @LF & "		End If"
	$code &= @LF & "	Loop While (Low <= High)"
	$code &= @LF & "	If (First < High) Then Quick_SortColumn  SortArray, ar_Column,First, High,i_ViewColNum "
	$code &= @LF & "	If (Low < Last) Then Quick_SortColumn  SortArray, ar_Column,Low, Last,i_ViewColNum "
	$code &= @LF & "End function   "
	$code &= @LF & 'Function FileToArray(ReadFile)'
	$code &= @LF & '	Dim objFileSystem: Set objFileSystem = CreateObject( "Scripting.FileSystemObject") '
	$code &= @LF & '	Dim fso, fso1,f1, InFile,ReadTempLine, ReadString,FileArray()'
	$code &= @LF & '	Set InFile = objFileSystem.OpenTextFile(ReadFile, 1)'
	$code &= @LF & '	Dim intPointer, intUpper, intLower, varHolder: intPointer=0'
	$code &= @LF & '	Do While Not InFile.AtEndOfStream'
	$code &= @LF & '		ReDim Preserve FileArray(intPointer+1)'
	$code &= @LF & '		ReadTempLine = InFile.ReadLine'
	$code &= @LF & '		FileArray(intPointer) = ReadTempLine'
	$code &= @LF & '		intPointer=intPointer+1'
	$code &= @LF & '	Loop'
	$code &= @LF & '	InFile.Close'
	$code &= @LF & '	FileToArray=FileArray'
	$code &= @LF & 'End function   '
	$code &= @LF & 'Function FileFromArray(File,arArrayToFile)'
	$code &= @LF & '	Dim objFileSystem: Set objFileSystem = CreateObject( "Scripting.FileSystemObject") '
	$code &= @LF & '	Dim hfilenamewrite:Set hfilenamewrite = objFileSystem.CreateTextFile(File, True)'
	$code &= @LF & '	for arline=0 to ubound(arArrayToFile)'
	$code &= @LF & '		hfilenamewrite.WriteLine arArrayToFile(arline)'
	$code &= @LF & '	next'
	$code &= @LF & '	hfilenamewrite.Close'
	$code &= @LF & 'End function   '
	$h_file = FileOpen(@ScriptDir & "\Quick_SortColumn.vbs", 2)
	FileWrite($h_file, $code)
	FileClose($h_file)
;~ 	MsgBox(0,"","$i_ViewColNum-1="&$i_ViewColNum-1)
	RunWait("wscript.exe Quick_SortColumn.vbs " & " " & $s_FileForArraySort & " " & $First & " " & $i_ViewColNum - 1)
	_FileReadToArray($s_FileSorted, $ar_Array)
;~ 	MsgBox(0,"","$ar_Array[0]="&$ar_Array[0])
;~ 	_ArrayDelete($ar_Array,0); counter
	If $ar_Array[UBound($ar_Array) - 1] = "" Then _ArrayDelete($ar_Array, UBound($ar_Array) - 1)
EndFunc   ;==>_Quick_SortColumnME
Func _MaxExtension($s_File)
	Local $j, $s_AnswerFile, $k, $i_TotalFound = 0;,$ar_Icons[1],$szIconFile, $nIcon=0
	$s_ExtString = ".au3"
	$i_TotalLines = _FileCountLines($s_File)
	$s_AnswerFile3 = @ScriptDir & "\AnswerFindLines3.txt"
	FileCopy($s_File, $s_AnswerFile3, 1)
	$s_AnswerFile = @ScriptDir & "\Answer.txt"
	$s_ExtMaxName = $s_ExtString
	$s_ExtStrList = $s_ExtString
	$s_ExtMaxNum = 0
	$i_Find = 0
	;===========================================================================================================
	$s_DefSwitches = '/I  /c:"' & "." & StringRight($s_ExtString, 3) & '"'       ; Change only if you know FINDSTR switches well
	_FindLinesDOSsearch($s_File, $s_AnswerFile, $s_DefSwitches, 0); AnswerFile ByRef
	;===========================================================================================================
	$i_Find = _FileCountLines($s_AnswerFile)
	If $i_Find > $s_ExtMaxNum Then
		$s_ExtMaxNum = $i_Find
		$s_ExtMaxName = $s_ExtString
	EndIf
	$i_TotalFound += $i_Find
	$h_file = FileOpen($s_AnswerFile3, 0)
	;While 1
	While ($s_ExtMaxNum< ($i_TotalLines - $i_TotalFound))
		$s_Line = FileReadLine($h_file)
		If @error Then ExitLoop
		$s_FileExt = "." & StringRight($s_Line, 3)
		If Not StringInStr($s_ExtStrList, $s_FileExt) Then
			$s_ExtStrList &= "|" & $s_FileExt
			$s_ExtString = $s_FileExt
			$i_Find = 0
			$s_DefSwitches = '/I  /c:"' & "." & StringRight($s_ExtString, 3) & '"'       ; Change only if you know FINDSTR switches well
			_FindLinesDOSsearch($s_File, $s_AnswerFile, $s_DefSwitches, 0); AnswerFile ByRef
			$i_Find = _FileCountLines($s_AnswerFile)
			If $i_Find > $s_ExtMaxNum Then
				$s_ExtMaxNum = $i_Find
				$s_ExtMaxName = $s_ExtString
			EndIf
			$i_TotalFound += $i_Find
			ConsoleWrite("Current;" & $s_FileExt & @LF)
		EndIf
	WEnd
	ConsoleWrite("Max;" & $s_ExtMaxName & @LF)
	FileClose($h_file)
	Return $s_ExtMaxName
EndFunc   ;==>_MaxExtension
Func _FindLinesDOSsearch(ByRef $s_File, ByRef $s_AnswerFile, $s_Searches, $i_Append = 0, $i_Case = 0, $i_Array = 0, $i_Literal = 0)
	;Syntax; _FindLinesDOSsearch($s_file,$s_AnswerFile,$s_Searches, $i_Case , $i_Array ,$i_Literal); $s_AnswerFile ByRef needs not be defined
	; Parameters; $i_Literal=1 implies spaces are delimiters for a number of search strings in $s_Searches, rather than spaces included in search
	Local $asList
	If FileExists($s_File) Then
		If $i_Append Then
			$i_Append = ">>"
		Else
			$i_Append = ">"
		EndIf
		If $i_Literal = 1 Then
			$i_Literal = "/c:"
		Else
			$i_Literal = ""
		EndIf
		If $i_Case = 1 Then
			$i_Case = "/I"
		Else
			$i_Case = ""
		EndIf
		$Position = StringInStr($s_File, "\", 0, -1)
		$s_Path = StringLeft($s_File, $Position)
		FileChangeDir($s_Path)
		$s_Searches = StringReplace($s_Searches, ".", "\."); to use as RegExp in "FindLines"
		$s_Searches = StringReplace($s_Searches, "*", ".*"); to use as RegExp in "FindLines"
		If StringInStr($s_File, " ") Then $s_File = '"' & $s_File & '"'
		If StringInStr($s_AnswerFile, " ") Then $s_AnswerFile = '"' & $s_AnswerFile & '"'
		$s_Command = 'findstr /R' & $i_Case & ' ' & $i_Literal & $s_Searches & ' ' & $s_File & ' ' & $i_Append & '  ' & $s_AnswerFile; rem /c: for literal?
		$i_Pid = RunWait(@ComSpec & " /c " & $s_Command, @ScriptDir, @SW_HIDE)
		ProcessClose($i_Pid)
		$s_AnswerFile = StringReplace($s_AnswerFile, '"', '')
		$s_File = StringReplace($s_File, '"', "")
		If $i_Array Then
			$sList = FileRead($s_AnswerFile, FileGetSize($s_AnswerFile))
			$sList = StringTrimRight(StringReplace($sList, @CRLF, @LF), 1)
			$asList = StringSplit($sList, @LF)
		EndIf
	Else
		SetError(1)
	EndIf
	Return $asList
EndFunc   ;==>_FindLinesDOSsearch
Func __FileListToArray($sPath, $sFilter = "*", $iFlag = 0)
	Local $aArray[1], $s_AnswerFile = @ScriptDir & "\FindFiles.txt", $i_AMPM
	;	local $aArray[1],$s_AnswerFile=@ScriptDir&"\FindFiles.txt",$sPathShort
	$sPathShort = FileGetShortName($sPath)
	If Not StringRight($sPathShort, 1) == "\" Then $sPathShort &= "\"
	$s_AnswerFile = FileGetShortName($s_AnswerFile)
	;$sCommand=	" dir " & $sPathShort & "*.*   /TW/Od/4 /-C /a-d-h-s | FIND "&'"M   "'&"> " &  $s_AnswerFile
	$sCommand = " dir " & $sPathShort & "*.*   /TW/O-d/4 /-C /a-d-h-s | FIND " & '"/"' & "> " & $s_AnswerFile
	_RunDOS($sCommand)
	__FileReadToArray($s_AnswerFile, $aArray)
;~ 	$aArray=_TextSearchDos($sPathShort,"/", 0)
	Return $aArray
EndFunc   ;==>__FileListToArray
Func _TextSearchDos($s_Mask = "", $text = "", $recursive = 0)
	Local $s_Buf = ""
	$cmd = " dir " & $s_Mask & "*.*   /TW/Od/4 /-C /a-d-h-s | FIND " & '"/"'
	$i_Pid = Run(@ComSpec & ' /c ' & $cmd, @WorkingDir, @SW_HIDE, 2)
	While Not @error
		$s_Buf &= StdoutRead($i_Pid)
	WEnd
	ProcessClose($i_Pid)
	Return StringSplit(StringTrimRight($s_Buf, 2), @CRLF, 1)
EndFunc   ;==>_TextSearchDos
Func _FileListToFile($sPath, $s_File, $sFilter = "*", $iFlag = 0)
	Local $aArray[1], $i_AMPM
	;	local $aArray[1],$s_AnswerFile=@ScriptDir&"\FindFiles.txt",$sPathShort
	$sPathShort = FileGetShortName($sPath)
	If Not StringRight($sPathShort, 1) == "\" Then $sPathShort &= "\"
	$s_File = FileGetShortName($s_File)
	$sCommand = " dir " & $sPathShort & "*.*   /TW/O-d/4 /-C /a-d-h-s | FIND " & '"/"' & "> " & $s_File
	_RunDOS($sCommand)
EndFunc   ;==>_FileListToFile
Func __FileReadToArray($sPath, ByRef $aArray)
	;MsgBox(0,"","__FileReadToArray="&$sPath)
	Local $i_PM
	;=============================================================
	;$s_Xmas_DateTimeFormat ( "2006/12/25", 2)
	$h_file = FileOpen($s_AnswerFileFind, 0)
	$s_Line = FileReadLine($h_file)
	;if not @error then
	If StringInStr($s_Line, " AM ") Or StringInStr($s_Line, " PM ") Then $i_PM = 1
	;EndIf
	FileClose($h_file)
	;=============================================================
	$code = "Function FileListToArray(ReadFile)"
	$code &= @LF & '	Dim objFileSystem: Set objFileSystem = CreateObject( "Scripting.FileSystemObject") '
	$code &= @LF & "	Dim fso, fso1,f1, InFile, ReadString,FileArray()"
	$code &= @LF & "	Set InFile = objFileSystem.OpenTextFile(ReadFile, 1)"
	$code &= @LF & "	Dim intPointer, intUpper, intLower, varHolder: intPointer=0"
	$code &= @LF & "		ReDim Preserve FileArray(0)"
	$code &= @LF & "	Do While Not InFile.AtEndOfStream"
	$code &= @LF & "		ReDim Preserve FileArray(ubound(FileArray)+1)"
	$code &= @LF & "		ReadString = InFile.ReadLine"
	If $i_PM Then $code &= @LF & 'FileArray(intPointer) =left(ReadString,10)&"|"&mid(ReadString,40)&"|"&mid(ReadString,13,8)&"|"&round(CSng(mid(ReadString,21,18))/1024)&"|"&right(ReadString,4) '
	If Not $i_PM Then $code &= @LF & 'FileArray(intPointer) =left(ReadString,10)&"|"&mid(ReadString,37)&"|"&mid(ReadString,13,5)&"|"&round(CSng(mid(ReadString,18,18))/1024)&"|"&right(ReadString,4) '
	;	$code &= @LF & '		FileArray(intPointer) = ReadString'
	$code &= @LF & "		intPointer=intPointer+1"
	$code &= @LF & "	Loop"
	$code &= @LF & "	InFile.Close"
	$code &= @LF & "		ReDim Preserve FileArray(ubound(FileArray)-1)"
	;	$code &= @LF & "		ReDim Preserve FileArray(intPointer)"
	$code &= @LF & "	FileListToArray=FileArray"
	$code &= @LF & "End function   "
	$vbs = ObjCreate("ScriptControl")
	$vbs.language = "vbscript"
	$vbs.addcode ($code)
;~ 	ConsoleWrite($code)
	$aArray = $vbs.run ("FileListToArray", $sPath)
	$vbs = ""
	;_ArrayReverse($aArray)
EndFunc   ;==>__FileReadToArray
Func _SortFileDOS($s_File, ByRef $s_AnswerFile, $s_Switches = "/+1/M/R")
	;SYNTAX ; _DOSDir($s_Path,$s_Mask,$s_AnswerFile,$s_Switches,$i_Recurse)
	Local $ar_ArrayList, $s_AnswerFindLines
	;If $i_Recurse=1 then
	;	$i_Recurse="/S"
	;Else
	;	$i_Recurse=""
	;EndIf
	;$s_Switches=$s_Switches
	;if not StringRight($s_Path,-1)="\" then $s_Path=$s_Path&"\"
	$Position = StringInStr($s_File, "\", 0, -1)
	$s_Path = StringLeft($s_File, $Position)
	FileChangeDir($s_Path)
	If FileExists($s_File) And FileExists($s_Path) Then
		;Sort a list of filenames or directories
		$s_AnswerFile = $s_Path & "Answer.txt"
		If Not FileExists($s_Path) Then
			$s_AnswerFile = @ScriptDir & "\" & "Answer.txt"
		EndIf
		FileDelete($s_AnswerFile)
		If StringInStr($s_File, " ") Then $s_File = '"' & $s_File & '"'
		If StringInStr($s_AnswerFile, " ") Then $s_AnswerFile = '"' & $s_AnswerFile & '"'
		$sCmd = 'sort ' & $s_Switches & ' ' & $s_File & ' /O ' & $s_AnswerFile; rem
		RunWait(@ComSpec & " /c " & $sCmd, "", @SW_HIDE) ;& " > " & $s_AnswerFile
		$s_AnswerFile = StringReplace($s_AnswerFile, '"', "")
		ConsoleWrite($sCmd & @CRLF)
		While Not FileExists($s_AnswerFile)
			Sleep(100)
		WEnd
	Else
		SetError(1)
	EndIf
	;if IsArray($ar_ArrayList) then Return $ar_ArrayList
EndFunc   ;==>_SortFileDOS
Func _FindLinesDOSsearchME(ByRef $s_File, ByRef $s_AnswerFile, $s_Searches, $i_Append = 0, $i_Case = 0, $i_Array = 0, $i_Literal = 0)
	;Syntax; _FindLinesDOSsearch2($s_file,$s_AnswerFile,$s_Searches, $i_Case , $i_Array ,$i_Literal); $s_AnswerFile ByRef needs not be defined
	; Parameters; $i_Literal=1 implies spaces are delimiters for a number of search strings in $s_Searches, rather than spaces included in search
	Local $asList
	If FileExists($s_File) Then
		If $i_Append Then
			$i_Append = ">>"
		Else
			$i_Append = ">"
		EndIf
		If $i_Case = 1 Then
			$i_Case = "/I"
		Else
			$i_Case = ""
		EndIf
		$Position = StringInStr($s_File, "\", 0, -1)
		$s_Path = StringLeft($s_File, $Position)
		FileChangeDir($s_Path)
		;$s_AnswerFile = $s_Path & "AnswerFindLines.txt"
		$s_Searches = StringReplace($s_Searches, ".", "\."); to use as RegExp in "FindLines"
		$s_Searches = StringReplace($s_Searches, "*", ".*"); to use as RegExp in "FindLines"
		;$s_Searches = '"' & $s_Searches & '"'
		If StringInStr($s_File, " ") Then $s_File = '"' & $s_File & '"'
		If StringInStr($s_AnswerFile, " ") Then $s_AnswerFile = '"' & $s_AnswerFile & '"'
		; Set the Command and Run Dos
;~ 		MsgBox(0,"","$s_AnswerFile="&$s_AnswerFile)
		$s_Command = 'type | find ' & $i_Case & ' ' & $s_Searches & ' ' & $s_File & ' ' & $i_Append & '  ' & $s_AnswerFile; rem /c: for literal?
;~ 		MsgBox(0,"","$s_Command="&$s_Command)
		$i_Pid = RunWait(@ComSpec & " /c " & $s_Command, @ScriptDir, @SW_HIDE)
		ProcessClose($i_Pid)
		$s_AnswerFile = StringReplace($s_AnswerFile, '"', '')
;~ 		MsgBox(0,"after search","$s_AnswerFile="&$s_AnswerFile)
		$s_File = StringReplace($s_File, '"', "")
		If $i_Array Then
			;FileReadToArray($s_AnswerFile, $asList)
			$sList = FileRead($s_AnswerFile, FileGetSize($s_AnswerFile))
			$sList = StringTrimRight(StringReplace($sList, @CRLF, @LF), 1)
			$asList = StringSplit($sList, @LF)
		EndIf
	Else
		SetError(1)
	EndIf
	Return $asList
EndFunc   ;==>_FindLinesDOSsearchME