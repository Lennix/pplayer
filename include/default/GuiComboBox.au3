#include-once

#include "GuiConstants.au3"
#include "ComboConstants.au3"
#include "EditConstants.au3"
#include "Array.au3"
#include "Misc.au3"
#include "Memory.au3"
#include "WinAPI.au3"
#include "Structures.au3"

; #INDEX# =======================================================================================================================
; Title .........: ComboBox
; AutoIt Version: 3.2.3++
; Language:       English
; Description:    Functions that assist with ComboBox.
; ===============================================================================================================================

; #VARIABLES# ===================================================================================================================
Global $_ghCBLastWnd
Global $Debug_CB = False
#cs==============================================================================================================================
	; ===============================================================================================================================
	; depricated functions will no longer work
	; ===============================================================================================================================
	; #OLD_FUNCTIONS#================================================================================================================
	; Old Function/Name                      ; --> New Function/Name/Replacement(s)
	; ===============================================================================================================================
	; _GUICtrlComboAddDir                    ; --> _GUICtrlComboBox_AddDir
	; _GUICtrlComboAddString                 ; --> _GUICtrlComboBox_AddString
	; _GUICtrlComboAutoComplete              ; --> _GUICtrlComboBox_AutoComplete
	; _GUICtrlComboDeleteString              ; --> _GUICtrlComboBox_DeleteString
	; _GUICtrlComboFindString                ; --> _GUICtrlComboBox_FindString, _GUICtrlComboBox_FindStringExact
	; _GUICtrlComboGetCount                  ; --> _GUICtrlComboBox_GetCount
	; _GUICtrlComboGetCurSel                 ; --> _GUICtrlComboBox_GetCurSel
	; _GUICtrlComboGetDroppedControlRECT     ; --> _GUICtrlComboBox_GetDroppedControlRect
	; _GUICtrlComboGetDroppedState           ; --> _GUICtrlComboBox_GetDroppedState
	; _GUICtrlComboGetDroppedWidth           ; --> _GUICtrlComboBox_GetDroppedWidth
	; _GUICtrlComboGetEditSel                ; --> _GUICtrlComboBox_GetEditSel
	; _GUICtrlComboGetExtendedUI             ; --> _GUICtrlComboBox_GetExtendedUI
	; _GUICtrlComboGetHorizontalExtent       ; --> _GUICtrlComboBox_GetHorizontalExtent
	; _GUICtrlComboGetItemHeight             ; --> _GUICtrlComboBox_GetItemHeight
	; _GUICtrlComboGetLBText                 ; --> _GUICtrlComboBox_GetLBText
	; _GUICtrlComboGetLBTextLen              ; --> _GUICtrlComboBox_GetLBTextLen
	; _GUICtrlComboGetList                   ; --> _GUICtrlComboBox_GetList
	; _GUICtrlComboGetLocale                 ; --> _GUICtrlComboBox_GetLocale
	; _GUICtrlComboGetMinVisible             ; --> _GUICtrlComboBox_GetMinVisible
	; _GUICtrlComboGetTopIndex               ; --> _GUICtrlComboBox_GetTopIndex
	; _GUICtrlComboInitStorage               ; --> _GUICtrlComboBox_InitStorage
	; _GUICtrlComboInsertString              ; --> _GUICtrlComboBox_InsertString
	; _GUICtrlComboLimitText                 ; --> _GUICtrlComboBox_LimitText
	; _GUICtrlComboResetContent              ; --> _GUICtrlComboBox_ResetContent
	; _GUICtrlComboSelectString              ; --> _GUICtrlComboBox_SelectString
	; _GUICtrlComboSetCurSel                 ; --> _GUICtrlComboBox_SetCurSel
	; _GUICtrlComboSetDroppedWidth           ; --> _GUICtrlComboBox_SetDroppedWidth
	; _GUICtrlComboSetEditSel                ; --> _GUICtrlComboBox_SetEditSel
	; _GUICtrlComboSetExtendedUI             ; --> _GUICtrlComboBox_SetExtendedUI
	; _GUICtrlComboSetHorizontalExtent       ; --> _GUICtrlComboBox_SetHorizontalExtent
	; _GUICtrlComboSetItemHeight             ; --> _GUICtrlComboBox_SetItemHeight
	; _GUICtrlComboSetMinVisible             ; --> _GUICtrlComboBox_SetMinVisible
	; _GUICtrlComboSetTopIndex               ; --> _GUICtrlComboBox_SetTopIndex
	; _GUICtrlComboShowDropDown              ; --> _GUICtrlComboBox_ShowDropDown
	; ===============================================================================================================================
	
	; #NO_DOC_FUNCTION# =============================================================================================================
	; Not working/documented/implimented at this time
	; ===============================================================================================================================
	_GUICtrlComboBox_SetLocale
	; ===============================================================================================================================
	
	; #CURRENT# =====================================================================================================================
	_GUICtrlComboBox_AddDir
	_GUICtrlComboBox_AddString
	_GUICtrlComboBox_AutoComplete
	_GUICtrlComboBox_BeginUpdate
	_GUICtrlComboBox_Create
	_GUICtrlComboBox_DeleteString
	_GUICtrlComboBox_Destroy
	_GUICtrlComboBox_EndUpdate
	_GUICtrlComboBox_FindString
	_GUICtrlComboBox_FindStringExact
	_GUICtrlComboBox_GetComboBoxInfo
	_GUICtrlComboBox_GetCount
	_GUICtrlComboBox_GetCurSel
	_GUICtrlComboBox_GetDroppedControlRect
	_GUICtrlComboBox_GetDroppedControlRectEx
	_GUICtrlComboBox_GetDroppedState
	_GUICtrlComboBox_GetDroppedWidth
	_GUICtrlComboBox_GetEditSel
	_GUICtrlComboBox_GetEditText
	_GUICtrlComboBox_GetExtendedUI
	_GUICtrlComboBox_GetHorizontalExtent
	_GUICtrlComboBox_GetItemHeight
	_GUICtrlComboBox_GetLBText
	_GUICtrlComboBox_GetLBTextLen
	_GUICtrlComboBox_GetList
	_GUICtrlComboBox_GetListArray
	_GUICtrlComboBox_GetLocale
	_GUICtrlComboBox_GetLocaleCountry
	_GUICtrlComboBox_GetLocaleLang
	_GUICtrlComboBox_GetLocalePrimLang
	_GUICtrlComboBox_GetLocaleSubLang
	_GUICtrlComboBox_GetMinVisible
	_GUICtrlComboBox_GetTopIndex
	_GUICtrlComboBox_InitStorage
	_GUICtrlComboBox_InsertString
	_GUICtrlComboBox_LimitText
	_GUICtrlComboBox_ReplaceEditSel
	_GUICtrlComboBox_ResetContent
	_GUICtrlComboBox_SelectString
	_GUICtrlComboBox_SetCurSel
	_GUICtrlComboBox_SetDroppedWidth
	_GUICtrlComboBox_SetEditSel
	_GUICtrlComboBox_SetEditText
	_GUICtrlComboBox_SetExtendedUI
	_GUICtrlComboBox_SetHorizontalExtent
	_GUICtrlComboBox_SetItemHeight
	_GUICtrlComboBox_SetMinVisible
	_GUICtrlComboBox_SetTopIndex
	_GUICtrlComboBox_ShowDropDown
	; ===============================================================================================================================
	
	; #INTERNAL_USE_ONLY#============================================================================================================
	_GUICtrlComboBox_DebugPrint
	_GUICtrlComboBox_ValidateClassName
#ce==============================================================================================================================

; #FUNCTION# ====================================================================================================================
; Name...........: _GUICtrlComboBox_AddDir
; Description ...: Adds the names of directories and files
; Syntax.........: _GUICtrlComboBox_AddDir($hWnd, $sFile[, $iAttributes = 0[, $fBrackets = True]])
; Parameters ....: $hWnd        - Handle to control
;                  $sFile       - Specifies an absolute path, relative path, or filename
;                  $iAttributes - Specifies the attributes of the files or directories to be added:
;                  |$DDL_READWRITE - Includes read-write files with no additional attributes
;                  |$DDL_READONLY  - Includes read-only files
;                  |$DDL_HIDDEN    - Includes hidden files
;                  |$DDL_SYSTEM    - Includes system files
;                  |$DDL_DIRECTORY - Includes subdirectories
;                  |$DDL_ARCHIVE   - Includes archived files
;                  |$DDL_DRIVES    - All mapped drives are added to the list
;                  |$DDL_EXCLUSIVE - Includes only files with the specified attributes
;                  $fBrackets      - include/exclude brackets when $DDL_DRIVES is used
; Return values .: Success      - Zero based index of the last name added
;                  Failure      - -1
; Author ........: Gary Frost (gafrost)
; Modified.......:
; Remarks .......: If there is insufficient space to store the new strings, the return value is $CB_ERRSPACE
; Related .......:
; Link ..........;
; Example .......; Yes
; ===============================================================================================================================
Func _GUICtrlComboBox_AddDir($hWnd, $sFile, $iAttributes = 0, $fBrackets = True)
	If $Debug_CB Then _GUICtrlComboBox_ValidateClassName($hWnd)
	If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)

	If BitAND($iAttributes, $DDL_DRIVES) = $DDL_DRIVES And Not $fBrackets Then
		Local $sText, $v_ret
		Local $gui_no_brackets = GUICreate("no brackets")
		Local $combo_no_brackets = GUICtrlCreateCombo("", 240, 40, 120, 120)
		$v_ret = GUICtrlSendMsg($combo_no_brackets, $CB_DIR, $iAttributes, $sFile)
		For $i = 0 To _GUICtrlComboBox_GetCount($combo_no_brackets) - 1
			_GUICtrlComboBox_GetLBText($combo_no_brackets, $i, $sText)
			$sText = StringReplace(StringReplace(StringReplace($sText, "[", ""), "]", ":"), "-", "")
			_GUICtrlComboBox_InsertString($hWnd, $sText)
		Next
		GUIDelete($gui_no_brackets)
		Return $v_ret
	Else
		Return _SendMessage($hWnd, $CB_DIR, $iAttributes, $sFile, 0, "int", "str")
	EndIf
