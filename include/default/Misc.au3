#include-once
#include "Constants.au3"
#include "Structures.au3"
#include "WinAPI.au3"

; #INDEX# =======================================================================================================================
; Title .........: Misc
; AutoIt Version: 3.1.1++
; Language:       English
; Description:    Functions that assist with Common Dialogs.
; ===============================================================================================================================

#cs==============================================================================================================================
	; #CURRENT# =====================================================================================================================
	_ChooseColor
	_ChooseFont
	_ClipPutFile
	_Iif
	_MouseTrap
	_Singleton
	_IsPressed
	_SendMessage
	_SendMessageA
	_VersionCompare
#ce==============================================================================================================================

; #FUNCTION# ====================================================================================================================
; Name...........: _ChooseColor
; Description ...: Creates a Color dialog box that enables the user to select a color
; Syntax.........: _ChooseColor([$iReturnType = 0[, $iColorRef = 0[, $iRefType = 0[, $hWndOwnder = 0]]]])
; Parameters ....: $iReturnType - Determines return type, valid values:
;                  |0 - COLORREF rgbcolor
;                  |1 - BGR hex
;                  |2 - RGB hex
;                  $iColorRef   - Default selected Color
;                  $iRefType    - Type of $iColorRef passed in, valid values:
;                  |0 - COLORREF rgbcolor
;                  |1 - BGR hex
;                  |2 - RGB hex
;                  $hWndOwnder  - Handle to the window that owns the dialog box
; Return values .: Success      - Color returned
;                  Failure      - -1
; Author ........: Gary Frost (gafrost)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........;
; Example .......; Yes
; ===============================================================================================================================
Func _ChooseColor($iReturnType = 0, $iColorRef = 0, $iRefType = 0, $hWndOwnder = 0)
	Local $custcolors = "int[16]", $tcc, $tChoose, $color_picked, $iResult
	
	$tChoose = DllStructCreate($tagCHOOSECOLOR)
	$tcc = DllStructCreate($custcolors)
	
	If ($iRefType == 1) Then     ; BGR hex color to colorref
		$iColorRef = Int($iColorRef)
	ElseIf ($iRefType == 2) Then ; RGB hex color to colorref
		$iColorRef = Hex(String($iColorRef), 6)
		$iColorRef = '0x' & StringMid($iColorRef, 5, 2) & StringMid($iColorRef, 3, 2) & StringMid($iColorRef, 1, 2)
	EndIf
	
	DllStructSetData($tChoose, "Size", DllStructGetSize($tChoose))
	DllStructSetData($tChoose, "hWndOwnder", $hWndOwnder)
	DllStructSetData($tChoose, "rgbResult", $iColorRef)
	DllStructSetData($tChoose, "CustColors", DllStructGetPtr($tcc))
	DllStructSetData($tChoose, "Flags", BitOR($CC_ANYCOLOR, $CC_FULLOPEN, $CC_RGBINIT))
	
	$iResult = DllCall("comdlg32.dll", "long", "ChooseColor", "ptr", DllStructGetPtr($tChoose))
	
	If ($iResult[0] == 0) Then Return SetError(-3, -3, -1) ; user selected cancel or struct settings incorrect
	
	$color_picked = DllStructGetData($tChoose, "rgbResult")
	
	If ($iReturnType == 1) Then     ; return Hex BGR Color
		Return '0x' & Hex(String($color_picked), 6)
	ElseIf ($iReturnType == 2) Then ; return Hex RGB Color
		$color_picked = Hex(String($color_picked), 6)
		Return '0x' & StringMid($color_picked, 5, 2) & StringMid($color_picked, 3, 2) & StringMid($color_picked, 1, 2)
	ElseIf ($iReturnType == 0) Then ; return RGB COLORREF
		Return $color_picked
	Else
		Return SetError(-4, -4, -1)
	EndIf
EndFunc   ;==>_ChooseColor