EndFunc   ;==>_GUICtrlComboBox_AddDir

; #FUNCTION# ====================================================================================================================
; Name...........: _GUICtrlComboBox_AddString
; Description ...: Add a string
; Syntax.........: _GUICtrlComboBox_AddString($hWnd, $sText)
; Parameters ....: $hWnd        - Handle to control
;                  $sText       - String to add
; Return values .: Success      - The index of the new item
;                  Failure      - -1
; Author ........: Gary Frost (gafrost)
; Modified.......:
; Remarks .......:
; Related .......: _GUICtrlComboBox_DeleteString, _GUICtrlComboBox_InsertString, _GUICtrlComboBox_ResetContent
; Link ..........;
; Example .......; Yes
; ===============================================================================================================================
Func _GUICtrlComboBox_AddString($hWnd, $sText)
	If $Debug_CB Then _GUICtrlComboBox_ValidateClassName($hWnd)
	If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
	
	Return _SendMessage($hWnd, $CB_ADDSTRING, 0, $sText, 0, "int", "str")
EndFunc   ;==>_GUICtrlComboBox_AddString

; #FUNCTION# ====================================================================================================================
; Name...........: _GUICtrlComboBox_AutoComplete
; Description ...: AutoComplete a ComboBox edit control
; Syntax.........: _GUICtrlComboBox_AutoComplete($hWnd)
; Parameters ....: $hWnd        - Handle to control
; Return values .:
; Author ........: Gary Frost (gafrost)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........;
; Example .......; Yes
; ===============================================================================================================================
Func _GUICtrlComboBox_AutoComplete($hWnd)
	Local $ret, $sInputText, $sEditText
	If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
	
	If Not _IsPressed('08') And Not _IsPressed("2E") Then ;backspace pressed or Del
		$sEditText = _GUICtrlComboBox_GetEditText($hWnd)
		If StringLen($sEditText) Then
			$ret = _GUICtrlComboBox_FindString($hWnd, $sEditText)
			If ($ret <> $CB_ERR) Then
				_GUICtrlComboBox_GetLBText($hWnd, $ret, $sInputText)
				_GUICtrlComboBox_SetEditText($hWnd, $sInputText)
				_GUICtrlComboBox_SetEditSel($hWnd, StringLen($sEditText), StringLen($sInputText))
			EndIf
		EndIf
	EndIf
EndFunc   ;==>_GUICtrlComboBox_AutoComplete

; #FUNCTION# ====================================================================================================================
; Name...........: _GUICtrlComboBox_BeginUpdate
; Description ...: Prevents updating of the control until the EndUpdate function is called
; Syntax.........: _GUICtrlComboBox_BeginUpdate($hWnd)
; Parameters ....: $hWnd        - Handle to the control
; Return values .: Success      - True
;                  Failure      - False
; Author ........: Paul Campbell (PaulIA)
; Modified.......: Gary Frost (gafrost)
; Remarks .......:
; Related .......: _GUICtrlComboBox_EndUpdate
; Link ..........;
; Example .......; Yes
; ===============================================================================================================================
Func _GUICtrlComboBox_BeginUpdate($hWnd)
	If $Debug_CB Then _GUICtrlComboBox_ValidateClassName($hWnd)
	If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
	
	Return _SendMessage($hWnd, $WM_SETREDRAW) = 0
EndFunc   ;==>_GUICtrlComboBox_BeginUpdate

; #FUNCTION# ====================================================================================================================
; Name...........: _GUICtrlComboBox_Create
; Description ...: Create a ComboBox control
; Syntax.........: _GUICtrlComboBox_Create($hWnd, $sText, $iX, $iY[, $iWidth = 100[, $iHeight = 120[, $iStyle = 0x00200042[, $iExStyle = 0x00000000]]]])
; Parameters ....: $hWnd        - Handle to parent or owner window
;                  $sText       - Delimited string to add to the combobox
;                  $iX          - Horizontal position of the control
;                  $iY          - Vertical position of the control
;                  $iWidth      - Control width
;                  $iHeight     - Control height
;                  $iStyle      - Control style:
;                  |$CBS_AUTOHSCROLL       - Automatically scrolls the text in an edit control to the right when the user types a character at the end of the line.
;                  |$CBS_DISABLENOSCROLL   - Shows a disabled vertical scroll bar
;                  |$CBS_DROPDOWN          - Similar to $CBS_SIMPLE, except that the list box is not displayed unless the user selects an icon next to the edit control
;                  |$CBS_DROPDOWNLIST      - Similar to $CBS_DROPDOWN, except that the edit control is replaced by a static text item that displays the current selection in the list box
;                  |$CBS_LOWERCASE         - Converts to lowercase all text in both the selection field and the list
;                  |$CBS_NOINTEGRALHEIGHT  - Specifies that the size of the combo box is exactly the size specified by the application when it created the combo box
;                  |$CBS_OEMCONVERT        - Converts text entered in the combo box edit control from the Windows character set to the OEM character set and then back to the Windows character set
;                  |$CBS_OWNERDRAWFIXED    - Specifies that the owner of the list box is responsible for drawing its contents and that the items in the list box are all the same height
;                  |$CBS_OWNERDRAWVARIABLE - Specifies that the owner of the list box is responsible for drawing its contents and that the items in the list box are variable in height
;                  |$CBS_SIMPLE            - Displays the list box at all times
;                  |$CBS_SORT              - Automatically sorts strings added to the list box
;                  |$CBS_UPPERCASE         - Converts to uppercase all text in both the selection field and the list
;                  -
;                  |Default: $CBS_DROPDOWN, $CBS_AUTOHSCROLL, $WS_VSCROLL
;                  |Forced : $WS_CHILD, $WS_TABSTOP, $WS_VISIBLE
;                  -
;                  $iExStyle    - Control extended style. These correspond to the standard $WS_EX_ constants.
; Return values .: Success      - Handle to the Listbox control
;                  Failure      - 0
; Author ........: Gary Frost (gafrost)
; Modified.......:
; Remarks .......:
; Related .......: _GUICtrlComboBox_Destroy
; Link ..........;
; Example .......; Yes
; ===============================================================================================================================
Func _GUICtrlComboBox_Create($hWnd, $sText, $iX, $iY, $iWidth = 100, $iHeight = 120, $iStyle = 0x00200042, $iExStyle = 0x00000000)
	If Not IsHWnd($hWnd) Then _WinAPI_ShowError ("Invalid Window handle for _GUICtrlComboBox_Create 1st parameter")
	If Not IsString($sText) Then _WinAPI_ShowError ("2nd parameter not a string for _GUICtrlComboBox_Create")
	
	Local $hCombo, $aText, $sDelimiter = Opt("GUIDataSeparatorChar")
	
	If $iWidth = -1 Then $iWidth = 100
	If $iHeight = -1 Then $iHeight = 120
	If $iStyle = -1 Then $iStyle = 0x00200042
	If $iExStyle = -1 Then $iExStyle = 0x00000000

;~ 	ConsoleWrite('0x' & Hex(BitOR($CBS_DROPDOWN, $CBS_AUTOHSCROLL, $WS_VSCROLL)) & @LF)

	$iStyle = BitOR($iStyle, $WS_CHILD, $WS_TABSTOP, $WS_VISIBLE)
	$hCombo = _WinAPI_CreateWindowEx ($iExStyle, "ComboBox", "", $iStyle, $iX, $iY, $iWidth, $iHeight, $hWnd)
	_WinAPI_SetFont ($hCombo, _WinAPI_GetStockObject ($DEFAULT_GUI_FONT))
	If StringLen($sText) Then
		$aText = StringSplit($sText, $sDelimiter)
		For $x = 1 To $aText[0]
			_GUICtrlComboBox_AddString($hCombo, $aText[$x])
		Next
	EndIf
	Return $hCombo
EndFunc   ;==>_GUICtrlComboBox_Create

; #INTERNAL_USE_ONLY#============================================================================================================
; Name...........: _GUICtrlComboBox_DebugPrint
; Description ...: Used for debugging when creating examples
; Syntax.........: _GUICtrlComboBox_DebugPrint($hWnd[, $iLine = @ScriptLineNumber])
; Parameters ....: $sText       - String to printed to console
;                  $iLine       - Line number function was called from
; Return values .: None
; Author ........: Gary Frost (gafrost)
; Modified.......:
; Remarks .......: For Internal Use Only
; Related .......:
; Link ..........;
; Example .......;
; ===============================================================================================================================
Func _GUICtrlComboBox_DebugPrint($sText, $iLine = @ScriptLineNumber)
	ConsoleWrite( _
			"!===========================================================" & @LF & _
			"+======================================================" & @LF & _
			"-->Line(" & StringFormat("%04d", $iLine) & "):" & @TAB & $sText & @LF & _
			"+======================================================" & @LF)
EndFunc   ;==>_GUICtrlComboBox_DebugPrint