; #FUNCTION# ====================================================================================================================
; Name...........: _ChooseFont
; Description ...: Creates a Font dialog box that enables the user to choose attributes for a logical font.
; Syntax.........: _ChooseFont([$sFontName = "Courier New"[, $iPointSize = 10[, $iColorRef = 0[, $iFontWeight = 0[, $iItalic = False[, $iUnderline = False[, $iStrikethru = False[, $hWndOwner = 0]]]]]]]])
; Parameters ....: $sFontName   - Default font name
;                  $iPointSize  - Pointsize of font
;                  $iColorRef   - COLORREF rgbColors
;                  $iFontWeight - Font Weight
;                  $iItalic     - Italic
;                  $iUnderline  - Underline
;                  $iStrikethru - Optional: Strikethru
; Return values .: Success      - Array in the following format:
;                  |[0] - contains the number of elements
;                  |[1] - attributes = BitOr of italic:2, undeline:4, strikeout:8
;                  |[2] - fontname
;                  |[3] - font size = point size
;                  |[4] - font weight = = 0-1000
;                  |[5] - COLORREF rgbColors
;                  |[6] - Hex BGR Color
;                  |[7] - Hex RGB Color
;                  Failure      - -1
; Author ........: Gary Frost (gafrost)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........;
; Example .......; Yes
; ===============================================================================================================================
Func _ChooseFont($sFontName = "Courier New", $iPointSize = 10, $iColorRef = 0, $iFontWeight = 0, $iItalic = False, $iUnderline = False, $iStrikethru = False, $hWndOwner = 0)
	Local $tLogFont, $tChooseFont, $lngDC, $lfHeight, $iResult
	Local $fontname, $italic = 0, $underline = 0, $strikeout = 0
	Local $attributes, $size, $weight, $colorref, $color_picked

	
	$lngDC = _WinAPI_GetDC (0)
	$lfHeight = Round(($iPointSize * _WinAPI_GetDeviceCaps ($lngDC, $LOGPIXELSX)) / 72, 0)
	_WinAPI_ReleaseDC (0, $lngDC)
	
	$tChooseFont = DllStructCreate($tagCHOOSEFONT)
	$tLogFont = DllStructCreate($tagLOGFONT)
	
	DllStructSetData($tChooseFont, "Size", DllStructGetSize($tChooseFont))
	DllStructSetData($tChooseFont, "hWndOwner", $hWndOwner)
	DllStructSetData($tChooseFont, "LogFont", DllStructGetPtr($tLogFont))
	DllStructSetData($tChooseFont, "PointSize", $iPointSize)
	DllStructSetData($tChooseFont, "Flags", BitOR($CF_SCREENFONTS, $CF_PRINTERFONTS, $CF_EFFECTS, $CF_INITTOLOGFONTSTRUCT, $CF_NOSCRIPTSEL))
	DllStructSetData($tChooseFont, "rgbColors", $iColorRef)
	DllStructSetData($tChooseFont, "FontType", 0)
	
	DllStructSetData($tLogFont, "Height", $lfHeight)
	DllStructSetData($tLogFont, "Weight", $iFontWeight)
	DllStructSetData($tLogFont, "Italic", $iItalic)
	DllStructSetData($tLogFont, "Underline", $iUnderline)
	DllStructSetData($tLogFont, "Strikeout", $iStrikethru)
	DllStructSetData($tLogFont, "FaceName", $sFontName)
	
	$iResult = DllCall("comdlg32.dll", "long", "ChooseFont", "ptr", DllStructGetPtr($tChooseFont))
	If ($iResult[0] == 0) Then Return SetError(-3, -3, -1) 	; user selected cancel or struct settings incorrect
	
	$fontname = DllStructGetData($tLogFont, "FaceName")
	If (StringLen($fontname) == 0 And StringLen($sFontName) > 0) Then $fontname = $sFontName
	
	If (DllStructGetData($tLogFont, "Italic")) Then $italic = 2
	If (DllStructGetData($tLogFont, "Underline")) Then $underline = 4
	If (DllStructGetData($tLogFont, "Strikeout")) Then $strikeout = 8
	
	$attributes = BitOR($italic, $underline, $strikeout)
	$size = DllStructGetData($tChooseFont, "PointSize") / 10
	$colorref = DllStructGetData($tChooseFont, "rgbColors")
	$weight = DllStructGetData($tLogFont, "Weight")
	
	$color_picked = Hex(String($colorref), 6)
	
	Return StringSplit($attributes & "," & $fontname & "," & $size & "," & $weight & "," & $colorref & "," & '0x' & $color_picked & "," & '0x' & StringMid($color_picked, 5, 2) & StringMid($color_picked, 3, 2) & StringMid($color_picked, 1, 2), ",")
EndFunc   ;==>_ChooseFont