; #FUNCTION# ====================================================================================================================
; Name...........: _GUICtrlComboBox_DeleteString
; Description ...: Delete a string
; Syntax.........: _GUICtrlComboBox_DeleteString($hWnd, $iIndex)
; Parameters ....: $hWnd        - Handle to control
;                  $iIndex      - Zero based index of string
; Return values .: Success      - Count of the strings remaining
;                  Failure      - -1
; Author ........: Gary Frost (gafrost)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........;
; Example .......; Yes
; ===============================================================================================================================
Func _GUICtrlComboBox_DeleteString($hWnd, $iIndex)
	If $Debug_CB Then _GUICtrlComboBox_ValidateClassName($hWnd)
	If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
	
	Return _SendMessage($hWnd, $CB_DELETESTRING, $iIndex)
EndFunc   ;==>_GUICtrlComboBox_DeleteString

; #FUNCTION# ====================================================================================================================
; Name...........: _GUICtrlComboBox_Destroy
; Description ...: Delete the control
; Syntax.........: _GUICtrlComboBox_Destroy(ByRef $hWnd)
; Parameters ....: $hWnd        - Handle to the control
; Return values .: Success      - True, Handle is set to 0
;                  Failure      - False
; Author ........: Gary Frost (gafrost)
; Modified.......:
; Remarks .......: Restricted to only be used on Listbox created with _GUICtrlComboBox_Create
; Related .......: _GUICtrlComboBox_Create
; Link ..........;
; Example .......; Yes
; ===============================================================================================================================
Func _GUICtrlComboBox_Destroy(ByRef $hWnd)
	If $Debug_CB Then _GUICtrlComboBox_ValidateClassName($hWnd)
	
	Local $Destroyed
	If IsHWnd($hWnd) Then
		If _WinAPI_InProcess ($hWnd, $_ghCBLastWnd) Then
			$Destroyed = _WinAPI_DestroyWindow ($hWnd)
			$hWnd = 0
		Else
			_WinAPI_ShowMsg ("Not Allowed to Destroy Other Applications ListView(s)")
			Return SetError(1, 1, False)
		EndIf
	Else
		Local $tHwnd = GUICtrlGetHandle($hWnd)
		$Destroyed = _WinAPI_DestroyWindow ($tHwnd)
		$hWnd = 0
	EndIf
	If Not @error Then Return $Destroyed <> 0
	Return SetError(1, 1, False)
EndFunc   ;==>_GUICtrlComboBox_Destroy

; #FUNCTION# ====================================================================================================================
; Name...........: _GUICtrlComboBox_EndUpdate
; Description ...: Enables screen repainting that was turned off with the BeginUpdate function
; Syntax.........: _GUICtrlComboBox_EndUpdate($hWnd)
; Parameters ....: $hWnd        - Handle to the control
; Return values .: Success      - True
;                  Failure      - False
; Author ........: Paul Campbell (PaulIA)
; Modified.......: Gary Frost (gafrost)
; Remarks .......:
; Related .......: _GUICtrlComboBox_BeginUpdate
; Link ..........;
; Example .......; Yes
; ===============================================================================================================================
Func _GUICtrlComboBox_EndUpdate($hWnd)
	If $Debug_CB Then _GUICtrlComboBox_ValidateClassName($hWnd)
	If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
	
	Return _SendMessage($hWnd, $WM_SETREDRAW, 1) = 0
EndFunc   ;==>_GUICtrlComboBox_EndUpdate

; #FUNCTION# ====================================================================================================================
; Name...........: _GUICtrlComboBox_FindString
; Description ...: Search for a string
; Syntax.........: _GUICtrlComboBox_FindString($hWnd, $sText[, $iIndex = -1])
; Parameters ....: $hWnd        - Handle to control
;                  $sText       - String to search for
;                  $iIndex      - Zero based index of the item preceding the first item to be searched
; Return values .: Success      - Zero based index of the matching item
;                  Failure      - -1
; Author ........: Gary Frost (gafrost)
; Modified.......:
; Remarks .......: Finds the first string beginning with the characters specified in $sText
;+
;                  When the search reaches the bottom of the ListBox, it continues from the top of the
;                  ListBox back to the item specified by $iIndex.
;+
;                  If $iIndex is �1, the entire ListBox is searched from the beginning.
; Related .......: _GUICtrlComboBox_SelectString
; Link ..........;
; Example .......; Yes
; ===============================================================================================================================
Func _GUICtrlComboBox_FindString($hWnd, $sText, $iIndex = -1)
	If $Debug_CB Then _GUICtrlComboBox_ValidateClassName($hWnd)
	If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
	
	If _WinAPI_InProcess ($hWnd, $_ghCBLastWnd) Then
		Return _SendMessage($hWnd, $CB_FINDSTRING, $iIndex, $sText, 0, "int", "str")
	Else
		Local $struct_String = DllStructCreate("char Text[" & StringLen($sText) + 1 & "]")
		Local $sBuffer_pointer = DllStructGetPtr($struct_String)
		DllStructSetData($struct_String, "Text", $sText)
		Local $rMemMap
		_MemInit ($hWnd, StringLen($sText) + 1, $rMemMap)
		_MemWrite ($rMemMap, $sBuffer_pointer)
		Local $iResult = _SendMessage($hWnd, $CB_FINDSTRING, $iIndex, $sBuffer_pointer, 0, "int", "ptr")
		_MemFree ($rMemMap)
		Return $iResult
	EndIf
EndFunc   ;==>_GUICtrlComboBox_FindString

; #FUNCTION# ====================================================================================================================
; Name...........: _GUICtrlComboBox_FindStringExact
; Description ...: Search for a string
; Syntax.........: _GUICtrlComboBox_FindStringExact($hWnd, $sText[, $iIndex = -1])
; Parameters ....: $hWnd        - Handle to control
;                  $sText       - String to search for
;                  $iIndex      - Zero based index of the item preceding the first item to be searched
; Return values .: Success      - Zero based index of the matching item
;                  Failure      - -1
; Author ........: Gary Frost (gafrost)
; Modified.......:
; Remarks .......: Find the first string that matches the string specified in the $sText parameter
;+
;                  When the search reaches the bottom of the ListBox, it continues from the top of the
;                  ListBox back to the item specified by $iIndex.
;+
;                  If $iIndex is �1, the entire ListBox is searched from the beginning.
; Related .......: _GUICtrlComboBox_SelectString
; Link ..........;
; Example .......; Yes
; ===============================================================================================================================
Func _GUICtrlComboBox_FindStringExact($hWnd, $sText, $iIndex = -1)
	If $Debug_CB Then _GUICtrlComboBox_ValidateClassName($hWnd)
	If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
	
	If _WinAPI_InProcess ($hWnd, $_ghCBLastWnd) Then
		Return _SendMessage($hWnd, $CB_FINDSTRINGEXACT, $iIndex, $sText, 0, "int", "str")
	Else
		Local $struct_String = DllStructCreate("char Text[" & StringLen($sText) + 1 & "]")
		Local $sBuffer_pointer = DllStructGetPtr($struct_String)
		DllStructSetData($struct_String, "Text", $sText)
		Local $rMemMap
		_MemInit ($hWnd, StringLen($sText) + 1, $rMemMap)
		_MemWrite ($rMemMap, $sBuffer_pointer)
		Local $iResult = _SendMessage($hWnd, $CB_FINDSTRINGEXACT, $iIndex, $sBuffer_pointer, 0, "int", "ptr")
		_MemFree ($rMemMap)
		Return $iResult
	EndIf
EndFunc   ;==>_GUICtrlComboBox_FindStringExact

; #FUNCTION# ====================================================================================================================
; Name...........: _GUICtrlComboBox_GetComboBoxInfo
; Description ...: Gets information about the specified ComboBox
; Syntax.........: _GUICtrlComboBox_GetComboBoxInfo($hWnd, ByRef $tInfo)
; Parameters ....: $hWnd        - Handle to control
; Return values .: Success      - True
;                  Failure      - False
; Author ........: Gary Frost (gafrost)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........;
; Example .......; Yes
; ===============================================================================================================================
Func _GUICtrlComboBox_GetComboBoxInfo($hWnd, ByRef $tInfo)
	If $Debug_CB Then _GUICtrlComboBox_ValidateClassName($hWnd)
	If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
	
	Local $pInfo, $iInfo
	$tInfo = DllStructCreate($tagCOMBOBOXINFO)
	$pInfo = DllStructGetPtr($tInfo)
	$iInfo = DllStructGetSize($tInfo)
	DllStructSetData($tInfo, "Size", $iInfo)
	Return _SendMessage($hWnd, $CB_GETCOMBOBOXINFO, 0, $pInfo, 0, "int", "ptr") <> 0
EndFunc   ;==>_GUICtrlComboBox_GetComboBoxInfo

; #FUNCTION# ====================================================================================================================
; Name...........: _GUICtrlComboBox_GetCount
; Description ...: Retrieve the number of items
; Syntax.........: _GUICtrlComboBox_GetCount($hWnd)
; Parameters ....: $hWnd        - Handle to control
; Return values .: Success      - Number of items
;                  Failure      - -1
; Author ........: Gary Frost (gafrost)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........;
; Example .......; Yes
; ===============================================================================================================================
Func _GUICtrlComboBox_GetCount($hWnd)
	If $Debug_CB Then _GUICtrlComboBox_ValidateClassName($hWnd)
	If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
	
	Return _SendMessage($hWnd, $CB_GETCOUNT)
EndFunc   ;==>_GUICtrlComboBox_GetCount