; #FUNCTION# ====================================================================================================================
; Name...........: _ClipPutFile
; Description ...: Copy Files to Clipboard Like Explorer does
; Syntax.........: _ClipPutFile($sFile[, $sSeperator = "|"])
; Parameters ....: $sFile       - Full Path to File(s)
;                  $sSeperator  - Seperator for multiple Files, Default = '|'
; Return values .: Success      - True
;                  Failure      - False and Sets @ERROR to:
;                  |1 - Unable to Open Clipboard
;                  |2 - Unable to Empty Cipboard
;                  |3 - GlobalAlloc Failed
;                  |4 - GlobalLock Failed
;                  |5 - Unable to Create H_DROP
;                  |6 - Unable to Update Clipboard
;                  |7 - Unable to Close Clipboard
;                  |8 - GlobalUnlock Failed
; Author ........: Piccaso (Florian Fida)
; Modified.......: Gary Frost (gafrost)
; Remarks .......:
; Related .......:
; Link ..........;
; Example .......; Yes
; ===============================================================================================================================
Func _ClipPutFile($sFile, $sSeperator = "|")
	Local $vDllCallTmp, $nGlobMemSize, $hGlobal, $DROPFILES, $i, $hLock
	Local $GMEM_MOVEABLE = 0x0002, $CF_HDROP = 15
	$sFile = $sFile & $sSeperator & $sSeperator
	$nGlobMemSize = StringLen($sFile) + 20 ; 20 = size of DROPFILES whitout buffer
	$vDllCallTmp = DllCall("user32.dll", "int", "OpenClipboard", "hwnd", 0)
	
	If @error Or $vDllCallTmp[0] = 0 Then Return SetError(1, 1, False)
	
	$vDllCallTmp = DllCall("user32.dll", "int", "EmptyClipboard")
	If @error Or $vDllCallTmp[0] = 0 Then Return SetError(2, 2, False)
	
	$vDllCallTmp = DllCall("kernel32.dll", "hwnd", "GlobalAlloc", "int", $GMEM_MOVEABLE, "int", $nGlobMemSize)
	If @error Or $vDllCallTmp[0] < 1 Then Return SetError(3, 3, False)
	
	$hGlobal = $vDllCallTmp[0]
	$vDllCallTmp = DllCall("kernel32.dll", "hwnd", "GlobalLock", "long", $hGlobal)
	If @error Or $vDllCallTmp[0] < 1 Then Return SetError(4, 4, False)
	
	$hLock = $vDllCallTmp[0]
	$DROPFILES = DllStructCreate("dword;ptr;int;int;int;byte[" & StringLen($sFile) & "]", $hLock)
	If @error Then Return SetError(5, 6, False)
	
	DllStructSetData($DROPFILES, 1, DllStructGetSize($DROPFILES) - StringLen($sFile))
	DllStructSetData($DROPFILES, 2, 0)
	DllStructSetData($DROPFILES, 3, 0)
	DllStructSetData($DROPFILES, 4, 0)
	DllStructSetData($DROPFILES, 5, 0)
	DllStructSetData($DROPFILES, 6, $sFile)
	For $i = 1 To StringLen($sFile)
		If DllStructGetData($DROPFILES, 6, $i) = Asc($sSeperator) Then DllStructSetData($DROPFILES, 6, 0, $i)
	Next
	$vDllCallTmp = DllCall("user32.dll", "long", "SetClipboardData", "int", $CF_HDROP, "long", $hGlobal)
	If @error Or $vDllCallTmp[0] < 1 Then
		$DROPFILES = 0
		Return SetError(6, 6, False)
	EndIf
	$vDllCallTmp = DllCall("user32.dll", "int", "CloseClipboard")
	If @error Or $vDllCallTmp[0] = 0 Then
		$DROPFILES = 0
		Return SetError(7, 7, False)
	EndIf
	$vDllCallTmp = DllCall("kernel32.dll", "int", "GlobalUnlock", "long", $hGlobal)
	If @error Then
		$DROPFILES = 0
		Return SetError(8, 8, False)
	EndIf
	$vDllCallTmp = DllCall("kernel32.dll", "int", "GetLastError")
	If $vDllCallTmp = 0 Then
		$DROPFILES = 0
		Return SetError(8, 9, False)
	Else
		$DROPFILES = 0
		Return True
	EndIf
EndFunc   ;==>_ClipPutFile