; #FUNCTION# ====================================================================================================================
; Name...........: _GUICtrlComboBox_GetCurSel
; Description ...: Retrieve the index of the currently selected item
; Syntax.........: _GUICtrlComboBox_GetCurSel($hWnd)
; Parameters ....: $hWnd        - Handle to control
; Return values .: Success      -  Zero-based index of the currently selected item
;                  Failure      - -1
; Author ........: Gary Frost (gafrost)
; Modified.......:
; Remarks .......:
; Related .......: _GUICtrlComboBox_SetCurSel
; Link ..........;
; Example .......; Yes
; ===============================================================================================================================
Func _GUICtrlComboBox_GetCurSel($hWnd)
	If $Debug_CB Then _GUICtrlComboBox_ValidateClassName($hWnd)
	If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
	
	Return _SendMessage($hWnd, $CB_GETCURSEL)
EndFunc   ;==>_GUICtrlComboBox_GetCurSel

; #FUNCTION# ====================================================================================================================
; Name...........: _GUICtrlComboBox_GetDroppedControlRect
; Description ...: Retrieve the screen coordinates of a combo box in its dropped-down state
; Syntax.........: _GUICtrlComboBox_GetDroppedControlRect($hWnd)
; Parameters ....: $hWnd        - Handle to control
; Return values .: Success      - Array with the following format:
;                  |[0] - X coordinate of the upper left corner of the rectangle
;                  |[1] - Y coordinate of the upper left corner of the rectangle
;                  |[2] - X coordinate of the lower right corner of the rectangle
;                  |[3] - Y coordinate of the lower right corner of the rectangle
; Author ........: Gary Frost (gafrost)
; Modified.......:
; Remarks .......:
; Related .......: _GUICtrlComboBox_GetDroppedControlRectEx
; Link ..........;
; Example .......; Yes
; ===============================================================================================================================
Func _GUICtrlComboBox_GetDroppedControlRect($hWnd)
	If $Debug_CB Then _GUICtrlComboBox_ValidateClassName($hWnd)
	If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
	
	Local $tRECT, $aRect[4]
	
	$tRECT = _GUICtrlComboBox_GetDroppedControlRectEx($hWnd)
	$aRect[0] = DllStructGetData($tRECT, "Left")
	$aRect[1] = DllStructGetData($tRECT, "Top")
	$aRect[2] = DllStructGetData($tRECT, "Right")
	$aRect[3] = DllStructGetData($tRECT, "Bottom")
	
	Return $aRect
EndFunc   ;==>_GUICtrlComboBox_GetDroppedControlRect

; #FUNCTION# ====================================================================================================================
; Name...........: _GUICtrlComboBox_GetDroppedControlRectEx
; Description ...: Retrieve the screen coordinates of a combo box in its dropped-down state
; Syntax.........: _GUICtrlComboBox_GetDroppedControlRectEx($hWnd)
; Parameters ....: $hWnd        - Handle to control
; Return values .: Success      - $tagRECT structure that receives the screen coordinates
; Author ........: Gary Frost (gafrost)
; Modified.......:
; Remarks .......:
; Related .......: _GUICtrlComboBox_GetDroppedControlRect, $tagRECT
; Link ..........;
; Example .......; Yes
; ===============================================================================================================================
Func _GUICtrlComboBox_GetDroppedControlRectEx($hWnd)
	If $Debug_CB Then _GUICtrlComboBox_ValidateClassName($hWnd)
	If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
	
	Local $tRECT = DllStructCreate($tagRect)
	_SendMessage($hWnd, $CB_GETDROPPEDCONTROLRECT, 0, DllStructGetPtr($tRECT), 0, "int", "ptr")
	Return $tRECT
EndFunc   ;==>_GUICtrlComboBox_GetDroppedControlRectEx

; #FUNCTION# ====================================================================================================================
; Name...........: _GUICtrlComboBox_GetDroppedState
; Description ...: Determines whether the ListBox of a ComboBox is dropped down
; Syntax.........: _GUICtrlComboBox_GetDroppedState($hWnd)
; Parameters ....: $hWnd        - Handle to control
; Return values .: True         - Is dropped down
;                  False        - Not dropped down
; Author ........: Gary Frost (gafro_GUICtrlComboBox_GetDroppedState
; Modified.......:
; Remarks .......:
; Related .......: _GUICtrlComboBox_ShowDropDown
; Link ..........;
; Example .......; Yes
; ===============================================================================================================================
Func _GUICtrlComboBox_GetDroppedState($hWnd)
	If $Debug_CB Then _GUICtrlComboBox_ValidateClassName($hWnd)
	If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
	
	Return _SendMessage($hWnd, $CB_GETDROPPEDSTATE) <> 0
EndFunc   ;==>_GUICtrlComboBox_GetDroppedState

; #FUNCTION# ====================================================================================================================
; Name...........: _GUICtrlComboBox_GetDroppedWidth
; Description ...: Retrieve the minimum allowable width, of the ListBox of a ComboBox
; Syntax.........: _GUICtrlComboBox_GetDroppedWidth($hWnd)
; Parameters ....: $hWnd        - Handle to control
; Return values .: Success      - The width, in pixels
;                  Failure      - -1
; Author ........: Gary Frost (gafrost)
; Modified.......:
; Remarks .......: The ComboBox must have $CBS_DROPDOWN or $CBS_DROPDOWNLIST style.
; Related .......: _GUICtrlComboBox_SetDroppedWidth
; Link ..........;
; Example .......; Yes
; ===============================================================================================================================
Func _GUICtrlComboBox_GetDroppedWidth($hWnd)
	If $Debug_CB Then _GUICtrlComboBox_ValidateClassName($hWnd)
	If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
	
	Return _SendMessage($hWnd, $CB_GETDROPPEDWIDTH)
EndFunc   ;==>_GUICtrlComboBox_GetDroppedWidth

; #FUNCTION# ====================================================================================================================
; Name...........: _GUICtrlComboBox_GetEditSel
; Description ...: Gets the starting and ending character positions of the current selection in the edit control of a ComboBox
; Syntax.........: _GUICtrlComboBox_GetEditSel($hWnd)
; Parameters ....: $hWnd        - Handle to control
; Return values .: Success      - Array in the following format:
;                  |[0]         - Starting position
;                  |[1]         - Ending position
;                  Failure      - -1
; Author ........: Gary Frost (gafrost)
; Modified.......:
; Remarks .......:
; Related .......: _GUICtrlComboBox_SetEditSel
; Link ..........;
; Example .......; Yes
; ===============================================================================================================================
Func _GUICtrlComboBox_GetEditSel($hWnd)
	If $Debug_CB Then _GUICtrlComboBox_ValidateClassName($hWnd)
	If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
	
	Local $tStart, $tEnd, $iResult, $aSel[2]
	
	$tStart = DllStructCreate("dword Start")
	$tEnd = DllStructCreate("dword End")
	
	$iResult = _SendMessage($hWnd, $CB_GETEDITSEL, DllStructGetPtr($tStart), DllStructGetPtr($tEnd), 0, "ptr", "ptr")
	If (Not $iResult) Then Return SetError($CB_ERR, $CB_ERR, $CB_ERR)
	
	$aSel[0] = DllStructGetData($tStart, "Start")
	$aSel[1] = DllStructGetData($tEnd, "End")
	Return $aSel
EndFunc   ;==>_GUICtrlComboBox_GetEditSel

; #FUNCTION# ====================================================================================================================
; Name...........: _GUICtrlComboBox_GetEditText
; Description ...: Get the text from the edit control of a ComboBox
; Syntax.........: _GUICtrlComboBox_GetEditText($hWnd)
; Parameters ....: $hWnd        - Handle to control
; Return values .: Success      - String from the edit control
;                  Failure      - Empty string
; Author ........: Gary Frost (gafrost)
; Modified.......:
; Remarks .......:
; Related .......: _GUICtrlComboBox_SetEditText
; Link ..........;
; Example .......; Yes
; ===============================================================================================================================
Func _GUICtrlComboBox_GetEditText($hWnd)
	If $Debug_CB Then _GUICtrlComboBox_ValidateClassName($hWnd)
	If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
	
	Local $iLine = 0, $iIndex = 0, $iLength, $iResult
	Local $struct_String, $struct_Buffer, $tInfo, $hEdit
	If _GUICtrlComboBox_GetComboBoxInfo($hWnd, $tInfo) Then
		
		$hEdit = DllStructGetData($tInfo, "hEdit")
		$iIndex = _SendMessage($hEdit, $EM_LINEINDEX, $iLine)
		$iLength = _SendMessage($hEdit, $EM_LINELENGTH, $iIndex)
		$struct_Buffer = DllStructCreate("short Len;char Text[" & $iLength + 2 & "]")
		DllStructSetData($struct_Buffer, "Len", $iLength + 2)
		
		$iResult = _SendMessageA ($hEdit, $EM_GETLINE, $iLine, DllStructGetPtr($struct_Buffer), 0, "int", "ptr")
		If $iResult = $EC_ERR Then Return SetError($EC_ERR, $EC_ERR, "")
		
		$struct_String = DllStructCreate("char Text[" & $iLength + 1 & "]", DllStructGetPtr($struct_Buffer))
		Return DllStructGetData($struct_String, "Text")
	Else
		Return SetError(-1, -1, "")
	EndIf
EndFunc   ;==>_GUICtrlComboBox_GetEditText

; #FUNCTION# ====================================================================================================================
; Name...........: _GUICtrlComboBox_GetExtendedUI
; Description ...: Determines whether a ComboBox has the default user interface or the extended user interface
; Syntax.........: _GUICtrlComboBox_GetExtendedUI($hWnd)
; Parameters ....: $hWnd        - Handle to control
; Return values .: True         - ComboBox has the extended user interface
;                  False        - ComboBox does "NOT" have the extended user interface
; Author ........: Gary Frost (gafrost)
; Modified.......:
; Remarks .......: By default, the F4 key opens or closes the list and the DOWN ARROW changes the current selection.
;+
;                  In a ComboBox with the extended user interface, the F4 key is disabled and pressing the DOWN ARROW
;                  key opens the drop-down list
; Related .......: _GUICtrlComboBox_SetExtendedUI
; Link ..........;
; Example .......; Yes
; ===============================================================================================================================
Func _GUICtrlComboBox_GetExtendedUI($hWnd)
	If $Debug_CB Then _GUICtrlComboBox_ValidateClassName($hWnd)
	If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
	
	Return _SendMessage($hWnd, $CB_GETEXTENDEDUI) <> 0
EndFunc   ;==>_GUICtrlComboBox_GetExtendedUI

; #FUNCTION# ====================================================================================================================
; Name...........: _GUICtrlComboBox_GetHorizontalExtent
; Description ...: Gets the width, in pixels, that the ListBox of a ComboBox control can be scrolled horizontally
; Syntax.........: _GUICtrlComboBox_GetHorizontalExtent($hWnd)
; Parameters ....: $hWnd        - Handle to control
; Return values .: Success      - The scrollable width, in pixels
; Author ........: Gary Frost (gafrost)
; Modified.......:
; Remarks .......:
; Related .......: _GUICtrlComboBox_SetHorizontalExtent
; Link ..........;
; Example .......; Yes
; ===============================================================================================================================
Func _GUICtrlComboBox_GetHorizontalExtent($hWnd)
	If $Debug_CB Then _GUICtrlComboBox_ValidateClassName($hWnd)
	If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
	
	Return _SendMessage($hWnd, $CB_GETHORIZONTALEXTENT)
EndFunc   ;==>_GUICtrlComboBox_GetHorizontalExtent

; #FUNCTION# ====================================================================================================================
; Name...........: _GUICtrlComboBox_GetItemHeight
; Description ...: Determines the height of list items or the selection field in a ComboBox
; Syntax.........: _GUICtrlComboBox_GetItemHeight($hWnd, $iIndex = -1)
; Parameters ....: $hWnd        - Handle to control
;                  $iIndex      - Determines which height to get:
;                  |�1          - Retrieve the height of the selection field
;                  | 0          - Retrieve the height of list items
; Return values .: Success      - The height, in pixels
;                  Failure      - -1
; Author ........: Gary Frost (gafrost)
; Modified.......:
; Remarks .......:
; Related .......: _GUICtrlComboBox_SetItemHeight
; Link ..........;
; Example .......; Yes
; ===============================================================================================================================
Func _GUICtrlComboBox_GetItemHeight($hWnd, $iIndex = -1)
	If $Debug_CB Then _GUICtrlComboBox_ValidateClassName($hWnd)
	If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
	
	Return _SendMessage($hWnd, $CB_GETITEMHEIGHT, $iIndex)
EndFunc   ;==>_GUICtrlComboBox_GetItemHeight

; #FUNCTION# ====================================================================================================================
; Name...........: _GUICtrlComboBox_GetLBText
; Description ...: Retrieve a string from the list of a ComboBox
; Syntax.........: _GUICtrlComboBox_GetLBText($hWnd, $iIndex, ByRef $sText)
; Parameters ....: $hWnd        - Handle to control
;                  $iIndex      - Zero based index to Retrieve from
;                  $sText       - Variable that will receive the string
; Return values .: Success      - The length of the string
;                  Failure      - -1
; Author ........: Gary Frost (gafrost)
; Modified.......:
; Remarks .......:
; Related .......: _GUICtrlComboBox_GetLBTextLen
; Link ..........;
; Example .......; Yes
; ===============================================================================================================================
Func _GUICtrlComboBox_GetLBText($hWnd, $iIndex, ByRef $sText)
	If $Debug_CB Then _GUICtrlComboBox_ValidateClassName($hWnd)
	If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
	
	Local $iResult, $iLen, $tBuffer

	$iLen = _GUICtrlComboBox_GetLBTextLen($hWnd, $iIndex)
	$tBuffer = DllStructCreate("char Text[" & $iLen + 1 & "]")
	$iResult = _SendMessageA ($hWnd, $CB_GETLBTEXT, $iIndex, DllStructGetPtr($tBuffer), 0, "int", "ptr")
	
	If ($iResult == $CB_ERR) Then Return SetError($CB_ERR, $CB_ERR, $CB_ERR)
	
	$sText = DllStructGetData($tBuffer, "Text")
	Return $iResult
EndFunc   ;==>_GUICtrlComboBox_GetLBText

; #FUNCTION# ====================================================================================================================
; Name...........: _GUICtrlComboBox_GetLBTextLen
; Description ...: Gets the length, in characters, of a string in the list of a combo box
; Syntax.........: _GUICtrlComboBox_GetLBTextLen($hWnd, $iIndex)
; Parameters ....: $hWnd        - Handle to control
; Return values .: Success      - The length of the string
;                  Failure      - -1
; Author ........: Gary Frost (gafrost)
; Modified.......:
; Remarks .......:
; Related .......: _GUICtrlComboBox_GetLBText
; Link ..........;
; Example .......; Yes
; ===============================================================================================================================
Func _GUICtrlComboBox_GetLBTextLen($hWnd, $iIndex)
	If $Debug_CB Then _GUICtrlComboBox_ValidateClassName($hWnd)
	If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
	
	Return _SendMessage($hWnd, $CB_GETLBTEXTLEN, $iIndex)
EndFunc   ;==>_GUICtrlComboBox_GetLBTextLen

; #FUNCTION# ====================================================================================================================
; Name...........: _GUICtrlComboBox_GetList
; Description ...: Retrieves all items from the list portion of a ComboBox control
; Syntax.........: _GUICtrlComboBox_GetList($hWnd)
; Parameters ....: $hWnd        - Handle to control
; Return values .: Success      - Delimited string of all ComboBox items
; Author ........: Jason Boggs
; Modified.......: Gary Frost (gafrost)
; Remarks .......: Default delimiter is "|" this can be change using the Opt("GUIDataSeparatorChar", "new delimiter")
; Related .......: _GUICtrlComboBox_GetListArray
; Link ..........;
; Example .......; Yes
; ===============================================================================================================================
Func _GUICtrlComboBox_GetList($hWnd)
	If $Debug_CB Then _GUICtrlComboBox_ValidateClassName($hWnd)
	If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
	
	Local $sDelimiter = Opt("GUIDataSeparatorChar")
	Local $sResult, $sItem
	
	For $i = 0 To _GUICtrlComboBox_GetCount($hWnd) - 1
		_GUICtrlComboBox_GetLBText($hWnd, $i, $sItem)
		$sResult &= $sItem & $sDelimiter
	Next
	
	Return StringTrimRight($sResult, StringLen($sDelimiter))
EndFunc   ;==>_GUICtrlComboBox_GetList

; #FUNCTION# ====================================================================================================================
; Name...........: _GUICtrlComboBox_GetListArray
; Description ...: Retrieves all items from the list portion of a ComboBox control
; Syntax.........: _GUICtrlComboBox_GetListArray($hWnd)
; Parameters ....: $hWnd        - Handle to control
; Return values .: Success      - Array in the following format:
;                  |[0]         - Number of items
;                  |[1]         - Item 1
;                  |[2]         - Item 2
;                  |[n]         - Item n
; Author ........: Gary Frost (gafrost)
; Modified.......:
; Remarks .......:
; Related .......: _GUICtrlComboBox_GetList
; Link ..........;
; Example .......; Yes
; ===============================================================================================================================
Func _GUICtrlComboBox_GetListArray($hWnd)
	If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
	
	Local $sDelimiter = Opt("GUIDataSeparatorChar")
	Return StringSplit(_GUICtrlComboBox_GetList($hWnd), $sDelimiter)
EndFunc   ;==>_GUICtrlComboBox_GetListArray

; #FUNCTION# ====================================================================================================================
; Name...........: _GUICtrlComboBox_GetLocale
; Description ...: Retrieves the current locale
; Syntax.........: _GUICtrlComboBox_GetLocale($hWnd)
; Parameters ....: $hWnd        - Handle to control
; Return values .: Success      - The high order word contains the country code and the low order word contains the language identifier.
; Author ........: Gary Frost (gafrost)
; Modified.......:
; Remarks .......:
; Related .......: _GUICtrlComboBox_GetLocaleCountry, _GUICtrlComboBox_GetLocaleLang
; Link ..........;
; Example .......; Yes
; ===============================================================================================================================
Func _GUICtrlComboBox_GetLocale($hWnd)
	If $Debug_CB Then _GUICtrlComboBox_ValidateClassName($hWnd)
	If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
	
	Return _SendMessage($hWnd, $CB_GETLOCALE)
EndFunc   ;==>_GUICtrlComboBox_GetLocale

; #FUNCTION# ====================================================================================================================
; Name...........: _GUICtrlComboBox_GetLocaleCountry
; Description ...: Retrieves the current country code
; Syntax.........: _GUICtrlComboBox_GetLocaleCountry($hWnd)
; Parameters ....: $hWnd        - Handle to control
; Return values .: Success      - The country code of the ComboBox
; Author ........: Gary Frost (gafrost)
; Modified.......:
; Remarks .......:
; Related .......: _GUICtrlComboBox_GetLocale
; Link ..........;
; Example .......; Yes
; ===============================================================================================================================
Func _GUICtrlComboBox_GetLocaleCountry($hWnd)
	Return _WinAPI_HiWord (_GUICtrlComboBox_GetLocale($hWnd))
EndFunc   ;==>_GUICtrlComboBox_GetLocaleCountry

; #FUNCTION# ====================================================================================================================
; Name...........: _GUICtrlComboBox_GetLocaleLang
; Description ...: Retrieves the current language identifier
; Syntax.........: _GUICtrlComboBox_GetLocaleLang($hWnd)
; Parameters ....: $hWnd        - Handle to control
; Return values .: Success      - The language code of the ComboBox
; Author ........: Gary Frost (gafrost)
; Modified.......:
; Remarks .......:
; Related .......: _GUICtrlComboBox_GetLocale
; Link ..........;
; Example .......; Yes
; ===============================================================================================================================
Func _GUICtrlComboBox_GetLocaleLang($hWnd)
	Return _WinAPI_LoWord (_GUICtrlComboBox_GetLocale($hWnd))
EndFunc   ;==>_GUICtrlComboBox_GetLocaleLang

; #FUNCTION# ====================================================================================================================
; Name...........: _GUICtrlComboBox_GetLocalePrimLang
; Description ...: Extract primary language id from a language id
; Syntax.........: _GUICtrlComboBox_GetLocalePrimLang($hWnd)
; Parameters ....: $hWnd        - Handle to control
; Return values .: Success      - Primary language id
; Author ........: Gary Frost (gafrost)
; Modified.......:
; Remarks .......:
; Related .......: _GUICtrlComboBox_GetLocale
; Link ..........;
; Example .......; Yes
; ===============================================================================================================================
Func _GUICtrlComboBox_GetLocalePrimLang($hWnd)
	Return _WinAPI_PrimaryLangId (_GUICtrlComboBox_GetLocaleLang($hWnd))
EndFunc   ;==>_GUICtrlComboBox_GetLocalePrimLang

; #FUNCTION# ====================================================================================================================
; Name...........: _GUICtrlComboBox_GetLocaleSubLang
; Description ...: Extract sublanguage id from a language id
; Syntax.........: _GUICtrlComboBox_GetLocaleSubLang($hWnd)
; Parameters ....: $hWnd        - Handle to control
; Return values .: Success      - Sub-Language id
; Author ........: Gary Frost (gafrost)
; Modified.......:
; Remarks .......:
; Related .......: _GUICtrlComboBox_GetLocale
; Link ..........;
; Example .......; Yes
; ===============================================================================================================================
Func _GUICtrlComboBox_GetLocaleSubLang($hWnd)
	Return _WinAPI_SubLangId (_GUICtrlComboBox_GetLocaleLang($hWnd))
EndFunc   ;==>_GUICtrlComboBox_GetLocaleSubLang

; #FUNCTION# ====================================================================================================================
; Name...........: _GUICtrlComboBox_GetMinVisible
; Description ...: Retrieve the minimum number of visible items in the drop-down list of a ComboBox
; Syntax.........: _GUICtrlComboBox_GetMinVisible($hWnd)
; Parameters ....: $hWnd        - Handle to control
; Return values .: Success      - True
;                  Failure      - False
; Author ........: Gary Frost (gafrost)
; Modified.......:
; Remarks .......: When the number of items in the drop-down list is greater than the minimum, the combo box uses a scrollbar.
;+
;                  This Function is ignored if the ComboBox control has style $CBS_NOINTEGRALHEIGHT
; Related .......: _GUICtrlComboBox_SetMinVisible
; Link ..........;
; Example .......; Yes
; ===============================================================================================================================
Func _GUICtrlComboBox_GetMinVisible($hWnd)
	If $Debug_CB Then _GUICtrlComboBox_ValidateClassName($hWnd)
	If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
	
	Return _SendMessage($hWnd, $CB_GETMINVISIBLE)
EndFunc   ;==>_GUICtrlComboBox_GetMinVisible

; #FUNCTION# ====================================================================================================================
; Name...........: _GUICtrlComboBox_GetTopIndex
; Description ...: Retrieve the zero-based index of the first visible item in the ListBox portion of a ComboBox
; Syntax.........: _GUICtrlComboBox_GetTopIndex($hWnd)
; Parameters ....: $hWnd        - Handle to control
; Return values .: Success      - The index of the first visible item in the ListBox of the ComboBox
;                  Failure      - -1
; Author ........: Gary Frost (gafrost)
; Modified.......:
; Remarks .......:
; Related .......: _GUICtrlComboBox_SetTopIndex
; Link ..........;
; Example .......; Yes
; ===============================================================================================================================
Func _GUICtrlComboBox_GetTopIndex($hWnd)
	If $Debug_CB Then _GUICtrlComboBox_ValidateClassName($hWnd)
	If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
	
	Return _SendMessage($hWnd, $CB_GETTOPINDEX)
EndFunc   ;==>_GUICtrlComboBox_GetTopIndex

; #FUNCTION# ====================================================================================================================
; Name...........: _GUICtrlComboBox_InitStorage
; Description ...: Allocates memory for storing ListBox items
; Syntax.........: _GUICtrlComboBox_InitStorage($hWnd, $iNum, $iBytes)
; Parameters ....: $hWnd        - Handle to control
;                  $iNum        - Number of items to add
;                  $iBytes      - The amount of memory to allocate for item strings, in bytes
; Return values .: Success      - The total number of items for which memory has been pre-allocated
;                  Failure      - $CB_ERRSPACE
; Author ........: Gary Frost (gafrost)
; Modified.......:
; Remarks .......: Helps speed up the initialization of ComboBoxes that have a large number of items (over 100).
;+
;                  You can use estimates for the $iNum and $iBytes parameters.
;                  If you overestimate, the extra memory is allocated.
;                  If you underestimate, the normal allocation is used for items that exceed the requested amount.
; Related .......: _GUICtrlComboBox_AddDir, _GUICtrlComboBox_AddString, _GUICtrlComboBox_InsertString
; Link ..........;
; Example .......; Yes
; ===============================================================================================================================
Func _GUICtrlComboBox_InitStorage($hWnd, $iNum, $iBytes)
	If $Debug_CB Then _GUICtrlComboBox_ValidateClassName($hWnd)
	If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
	
	Return _SendMessage($hWnd, $CB_INITSTORAGE, $iNum, $iBytes)
EndFunc   ;==>_GUICtrlComboBox_InitStorage

; #FUNCTION# ====================================================================================================================
; Name...........: _GUICtrlComboBox_InsertString
; Description ...: Insert a string
; Syntax.........: _GUICtrlComboBox_InsertString($hWnd, $sText[, $iIndex = -1])
; Parameters ....: $hWnd        - Handle to control
;                  $sText       - Text string to be inserted
;                  $iIndex      - Specifies the zero based index of the position at which to insert the string.
; Return values .: Success      - Zero based index of the position at which the string was inserted
;                  Failure      - -1
; Author ........: Gary Frost (gafrost)
; Modified.......:
; Remarks .......: If the $iIndex parameter is �1, the string is added to the end of the list.
;+
;                  If the ComboBox has $WS_HSCROLL style and you insert a string wider than the ComboBox,
;                  you should use the _GUICtrlComboBox_SetHorizontalExtent function to ensure the horizontal scrollbar appears.
; Related .......: _GUICtrlComboBox_AddString
; Link ..........;
; Example .......; Yes
; ===============================================================================================================================
Func _GUICtrlComboBox_InsertString($hWnd, $sText, $iIndex = -1)
	If $Debug_CB Then _GUICtrlComboBox_ValidateClassName($hWnd)
	If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
	
	If _WinAPI_InProcess ($hWnd, $_ghCBLastWnd) Then
		Return _SendMessage($hWnd, $CB_INSERTSTRING, $iIndex, $sText, 0, "int", "str")
	Else
		Local $struct_String = DllStructCreate("char Text[" & StringLen($sText) + 1 & "]")
		Local $sBuffer_pointer = DllStructGetPtr($struct_String)
		DllStructSetData($struct_String, "Text", $sText)
		Local $rMemMap
		_MemInit ($hWnd, StringLen($sText) + 1, $rMemMap)
		_MemWrite ($rMemMap, $sBuffer_pointer)
		Local $iResult = _SendMessage($hWnd, $CB_INSERTSTRING, $iIndex, $sBuffer_pointer, 0, "int", "ptr")
		_MemFree ($rMemMap)
		Return $iResult
	EndIf
EndFunc   ;==>_GUICtrlComboBox_InsertString

; #FUNCTION# ====================================================================================================================
; Name...........: _GUICtrlComboBox_LimitText
; Description ...: Limits the length of the text the user may type into the edit control of a ComboBox
; Syntax.........: _GUICtrlComboBox_LimitText($hWnd[, $iLimit = 0])
; Parameters ....: $hWnd        - Handle to control
; Return values .:
; Author ........: Gary Frost (gafrost)
; Modified.......:
; Remarks .......: If the $iLimit parameter is zero, the text length is limited to 0x7FFFFFFE characters.
;+
;                  If the ComboBox does not have the $CBS_AUTOHSCROLL style, setting the text limit to
;                  be larger than the size of the edit control has no effect.
;+
;                  The _GUICtrlComboBox_LimitText function limits only the text the user can enter.
;                  It has no effect on any text already in the edit control when the message is sent,
;                  nor does it affect the length of the text copied to the edit control when a string
;                  in the ListBox is selected.
;+
;                  The default limit to the text a user can enter in the edit control is 30,000 characters
; Related .......:
; Link ..........;
; Example .......; Yes
; ===============================================================================================================================
Func _GUICtrlComboBox_LimitText($hWnd, $iLimit = 0)
	If $Debug_CB Then _GUICtrlComboBox_ValidateClassName($hWnd)
	If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
	
	_SendMessage($hWnd, $CB_LIMITTEXT, $iLimit)
EndFunc   ;==>_GUICtrlComboBox_LimitText

; #FUNCTION# ====================================================================================================================
; Name...........: _GUICtrlComboBox_ReplaceEditSel
; Description ...: Replace text selected in edit box
; Syntax.........: _GUICtrlComboBox_ReplaceEditSel($hWnd, $sText)
; Parameters ....: $hWnd        - Handle to control
;                  $sText       - String containing the replacement text
; Return values .:
; Author ........: Gary Frost (gafrost)
; Modified.......:
; Remarks .......:
; Related .......: _GUICtrlComboBox_SetEditText, _GUICtrlComboBox_SetEditSel
; Link ..........;
; Example .......; Yes
; ===============================================================================================================================
Func _GUICtrlComboBox_ReplaceEditSel($hWnd, $sText)
	If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
	
	Local $struct_MemMap, $struct_String, $sBuffer_pointer
	Local $tInfo, $hEdit
	
	$struct_String = DllStructCreate("char Text[" & StringLen($sText) + 1 & "]")
	$sBuffer_pointer = DllStructGetPtr($struct_String)
	DllStructSetData($struct_String, "Text", $sText)

	If _GUICtrlComboBox_GetComboBoxInfo($hWnd, $tInfo) Then
		
		$hEdit = DllStructGetData($tInfo, "hEdit")
		
		_MemInit ($hEdit, StringLen($sText) + 1, $struct_MemMap)
		_MemWrite ($struct_MemMap, $sBuffer_pointer)
		_SendMessage($hEdit, $EM_REPLACESEL, True, $sBuffer_pointer, 0, "int", "ptr")
		_MemFree ($struct_MemMap)
		If @error Then Return SetError($EC_ERR, $EC_ERR, 0)
	EndIf
EndFunc   ;==>_GUICtrlComboBox_ReplaceEditSel

; #FUNCTION# ====================================================================================================================
; Name...........: _GUICtrlComboBox_ResetContent
; Description ...: Remove all items from the ListBox and edit control of a ComboBox
; Syntax.........: _GUICtrlComboBox_ResetContent($hWnd)
; Parameters ....: $hWnd        - Handle to control
; Return values .:
; Author ........: Gary Frost (gafrost)
; Modified.......:
; Remarks .......:
; Related .......: _GUICtrlComboBox_DeleteString
; Link ..........;
; Example .......; Yes
; ===============================================================================================================================
Func _GUICtrlComboBox_ResetContent($hWnd)
	If $Debug_CB Then _GUICtrlComboBox_ValidateClassName($hWnd)
	If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
	
	_SendMessage($hWnd, $CB_RESETCONTENT)
EndFunc   ;==>_GUICtrlComboBox_ResetContent

; #FUNCTION# ====================================================================================================================
; Name...........: _GUICtrlComboBox_SelectString
; Description ...: Searches the ListBox of a ComboBox for an item that begins with the characters in a specified string
; Syntax.........: _GUICtrlComboBox_SelectString($hWnd, $sText[, $iIndex = -1])
; Parameters ....: $hWnd        - Handle to control
;                  $sText       - String that contains the characters for which to search
;                  $iIndex      - Specifies the zero-based index of the item preceding the first item to be searched
; Return values .: Success      - The index of the selected item
;                  Failure      - -1
; Author ........: Gary Frost (gafrost)
; Modified.......:
; Remarks .......: When the search reaches the bottom of the list, it continues from the top of the list back to the
;                  item specified by the wParam parameter.
;+
;                  If $iIndex is �1, the entire list is searched from the beginning.
;                  A string is selected only if the characters from the starting point match the characters in the
;                  prefix string
;+
;                  If a matching item is found, it is selected and copied to the edit control
; Related .......: _GUICtrlComboBox_FindString, _GUICtrlComboBox_FindStringExact
; Link ..........;
; Example .......; Yes
; ===============================================================================================================================
Func _GUICtrlComboBox_SelectString($hWnd, $sText, $iIndex = -1)
	If $Debug_CB Then _GUICtrlComboBox_ValidateClassName($hWnd)
	If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
	
	Return _SendMessage($hWnd, $CB_SELECTSTRING, $iIndex, $sText, 0, "int", "str")
EndFunc   ;==>_GUICtrlComboBox_SelectString

; #FUNCTION# ====================================================================================================================
; Name...........: _GUICtrlComboBox_SetCurSel
; Description ...: Select a string in the list of a ComboBox
; Syntax.........: _GUICtrlComboBox_SetCurSel($hWnd[, $iIndex = -1])
; Parameters ....: $hWnd        - Handle to control
;                  $iIndex      - Specifies the zero-based index of the string to select
; Return values .: Success      - The index of the item selected
;                  Failure      - -1
; Author ........: Gary Frost (gafrost)
; Modified.......:
; Remarks .......: If $iIndex is �1, any current selection in the list is removed and the edit control is cleared.
;+
;                  If $iIndex is greater than the number of items in the list or if $iIndex is �1, the return value
;                  is -1 and the selection is cleared.
; Related .......: _GUICtrlComboBox_GetCurSel
; Link ..........;
; Example .......; Yes
; ===============================================================================================================================
Func _GUICtrlComboBox_SetCurSel($hWnd, $iIndex = -1)
	If $Debug_CB Then _GUICtrlComboBox_ValidateClassName($hWnd)
	If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
	
	Return _SendMessage($hWnd, $CB_SETCURSEL, $iIndex)
EndFunc   ;==>_GUICtrlComboBox_SetCurSel

; #FUNCTION# ====================================================================================================================
; Name...........: _GUICtrlComboBox_SetDroppedWidth
; Description ...: Set the maximum allowable width, in pixels, of the ListBox of a ComboBox
; Syntax.........: _GUICtrlComboBox_SetDroppedWidth($hWnd, $iWidth)
; Parameters ....: $hWnd        - Handle to control
;                  $iWidth      - The width of the ListBox, in pixels
; Return values .: Success      - The new width of the ListBox
;                  Failure      - -1
; Author ........: Gary Frost (gafrost)
; Modified.......:
; Remarks .......: By default, the minimum allowable width of the drop-down ListBox is zero.
;                  The width of the ListBox is either the minimum allowable width or the ComboBox width, whichever is larger.
;+
;                  Use $CBS_DROPDOWN or $CBS_DROPDOWNLIST style.
; Related .......: _GUICtrlComboBox_GetDroppedWidth
; Link ..........;
; Example .......; Yes
; ===============================================================================================================================
Func _GUICtrlComboBox_SetDroppedWidth($hWnd, $iWidth)
	If $Debug_CB Then _GUICtrlComboBox_ValidateClassName($hWnd)
	If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
	
	Return _SendMessage($hWnd, $CB_SETDROPPEDWIDTH, $iWidth)
EndFunc   ;==>_GUICtrlComboBox_SetDroppedWidth

; #FUNCTION# ====================================================================================================================
; Name...........: _GUICtrlComboBox_SetEditSel
; Description ...: Select characters in the edit control of a ComboBox
; Syntax.........: _GUICtrlComboBox_SetEditSel($hWnd, $iStart, $iStop)
; Parameters ....: $hWnd        - Handle to control
;                  $iStart      - Starting position
;                  $iStop       - Ending postions
; Return values .: Success      - True
;                  Failure      - False If the message is sent to a ComboBox with the $CBS_DROPDOWNLIST style
; Author ........: Gary Frost (gafrost)
; Modified.......:
; Remarks .......: The positions are zero-based. The first character of the edit control is in the zero position.
;                  If $iStop is �1, all text from the starting position to the last character in the edit control is selected.
;+
;                  The first character after the last selected character is in the ending position.
;+
;                  For example, to select the first four characters of the edit control, use a starting position
;                  of 0 and an ending position of 4.
; Related .......: _GUICtrlComboBox_GetEditSel
; Link ..........;
; Example .......; Yes
; ===============================================================================================================================
Func _GUICtrlComboBox_SetEditSel($hWnd, $iStart, $iStop)
	If $Debug_CB Then _GUICtrlComboBox_ValidateClassName($hWnd)
	If Not HWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
	
	Return _SendMessage($hWnd, $CB_SETEDITSEL, 0, _WinAPI_MakeLong ($iStart, $iStop)) <> -1
EndFunc   ;==>_GUICtrlComboBox_SetEditSel

; #FUNCTION# ====================================================================================================================
; Name...........: _GUICtrlComboBox_SetEditText
; Description ...: Set the text of the edit control of the ComboBox
; Syntax.........: _GUICtrlComboBox_SetEditText($hWnd, $sText)
; Parameters ....: $hWnd        - Handle to control
; Return values .:
; Author ........: Gary Frost (gafrost)
; Modified.......:
; Remarks .......:
; Related .......: _GUICtrlComboBox_GetEditText
; Link ..........;
; Example .......; Yes
; ===============================================================================================================================
Func _GUICtrlComboBox_SetEditText($hWnd, $sText)
	If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
	
	_GUICtrlComboBox_SetEditSel($hWnd, 0, -1)
	_GUICtrlComboBox_ReplaceEditSel($hWnd, $sText)
EndFunc   ;==>_GUICtrlComboBox_SetEditText

; #FUNCTION# ====================================================================================================================
; Name...........: _GUICtrlComboBox_SetExtendedUI
; Description ...: Select either the default user interface or the extended user interface
; Syntax.........: _GUICtrlComboBox_SetExtendedUI($hWnd[, $fExtended = False])
; Parameters ....: $hWnd        - Handle to control
;                  $fExtended   - Specifies whether the combo box uses the extended
; Return values .: Success      - True
;                  Failure      - False
; Author ........: Gary Frost (gafrost)
; Modified.......:
; Remarks .......: By default, the F4 key opens or closes the list and the DOWN ARROW changes the current selection.
;+
;                  In a ComboBox with the extended user interface, the F4 key is disabled and pressing the DOWN ARROW
;                  key opens the drop-down list
; Related .......: _GUICtrlComboBox_GetExtendedUI
; Link ..........;
; Example .......; Yes
; ===============================================================================================================================
Func _GUICtrlComboBox_SetExtendedUI($hWnd, $fExtended = False)
	If $Debug_CB Then _GUICtrlComboBox_ValidateClassName($hWnd)
	If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
	
	Return _SendMessage($hWnd, $CB_SETEXTENDEDUI, $fExtended) = 0
EndFunc   ;==>_GUICtrlComboBox_SetExtendedUI

; #FUNCTION# ====================================================================================================================
; Name...........: _GUICtrlComboBox_SetHorizontalExtent
; Description ...: Set the width, in pixels, by which a list box can be scrolled horizontally
; Syntax.........: _GUICtrlComboBox_SetHorizontalExtent($hWnd, $iWidth)
; Parameters ....: $hWnd        - Handle to control
;                  $iWidth      - Specifies the scrollable width of the list box, in pixels
; Return values .:
; Author ........: Gary Frost (gafrost)
; Modified.......:
; Remarks .......: If the width of the ListBox is smaller than $iWidth, the horizontal scroll bar horizontally scrolls
;                  items in the list box.
;+
;                  If the width of the ListBox is equal to or greater than $iWidth, the horizontal scroll bar is hidden
;                  or, if the ComboBox has the $CBS_DISABLENOSCROLL style, disabled.
; Related .......: _GUICtrlComboBox_GetHorizontalExtent
; Link ..........;
; Example .......; Yes
; ===============================================================================================================================
Func _GUICtrlComboBox_SetHorizontalExtent($hWnd, $iWidth)
	If $Debug_CB Then _GUICtrlComboBox_ValidateClassName($hWnd)
	If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
	
	_SendMessage($hWnd, $CB_SETHORIZONTALEXTENT, $iWidth)
EndFunc   ;==>_GUICtrlComboBox_SetHorizontalExtent

; #FUNCTION# ====================================================================================================================
; Name...........: _GUICtrlComboBox_SetItemHeight
; Description ...: Set the height of list items or the selection field in a ComboBox
; Syntax.........: _GUICtrlComboBox_SetItemHeight($hWnd, $iHeight[, $iComponent = -1])
; Parameters ....: $hWnd        - Handle to control
;                  $iHeight     - The height, in pixels, of the combo box component identified by $iComponent
;                  $iComponent  - Use the following values:
;                  |�1          - Set the height of the selection field
;                  | 0          - Set the height of list items
; Return values .: Failure      - If height is invalid, the return value is -1.
; Author ........: Gary Frost (gafrost)
; Modified.......:
; Remarks .......:
; Related .......: _GUICtrlComboBox_GetItemHeight
; Link ..........;
; Example .......; Yes
; ===============================================================================================================================
Func _GUICtrlComboBox_SetItemHeight($hWnd, $iHeight, $iComponent = -1)
	If $Debug_CB Then _GUICtrlComboBox_ValidateClassName($hWnd)
	If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
	
	Return _SendMessage($hWnd, $CB_SETITEMHEIGHT, $iComponent, $iHeight)
EndFunc   ;==>_GUICtrlComboBox_SetItemHeight

; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _GUICtrlComboBox_SetLocale
; Description ...: Set the current locale of the ComboBox
; Syntax.........: _GUICtrlComboBox_SetLocale($hWnd, $iLocale)
; Parameters ....: $hWnd        - Handle to control
;                  $iLocale     - Specifies the locale identifier for the ComboBox to use for sorting when adding text
; Return values .: Success      - The previous locale identifier
;                  Failure      - -1
; Author ........: Gary Frost (gafrost)
; Modified.......:
; Remarks .......: _WinAPI_MAKELANGID, _WinAPI_MAKELCID, _WinAPI_PrimaryLangId, _WinAPI_SubLangId
; Related .......: _GUICtrlComboBox_GetLocale
; Link ..........;
; Example .......; Yes
; ===============================================================================================================================
Func _GUICtrlComboBox_SetLocale($hWnd, $iLocal)
	If $Debug_CB Then _GUICtrlComboBox_ValidateClassName($hWnd)
	If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
	
	Return _SendMessage($hWnd, $CB_SETLOCALE, $iLocal)
EndFunc   ;==>_GUICtrlComboBox_SetLocale

; #FUNCTION# ====================================================================================================================
; Name...........: _GUICtrlComboBox_SetMinVisible
; Description ...: Set the minimum number of visible items in the drop-down list of a ComboBox
; Syntax.........: _GUICtrlComboBox_SetMinVisible($hWnd, $iMinimum)
; Parameters ....: $hWnd        - Handle to control
;                  $iMinimum    - Specifies the minimum number of visible items
; Return values .: Success      - True
;                  Failure      - False
; Author ........: Gary Frost (gafrost)
; Modified.......:
; Remarks .......: When the number of items in the drop-down list is greater than the minimum,
;                  the Combobbox uses a scrollbar. By default, 30 is the minimum number of visible items.
;+
;                  This message is ignored if the combo box control has style $CBS_NOINTEGRALHEIGHT.
; Related .......: _GUICtrlComboBox_GetMinVisible
; Link ..........;
; Example .......; Yes
; ===============================================================================================================================
Func _GUICtrlComboBox_SetMinVisible($hWnd, $iMinimum)
	If $Debug_CB Then _GUICtrlComboBox_ValidateClassName($hWnd)
	If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
	
	Return _SendMessage($hWnd, $CB_SETMINVISIBLE, $iMinimum) <> 0
EndFunc   ;==>_GUICtrlComboBox_SetMinVisible

; #FUNCTION# ====================================================================================================================
; Name...........: _GUICtrlComboBox_SetTopIndex
; Description ...: Ensure that a particular item is visible in the ListBox of a ComboBox
; Syntax.........: _GUICtrlComboBox_SetTopIndex($hWnd, $iIndex)
; Parameters ....: $hWnd        - Handle to control
;                  $iIndex      - Specifies the zero-based index of the list item
; Return values .: Success      - True
;                  Failure      - False
; Author ........: Gary Frost (gafrost)
; Modified.......:
; Remarks .......: The system scrolls the ListBox contents so that either the specified item appears at the top
;                  of the list box or the maximum scroll range has been reached.
; Related .......: _GUICtrlComboBox_GetTopIndex
; Link ..........;
; Example .......; Yes
; ===============================================================================================================================
Func _GUICtrlComboBox_SetTopIndex($hWnd, $iIndex)
	If $Debug_CB Then _GUICtrlComboBox_ValidateClassName($hWnd)
	If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
	
	Return _SendMessage($hWnd, $CB_SETTOPINDEX, $iIndex) = 0
EndFunc   ;==>_GUICtrlComboBox_SetTopIndex

; #FUNCTION# ====================================================================================================================
; Name...........: _GUICtrlComboBox_ShowDropDown
; Description ...: Show or hide the ListBox of a ComboBox
; Syntax.........: _GUICtrlComboBox_ShowDropDown($hWnd[, $fShow = False])
; Parameters ....: $hWnd        - Handle to control
;                  $fShow       - Specifies whether the drop-down ListBox is to be shown or hidden:
;                  | True       - Show ListBox
;                  |False       - Hide ListBox
; Return values .:
; Author ........: Gary Frost (gafrost)
; Modified.......:
; Remarks .......: This function has no effect on a ComboBox created with the $CBS_SIMPLE style.
; Related .......: _GUICtrlComboBox_GetDroppedState
; Link ..........;
; Example .......; Yes
; ===============================================================================================================================
Func _GUICtrlComboBox_ShowDropDown($hWnd, $fShow = False)
	If $Debug_CB Then _GUICtrlComboBox_ValidateClassName($hWnd)
	If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
	
	_SendMessage($hWnd, $CB_SHOWDROPDOWN, $fShow)
EndFunc   ;==>_GUICtrlComboBox_ShowDropDown

; #INTERNAL_USE_ONLY#============================================================================================================
; Name...........: _GUICtrlComboBox_ValidateClassName
; Description ...: Used for debugging when creating examples
; Syntax.........: _GUICtrlComboBox_ValidateClassName($hWnd[, $iLine = @ScriptLineNumber])
; Parameters ....: $hWnd        - Handle to the control
; Return values .: None
; Author ........: Gary Frost (gafrost)
; Modified.......:
; Remarks .......: For Internal Use Only
; Related .......:
; Link ..........;
; Example .......;
; ===============================================================================================================================
Func _GUICtrlComboBox_ValidateClassName($hWnd, $sType = "ComboBox")
	_GUICtrlComboBox_DebugPrint("This is for debugging only, set the debug variable to false before submitting")
	_WinAPI_ValidateClassName ($hWnd, $sType)
EndFunc   ;==>_GUICtrlComboBox_ValidateClassName