; #FUNCTION# ====================================================================================================================
; Name...........: _Iif
; Description ...: Perform a boolean test within an expression.
; Syntax.........: _Iif($fTest, $vTrueVal, $vFalseVal)
; Parameters ....: $fTest     - Boolean test.
;                  $vTrueVal  - Value to return if $fTest is true.
;                  $vFalseVal - Value to return if $fTest is false.
; Return values .: True         - $vTrueVal
;                  False        - $vFalseVal
; Author ........: Dale (Klaatu) Thompson
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........;
; Example .......; Yes
; ===============================================================================================================================
Func _Iif($fTest, $vTrueVal, $vFalseVal)
	If $fTest Then
		Return $vTrueVal
	Else
		Return $vFalseVal
	EndIf
EndFunc   ;==>_Iif

; #FUNCTION# ====================================================================================================================
; Name...........: _MouseTrap
; Description ...: Confine the Mouse Cursor to specified coords.
; Syntax.........: _MouseTrap([$iLeft = 0[, $iTop = 0[, $iRight = 0[, $iBottom = 0]]]])
; Parameters ....: $iLeft   - Left coord
;                  $iTop    - Top coord
;                  $iRight  - Right coord
;                  $iBottom - Bottom coord
; Return values .: Success      - True
;                  Failure      - False
; Author ........: Gary Frost (gafrost)
; Modified.......:
; Remarks .......: Use _MouseTrap() with no params to release the Mouse Cursor
; Related .......:
; Link ..........;
; Example .......; Yes
; ===============================================================================================================================
Func _MouseTrap($iLeft = 0, $iTop = 0, $iRight = 0, $iBottom = 0)
	Local $iResult, $tRect
	If @NumParams == 0 Then
		$iResult = DllCall("user32.dll", "int", "ClipCursor", "int", 0)
	Else
		If @NumParams == 2 Then
			$iRight = $iLeft + 1
			$iBottom = $iTop + 1
		EndIf
		$tRect = DllStructCreate($tagRect)
		If @error Then Return 0
		DllStructSetData($tRect, "Left", $iLeft)
		DllStructSetData($tRect, "Top", $iTop)
		DllStructSetData($tRect, "Right", $iRight)
		DllStructSetData($tRect, "Bottom", $iBottom)
		$iResult = DllCall("user32.dll", "int", "ClipCursor", "ptr", DllStructGetPtr($tRect))
	EndIf
	Return $iResult[0] <> 0
EndFunc   ;==>_MouseTrap

; #FUNCTION# ====================================================================================================================
; Name...........: _Singleton
; Description ...: Check if no other occurence is running
; Syntax.........: _Singleton($sOccurenceName[, $iFlag = 0])
; Parameters ....: $sOccurenceName - String to identify the occurrence of the script
;                  $iFlag          - Action if @error
;                  |0 - Exit if occurrence already exists
;                  |1 - Return if occurrence already exists
; Return values .: Success      - 1
;                  Failure      - 0
; Author ........: Valik
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........;
; Example .......; Yes
; ===============================================================================================================================
Func _Singleton($sOccurenceName, $iFlag = 0)
	Local $ERROR_ALREADY_EXISTS = 183, $handle, $lastError
	
	$sOccurenceName = StringReplace($sOccurenceName, "\", "") ; to avoid error
	;$handle = DllCall("kernel32.dll", "int", "CreateSemaphore", "int", 0, "long", 1, "long", 1, "str", $sOccurenceName)
	$handle = DllCall("kernel32.dll", "int", "CreateMutex", "int", 0, "long", 1, "str", $sOccurenceName)
	$lastError = DllCall("kernel32.dll", "int", "GetLastError")
	If $lastError[0] = $ERROR_ALREADY_EXISTS Then
		If $iFlag = 0 Then
			Exit -1
		Else
			Return SetError($lastError[0], $lastError[0], 0)
		EndIf
	EndIf
	Return $handle[0]
EndFunc   ;==>_Singleton

; #FUNCTION# ====================================================================================================================
; Name...........: _IsPressed
; Description ...: Check if key has been pressed
; Syntax.........: _IsPressed($sHexKey[, $vDLL = 'user32.dll'])
; Parameters ....: $sHexKey     - Key to check for
;                  $vDLL        - Handle to dll or default to user32.dll
; Return values .: True         - 1
;                  False        - 0
; Author ........: ezzetabi and Jon
; Modified.......:
; Remarks .......: If calling this function repeatidly, should open 'user32.dll' and pass in handle.
;                  Make sure to close at end of script
; Related .......:
; Link ..........;
; Example .......; Yes
; ===============================================================================================================================
Func _IsPressed($sHexKey, $vDLL = 'user32.dll')
	; $hexKey must be the value of one of the keys.
	; _Is_Key_Pressed will return 0 if the key is not pressed, 1 if it is.
	Local $a_R = DllCall($vDLL, "int", "GetAsyncKeyState", "int", '0x' & $sHexKey)
	If Not @error And BitAND($a_R[0], 0x8000) = 0x8000 Then Return 1
	Return 0
EndFunc   ;==>_IsPressed

; #FUNCTION# ====================================================================================================================
; Name...........: _SendMessage
; Description ...: Wrapper for commonly used Dll Call
; Syntax.........: _SendMessage($hWnd, $iMsg[, $wParam = 0[, $lParam = 0[, $iReturn = 0[, $wParamType = "int"[, $lParamType = "int"[, $sReturnType = "long"]]]]]])
; Parameters ....: $hWnd       - Window/control handle
;                  $iMsg       - Message to send to control (number)
;                  $wParam     - Specifies additional message-specific information
;                  $lParam     - Specifies additional message-specific information
;                  $iReturn    - What to return:
;                  |0 - Return value from dll call
;                  |1 - $ihWnd
;                  |2 - $iMsg
;                  |3 - $wParam
;                  |4 - $lParam
;                  |<0 or > 4 - array same as dllcall
;                  $wParamType - Specifies what type of additional information
;                  $lParamType - Specifies what type of additional information
;                  $sReturnType - Can be one of the following returned when $iReturn = 0:
;                  |none      - no value (only valid for return type - equivalent to void in C)
;                  |byte      - a 8 bit integer
;                  |ubyte     - an unsigned8 bit integer
;                  |short     - a 16 bit integer
;                  |ushort    - an unsigned 16 bit integer
;                  |dword     - a 32 bit integer
;                  |udword    - an unsigned 32 bit integer
;                  |int       - a 32 bit integer
;                  |uint      - an unsigned 32 bit integer
;                  |long      - a 32 bit integer
;                  |short* - a pointer to a 16 bit integer
;                  |int*   - a pointer to a 32 bit integer
;                  |long*  - a pointer to a 32 bit integer
;                  |str       - a string (cannot be more than 65536)
;                  |wstr      - a wide character string (converted to/from an ANSI string during the call). Cannot be more than 65536
;                  |hwnd      - a window handle
;                  |ptr       - a general pointer (void *)
;                  |float     - a single precision floating point number
; Return values .: Success      - User selected value from the DllCall() result
;                  Failure      - @error is set
; Author ........: Valik
; Modified.......: Gary Frost (GaryFrost) aka gafrost
; Remarks .......:
; Related .......: _SendMessageA
; Link ..........;
; Example .......; Yes
; ===============================================================================================================================
Func _SendMessage($hWnd, $iMsg, $wParam = 0, $lParam = 0, $iReturn = 0, $wParamType = "int", $lParamType = "int", $sReturnType = "long")
	Local $aResult = DllCall("user32.dll", $sReturnType, "SendMessage", "hwnd", $hWnd, "int", $iMsg, $wParamType, $wParam, $lParamType, $lParam)
	If @error Then Return SetError(@error, @extended, "")
	If $iReturn >= 0 And $iReturn <= 4 Then Return $aResult[$iReturn]
	Return $aResult
EndFunc   ;==>_SendMessage

; #FUNCTION# ====================================================================================================================
; Name...........: _SendMessageA
; Description ...: Wrapper for commonly used Dll Call (Force Ansi Call)
; Syntax.........: _SendMessageA($hWnd, $iMsg[, $wParam = 0[, $lParam = 0[, $iReturn = 0[, $wParamType = "int"[, $lParamType = "int"[, $sReturnType = "long"]]]]]])
; Parameters ....: $hWnd       - Window/control handle
;                  $iMsg       - Message to send to control (number)
;                  $wParam     - Specifies additional message-specific information
;                  $lParam     - Specifies additional message-specific information
;                  $iReturn    - What to return:
;                  |0 - Return value from dll call
;                  |1 - $ihWnd
;                  |2 - $iMsg
;                  |3 - $wParam
;                  |4 - $lParam
;                  |<0 or > 4 - array same as dllcall
;                  $wParamType - Specifies what type of additional information
;                  $lParamType - Specifies what type of additional information
;                  $sReturnType - Can be one of the following returned when $iReturn = 0:
;                  |none      - no value (only valid for return type - equivalent to void in C)
;                  |byte      - a 8 bit integer
;                  |ubyte     - an unsigned8 bit integer
;                  |short     - a 16 bit integer
;                  |ushort    - an unsigned 16 bit integer
;                  |dword     - a 32 bit integer
;                  |udword    - an unsigned 32 bit integer
;                  |int       - a 32 bit integer
;                  |uint      - an unsigned 32 bit integer
;                  |long      - a 32 bit integer
;                  |short* - a pointer to a 16 bit integer
;                  |int*   - a pointer to a 32 bit integer
;                  |long*  - a pointer to a 32 bit integer
;                  |str       - a string (cannot be more than 65536)
;                  |wstr      - a wide character string (converted to/from an ANSI string during the call). Cannot be more than 65536
;                  |hwnd      - a window handle
;                  |ptr       - a general pointer (void *)
;                  |float     - a single precision floating point number
; Return values .: Success      - User selected value from the DllCall() result
;                  Failure      - @error is set
; Author ........: Valik
; Modified.......: Gary Frost (GaryFrost) aka gafrost
; Remarks .......:
; Related .......: _SendMessage
; Link ..........;
; Example .......;
; ===============================================================================================================================
Func _SendMessageA($hWnd, $iMsg, $wParam = 0, $lParam = 0, $iReturn = 0, $wParamType = "int", $lParamType = "int", $sReturnType = "long")
	Local $aResult = DllCall("user32.dll", $sReturnType, "SendMessageA", "hwnd", $hWnd, "int", $iMsg, $wParamType, $wParam, $lParamType, $lParam)
	If @error Then Return SetError(@error, @extended, "")
	If $iReturn >= 0 And $iReturn <= 4 Then Return $aResult[$iReturn]
	Return $aResult
EndFunc   ;==>_SendMessageA

; #FUNCTION# ====================================================================================================================
; Name...........: _VersionCompare
; Description ...: Compares two file versions for equality
; Syntax.........: _VersionCompare($sVersion1, $sVersion2)
; Parameters ....: $sVersion1   - IN - The first version
;                  $sVersion2   - IN - The second version
; Return values .: Success      - Following Values:
;                  | 0          - Both versions equal
;                  | 1          - Version 1 greater
;                  |-1          - Version 2 greater
;                  Failure      - @error will be set in the event of a catasrophic error
; Author ........: Valik
; Modified.......:
; Remarks .......: This will try to use a numerical comparison but fall back on a lexicographical comparison.
;                  See @extended for details about which type was performed.
; Related .......:
; Link ..........;
; Example .......;
; ===============================================================================================================================
Func _VersionCompare($sVersion1, $sVersion2)
	If $sVersion1 = $sVersion2 Then Return 0
	Local $sep = "."
	If StringInStr($sVersion1, $sep) = 0 Then $sep = ","
	Local $aVersion1 = StringSplit($sVersion1, $sep)
	Local $aVersion2 = StringSplit($sVersion2, $sep)
	If UBound($aVersion1) <> UBound($aVersion2) Or UBound($aVersion1) = 0 Then
		; Compare as strings
		SetExtended(1)
		If $sVersion1 > $sVersion2 Then
			Return 1
		ElseIf $sVersion1 < $sVersion2 Then
			Return -1
		EndIf
	Else
		For $i = 1 To UBound($aVersion1) - 1
			; Compare this segment as numbers
			If StringIsDigit($aVersion1[$i]) And StringIsDigit($aVersion2[$i]) Then
				If Number($aVersion1[$i]) > Number($aVersion2[$i]) Then
					Return 1
				ElseIf Number($aVersion1[$i]) < Number($aVersion2[$i]) Then
					Return -1
				EndIf
			Else	; Compare the segment as strings
				SetExtended(1)
				If $aVersion1[$i] > $aVersion2[$i] Then
					Return 1
				ElseIf $aVersion1[$i] < $aVersion2[$i] Then
					Return -1
				EndIf
			EndIf
		Next
	EndIf
	; This point should never be reached
	SetError(2)
	Return 0
EndFunc   ;==>_VersionCompare