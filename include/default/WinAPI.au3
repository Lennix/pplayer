#include-once
#include "WindowsConstants.au3"
#include "Constants.au3"
#include "Structures.au3"
#include "Security.au3"
#include "Misc.au3"

; #INDEX# =======================================================================================================================
; Title .........: Windows API
; Description ...: This module contains various Windows API calls that have been translated to AutoIt functions.
; Author ........: Paul Campbell (PaulIA)
; ===============================================================================================================================

; #VARIABLES# ===================================================================================================================
Global $winapi_gaInProcess[64][2] = [[0, 0]]
Global $winapi_gaWinList[64][2] = [[0, 0]]
; ===============================================================================================================================

#cs==============================================================================================================================
	
	; #CURRENT# =====================================================================================================================
	_WinAPI_AttachConsole
	_WinAPI_AttachThreadInput
	_WinAPI_Beep
	_WinAPI_BitBlt
	_WinAPI_Check
	_WinAPI_ClientToScreen
	_WinAPI_CloseHandle
	_WinAPI_CopyIcon
	_WinAPI_CreateBitmap
	_WinAPI_CreateCompatibleBitmap
	_WinAPI_CreateCompatibleDC
	_WinAPI_CreateEvent
	_WinAPI_CreateFile
	_WinAPI_CreateFontIndirect
	_WinAPI_CreateProcess
	_WinAPI_CreateSolidBitmap
	_WinAPI_CreateWindowEx
	_WinAPI_DefWindowProc
	_WinAPI_DeleteDC
	_WinAPI_DeleteObject
	_WinAPI_DestroyIcon
	_WinAPI_DestroyWindow
	_WinAPI_DrawIcon
	_WinAPI_DrawIconEx
	_WinAPI_DrawText
	_WinAPI_EnableWindow
	_WinAPI_EnumDisplayDevices
	_WinAPI_EnumWindows
	_WinAPI_EnumWindowsPopup
	_WinAPI_EnumWindowsTop
	_WinAPI_ExpandEnvironmentStrings
	_WinAPI_ExtractIconEx
	_WinAPI_FatalAppExit
	_WinAPI_FindExecutable
	_WinAPI_FindWindow
	_WinAPI_FlashWindow
	_WinAPI_FlashWindowEx
	_WinAPI_FloatToInt
	_WinAPI_FlushFileBuffers
	_WinAPI_FormatMessage
	_WinAPI_FreeLibrary
	_WinAPI_GetAncestor
	_WinAPI_GetAsyncKeyState
	_WinAPI_GetClassName
	_WinAPI_GetClientHeight
	_WinAPI_GetClientWidth
	_WinAPI_GetClientRect
	_WinAPI_GetCurrentProcess
	_WinAPI_GetCurrentProcessID
	_WinAPI_GetCurrentThread
	_WinAPI_GetCurrentThreadId
	_WinAPI_GetCursorInfo
	_WinAPI_GetDC
	_WinAPI_GetDesktopWindow
	_WinAPI_GetDeviceCaps
	_WinAPI_GetDIBits
	_WinAPI_GetDlgCtrlID
	_WinAPI_GetDlgItem
	_WinAPI_GetFocus
	_WinAPI_GetForegroundWindow
	_WinAPI_GetIconInfo
	_WinAPI_GetFileSizeEx
	_WinAPI_GetLastError
	_WinAPI_GetLastErrorMessage
	_WinAPI_GetModuleHandle
	_WinAPI_GetMousePos
	_WinAPI_GetMousePosX
	_WinAPI_GetMousePosY
	_WinAPI_GetObject
	_WinAPI_GetOverlappedResult
	_WinAPI_GetParent
	_WinAPI_GetProcessAffinityMask
	_WinAPI_GetStockObject
	_WinAPI_GetStdHandle
	_WinAPI_GetSysColor
	_WinAPI_GetSysColorBrush
	_WinAPI_GetSystemMetrics
	_WinAPI_GetTextExtentPoint32
	_WinAPI_GetWindow
	_WinAPI_GetWindowDC
	_WinAPI_GetWindowHeight
	_WinAPI_GetWindowLong
	_WinAPI_GetWindowRect
	_WinAPI_GetWindowText
	_WinAPI_GetWindowThreadProcessId
	_WinAPI_GetWindowWidth
	_WinAPI_GlobalMemStatus
	_WinAPI_GUIDFromString
	_WinAPI_GUIDFromStringEx
	_WinAPI_HiWord
	_WinAPI_InProcess
	_WinAPI_IntToFloat
	_WinAPI_IsClassName
	_WinAPI_IsWindow
	_WinAPI_IsWindowVisible
	_WinAPI_InvalidateRect
	_WinAPI_LoadBitmap
	_WinAPI_LoadImage
	_WinAPI_LoadLibrary
	_WinAPI_LoadLibraryEx
	_WinAPI_LoadShell32Icon
	_WinAPI_LocalFree
	_WinAPI_LoWord
	_WinAPI_MakeDWord
	_WinAPI_MAKELANGID
	_WinAPI_MAKELCID
	_WinAPI_MakeLong
	_WinAPI_MessageBeep
	_WinAPI_MsgBox
	_WinAPI_Mouse_Event
	_WinAPI_MoveWindow
	_WinAPI_MulDiv
	_WinAPI_MultiByteToWideChar
	_WinAPI_MultiByteToWideCharEx
	_WinAPI_OpenProcess
	_WinAPI_PostMessage
	_WinAPI_PrimaryLangId
	_WinAPI_PtInRect
	_WinAPI_ReadFile
	_WinAPI_ReadProcessMemory
	_WinAPI_RectIsEmpty
	_WinAPI_RedrawWindow
	_WinAPI_RegisterWindowMessage
	_WinAPI_ReleaseCapture
	_WinAPI_ReleaseDC
	_WinAPI_ScreenToClient
	_WinAPI_SelectObject
	_WinAPI_SetBkColor
	_WinAPI_SetCapture
	_WinAPI_SetCursor
	_WinAPI_SetDefaultPrinter
	_WinAPI_SetDIBits
	_WinAPI_SetEvent
	_WinAPI_SetFocus
	_WinAPI_SetFont
	_WinAPI_SetHandleInformation
	_WinAPI_SetLastError
	_WinAPI_SetParent
	_WinAPI_SetProcessAffinityMask
	_WinAPI_SetTextColor
	_WinAPI_SetWindowLong
	_WinAPI_SetWindowPos
	_WinAPI_SetWindowText
	_WinAPI_ShowCursor
	_WinAPI_ShowError
	_WinAPI_ShowMsg
	_WinAPI_ShowWindow
	_WinAPI_StringFromGUID
	_WinAPI_SubLangId
	_WinAPI_SystemParametersInfo
	_WinAPI_TwipsPerPixelX
	_WinAPI_TwipsPerPixelY
	_WinAPI_UpdateLayeredWindow
	_WinAPI_UpdateWindow
	_WinAPI_WaitForInputIdle
	_WinAPI_WaitForMultipleObjects
	_WinAPI_WaitForSingleObject
	_WinAPI_WideCharToMultiByte
	_WinAPI_WindowFromPoint
	_WinAPI_WriteConsole
	_WinAPI_WriteFile
	_WinAPI_WriteProcessMemory
	_WinAPI_ValidateClassName
	; ===============================================================================================================================
	
	; #INTERNAL_USE_ONLY#============================================================================================================
	_WinAPI_EnumWindowsAdd
	_WinAPI_EnumWindowsChild
	_WinAPI_EnumWindowsInit
#ce==============================================================================================================================

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_AttachConsole
; Description ...: Attaches the calling process to the console of the specified process
; Syntax.........: _WinAPI_AttachConsole([$iProcessID = -1])
; Parameters ....: $iProcessID  - Identifier of the process. Set to -1 to attach to the current process.
; Return values .: Success      - True
;                  Failure      - False
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........; @@MsdnLink@@ AttachConsole
; Example .......;
; ===============================================================================================================================
Func _WinAPI_AttachConsole($iProcessID = -1)
	Local $aResult

	$aResult = DllCall("Kernel32.dll", "int", "AttachConsole", "dword", $iProcessID)
	Return $aResult[0] <> 0
EndFunc   ;==>_WinAPI_AttachConsole

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_AttachThreadInput
; Description ...: Attaches the input processing mechanism of one thread to that of another thread
; Syntax.........: _WinAPI_AttachThreadInput($iAttach, $iAttachTo, $fAttach)
; Parameters ....: $iAttach     - Identifier of the thread to be attached to another thread
;                  $iAttachTo   - Identifier of the thread to be attached to
;                  $fAttach     - Attachment mode:
;                  |True  - The threads are attached
;                  |False - The threads are detached
; Return values .: Success      - True
;                  Failure      - False
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........; @@MsdnLink@@ AttachThreadInput
; Example .......;
; ===============================================================================================================================
Func _WinAPI_AttachThreadInput($iAttach, $iAttachTo, $fAttach)
	Local $aResult

	$aResult = DllCall("User32.dll", "int", "AttachThreadInput", "int", $iAttach, "int", $iAttachTo, "int", $fAttach)
	Return $aResult[0] <> 0
EndFunc   ;==>_WinAPI_AttachThreadInput

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_Beep
; Description ...: Generates simple tones on the speaker
; Syntax.........: _WinAPI_Beep($iFreq = 500, $iDuration = 1000)
; Parameters ....: $iFreq       - The frequency of the sound, in hertz.  This parameter must be in the range 37  through  32,767.
;                  +Windows Me/98/95: This parameter is ignored.
;                  $iDuration   - The duration of the sound, in milliseconds.  Windows Me/98/95:  This parameter is ignored.
; Return values .: Success      - True
;                  Failure      - False
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......: Muting and volume control have no effect on Beep. You will still hear the tone.
; Related .......:
; Link ..........; @@MsdnLink@@ Beep
; Example .......;
; ===============================================================================================================================
Func _WinAPI_Beep($iFreq = 500, $iDuration = 1000)
	Local $aResult

	$aResult = DllCall("Kernel32.dll", "int", "Beep", "dword", $iFreq, "dword", $iDuration)
	Return SetError(_WinAPI_GetLastError(), 0, $aResult[0] <> 0)
EndFunc   ;==>_WinAPI_Beep

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_BitBlt
; Description ...: Performs a bit-block transfer of color data
; Syntax.........: _WinAPI_BitBlt($hDestDC, $iXDest, $iYDest, $iWidth, $iHeight, $hSrcDC, $iXSrc, $iYSrc, $iROP)
; Parameters ....: $hDestDC     - Handle to the destination device context
;                  $iXDest      - X value of the upper-left corner of the destination rectangle
;                  $iYDest      - Y value of the upper-left corner of the destination rectangle
;                  $iWidth      - Width of the source and destination rectangles
;                  $iHeight     - Height of the source and destination rectangles
;                  $hSrcDC      - Handle to the source device context
;                  $iXSrc       - X value of the upper-left corner of the source rectangle
;                  $iYSrc       - Y value of the upper-left corner of the source rectangle
;                  $iROP        - Specifies a raster operation code.  These codes define  how  the  color  data  for  the  source
;                  +rectangle is to be combined with the color data for the destination rectangle to achieve the final color:
;                  |$BLACKNESS      - Fills the destination rectangle using the color associated with palette index 0
;                  |$CAPTUREBLT     - Includes any window that are layered on top of your window in the resulting image
;                  |$DSTINVERT      - Inverts the destination rectangle
;                  |$MERGECOPY      - Merges the color of the source rectangle with the brush currently  selected  in  hDest,  by
;                  +using the AND operator.
;                  |$MERGEPAINT     - Merges the color of the inverted source  rectangle  with  the  colors  of  the  destination
;                  +rectangle by using the OR operator.
;                  |$NOMIRRORBITMAP - Prevents the bitmap from being mirrored
;                  |$NOTSRCCOPY     - Copies the inverted source rectangle to the destination
;                  |$NOTSRCERASE    - Combines the colors of the source and destination rectangles by using the OR  operator  and
;                  +then inverts the resultant color.
;                  |$PATCOPY        - Copies the brush selected in hdcDest, into the destination bitmap
;                  |$PATINVERT      - Combines the colors of the brush currently selected  in  hDest,  with  the  colors  of  the
;                  +destination rectangle by using the XOR operator.
;                  |$PATPAINT       - Combines the colors of the brush currently selected  in  hDest,  with  the  colors  of  the
;                  +inverted source rectangle by using the OR operator.  The result of this operation is combined with the  color
;                  +of the destination rectangle by using the OR operator.
;                  |$SRCAND         - Combines the colors of the source and destination rectangles by using the AND operator
;                  |$SRCCOPY        - Copies the source rectangle directly to the destination rectangle
;                  |$SRCERASE       - Combines the inverted color of the destination rectangle with  the  colors  of  the  source
;                  +rectangle by using the AND operator.
;                  |$SRCINVERT      - Combines the colors of the source and destination rectangles by using the XOR operator
;                  |$SRCPAINT       - Combines the colors of the source and destination rectangles by using the OR operator
;                  |$WHITENESS      - Fills the destination rectangle using the color associated with index  1  in  the  physical
;                  +palette.
; Return values .: Success      - True
;                  Failure      - False
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........; @@MsdnLink@@ BitBlt
; Example .......;
; ===============================================================================================================================
Func _WinAPI_BitBlt($hDestDC, $iXDest, $iYDest, $iWidth, $iHeight, $hSrcDC, $iXSrc, $iYSrc, $iROP)
	Local $aResult

	$aResult = DllCall("GDI32.dll", "int", "BitBlt", "hwnd", $hDestDC, "int", $iXDest, "int", $iYDest, "int", $iWidth, "int", $iHeight, _
			"hwnd", $hSrcDC, "int", $iXSrc, "int", $iYSrc, "int", $iROP)
	_WinAPI_Check("_WinAPI_BitBlt", ($aResult[0] = 0), 0, True)
	Return $aResult[0]
EndFunc   ;==>_WinAPI_BitBlt

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_Check
; Description ...: Displays any errors produced by the Auto3Lib library
; Syntax.........: _WinAPI_Check($sFunction, $fError, $vError[, $fTranslate = False])
; Parameters ....: $Function     - Name of function
;                  $fError       - True if error occurred
;                  $iError       - Error code
;                  $fTranslate   - Translate error using _WinAPI_GetLastErrorMessage
; Return values .:
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......: This function is used within many of the lower level API functions to simulate a  "fatal"  application  error.
;                  It is used in functions that normally should not fail or where there is no clear corrective action that can be
;                  taken if an error is generated.
; Related .......: _WinAPI_GetLastErrorMessage
; Link ..........;
; Example .......;
; ===============================================================================================================================
Func _WinAPI_Check($sFunction, $fError, $vError, $fTranslate = False)
	If $fError Then
		If $fTranslate Then $vError = _WinAPI_GetLastErrorMessage()
		_WinAPI_ShowError($sFunction & ": " & $vError)
	EndIf
EndFunc   ;==>_WinAPI_Check

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_ClientToScreen
; Description ...: Converts the client coordinates of a specified point to screen coordinates
; Syntax.........: _WinAPI_ClientToScreen($hWnd, ByRef $tPoint)
; Parameters ....: $hWnd        - Identifies the window that will be used for the conversion
;                  $tPoint      - $tagPOINT structure that contains the client coordinates to be converted
; Return values .: Success      - $tagPOINT structure
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......: The function replaces the client coordinates in the  $tagPOINT  structure  with  the  screen  coordinates.  The
;                  screen coordinates are relative to the upper-left corner of the screen.
; Related .......: _WinAPI_ScreenToClient
; Link ..........; @@MsdnLink@@ ClientToScreen
; Example .......;
; ===============================================================================================================================
Func _WinAPI_ClientToScreen($hWnd, ByRef $tPoint)
	Local $pPoint, $aResult

	$pPoint = DllStructGetPtr($tPoint)
	$aResult = DllCall("User32.dll", "int", "ClientToScreen", "hwnd", $hWnd, "ptr", $pPoint)
	Return SetError($aResult[0] <> 0, 0, $tPoint)
EndFunc   ;==>_WinAPI_ClientToScreen

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_CloseHandle
; Description ...: Closes an open object handle
; Syntax.........: _WinAPI_CloseHandle($hObject)
; Parameters ....: $hObject     - Handle of object to close
; Return values .: Success      - True
;                  Failure      - False
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........; @@MsdnLink@@ CloseHandle
; Example .......;
; ===============================================================================================================================
Func _WinAPI_CloseHandle($hObject)
	Local $aResult

	$aResult = DllCall("Kernel32.dll", "int", "CloseHandle", "int", $hObject)
	_WinAPI_Check("_WinAPI_CloseHandle", ($aResult[0] = 0), 0, True)
	Return $aResult[0] <> 0
EndFunc   ;==>_WinAPI_CloseHandle

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_CopyIcon
; Description ...: Copies the specified icon from another module
; Syntax.........: _WinAPI_CopyIcon($hIcon)
; Parameters ....: $hIcon       - Handle to the icon to be copied
; Return values .: Success      - The handle to the duplicate icon
;                  Failure       - 0
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......: The CopyIcon function enables an application or DLL to get its own handle to an icon owned by another  module.
;                  If the other module is freed, the application icon will still be able to use the icon.  Before  closing,  call
;                  the _WinAPI_DestroyIcon function to free any system resources associated with the icon.
; Related .......: _WinAPI_DestroyIcon
; Link ..........; @@MsdnLink@@ CopyIcon
; Example .......;
; ===============================================================================================================================
Func _WinAPI_CopyIcon($hIcon)
	Local $aResult

	$aResult = DllCall("User32.dll", "hwnd", "CopyIcon", "hwnd", $hIcon)
	_WinAPI_Check("_WinAPI_CopyIcon", ($aResult[0] = 0), 0, True)
	Return $aResult[0]
EndFunc   ;==>_WinAPI_CopyIcon

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_CreateBitmap
; Description ...: Creates a bitmap with the specified width, height, and color format
; Syntax.........: _WinAPI_CreateBitmap($iWidth, $iHeight[, $iPlanes = 1[, $iBitsPerPel = 1[, $pBits = 0]]])
; Parameters ....: $iWidth      - Specifies the bitmap width, in pixels
;                  $iHeight     - Specifies the bitmap height, in pixels
;                  $iPlanes     - Specifies the number of color planes used by the device
;                  $iBitsPerPel - Specifies the number of bits required to identify the color of a single pixel
;                  $pBits       - Pointer to an array of color data used to set the colors in a rectangle of  pixels.  Each  scan
;                  +line in the rectangle must be word aligned (scan lines that are not word aligned must be padded with  zeros).
;                  +If this parameter is 0, the contents of the new bitmap is undefined.
; Return values .: Success      - The handle to a bitmap
;                  Failure      - 0
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........; @@MsdnLink@@ CreateBitmap
; Example .......;
; ===============================================================================================================================
Func _WinAPI_CreateBitmap($iWidth, $iHeight, $iPlanes = 1, $iBitsPerPel = 1, $pBits = 0)
	Local $aResult

	$aResult = DllCall("GDI32.dll", "hwnd", "CreateBitmap", "int", $iWidth, "int", $iHeight, "int", $iPlanes, "int", $iBitsPerPel, "ptr", $pBits)
	_WinAPI_Check("_WinAPI_CreateBitmap", ($aResult[0] = 0), 0, True)
	Return $aResult[0]
EndFunc   ;==>_WinAPI_CreateBitmap

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_CreateCompatibleBitmap
; Description ...: Creates a bitmap compatible with the specified device context
; Syntax.........: _WinAPI_CreateCompatibleBitmap($hDC, $iWidth, $iHeight)
; Parameters ....: $hDC         - Identifies a device context
;                  $iWidth      - Specifies the bitmap width, in pixels
;                  $iHeight     - Specifies the bitmap height, in pixels
; Return values .: Success      - The handle to the bitmap
;                  Failure      - 0
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......: When you no longer need the bitmap, call the _WinAPI_DeleteObject function to delete it
; Related .......: _WinAPI_DeleteObject
; Link ..........; @@MsdnLink@@ CreateCompatibleBitmap
; Example .......;
; ===============================================================================================================================
Func _WinAPI_CreateCompatibleBitmap($hDC, $iWidth, $iHeight)
	Local $aResult

	$aResult = DllCall("GDI32.dll", "hwnd", "CreateCompatibleBitmap", "hwnd", $hDC, "int", $iWidth, "int", $iHeight)
	_WinAPI_Check("_WinAPI_CreateCompatibleBitmap", ($aResult[0] = 0), 0, True)
	Return $aResult[0]
EndFunc   ;==>_WinAPI_CreateCompatibleBitmap

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_CreateCompatibleDC
; Description ...: Creates a memory device context compatible with the specified device
; Syntax.........: _WinAPI_CreateCompatibleDC($hDC)
; Parameters ....: $hDC         - Handle to an existing DC. If this handle is 0, the function creates a memory DC compatible with
;                  +the application's current screen.
; Return values .: Success      - Handle to a memory DC
;                  Failure      - 0
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......: When you no longer need the memory DC, call the _WinAPI_DeleteDC function
; Related .......: _WinAPI_DeleteDC
; Link ..........; @@MsdnLink@@ CreateCompatibleDC
; Example .......;
; ===============================================================================================================================
Func _WinAPI_CreateCompatibleDC($hDC)
	Local $aResult

	$aResult = DllCall("GDI32.dll", "hwnd", "CreateCompatibleDC", "hwnd", $hDC)
	_WinAPI_Check("_WinAPI_CreateCompatibleDC", ($aResult[0] = 0), 0, True)
	Return $aResult[0]
EndFunc   ;==>_WinAPI_CreateCompatibleDC

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_CreateEvent
; Description ...: Creates or opens a named or unnamed event object
; Syntax.........: _WinAPI_CreateEvent([$pAttributes = 0[, $fManualReset = True[, $fInitialState = True[, $sName = ""]]]])
; Parameters ....: $pAttributes - Pointer to a $tagSECURITY_ATTRIBUTES structure.  If 0, the  handle cannot be inherited by  child
;                  +processes.  The Descriptor member of the structure specifies a security descriptor  for  the  new  event.  If
;                  +pAttributes is 0, the event gets a default security descriptor.  The ACLs in the default security  descriptor
;                  +for an event come from the primary or impersonation token of the creator.
;                  $fManualReset - If True, the function creates a manual-reset event object,  which  requires  the  use  of  the
;                  +ResetEvent function to set the event state to nonsignaled. If False, the function creates an auto-reset event
;                  +object and system automatically resets the event state to nonsignaled after a single waiting thread has  been
;                  +released.
;                  $fInitialState - If True, the initial state of the event object is signaled; otherwise, it is nonsignaled
;                  $sName        - The name of the event object. Name comparison is case sensitive.  If sName matches the name of
;                  +an existing named event object, this function requests the EVENT_ALL_ACCESS access right.  In this  case  the
;                  +fManualReset and fInitialState parameters are ignored because they have already  been  set  by  the  creating
;                  +process. If the pAttributes parameter is not 0, it determines whether the handle can be  inherited,  but  its
;                  +security-descriptor member is ignored. If Name is blank, the event object is created without a name.
; Return values .: Success      - The handle to the event object.  If the named event object existed before the function call the
;                  +function returns a handle to the existing object and GetLastError returns ERROR_ALREADY_EXISTS.
;                  Failure      - 0
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........; @@MsdnLink@@ CreateEvent
; Example .......;
; ===============================================================================================================================
Func _WinAPI_CreateEvent($pAttributes = 0, $fManualReset = True, $fInitialState = True, $sName = "")
	Local $aResult

	If $sName = "" Then $sName = 0
	$aResult = DllCall("Kernel32.dll", "int", "CreateEvent", "ptr", $pAttributes, "int", $fManualReset, "int", $fInitialState, "str", $sName)
	Return SetError(_WinAPI_GetLastError(), 0, $aResult[0])
EndFunc   ;==>_WinAPI_CreateEvent

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_CreateFile
; Description ...: Creates or opens a file or other device
; Syntax.........: _WinAPI_CreateFile($sFileName, $iCreation[, $iAccess = 4[, $iShare = 0[, $iAttributes = 0[, $pSecurity = 0]]]])
; Parameters ....: $sFileName   - Name of an object to create or open
;                  $iCreation   - Action to take on files that exist and do not exist:
;                  |0 - Creates a new file. The function fails if the file exists
;                  |1 - Creates a new file. If a file exists, it is overwritten
;                  |2 - Opens a file. The function fails if the file does not exist
;                  |3 - Opens a file. If the file does not exist, the function creates the file
;                  |4 - Opens a file and truncates it so that its size is 0 bytes.  The function fails if the file does not exist.
;                  $iAccess     - Access to the object:
;                  |1 - Execute
;                  |2 - Read
;                  |4 - Write
;                  $iShare      - Sharing mode of an object:
;                  |1 - Delete
;                  |2 - Read
;                  |4 - Write
;                  $iAttributes - The file attributes:
;                  |1 - File should be archived
;                  |2 - File is hidden
;                  |4 - File is read only
;                  |8 - File is part of or used exclusively by an operating system.
;                  $pSecurity   - Pointer to a $tagSECURITY_ATTRIBUTES structure that determines if the  returned  handle  can  be
;                  +inherited by child processes. If pSecurity is 0, the handle cannot be inherited.
; Return values .: Success      - The open handle to a specified file
;                  Failure      - 0
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........; @@MsdnLink@@ CreateFile
; Example .......;
; ===============================================================================================================================
Func _WinAPI_CreateFile($sFileName, $iCreation, $iAccess = 4, $iShare = 0, $iAttributes = 0, $pSecurity = 0)
	Local $iDA = 0, $iSM = 0, $iCD = 0, $iFA = 0, $aResult

	If BitAND($iAccess, 1) <> 0 Then $iDA = BitOR($iDA, $GENERIC_EXECUTE)
	If BitAND($iAccess, 2) <> 0 Then $iDA = BitOR($iDA, $GENERIC_READ)
	If BitAND($iAccess, 4) <> 0 Then $iDA = BitOR($iDA, $GENERIC_WRITE)

	If BitAND($iShare, 1) <> 0 Then $iSM = BitOR($iSM, $FILE_SHARE_DELETE)
	If BitAND($iShare, 2) <> 0 Then $iSM = BitOR($iSM, $FILE_SHARE_READ)
	If BitAND($iShare, 4) <> 0 Then $iSM = BitOR($iSM, $FILE_SHARE_WRITE)

	Switch $iCreation
		Case 0
			$iCD = $CREATE_NEW
		Case 1
			$iCD = $CREATE_ALWAYS
		Case 2
			$iCD = $OPEN_EXISTING
		Case 3
			$iCD = $OPEN_ALWAYS
		Case 4
			$iCD = $TRUNCATE_EXISTING
	EndSwitch

	If BitAND($iAttributes, 1) <> 0 Then $iFA = BitOR($iFA, $FILE_ATTRIBUTE_ARCHIVE)
	If BitAND($iAttributes, 2) <> 0 Then $iFA = BitOR($iFA, $FILE_ATTRIBUTE_HIDDEN)
	If BitAND($iAttributes, 4) <> 0 Then $iFA = BitOR($iFA, $FILE_ATTRIBUTE_READONLY)
	If BitAND($iAttributes, 8) <> 0 Then $iFA = BitOR($iFA, $FILE_ATTRIBUTE_SYSTEM)

	$aResult = DllCall("Kernel32.dll", "hwnd", "CreateFile", "str", $sFileName, "int", $iDA, "int", $iSM, "ptr", $pSecurity, "int", $iCD, "int", $iFA, "int", 0)
	Return SetError(_WinAPI_GetLastError(), 0, $aResult[0])
EndFunc   ;==>_WinAPI_CreateFile

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_CreateFontIndirect
; Description ...: Creates a logical font that has specific characteristics
; Syntax.........: _WinAPI_CreateFontIndirect($tLogFont)
; Parameters ....: $tLogFont    - $tagLOGFONT structure that defines the characteristics of the logical font
; Return values .: Success      - Handle to a logical font
;                  Failure      - 0
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......: This function creates a logical font with the characteristics specified in the $tagLOGFONT structure. When this
;                  font is selected by using the SelectObject function, GDI's font mapper attempts to match the logical font with
;                  an existing physical font. If it fails to find an exact match it provides an alternative whose characteristics
;                  match as many of the requested characteristics as possible.
; Related .......:
; Link ..........; @@MsdnLink@@ CreateFontIndirect
; Example .......;
; ===============================================================================================================================
Func _WinAPI_CreateFontIndirect($tLogFont)
	Local $aResult

	$aResult = DllCall("GDI32.dll", "hwnd", "CreateFontIndirect", "ptr", DllStructGetPtr($tLogFont))
	Return SetError(_WinAPI_GetLastError(), 0, $aResult[0])
EndFunc   ;==>_WinAPI_CreateFontIndirect

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_CreateProcess
; Description ...: Creates a new process and its primary thread
; Syntax.........: _WinAPI_CreateProcess($sAppName, $sCommand, $pSecurity, $pThread, $fInherit, $iFlags, $pEnviron, $sDir, $pStartupInfo, $pProcess)
; Parameters ....: $sAppName    - The name of the module to be executed
;                  $sCommand    - The command line to be executed
;                  $pSecurity   - Pointer to $tagSECURITY_ATTRIBUTES structure that determines whether the returned handle can  be
;                  +inherited by child processes.
;                  $pThread     - Pointer to $tagSECURITY_ATTRIBUTES structure that determines whether the returned handle can  be
;                  +inherited by child processes.
;                  $fInherit    - If True, each inheritable handle in the calling process is inherited by the new process
;                  $iFlags      - Flags that control the priority class and creation of the process
;                  $pEnviron    - Pointer to the environment block for the new process
;                  $sDir        - The full path to the current directory for the process
;                  $pStartupInfo - Pointer to a $tagSTARTUPINFO structure
;                  $pProcess    - Pointer to a $tagPROCESS_INFORMATION structure
; Return values .: Success      - True
;                  Failure      - False
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........; @@MsdnLink@@ CreateProcess
; Example .......;
; ===============================================================================================================================
Func _WinAPI_CreateProcess($sAppName, $sCommand, $pSecurity, $pThread, $fInherit, $iFlags, $pEnviron, $sDir, $pStartupInfo, $pProcess)
	Local $pAppName, $tAppName, $pCommand, $tCommand, $pDir, $tDir, $aResult

	If $sAppName <> "" Then
		$tAppName = DllStructCreate("char Text[" & StringLen($sAppName) + 1 & "]")
		$pAppName = DllStructGetPtr($tAppName)
		DllStructSetData($tAppName, "Text", $sAppName)
	EndIf
	If $sCommand <> "" Then
		$tCommand = DllStructCreate("char Text[" & StringLen($sCommand) + 1 & "]")
		$pCommand = DllStructGetPtr($tCommand)
		DllStructSetData($tCommand, "Text", $sCommand)
	EndIf
	If $sDir <> "" Then
		$tDir = DllStructCreate("char Text[" & StringLen($sDir) + 1 & "]")
		$pDir = DllStructGetPtr($tDir)
		DllStructSetData($tDir, "Text", $sDir)
	EndIf
	$aResult = DllCall("Kernel32.dll", "int", "CreateProcess", "ptr", $pAppName, "ptr", $pCommand, "ptr", $pSecurity, "ptr", $pThread, _
			"int", $fInherit, "int", $iFlags, "ptr", $pEnviron, "ptr", $pDir, "ptr", $pStartupInfo, "ptr", $pProcess)
	Return SetError(_WinAPI_GetLastError(), 0, $aResult[0] <> 0)
EndFunc   ;==>_WinAPI_CreateProcess

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_CreateSolidBitmap
; Description ...: Creates a solid color bitmap
; Syntax.........: _WinAPI_CreateSolidBitmap($hWnd, $iColor, $iWidth, $iHeight)
; Parameters ....: $hWnd        - Handle to the window where the bitmap will be displayed
;                  $iColor      - The color of the bitmap, stated in RGB
;                  $iWidth      - The width of the bitmap
;                  $iHeight     - The height of the bitmap
; Return values .: Success      - Handle to the bitmap
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......: _WinAPI_CreateCompatibleBitmap
; Link ..........;
; Example .......;
; ===============================================================================================================================
Func _WinAPI_CreateSolidBitmap($hWnd, $iColor, $iWidth, $iHeight)
	Local $iI, $iSize, $tBits, $tBMI, $hDC, $hBmp

	$iSize = $iWidth * $iHeight
	$tBits = DllStructCreate("int[" & $iSize & "]")
	For $iI = 1 To $iSize
		DllStructSetData($tBits, 1, $iColor, $iI)
	Next
	$tBMI = DllStructCreate($tagBITMAPINFO)
	DllStructSetData($tBMI, "Size", DllStructGetSize($tBMI) - 4)
	DllStructSetData($tBMI, "Planes", 1)
	DllStructSetData($tBMI, "BitCount", 32)
	DllStructSetData($tBMI, "Width", $iWidth)
	DllStructSetData($tBMI, "Height", $iHeight)
	$hDC = _WinAPI_GetDC($hWnd)
	$hBmp = _WinAPI_CreateCompatibleBitmap($hDC, $iWidth, $iHeight)
	_WinAPI_SetDIBits(0, $hBmp, 0, $iHeight, DllStructGetPtr($tBits), DllStructGetPtr($tBMI))
	Return $hBmp
EndFunc   ;==>_WinAPI_CreateSolidBitmap

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_CreateWindowEx
; Description ...: Creates an overlapped, pop-up, or child window
; Syntax.........: _WinAPI_CreateWindowEx($iExStyle, $sClass, $sName, $iStyle, $iX, $iY, $iWidth, $iHeight, $hParent[, $hMenu = 0[, $hInstance = 0[, $pParam = 0]]])
; Parameters ....: $iExStyle    - Extended window style
;                  $sClass      - Registered class name
;                  $sName       - Window name
;                  $iStyle      - Window style
;                  $iX          - Horizontal position of window
;                  $iY          - Vertical position of window
;                  $iWidth      - Window width
;                  $iHeight     - Window height
;                  $hParent     - Handle to parent or owner window
;                  $hMenu       - Handle to menu or child-window identifier
;                  $hInstance   - Handle to application instance
;                  $pParam      - Pointer to window-creation data
; Return values .: Success      - The handle to the new window
;                  Failure      - 0
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........; @@MsdnLink@@ CreateWindowEx
; Example .......;
; ===============================================================================================================================
Func _WinAPI_CreateWindowEx($iExStyle, $sClass, $sName, $iStyle, $iX, $iY, $iWidth, $iHeight, $hParent, $hMenu = 0, $hInstance = 0, $pParam = 0)
	Local $aResult

	If $hInstance = 0 Then $hInstance = _WinAPI_GetModuleHandle("")
	$aResult = DllCall("User32.dll", "hwnd", "CreateWindowEx", "int", $iExStyle, "str", $sClass, "str", $sName, "int", $iStyle, "int", $iX, _
			"int", $iY, "int", $iWidth, "int", $iHeight, "hwnd", $hParent, "hwnd", $hMenu, "hwnd", $hInstance, "ptr", $pParam)
	_WinAPI_Check("_WinAPI_CreateWindowEx", ($aResult[0] = 0), 0, True)
	Return $aResult[0]
EndFunc   ;==>_WinAPI_CreateWindowEx

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_DefWindowProc
; Description ...: Call the default window procedure to provide default processing
; Syntax.........: _WinAPI_DefWindowProc($hWnd, $iMsg, $iwParam, $ilParam)
; Parameters ....: $hWnd        - Handle to the window procedure that received the message
;                  $iMsg        - Specifies the message
;                  $iwParam     - Specifies additional message information
;                  $ilParam     - Specifies additional message information
; Return values .:
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........; @@MsdnLink@@ DefWindowProc
; Example .......;
; ===============================================================================================================================
Func _WinAPI_DefWindowProc($hWnd, $iMsg, $iwParam, $ilParam)
	Local $aResult

	$aResult = DllCall("User32.dll", "int", "DefWindowProc", "hwnd", $hWnd, "int", $iMsg, "int", $iwParam, "int", $ilParam)
	Return $aResult[0]
EndFunc   ;==>_WinAPI_DefWindowProc

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_DeleteDC
; Description ...: Deletes the specified device context
; Syntax.........: _WinAPI_DeleteDC($hDC)
; Parameters ....: $hDC         - Identifies the device context to be deleted
; Return values .: Success      - True
;                  Failure      - False
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......: An application must not delete a DC whose handle was obtained by calling the _WinAPI_GetDC function.  Instead, it
;                  must call the _WinAPI_ReleaseDC function to free the DC.
; Related .......: _WinAPI_GetDC, _WinAPI_ReleaseDC
; Link ..........; @@MsdnLink@@ DeleteDC
; Example .......;
; ===============================================================================================================================
Func _WinAPI_DeleteDC($hDC)
	Local $aResult

	$aResult = DllCall("GDI32.dll", "int", "DeleteDC", "hwnd", $hDC)
	_WinAPI_Check("_WinAPI_DeleteDC", ($aResult[0] = 0), 0, True)
	Return $aResult[0] <> 0
EndFunc   ;==>_WinAPI_DeleteDC

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_DeleteObject
; Description ...: Deletes a logical pen, brush, font, bitmap, region, or palette
; Syntax.........: _WinAPI_DeleteObject($hObject)
; Parameters ....: $hObject     - Identifies a logical pen, brush, font, bitmap, region, or palette
; Return values .: Success      - True
;                  Failure      - False
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......: Do not delete a drawing object while it is still  selected  into  a  device  context.  When  a  pattern  brush
;                  is deleted the bitmap associated with the brush is not deleted. The bitmap must be deleted independently.
; Related .......:
; Link ..........; @@MsdnLink@@ DeleteObject
; Example .......;
; ===============================================================================================================================
Func _WinAPI_DeleteObject($hObject)
	Local $aResult

	$aResult = DllCall("GDI32.dll", "int", "DeleteObject", "int", $hObject)
	Return $aResult[0] <> 0
EndFunc   ;==>_WinAPI_DeleteObject

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_DestroyIcon
; Description ...: Destroys an icon and frees any memory the icon occupied
; Syntax.........: _WinAPI_DestroyIcon($hIcon)
; Parameters ....: $hIcon       - Handle to the icon to be destroyed. The icon must not be in use.
; Return values .: Success      - True
;                  Failure      - False
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........; @@MsdnLink@@ DestroyIcon
; Example .......;
; ===============================================================================================================================
Func _WinAPI_DestroyIcon($hIcon)
	Local $aResult

	$aResult = DllCall("User32.dll", "int", "DestroyIcon", "hwnd", $hIcon)
	_WinAPI_Check("_WinAPI_DestroyIcon", ($aResult[0] = 0), 0, True)
	Return $aResult[0] <> 0
EndFunc   ;==>_WinAPI_DestroyIcon

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_DestroyWindow
; Description ...: Destroys the specified window
; Syntax.........: _WinAPI_DestroyWindow($hWnd)
; Parameters ....: $hWnd        - Handle to the window to be destroyed
; Return values .: Success      - True
;                  Failure      - False
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......: You cannot use _WinAPI_DestroyWindow to destroy a window created by a different thread
; Related .......: _WinAPI_CreateWindowEx
; Link ..........; @@MsdnLink@@ DestroyWindow
; Example .......;
; ===============================================================================================================================
Func _WinAPI_DestroyWindow($hWnd)
	Local $aResult

	$aResult = DllCall("User32.dll", "int", "DestroyWindow", "hwnd", $hWnd)
	Return $aResult[0] <> 0
EndFunc   ;==>_WinAPI_DestroyWindow

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_DrawIcon
; Description ...: Draws an icon or cursor into the specified device context
; Syntax.........: _WinAPI_DrawIcon($hDC, $iX, $iY, $hIcon)
; Parameters ....: $hDC         - Handle to the device context into which the icon or cursor is drawn
;                  $iX          - X coordinate of the upper-left corner of the icon
;                  $iY          - Y coordinate of the upper-left corner of the icon
;                  $hIcon       - Handle to the icon to be drawn
; Return values .: Success     - True
;                  Failure     - False
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......: _WinAPI_DrawIconEx
; Link ..........; @@MsdnLink@@ DrawIcon
; Example .......;
; ===============================================================================================================================
Func _WinAPI_DrawIcon($hDC, $iX, $iY, $hIcon)
	Local $aResult

	$aResult = DllCall("User32.dll", "int", "DrawIcon", "hwnd", $hDC, "int", $iX, "int", $iY, "hwnd", $hIcon)
	_WinAPI_Check("_WinAPI_DrawIcon", ($aResult[0] = 0), 0, True)
	Return $aResult[0] <> 0
EndFunc   ;==>_WinAPI_DrawIcon

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_DrawIconEx
; Description ...: Draws an icon or cursor into the specified device context
; Syntax.........: _WinAPI_DrawIconEx($hDC, $iX, $iY, $hIcon[, $iWidth = 0[, $iHeight = 0[, $iStep = 0[, $hBrush = 0[, $iFlags = 3]]]]])
; Parameters ....: $hDC         - Handle to the device context into which the icon or cursor is drawn
;                  $iX          - X coordinate of the upper-left corner of the icon
;                  $iY          - Y coordinate of the upper-left corner of the icon
;                  $hIcon       - Handle to the icon to be drawn
;                  $iWidth      - Specifies the logical width of the icon or cursor.  If this parameter is zero  and  the  iFlags
;                  +parameter is "default size", the function uses the SM_CXICON or SM_CXCURSOR system metric value  to  set  the
;                  +width. If this is zero and "default size" is not used, the function uses the actual resource width.
;                  $iHeight     - Specifies the logical height of the icon or cursor.  If this parameter is zero and  the  iFlags
;                  +parameter is "default size", the function uses the SM_CYICON or SM_CYCURSOR system metric value  to  set  the
;                  +width. If this is zero and "default size" is not used, the function uses the actual resource height.
;                  $iStep       - Specifies the index of the frame to draw if hIcon identifies an animated cursor. This parameter
;                  +is ignored if hIcon does not identify an animated cursor.
;                  $hBrush      - Handle to a brush that the system uses for flicker-free drawing.  If hBrush is  a  valid  brush
;                  +handle, the system creates an offscreen bitmap using the specified brush for the background color, draws  the
;                  +icon or cursor into the bitmap, and then copies the bitmap into the device  context  identified  by  hDC.  If
;                  +hBrush is 0, the system draws the icon or cursor directly into the device context.
;                  $iFlags      - Specifies the drawing flags. This parameter can be one of the following values:
;                  |1 - Draws the icon or cursor using the mask
;                  |2 - Draws the icon or cursor using the image
;                  |3 - Draws the icon or cursor using the mask and image
;                  |4 - Draws the icon or cursor using the system default image rather than the user-specified image
;                  |5 - Draws the icon or cursor using the width and height specified by the system metric values for cursors  or
;                  +icons, if the iWidth and iWidth parameters are set to zero.  If this flag is not  specified  and  iWidth  and
;                  +iWidth are set to zero, the function uses the actual resource size.
;                  |6 - Draws the icon as an unmirrored icon
; Return values .: Success      - True
;                  Failure      - False
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......: _WinAPI_DrawIcon
; Link ..........; @@MsdnLink@@ DrawIconEx
; Example .......;
; ===============================================================================================================================
Func _WinAPI_DrawIconEx($hDC, $iX, $iY, $hIcon, $iWidth = 0, $iHeight = 0, $iStep = 0, $hBrush = 0, $iFlags = 3)
	Local $iOptions, $aResult

	Switch $iFlags
		Case 1
			$iOptions = $DI_MASK
		Case 2
			$iOptions = $DI_IMAGE
		Case 3
			$iOptions = $DI_NORMAL
		Case 4
			$iOptions = $DI_COMPAT
		Case 5
			$iOptions = $DI_DEFAULTSIZE
		Case Else
			$iOptions = $DI_NOMIRROR
	EndSwitch

	$aResult = DllCall("User32.dll", "int", "DrawIconEx", "hwnd", $hDC, "int", $iX, "int", $iY, "hwnd", $hIcon, "int", $iWidth, _
			"int", $iHeight, "uint", $iStep, "hwnd", $hBrush, "uint", $iOptions)
	_WinAPI_Check("_WinAPI_DrawIconEx", ($aResult[0] = 0), 0, True)
	Return $aResult[0] <> 0
EndFunc   ;==>_WinAPI_DrawIconEx

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_DrawText
; Description ...: Draws formatted text in the specified rectangle
; Syntax.........: _WinAPI_DrawText($hDC, $sText, ByRef $tRect, $iFlags)
; Parameters ....: $hDC         - Identifies the device context
;                  $sText       - The string to be drawn
;                  $tRect       - $tagRECT structure that contains the rectangle for the text
;                  $iFlags      - Specifies the method of formatting the text:
;                  |$DT_BOTTOM          - Justifies the text to the bottom of the rectangle
;                  |$DT_CALCRECT        - Determines the width and height of the rectangle
;                  |$DT_CENTER          - Centers text horizontally in the rectangle
;                  |$DT_EDITCONTROL     - Duplicates the text-displaying characteristics of a multiline edit control
;                  |$DT_END_ELLIPSIS    - Replaces part of the given string with ellipses if necessary
;                  |$DT_EXPANDTABS      - Expands tab characters
;                  |$DT_EXTERNALLEADING - Includes the font external leading in line height
;                  |$DT_LEFT            - Aligns text to the left
;                  |$DT_MODIFYSTRING    - Modifies the given string to match the displayed text
;                  |$DT_NOCLIP          - Draws without clipping
;                  |$DT_NOPREFIX        - Turns off processing of prefix characters
;                  |$DT_RIGHT           - Aligns text to the right
;                  |$DT_RTLREADING      - Layout in right to left reading order for bi-directional text
;                  |$DT_SINGLELINE      - Displays text on a single line only
;                  |$DT_TABSTOP         - Sets tab stops. Bits 15-8 of $iFlags specify the number of characters for each tab
;                  |$DT_TOP             - Top-justifies text (single line only)
;                  |$DT_VCENTER         - Centers text vertically (single line only)
;                  |$DT_WORDBREAK       - Breaks words
; Return values .: Success      - The height of the text
;                  Failure      - 0
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......: The DrawText function uses the device context's selected font, text color, and background color  to  draw  the
;                  text.  Unless the $DT_NOCLIP format is  used,  DrawText clips the text so that it does not appear outside  the
;                  specified rectangle.  All formatting is assumed to have multiple lines unless  the  $DT_SINGLELINE  format  is
;                  specified. If the selected font is too large, DrawText does not attempt to substitute a smaller font.
; Related .......:
; Link ..........; @@MsdnLink@@ DrawText
; Example .......;
; ===============================================================================================================================
Func _WinAPI_DrawText($hDC, $sText, ByRef $tRect, $iFlags)
	Local $aResult

	$aResult = DllCall("User32.dll", "int", "DrawText", "hwnd", $hDC, "str", $sText, "int", -1, "ptr", DllStructGetPtr($tRect), "int", $iFlags)
	Return $aResult[0]
EndFunc   ;==>_WinAPI_DrawText

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_EnableWindow
; Description ...: Enables or disables mouse and keyboard input to the specified window or control
; Syntax.........: _WinAPI_EnableWindow($hWnd[, $fEnable = True])
; Parameters ....: $hWnd        - Handle to the window to be enabled or disabled
;                  $fEnable     - Specifies whether to enable or disable the window:
;                  | True - The window or control is enabled
;                  |False - The window or control is disabled
; Return values .: True - The window or control was previously disabled
;                  False - The window or control was previously enabled
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........; @@MsdnLink@@ EnableWindow
; Example .......;
; ===============================================================================================================================
Func _WinAPI_EnableWindow($hWnd, $fEnable = True)
	Local $aResult

	$aResult = DllCall("User32.dll", "int", "EnableWindow", "hwnd", $hWnd, "int", $fEnable)
	Return $aResult[0]
EndFunc   ;==>_WinAPI_EnableWindow

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_EnumDisplayDevices
; Description ...: Obtains information about the display devices in a system
; Syntax.........: _WinAPI_EnumDisplayDevices($sDevice, $iDevNum)
; Parameters ....: $sDevice     - Device name. If blank, the function returns information for the display adapters on the machine
;                  +based on iDevNum.
;                  $iDevNum     - Zero based index value that specifies the display device of interest
; Return values .: Success      - Array with the following format:
;                  |$aDevice[0] - True on success, otherwise False
;                  |$aDevice[1] - Either the adapter device or the monitor device
;                  |$aDevice[2] - Either a description of the adapter or the monitor
;                  |$aDevice[3] - Device state flags:
;                  | 1 - The device is part of the desktop
;                  | 2 - The primary desktop is on the device
;                  | 4 - Represents a pseudo device used to mirror application drawing for remoting
;                  | 8 - The device is VGA compatible
;                  |16 - The device is removable; it cannot be the primary display
;                  |32 - The device has more display modes than its output devices support
;                  |$aDevice[4] - Plug and Play identifier string (Windows 98/ME)
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........; @@MsdnLink@@ EnumDisplayDevices
; Example .......;
; ===============================================================================================================================
Func _WinAPI_EnumDisplayDevices($sDevice, $iDevNum)
	Local $pName, $tName, $iDevice, $pDevice, $tDevice, $iN, $iFlags, $aResult, $aDevice[5]

	If $sDevice <> "" Then
		$tName = DllStructCreate("char Text[128]")
		$pName = DllStructGetPtr($tName)
		DllStructSetData($tName, "Text", $sDevice)
	EndIf
	$tDevice = DllStructCreate($tagDISPLAY_DEVICE)
	$pDevice = DllStructGetPtr($tDevice)
	$iDevice = DllStructGetSize($tDevice)
	DllStructSetData($tDevice, "Size", $iDevice)
	$aResult = DllCall("User32.dll", "int", "EnumDisplayDevices", "ptr", $pName, "int", $iDevNum, "ptr", $pDevice, "int", 1)

	$iN = DllStructGetData($tDevice, "Flags")
	If BitAND($iN, $DISPLAY_DEVICE_ATTACHED_TO_DESKTOP) <> 0 Then $iFlags = BitOR($iFlags, 1)
	If BitAND($iN, $DISPLAY_DEVICE_PRIMARY_DEVICE) <> 0 Then $iFlags = BitOR($iFlags, 2)
	If BitAND($iN, $DISPLAY_DEVICE_MIRRORING_DRIVER) <> 0 Then $iFlags = BitOR($iFlags, 4)
	If BitAND($iN, $DISPLAY_DEVICE_VGA_COMPATIBLE) <> 0 Then $iFlags = BitOR($iFlags, 8)
	If BitAND($iN, $DISPLAY_DEVICE_REMOVABLE) <> 0 Then $iFlags = BitOR($iFlags, 16)
	If BitAND($iN, $DISPLAY_DEVICE_MODESPRUNED) <> 0 Then $iFlags = BitOR($iFlags, 32)
	$aDevice[0] = $aResult[0] <> 0
	$aDevice[1] = DllStructGetData($tDevice, "Name")
	$aDevice[2] = DllStructGetData($tDevice, "String")
	$aDevice[3] = $iFlags
	$aDevice[4] = DllStructGetData($tDevice, "ID")
	Return $aDevice
EndFunc   ;==>_WinAPI_EnumDisplayDevices

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_EnumWindows
; Description ...: Enumerates all windows
; Syntax.........: _WinAPI_EnumWindows([$fVisible = True])
; Parameters ....: $fVisible    - Window selection flag:
;                  | True - Returns only visible windows
;                  |False - Returns all windows
; Return values .: Success      - Array with the following format:
;                  |[0][0] - Number of rows in array (n)
;                  |[1][0] - Window handle
;                  |[1][1] - Window class name
;                  |[n][0] - Window handle
;                  |[n][1] - Window class name
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......: _WinAPI_EnumWindowsPopup, _WinAPI_EnumWindowsTop
; Link ..........;
; Example .......;
; ===============================================================================================================================
Func _WinAPI_EnumWindows($fVisible = True)
	_WinAPI_EnumWindowsInit()
	_WinAPI_EnumWindowsChild(_WinAPI_GetDesktopWindow(), $fVisible)
	Return $winapi_gaWinList
EndFunc   ;==>_WinAPI_EnumWindows

; #INTERNAL_USE_ONLY#============================================================================================================
; Name...........: _WinAPI_EnumWindowsAdd
; Description ...: Adds window information to the windows enumeration list
; Syntax.........: _WinAPI_EnumWindowsAdd($hWnd[, $sClass = ""])
; Parameters ....: $hWnd        - Handle to the window
;                  $sClass      - Window class name
; Return values .:
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......: This function is used internally by the windows enumeration functions
; Related .......:
; Link ..........;
; Example .......;
; ===============================================================================================================================
Func _WinAPI_EnumWindowsAdd($hWnd, $sClass = "")
	Local $iCount

	If $sClass = "" Then $sClass = _WinAPI_GetClassName($hWnd)
	$winapi_gaWinList[0][0] += 1
	$iCount = $winapi_gaWinList[0][0]
	If $iCount >= $winapi_gaWinList[0][1] Then
		ReDim $winapi_gaWinList[$iCount + 64][2]
		$winapi_gaWinList[0][1] += 64
	EndIf
	$winapi_gaWinList[$iCount][0] = $hWnd
	$winapi_gaWinList[$iCount][1] = $sClass
EndFunc   ;==>_WinAPI_EnumWindowsAdd

; #INTERNAL_USE_ONLY#============================================================================================================
; Name...........: _WinAPI_EnumWindowsChild
; Description ...: Enumerates child windows of a specific window
; Syntax.........: _WinAPI_EnumWindowsChild($hWnd[, $fVisible = True])
; Parameters ....: $hWnd        - Handle of parent window
;                  $fVisible    - Window selection flag:
;                  | True - Returns only visible windows
;                  |False - Returns all windows
; Return values .:
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......: This function is used internally by the windows enumeration functions
; Related .......:
; Link ..........;
; Example .......;
; ===============================================================================================================================
Func _WinAPI_EnumWindowsChild($hWnd, $fVisible = True)
	$hWnd = _WinAPI_GetWindow($hWnd, $GW_CHILD)
	While $hWnd <> 0
		If (Not $fVisible) Or _WinAPI_IsWindowVisible($hWnd) Then
			_WinAPI_EnumWindowsChild($hWnd, $fVisible)
			_WinAPI_EnumWindowsAdd($hWnd)
		EndIf
		$hWnd = _WinAPI_GetWindow($hWnd, $GW_HWNDNEXT)
	WEnd
EndFunc   ;==>_WinAPI_EnumWindowsChild

; #INTERNAL_USE_ONLY#============================================================================================================
; Name...........: _WinAPI_EnumWindowsInit
; Description ...: Initializes the windows enumeration list
; Syntax.........: _WinAPI_EnumWindowsInit()
; Parameters ....:
; Return values .:
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......: This function is used internally by the windows enumeration functions
; Related .......:
; Link ..........;
; Example .......;
; ===============================================================================================================================
Func _WinAPI_EnumWindowsInit()
	ReDim $winapi_gaWinList[64][2]
	$winapi_gaWinList[0][0] = 0
	$winapi_gaWinList[0][1] = 64
EndFunc   ;==>_WinAPI_EnumWindowsInit

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_EnumWindowsPopup
; Description ...: Enumerates popup windows
; Syntax.........: _WinAPI_EnumWindowsPopup()
; Parameters ....:
; Return values .: Success      - Array with the following format:
;                  |[0][0] - Number of rows in array (n)
;                  |[1][0] - Window handle
;                  |[1][1] - Window class name
;                  |[n][0] - Window handle
;                  |[n][1] - Window class name
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......: _WinAPI_EnumWindows, _WinAPI_EnumWindowsTop
; Link ..........;
; Example .......;
; ===============================================================================================================================
Func _WinAPI_EnumWindowsPopup()
	Local $hWnd, $sClass

	_WinAPI_EnumWindowsInit()
	$hWnd = _WinAPI_GetWindow(_WinAPI_GetDesktopWindow(), $GW_CHILD)
	While $hWnd <> 0
		If _WinAPI_IsWindowVisible($hWnd) Then
			$sClass = _WinAPI_GetClassName($hWnd)
			If $sClass = "#32768"  Then
				_WinAPI_EnumWindowsAdd($hWnd)
			ElseIf $sClass = "ToolbarWindow32"  Then
				_WinAPI_EnumWindowsAdd($hWnd)
			ElseIf $sClass = "ToolTips_Class32"  Then
				_WinAPI_EnumWindowsAdd($hWnd)
			ElseIf $sClass = "BaseBar"  Then
				_WinAPI_EnumWindowsChild($hWnd)
			EndIf
		EndIf
		$hWnd = _WinAPI_GetWindow($hWnd, $GW_HWNDNEXT)
	WEnd
	Return $winapi_gaWinList
EndFunc   ;==>_WinAPI_EnumWindowsPopup

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_EnumWindowsTop
; Description ...: Enumerates all top level windows
; Syntax.........: _WinAPI_EnumWindowsTop()
; Parameters ....:
; Return values .: Success      - Array with the following format:
;                  |[0][0] - Number of rows in array (n)
;                  |[1][0] - Window handle
;                  |[1][1] - Window class name
;                  |[n][0] - Window handle
;                  |[n][1] - Window class name
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......: _WinAPI_EnumWindows, _WinAPI_EnumWindowsPopup
; Link ..........;
; Example .......;
; ===============================================================================================================================
Func _WinAPI_EnumWindowsTop()
	Local $hWnd

	_WinAPI_EnumWindowsInit()
	$hWnd = _WinAPI_GetWindow(_WinAPI_GetDesktopWindow(), $GW_CHILD)
	While $hWnd <> 0
		If _WinAPI_IsWindowVisible($hWnd) Then _WinAPI_EnumWindowsAdd($hWnd)
		$hWnd = _WinAPI_GetWindow($hWnd, $GW_HWNDNEXT)
	WEnd
	Return $winapi_gaWinList
EndFunc   ;==>_WinAPI_EnumWindowsTop

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_ExpandEnvironmentStrings
; Description ...: Expands environment variable strings and replaces them with their defined values
; Syntax.........: _WinAPI_ExpandEnvironmentStrings($sString)
; Parameters ....: $sStrings    - String to convert for environment variables
; Return values .: Success      - Converted string
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........; @@MsdnLink@@ ExpandEnvironmentStringsA
; Example .......;
; ===============================================================================================================================
Func _WinAPI_ExpandEnvironmentStrings($sString)
	Local $tText, $aResult

	$tText = DllStructCreate("char Text[4096]")
	$aResult = DllCall("Kernel32.dll", "int", "ExpandEnvironmentStringsA", "str", $sString, "ptr", DllStructGetPtr($tText), "int", 4096)
	_WinAPI_Check("_WinAPI_ExpandEnvironmentStrings", ($aResult[0] = 0), 0, True)
	Return DllStructGetData($tText, "Text")
EndFunc   ;==>_WinAPI_ExpandEnvironmentStrings

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_ExtractIconEx
; Description ...: Creates an array of handles to large or small icons extracted from a file
; Syntax.........: _WinAPI_ExtractIconEx($sFile, $iIndex, $pLarge, $pSmall, $iIcons)
; Parameters ....: $sFile       - Name of an executable file, DLL, or icon file from which icons will be extracted
;                  $iIndex      - Specifies the zero-based index of the first icon to extract
;                  $pLarge      - Pointer to an array of icon handles that receives handles to the large icons extracted from the
;                  +file. If this parameter is 0, no large icons are extracted from the file.
;                  $pSmall      - Pointer to an array of icon handles that receives handles to the small icons extracted from the
;                  +file. If this parameter is 0, no small icons are extracted from the file.
;                  $iIcons      - Specifies the number of icons to extract from the file
; Return values .: Success      - If iIndex is -1, pLarge parameter is 0, and pSmall is 0, then the return value is the number of
;                  +icons contained in the specified file.  Otherwise, the return value  is  the  number  of  icons  successfully
;                  +extracted from the file.
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........; @@MsdnLink@@ ExtractIconEx
; Example .......;
; ===============================================================================================================================
Func _WinAPI_ExtractIconEx($sFile, $iIndex, $pLarge, $pSmall, $iIcons)
	Local $aResult

	$aResult = DllCall("Shell32.dll", "int", "ExtractIconEx", "str", $sFile, "int", $iIndex, "ptr", $pLarge, "ptr", $pSmall, "int", $iIcons)
	Return $aResult[0]
EndFunc   ;==>_WinAPI_ExtractIconEx

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_FatalAppExit
; Description ...: Displays a message box and terminates the application
; Syntax.........: _WinAPI_FatalAppExit($sMessage)
; Parameters ....: $sMessage    - The string that is displayed in the message box
; Return values .:
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......: An application calls FatalAppExit only when it is not capable of terminating any other way.  FatalAppExit  may
;                  not always free an application's memory or close its files, and it may cause a general failure of the  system.
;                  An application that encounters an unexpected error should terminate by freeing all its  memory  and  returning
;                  from its main message loop.
; Related .......:
; Link ..........; @@MsdnLink@@ FatalAppExit
; Example .......;
; ===============================================================================================================================
Func _WinAPI_FatalAppExit($sMessage)
	DllCall("Kernel32.dll", "none", "FatalAppExit", "uint", 0, "str", $sMessage)
EndFunc   ;==>_WinAPI_FatalAppExit

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_FindExecutable
; Description ...: Retrieves the name of the executable file associated with the specified file name
; Syntax.........: _WinAPI_FindExecutable($sFileName[, $sDirectory = ""])
; Parameters ....: $FileName    - Fully qualified path to existing file
;                  $Directory   - Default directory
; Return values .: Success      - Full path to the executable file started when an "open" by  association  is  run  on  the  file
;                  +specified or blank if no association was found.
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........; @@MsdnLink@@ FindExecutable
; Example .......;
; ===============================================================================================================================
Func _WinAPI_FindExecutable($sFileName, $sDirectory = "")
	Local $tText

	$tText = DllStructCreate("char Text[4096]")
	DllCall("Shell32.dll", "hwnd", "FindExecutable", "str", $sFileName, "str", $sDirectory, "ptr", DllStructGetPtr($tText))
	Return DllStructGetData($tText, "Text")
EndFunc   ;==>_WinAPI_FindExecutable

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_FindWindow
; Description ...: Retrieves the handle to the top-level window whose class name and window name match
; Syntax.........: _WinAPI_FindWindow($sClassName, $sWindowName)
; Parameters ....: $sClassName  - A string that specifies the class name or is an atom that identifies the class-name string.  If
;                  +this parameter is an atom, it must be a global atom created by a call to  the  GlobalAddAtom  function.   The
;                  +atom, a 16-bit value, must be placed in the low-order word of the $sClassName string and the high-order  word
;                  +must be zero.
;                  $WindowName  - A string that specifies the window name.  If this parameter is blank, all window names match.
; Return values .: Success      - The handle to the window
;                  Failure      - 0
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........; @@MsdnLink@@ FindWindow
; Example .......;
; ===============================================================================================================================
Func _WinAPI_FindWindow($sClassName, $sWindowName)
	Local $aResult

	$aResult = DllCall("User32.dll", "hwnd", "FindWindow", "str", $sClassName, "str", $sWindowName)
	Return $aResult[0]
EndFunc   ;==>_WinAPI_FindWindow

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_FlashWindow
; Description ...: Flashes the specified window one time
; Syntax.........: _WinAPI_FlashWindow($hWnd[, $fInvert = True])
; Parameters ....: $hWnd        - Handle to the window to be flashed. The window can be either open or minimized.
;                  $fInvert     - If True, the window is flashed from one state to the other.  If False the window is returned to
;                  +its original state. When an application is minimized and this parameter is True, the  taskbar  window  button
;                  +flashes active/inactive.  If it is False, the taskbar window button flashes inactive, meaning  that  it  does
;                  +not change colors.  It flashes as if it were being redrawn, but it does not provide the visual invert clue to
;                  +the user.
; Return values .: Success      - True
;                  Failure      - False
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......: This function does not change the active state of the window. To flash the window a specified number of times,
;                  use the FlashWindowEx function.
; Related .......: _WinAPI_FlashWindowEx
; Link ..........; @@MsdnLink@@ FlashWindow
; Example .......;
; ===============================================================================================================================
Func _WinAPI_FlashWindow($hWnd, $fInvert = True)
	Local $aResult

	$aResult = DllCall("User32.dll", "int", "FlashWindow", "hwnd", $hWnd, "int", $fInvert)
	Return $aResult[0] <> 0
EndFunc   ;==>_WinAPI_FlashWindow

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_FlashWindowEx
; Description ...: Flashes the specified window
; Syntax.........: _WinAPI_FlashWindowEx($hWnd[, $iFlags = 3[, $iCount = 3[, $iTimeout = 0]]])
; Parameters ....: $hWnd        - Handle to the window to be flashed. The window can be either open or minimized.
;                  $iFlags      - The flash status. Can be one or more of the following values:
;                  |0 - Stop flashing. The system restores the window to its original state.
;                  |1 - Flash the window caption
;                  |2 - Flash the taskbar button
;                  |4 - Flash continuously until stopped
;                  |8 - Flash continuously until the window comes to the foreground
;                  $iCount      - The number of times to flash the window
;                  $iTimeout    - The rate at which the window is to be flashed, in  milliseconds.  If 0, the function  uses  the
;                  +default cursor blink rate.
; Return values .: Success      - True
;                  Failure      - False
; Author ........: Yoan Roblet (arcker)
; Modified.......:
; Remarks .......: Typically, you flash a window to inform the user that the window requires attention  but  does  not  currently
;                  have the keyboard focus.  When a window flashes, it appears to change  from  inactive  to  active  status.  An
;                  inactive caption bar changes to an active caption bar; an active caption bar changes to  an  inactive  caption
;                  bar.
; Related .......: _WinAPI_FlashWindow
; Link ..........; @@MsdnLink@@ FlashWindowEx
; Example .......;
; ===============================================================================================================================
Func _WinAPI_FlashWindowEx($hWnd, $iFlags = 3, $iCount = 3, $iTimeout = 0)
	Local $iMode = 0, $iFlash, $pFlash, $tFlash, $aResult

	$tFlash = DllStructCreate($tagFLASHWINDOW)
	$pFlash = DllStructGetPtr($tFlash)
	$iFlash = DllStructGetSize($tFlash)
	If BitAND($iFlags, 1) <> 0 Then $iMode = BitOR($iMode, $FLASHW_CAPTION)
	If BitAND($iFlags, 2) <> 0 Then $iMode = BitOR($iMode, $FLASHW_TRAY)
	If BitAND($iFlags, 4) <> 0 Then $iMode = BitOR($iMode, $FLASHW_TIMER)
	If BitAND($iFlags, 8) <> 0 Then $iMode = BitOR($iMode, $FLASHW_TIMERNOFG)
	DllStructSetData($tFlash, "Size", $iFlash)
	DllStructSetData($tFlash, "hWnd", $hWnd)
	DllStructSetData($tFlash, "Flags", $iMode)
	DllStructSetData($tFlash, "Count", $iCount)
	DllStructSetData($tFlash, "Timeout", $iTimeout)
	$aResult = DllCall("User32.dll", "int", "FlashWindowEx", "ptr", $pFlash)
	Return $aResult[0] <> 0
EndFunc   ;==>_WinAPI_FlashWindowEx

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_FloatToInt
; Description ...: Returns a 4 byte float as an integer value
; Syntax.........: _WinAPI_FloatToInt($nFloat)
; Parameters ....: $nFloat      - Float value
; Return values .: Success      - 4 byte float value as an integer
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........;
; Example .......;
; ===============================================================================================================================
Func _WinAPI_FloatToInt($nFloat)
	Local $tFloat, $tInt

	$tFloat = DllStructCreate("float")
	$tInt = DllStructCreate("int", DllStructGetPtr($tFloat))
	DllStructSetData($tFloat, 1, $nFloat)
	Return DllStructGetData($tInt, 1)
EndFunc   ;==>_WinAPI_FloatToInt

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_FlushFileBuffers
; Description ...: Flushes the buffers of a specified file and causes all buffered data to be written
; Syntax.........: _WinAPI_FlushFileBuffers($hFile)
; Parameters ....: $hFile       - Handle to an open file.  The file handle must have the GENERIC_WRITE access right.  If hFile is
;                  +a handle to a communications device, the function only flushes the transmit buffer.  If hFile is a handle  to
;                  +the server end of a named pipe the function does not return until the client has read all buffered data  from
;                  +the pipe.
; Return values .: Success      - True
;                  Failure      - False
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........; @@MsdnLink@@ FlushFileBuffers
; Example .......;
; ===============================================================================================================================
Func _WinAPI_FlushFileBuffers($hFile)
	Local $aResult

	$aResult = DllCall("Kernel32.dll", "int", "FlushFileBuffers", "hwnd", $hFile)
	Return SetError(_WinAPI_GetLastError(), 0, $aResult[0] <> 0)
EndFunc   ;==>_WinAPI_FlushFileBuffers

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_FormatMessage
; Description ...: Formats a message string
; Syntax.........: _WinAPI_FormatMessage($iFlags, $pSource, $iMessageID, $iLanguageID, $pBuffer, $iSize, $vArguments)
; Parameters ....: $iFlags      - Contains a set of bit flags that specify aspects of the formatting process and how to interpret
;                  +the pSource parameter.  The low-order byte of $iFlags specifies how the function handles line breaks  in  the
;                  +output buffer. The low-order byte can also specify the maximum width of a formatted output line.
;                  $pSource     - Pointer to message source
;                  $iMessageID  - Requested message identifier
;                  $iLanguageID - Language identifier for requested message
;                  $pBuffer     - Pointer to message buffer
;                  $iSize       - Maximum size of message buffer
;                  $vArguments  - Address of array of message inserts
; Return values .: Success      - Number of bytes stored in message buffer
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........; @@MsdnLink@@ FormatMessageA
; Example .......;
; ===============================================================================================================================
Func _WinAPI_FormatMessage($iFlags, $pSource, $iMessageID, $iLanguageID, $pBuffer, $iSize, $vArguments)
	Local $aResult

	$aResult = DllCall("Kernel32.dll", "int", "FormatMessageA", "int", $iFlags, "hwnd", $pSource, "int", $iMessageID, "int", $iLanguageID, _
			"ptr", $pBuffer, "int", $iSize, "ptr", $vArguments)
	Return $aResult[0]
EndFunc   ;==>_WinAPI_FormatMessage

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_FreeLibrary
; Description ...: Decrements the reference count of the loaded dynamic-link library (DLL) module
; Syntax.........: _WinAPI_FreeLibrary($hModule)
; Parameters ....: $hModule     - Identifies the loaded library module
; Return values .: Success      - True
;                  Failure      - False
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......: _WinAPI_LoadLibrary
; Link ..........; @@MsdnLink@@ FreeLibrary
; Example .......;
; ===============================================================================================================================
Func _WinAPI_FreeLibrary($hModule)
	Local $aResult

	$aResult = DllCall("Kernel32.dll", "hwnd", "FreeLibrary", "hwnd", $hModule)
	Return $aResult[0] <> 0
EndFunc   ;==>_WinAPI_FreeLibrary

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_GetAncestor
; Description ...: Retrieves the handle to the ancestor of the specified window
; Syntax.........: _WinAPI_GetAncestor($hWnd[, $iFlags = 1])
; Parameters ....: $hWnd        - Handle to the window whose ancestor is to be retrieved.  If this is  the  desktop  window,  the
;                  +function returns 0.
;                  $iFlags      - Specifies the ancestor to be retrieved. This parameter can be one of the following values:
;                  |$GA_PARENT    - Retrieves the parent window
;                  |$GA_ROOT      - Retrieves the root window by walking the chain of parent windows
;                  |$GA_ROOTOWNER - Retrieves the owned root window by walking the chain of parent and owner windows returned  by
;                  +GetParent.
; Return values .: Success      - The handle of the ancestor window
;                  Failure      - 0
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........; @@MsdnLink@@ GetAncestor
; Example .......;
; ===============================================================================================================================
Func _WinAPI_GetAncestor($hWnd, $iFlags = 1)
	Local $aResult

	$aResult = DllCall("User32.dll", "hwnd", "GetAncestor", "hwnd", $hWnd, "uint", $iFlags)
	Return $aResult[0]
EndFunc   ;==>_WinAPI_GetAncestor

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_GetAsyncKeyState
; Description ...: Determines whether a key is up or down at the time the function is called
; Syntax.........: _WinAPI_GetAsyncKeyState($iKey)
; Parameters ....: $iKey        - Key to test for
; Return values .: Success      - If the most significant bit is set the key is down, and if the least significant  bit  is  set,
;                  +the key was pressed after the previous call to GetAsyncKeyState.  The return value is zero  if  a  window  in
;                  +another thread or process currently has the keyboard focus.
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........; @@MsdnLink@@ GetAsyncKeyState
; Example .......;
; ===============================================================================================================================
Func _WinAPI_GetAsyncKeyState($iKey)
	Local $aResult

	$aResult = DllCall("User32.dll", "int", "GetAsyncKeyState", "int", $iKey)
	Return $aResult[0]
EndFunc   ;==>_WinAPI_GetAsyncKeyState

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_GetClassName
; Description ...: Retrieves the name of the class to which the specified window belongs
; Syntax.........: _WinAPI_GetClassName($hWnd)
; Parameters ....: $hWnd        - Handle of window
; Return values .: Success      - The window class name
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........; @@MsdnLink@@ GetClassName
; Example .......;
; ===============================================================================================================================
Func _WinAPI_GetClassName($hWnd)
	Local $aResult
	If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
	$aResult = DllCall("User32.dll", "int", "GetClassName", "hwnd", $hWnd, "str", "", "int", 4096)
	Return $aResult[2]
EndFunc   ;==>_WinAPI_GetClassName

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_GetClientHeight
; Description ...: Retrieves the height of a window's client area
; Syntax.........: _WinAPI_GetClientHeight($hWnd)
; Parameters ....: $hWnd        - Handle of window
; Return values .: Success      - Client area height
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......: _WinAPI_GetClientWidth
; Link ..........;
; Example .......;
; ===============================================================================================================================
Func _WinAPI_GetClientHeight($hWnd)
	Local $tRect

	$tRect = _WinAPI_GetClientRect($hWnd)
	Return DllStructGetData($tRect, "Bottom") - DllStructGetData($tRect, "Top")
EndFunc   ;==>_WinAPI_GetClientHeight

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_GetClientWidth
; Description ...: Retrieves the width of a window's client area
; Syntax.........: _WinAPI_GetClientWidth($hWnd)
; Parameters ....: $hWnd        - Handle of window
; Return values .: Success      - Client area width
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......: _WinAPI_GetClientHeight
; Link ..........;
; Example .......;
; ===============================================================================================================================
Func _WinAPI_GetClientWidth($hWnd)
	Local $tRect

	$tRect = _WinAPI_GetClientRect($hWnd)
	Return DllStructGetData($tRect, "Right") - DllStructGetData($tRect, "Left")
EndFunc   ;==>_WinAPI_GetClientWidth

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_GetClientRect
; Description ...: Retrieves the coordinates of a window's client area
; Syntax.........: _WinAPI_GetClientRect($hWnd)
; Parameters ....: $hWnd        - Handle of window
; Return values .: Success      - $tagRECT structure that receives the client coordinates
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........; @@MsdnLink@@ GetClientRect
; Example .......;
; ===============================================================================================================================
Func _WinAPI_GetClientRect($hWnd)
	Local $tRect, $aResult

	$tRect = DllStructCreate($tagRECT)
	$aResult = DllCall("User32.dll", "int", "GetClientRect", "hwnd", $hWnd, "ptr", DllStructGetPtr($tRect))
	_WinAPI_Check("_WinAPI_GetClientRect", ($aResult[0] = 0), 0, True)
	Return $tRect
EndFunc   ;==>_WinAPI_GetClientRect

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_GetCurrentProcess
; Description ...: Returns the process handle of the calling process
; Syntax.........: _WinAPI_GetCurrentProcess()
; Parameters ....:
; Return values .: Success      - Process handle of the calling process
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......: _WinAPI_GetCurrentProcessID
; Link ..........; @@MsdnLink@@ GetCurrentProcess
; Example .......;
; ===============================================================================================================================
Func _WinAPI_GetCurrentProcess()
	Local $aResult

	$aResult = DllCall("Kernel32.dll", "hwnd", "GetCurrentProcess")
	Return $aResult[0]
EndFunc   ;==>_WinAPI_GetCurrentProcess

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_GetCurrentProcessID
; Description ...: Returns the process identifier of the calling process
; Syntax.........: _WinAPI_GetCurrentProcessID()
; Parameters ....:
; Return values .: Success      - Process identifier of the calling process
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......: _WinAPI_GetWindowThreadProcessID
; Link ..........; @@MsdnLink@@ GetCurrentProcessId
; Example .......;
; ===============================================================================================================================
Func _WinAPI_GetCurrentProcessID()
	Local $aResult

	$aResult = DllCall("Kernel32.dll", "int", "GetCurrentProcessId")
	Return $aResult[0]
EndFunc   ;==>_WinAPI_GetCurrentProcessID

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_GetCurrentThread
; Description ...: Retrieves a pseudo handle for the calling thread.
; Syntax.........: _WinAPI_GetCurrentThread()
; Parameters ....:
; Return values .: Success      - Pseudo handle for the current thread
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......: A pseudo handle is a special constant that is interpreted as the current thread handle. The calling thread can
;                  use this handle to specify itself whenever a thread handle is required.
; Related .......:
; Link ..........; @@MsdnLink@@ GetCurrentThread
; Example .......;
; ===============================================================================================================================
Func _WinAPI_GetCurrentThread()
	Local $aResult

	$aResult = DllCall("Kernel32.dll", "int", "GetCurrentThread")
	Return $aResult[0]
EndFunc   ;==>_WinAPI_GetCurrentThread

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_GetCurrentThreadId
; Description ...: Returns the thread identifier of the calling thread
; Syntax.........: _WinAPI_GetCurrentThreadId()
; Parameters ....:
; Return values .: Success      - Thread identifier of the calling thread
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........; @@MsdnLink@@ GetCurrentThreadId
; Example .......;
; ===============================================================================================================================
Func _WinAPI_GetCurrentThreadId()
	Local $aResult

	$aResult = DllCall("Kernel32.dll", "int", "GetCurrentThreadId")
	Return $aResult[0]
EndFunc   ;==>_WinAPI_GetCurrentThreadId

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_GetCursorInfo
; Description ...: Retrieves information about the global cursor
; Syntax.........: _WinAPI_GetCursorInfo()
; Parameters ....:
; Return values .: Success      - Array with the following format:
;                  |$aCursor[0] - True on success, otherwise False
;                  |$aCursor[1] - True if cursor is showing, otherwise False
;                  |$aCursor[2] - Handle to the cursor
;                  |$aCursor[3] - X coordinate of the cursor
;                  |$aCursor[4] - Y coordinate of the cursor
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........; @@MsdnLink@@ GetCursorInfo
; Example .......;
; ===============================================================================================================================
Func _WinAPI_GetCursorInfo()
	Local $iCursor, $tCursor, $aResult, $aCursor[5]

	$tCursor = DllStructCreate($tagCURSORINFO)
	$iCursor = DllStructGetSize($tCursor)
	DllStructSetData($tCursor, "Size", $iCursor)
	$aResult = DllCall("User32.dll", "int", "GetCursorInfo", "ptr", DllStructGetPtr($tCursor))
	_WinAPI_Check("_WinAPI_GetCursorInfo", ($aResult[0] = 0), 0, True)
	$aCursor[0] = $aResult[0] <> 0
	$aCursor[1] = DllStructGetData($tCursor, "Flags") <> 0
	$aCursor[2] = DllStructGetData($tCursor, "hCursor")
	$aCursor[3] = DllStructGetData($tCursor, "X")
	$aCursor[4] = DllStructGetData($tCursor, "Y")
	Return $aCursor
EndFunc   ;==>_WinAPI_GetCursorInfo

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_GetDC
; Description ...: Retrieves a handle of a display device context for the client area a window
; Syntax.........: _WinAPI_GetDC($hWnd)
; Parameters ....: $hWnd        - Handle of window
; Return values .: Success      - The device context for the given window's client area
;                  Failure      - 0
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......: After painting with a common device context, the _WinAPI_ReleaseDC function must be called to release the DC
; Related .......:
; Link ..........; @@MsdnLink@@ GetDC
; Example .......;
; ===============================================================================================================================
Func _WinAPI_GetDC($hWnd)
	Local $aResult

	$aResult = DllCall("User32.dll", "hwnd", "GetDC", "hwnd", $hWnd)
	_WinAPI_Check("_WinAPI_GetDC", ($aResult[0] = 0), -1)
	Return $aResult[0]
EndFunc   ;==>_WinAPI_GetDC

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_GetDesktopWindow
; Description ...: Returns the handle of the Windows desktop window
; Syntax.........: _WinAPI_GetDesktopWindow()
; Parameters ....:
; Return values .: Success      - Handle of the desktop window
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........; @@MsdnLink@@ GetDesktopWindow
; Example .......;
; ===============================================================================================================================
Func _WinAPI_GetDesktopWindow()
	Local $aResult

	$aResult = DllCall("User32.dll", "hwnd", "GetDesktopWindow")
	Return $aResult[0]
EndFunc   ;==>_WinAPI_GetDesktopWindow

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_GetDeviceCaps
; Description ...: Retrieves device specific information about a specified device
; Syntax.........: _WinAPI_GetDeviceCaps($hDC, $iIndex)
; Parameters ....: $hDC         - Identifies the device context
;                  $iIndex      - Specifies the item to return
; Return values .: Success      - The value of the desired item
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........; @@MsdnLink@@ GetDeviceCaps
; Example .......;
; ===============================================================================================================================
Func _WinAPI_GetDeviceCaps($hDC, $iIndex)
	Local $aResult

	$aResult = DllCall("GDI32.dll", "int", "GetDeviceCaps", "hwnd", $hDC, "int", $iIndex)
	Return $aResult[0]
EndFunc   ;==>_WinAPI_GetDeviceCaps

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_GetDIBits
; Description ...: Retrieves the bits of the specified bitmap and copies them into a buffer as a DIB
; Syntax.........: _WinAPI_GetDIBits($hDC, $hBmp, $iStartScan, $iScanLines, $pBits, $pBI, $iUsage)
; Parameters ....: $hDC         - Handle to the device context
;                  $hBmp        - Handle to the bitmap. This must be a compatible bitmap (DDB).
;                  $iStartScan  - Specifies the first scan line to retrieve
;                  $iScanLines  - Specifies the number of scan lines to retrieve
;                  $pBits       - Pointer to a buffer to receive the bitmap data. If this parameter is 0, the function passes the
;                  +dimensions and format of the bitmap to the $tagBITMAPINFO structure pointed to by the pBI parameter.
;                  $pBI         - Pointer to a $tagBITMAPINFO structure that specifies the desired format for the DIB data
;                  $iUsage      - Specifies the format of the bmiColors member of the $tagBITMAPINFO structure. It must be one  of
;                  +the following values:
;                  |$DIB_PAL_COLORS - The color table should consist of an array of 16-bit indexes into the current palette
;                  |$DIB_RGB_COLORS - The color table should consist of literal red, green, blue values
; Return values .: Success      - If pBits is not 0 and the function succeeds, the return value  is  the  number  of  scan  lines
;                  +copied from the bitmap.  If pBits is 0 and GetDIBits successfully fills the structure, the  return  value  is
;                  +True.
;                  Failure      - False
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........; @@MsdnLink@@ GetDIBits
; Example .......;
; ===============================================================================================================================
Func _WinAPI_GetDIBits($hDC, $hBmp, $iStartScan, $iScanLines, $pBits, $pBI, $iUsage)
	Local $aResult

	$aResult = DllCall("GDI32.dll", "int", "GetDIBits", "hwnd", $hDC, "hwnd", $hBmp, "int", $iStartScan, "int", $iScanLines, _
			"ptr", $pBits, "ptr", $pBI, "int", $iUsage)
	_WinAPI_Check("_WinAPI_GetDIBits", ($aResult[0] = 0), 0, True)
	Return $aResult[0] <> 0
EndFunc   ;==>_WinAPI_GetDIBits

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_GetDlgCtrlID
; Description ...: Returns the identifier of the specified control
; Syntax.........: _WinAPI_GetDlgCtrlID($hWnd)
; Parameters ....: $hWnd        - Handle to control
; Return values .: Success      - Identifier of the control
;                  Failure      - 0
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......: GetDlgCtrlID accepts child window handles as well as handles of controls in dialog boxes.  An application sets
;                  the identifier for a child window when it creates the window by assigning the identifier value  to  the  hmenu
;                  parameter when calling the CreateWindow or CreateWindowEx function.  Although GetDlgCtrlID may return a  value
;                  if $hWnd identifies a top-level window, top-level windows cannot have identifiers and such a return  value  is
;                  never valid.
; Related .......:
; Link ..........; @@MsdnLink@@ GetDlgCtrlID
; Example .......;
; ===============================================================================================================================
Func _WinAPI_GetDlgCtrlID($hWnd)
	Local $aResult

	$aResult = DllCall("User32.dll", "hwnd", "GetDlgCtrlID", "hwnd", $hWnd)
	Return $aResult[0]
EndFunc   ;==>_WinAPI_GetDlgCtrlID

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_GetDlgItem
; Description ...: Retrieves the handle of a control in the specified dialog box
; Syntax.........: _WinAPI_GetDlgItem($hWnd, $iItemID)
; Parameters ....: $hWnd        - Handle to the dialog box
;                  $iItemID     - Specifies the identifier of the control to be retrieved
; Return values .: Success      - The window handle of the given control
;                  Failure      - 0
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......: You can use the GetDlgItem function with any parent-child window pair, not just with dialog boxes.  As long as
;                  the $hWnd parameter specifies a parent window and the child window has a unique identifier, GetDlgItem returns
;                  a valid handle to the child window.
; Related .......:
; Link ..........; @@MsdnLink@@ GetDlgItem
; Example .......;
; ===============================================================================================================================
Func _WinAPI_GetDlgItem($hWnd, $iItemID)
	Local $aResult

	$aResult = DllCall("User32.dll", "hwnd", "GetDlgItem", "hwnd", $hWnd, "int", $iItemID)
	Return $aResult[0]
EndFunc   ;==>_WinAPI_GetDlgItem

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_GetFocus
; Description ...: Retrieves the handle of the window that has the keyboard focus
; Syntax.........: _WinAPI_GetFocus()
; Parameters ....:
; Return values .: Success      - The handle of the window with the keyboard focus
;                  Failure      - 0
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........; @@MsdnLink@@ GetFocus
; Example .......;
; ===============================================================================================================================
Func _WinAPI_GetFocus()
	Local $aResult

	$aResult = DllCall("User32.dll", "hwnd", "GetFocus")
	Return $aResult[0]
EndFunc   ;==>_WinAPI_GetFocus

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_GetForegroundWindow
; Description ...: Returns the handle of the foreground window
; Syntax.........: _WinAPI_GetForegroundWindow()
; Parameters ....:
; Return values .: Success      - Handle of the foreground window
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........; @@MsdnLink@@ GetForegroundWindow
; Example .......;
; ===============================================================================================================================
Func _WinAPI_GetForegroundWindow()
	Local $aResult

	$aResult = DllCall("User32.dll", "hwnd", "GetForegroundWindow")
	Return $aResult[0]
EndFunc   ;==>_WinAPI_GetForegroundWindow

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_GetIconInfo
; Description ...: Retrieves information about the specified icon or cursor
; Syntax.........: _WinAPI_GetIconInfo($hIcon)
; Parameters ....: $hIcon       - Handle to the icon or cursor. To retrieve information on a standard icon or cursor, specify one
;                  +of the following values:
;                  |$IDC_APPSTARTING - Standard arrow and small hourglass cursor
;                  |$IDC_ARROW       - Standard arrow cursor
;                  |$IDC_CROSS       - Crosshair cursor
;                  |$IDC_HAND        - Hand cursor
;                  |$IDC_HELP        - Arrow and question mark cursor
;                  |$IDC_IBEAM       - I-beam cursor
;                  |$IDC_NO          - Slashed circle cursor
;                  |$IDC_SIZEALL     - Four-pointed arrow cursor
;                  |$IDC_SIZENESW    - Double-pointed arrow cursor pointing NE and SW
;                  |$IDC_SIZENS      - Double-pointed arrow cursor pointing N and S
;                  |$IDC_SIZENWSE    - Double-pointed arrow cursor pointing NW and SE
;                  |$IDC_SIZEWE      - Double-pointed arrow cursor pointing W and E
;                  |$IDC_UPARROW     - Vertical arrow cursor
;                  |$IDC_WAIT        - Hourglass cursor
;                  |$IDI_APPLICATION - Application icon
;                  |$IDI_ASTERISK    - Asterisk icon
;                  |$IDI_EXCLAMATION - Exclamation point icon
;                  |$IDI_HAND        - Stop sign icon
;                  |$IDI_QUESTION    - Question-mark icon
;                  |$IDI_WINLOGO     - Windows logo icon
; Return values .: Success      - Array with the following format:
;                  |$aIcon[0] - True on success, otherwise False
;                  |$aIcon[1] - True specifies an icon, False specifies a cursor
;                  |$aIcon[2] - Specifies the X coordinate of a cursor's hot spot
;                  |$aIcon[3] - Specifies the Y coordinate of a cursor's hot spot
;                  |$aIcon[4] - Specifies the icon bitmask bitmap
;                  |$aIcon[5] - Handle to the icon color bitmap
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......: This function creates bitmaps for the bitmask and color members.  You must manage  these  bitmaps  and  delete
;                  them when they are no longer necessary.
; Related .......:
; Link ..........; @@MsdnLink@@ GetIconInfo
; Example .......;
; ===============================================================================================================================
Func _WinAPI_GetIconInfo($hIcon)
	Local $tInfo, $aResult, $aIcon[6]

	$tInfo = DllStructCreate($tagICONINFO)
	$aResult = DllCall("User32.dll", "int", "GetIconInfo", "hwnd", $hIcon, "ptr", DllStructGetPtr($tInfo))
	_WinAPI_Check("_WinAPI_GetIconInfo", ($aResult[0] = 0), 0, True)
	$aIcon[0] = $aResult[0] <> 0
	$aIcon[1] = DllStructGetData($tInfo, "Icon") <> 0
	$aIcon[2] = DllStructGetData($tInfo, "XHotSpot")
	$aIcon[3] = DllStructGetData($tInfo, "YHotSpot")
	$aIcon[4] = DllStructGetData($tInfo, "hMask")
	$aIcon[5] = DllStructGetData($tInfo, "hColor")
	Return $aIcon
EndFunc   ;==>_WinAPI_GetIconInfo

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_GetFileSizeEx
; Description ...: Retrieves the size of the specified file
; Syntax.........: _WinAPI_GetFileSizeEx($hFile)
; Parameters ....: $hFile       - Handle to the file whose size is to be returned
; Return values .: Success      - File size
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......: _WinAPI_CreateFile, _WinAPI_ReadFile, _WinAPI_WriteFile
; Link ..........; @@MsdnLink@@ GetFileSizeEx
; Example .......;
; ===============================================================================================================================
Func _WinAPI_GetFileSizeEx($hFile)
	Local $tSize

	$tSize = DllStructCreate("int64 Size")
	DllCall("Kernel32.dll", "int", "GetFileSizeEx", "hwnd", $hFile, "ptr", DllStructGetPtr($tSize))
	Return SetError(_WinAPI_GetLastError(), 0, DllStructGetData($tSize, "Size"))
EndFunc   ;==>_WinAPI_GetFileSizeEx

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_GetLastError
; Description ...: Returns the calling thread's lasterror code value
; Syntax.........: _WinAPI_GetLastError()
; Parameters ....:
; Return values .: Success      - Last error code
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......: _WinAPI_GetLastErrorMessage
; Link ..........; @@MsdnLink@@ GetLastError
; Example .......;
; ===============================================================================================================================
Func _WinAPI_GetLastError()
	Local $aResult

	$aResult = DllCall("Kernel32.dll", "int", "GetLastError")
	Return $aResult[0]
EndFunc   ;==>_WinAPI_GetLastError

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_GetLastErrorMessage
; Description ...: Returns the calling threads last error message
; Syntax.........: _WinAPI_GetLastErrorMessage()
; Parameters ....:
; Return values .: Success      - Last error message
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......: _WinAPI_GetLastError
; Link ..........;
; Example .......;
; ===============================================================================================================================
Func _WinAPI_GetLastErrorMessage()
	Local $tText

	$tText = DllStructCreate("char Text[4096]")
	_WinAPI_FormatMessage($FORMAT_MESSAGE_FROM_SYSTEM, 0, _WinAPI_GetLastError(), 0, DllStructGetPtr($tText), 4096, 0)
	Return DllStructGetData($tText, "Text")
EndFunc   ;==>_WinAPI_GetLastErrorMessage

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_GetModuleHandle
; Description ...: Returns a module handle for the specified module
; Syntax.........: _WinAPI_GetModuleHandle($sModuleName)
; Parameters ....: $sModuleName - Names a Win32 module (either a .DLL or .EXE file).  If the filename extension is  omitted,  the
;                  +default library extension .DLL is appended. The filename string can include a trailing point character (.) to
;                  +indicate that the module name has no extension.  The string does not have to specify  a  path.  The  name  is
;                  +compared (case independently) to the names of modules currently mapped into the address space of the  calling
;                  +process. If this parameter is 0 the function returns a handle of the file used to create the calling process.
; Return values .: Success      - The handle to the specified module
;                  Failure      - 0
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........; @@MsdnLink@@ GetModuleHandle
; Example .......;
; ===============================================================================================================================
Func _WinAPI_GetModuleHandle($sModuleName)
	Local $tText, $aResult

	If $sModuleName <> "" Then
		$tText = DllStructCreate("char Text[4096]")
		DllStructSetData($tText, "Text", $sModuleName)
		$aResult = DllCall("Kernel32.dll", "hwnd", "GetModuleHandle", "ptr", DllStructGetPtr($tText))
	Else
		$aResult = DllCall("Kernel32.dll", "hwnd", "GetModuleHandle", "ptr", 0)
	EndIf
	_WinAPI_Check("_WinAPI_GetModuleHandle", ($aResult[0] = 0), 0, True)
	Return $aResult[0]
EndFunc   ;==>_WinAPI_GetModuleHandle

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_GetMousePos
; Description ...: Returns the current mouse position
; Syntax.........: _WinAPI_GetMousePos([$fToClient = False], $hWnd = 0]])
; Parameters ....: $fToClient   - If True, the coordinates will be converted to client coordinates
;                  $hWnd        - Window handle used to convert coordinates if $fToClient is True
; Return values .: Success      - $tagPOINT structure with current mouse position
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......: This function takes into account the current MouseCoordMode setting when  obtaining  the  mouse  position.  It
;                  will also convert screen to client coordinates based on the parameters passed.
; Related .......:
; Link ..........;
; Example .......;
; ===============================================================================================================================
Func _WinAPI_GetMousePos($fToClient = False, $hWnd = 0)
	Local $iMode, $aPos, $tPoint

	$iMode = Opt("MouseCoordMode", 1)
	$aPos = MouseGetPos()
	Opt("MouseCoordMode", $iMode)
	$tPoint = DllStructCreate($tagPOINT)
	DllStructSetData($tPoint, "X", $aPos[0])
	DllStructSetData($tPoint, "Y", $aPos[1])
	If $fToClient Then _WinAPI_ScreenToClient($hWnd, $tPoint)
	Return $tPoint
EndFunc   ;==>_WinAPI_GetMousePos

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_GetMousePosX
; Description ...: Returns the current mouse X position
; Syntax.........: _WinAPI_GetMousePosX([$fToClient = False[, $hWnd = 0]])
; Parameters ....: $fToClient   - If True, the coordinates will be converted to client coordinates
;                  $hWnd        - Window handle used to convert coordinates if $fToClient is True
; Return values .: Success      - Mouse X position
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......: This function takes into account the current MouseCoordMode setting when  obtaining  the  mouse  position.  It
;                  will also convert screen to client coordinates based on the parameters passed.
; Related .......: _WinAPI_GetMousePos
; Link ..........;
; Example .......;
; ===============================================================================================================================
Func _WinAPI_GetMousePosX($fToClient = False, $hWnd = 0)
	Local $tPoint

	$tPoint = _WinAPI_GetMousePos($fToClient, $hWnd)
	Return DllStructGetData($tPoint, "X")
EndFunc   ;==>_WinAPI_GetMousePosX

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_GetMousePosY
; Description ...: Returns the current mouse Y position
; Syntax.........: _WinAPI_GetMousePosY([$fToClient = False[, $hWnd = 0]])
; Parameters ....: $fToClient   - If True, the coordinates will be converted to client coordinates
;                  $hWnd        - Window handle used to convert coordinates if $fToClient is True
; Return values .: Success      - Mouse Y position
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......: This function takes into account the current MouseCoordMode setting when  obtaining  the  mouse  position.  It
;                  will also convert screen to client coordinates based on the parameters passed.
; Related .......: _WinAPI_GetMousePos
; Link ..........;
; Example .......;
; ===============================================================================================================================
Func _WinAPI_GetMousePosY($fToClient = False, $hWnd = 0)
	Local $tPoint

	$tPoint = _WinAPI_GetMousePos($fToClient, $hWnd)
	Return DllStructGetData($tPoint, "Y")
EndFunc   ;==>_WinAPI_GetMousePosY

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_GetObject
; Description ...: Retrieves information for the specified graphics object
; Syntax.........: _WinAPI_GetObject($hObject, $iSize, $pObject)
; Parameters ....: $hObject     - Identifies a logical pen, brush, font, bitmap, region, or palette
;                  $iSize       - Specifies the number of bytes to be written to the buffer
;                  $pObject     - Pointer to a buffer that receives the information.  The following shows the type of information
;                  +the buffer receives for each type of graphics object you can specify:
;                  |HBITMAP  - BITMAP or DIBSECTIOn
;                  |HPALETTE - A count of the number of entries in the logical palette
;                  |HPEN     - EXTLOGPEN or LOGPEN
;                  |HBRUSH   - LOGBRUSH
;                  |HFONT    - LOGFONT
;                  -
;                  |If $pObject is 0 the function return value is the number of bytes required to store the information it writes
;                  +to the buffer for the specified graphics object.
; Return values .: Success      - If $pObject is a valid pointer, the return value is the number of bytes stored into the buffer.
;                  +If the function succeeds, and $pObject is 0, the return value is the number of bytes  required  to  hold  the
;                  +information the function would store into the buffer.
;                  Failure      - 0
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........; @@MsdnLink@@ GetObject
; Example .......;
; ===============================================================================================================================
Func _WinAPI_GetObject($hObject, $iSize, $pObject)
	Local $aResult

	$aResult = DllCall("GDI32.dll", "int", "GetObject", "int", $hObject, "int", $iSize, "ptr", $pObject)
	_WinAPI_Check("_WinAPI_GetObject", ($aResult[0] = 0), 0, True)
	Return $aResult[0]
EndFunc   ;==>_WinAPI_GetObject

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_GetOverlappedResult
; Description ...: Retrieves the results of an overlapped operation
; Syntax.........: _WinAPI_GetOverlappedResult($hFile, $pOverlapped, ByRef $iBytes[, $fWait = False])
; Parameters ....: $hFile       - Handle to the file, named pipe, or communications device.  This is the  same  handle  that  was
;                  +specified when the overlapped operation was started by  a  call  to  ReadFile,  WriteFile,  ConnectNamedPipe,
;                  +TransactNamedPipe, DeviceIoControl, or WaitCommEvent.
;                  $pOverlapped - Pointer to the $tagOVERLAPPED structure that was specified when  the  overlapped  operation  was
;                  +started.
;                  $iBytes      - The number of bytes that were actually  transferred  by  a  read  or  write  operation.  For  a
;                  +TransactNamedPipe operation, this is the number of bytes that were read from the pipe.  For a DeviceIoControl
;                  +operation this is the number of bytes of output data returned by the device driver. For a ConnectNamedPipe or
;                  +WaitCommEvent operation, this value is undefined.
;                  $fWait       - If True, the function does not return until the operation has been completed.  If False and the
;                  +operation  is  still  pending,  the  function  returns  False  and  the  GetLastError  function  will  return
;                  +ERROR_IO_INCOMPLETE.
; Return values .: Success      - The number of bytes that were actually transferred by a read or write operation
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........; @@MsdnLink@@ GetOverlappedResult
; Example .......;
; ===============================================================================================================================
Func _WinAPI_GetOverlappedResult($hFile, $pOverlapped, ByRef $iBytes, $fWait = False)
	Local $pRead, $tRead, $aResult

	$tRead = DllStructCreate("int Read")
	$pRead = DllStructGetPtr($tRead)
	$aResult = DllCall("Kernel32.dll", "int", "GetOverlappedResult", "int", $hFile, "ptr", $pOverlapped, "ptr", $pRead, "int", $fWait)
	$iBytes = DllStructGetData($tRead, "Read")
	Return SetError(_WinAPI_GetLastError(), 0, $aResult[0] <> 0)
EndFunc   ;==>_WinAPI_GetOverlappedResult

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_GetParent
; Description ...: Retrieves the handle of the specified child window's parent window
; Syntax.........: _WinAPI_GetParent($hWnd)
; Parameters ....: $hWnd        - Window handle of child window
; Return values .: Success      - The handle of the parent window
;                  Failure      - 0
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........; @@MsdnLink@@ GetParent
; Example .......;
; ===============================================================================================================================
Func _WinAPI_GetParent($hWnd)
	Local $aResult

	$aResult = DllCall("User32.dll", "hwnd", "GetParent", "hwnd", $hWnd)
	Return $aResult[0]
EndFunc   ;==>_WinAPI_GetParent

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_GetProcessAffinityMask
; Description ...: Obtains a affinity masks for the process and the system
; Syntax.........: _WinAPI_GetProcessAffinityMask($hProcess)
; Parameters ....: $hProcess    - An open handle to the process whose affinity mask is desired.
; Return values .: Success      - Array with the following format:
;                  |$aMask[0] - True on success, otherwise False
;                  |$aMask[1] - Process affinity mask
;                  |$aMask[2] - System affinity mask
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......: An affinity mask is a bit mask in which each bit represents a processor on which the threads  of  the  process
;                  are allowed to run.  For example, if you pass a mask of 0x05, processors 1 and 3 are allowed to run.
; Related .......:
; Link ..........; @@MsdnLink@@ GetProcessAffinityMask
; Example .......;
; ===============================================================================================================================
Func _WinAPI_GetProcessAffinityMask($hProcess)
	Local $pProcess, $tProcess, $pSystem, $tSystem, $aResult, $aMask[3]

	$tProcess = DllStructCreate("int Data")
	$pProcess = DllStructGetPtr($tProcess)
	$tSystem = DllStructCreate("int Data")
	$pSystem = DllStructGetPtr($tSystem)
	$aResult = DllCall("Kernel32.dll", "int", "GetProcessAffinityMask", "hwnd", $hProcess, "ptr", $pProcess, "ptr", $pSystem)
	$aMask[0] = $aResult[0] <> 0
	$aMask[1] = DllStructGetData($tProcess, "Data")
	$aMask[2] = DllStructGetData($tSystem, "Data")
	Return $aMask
EndFunc   ;==>_WinAPI_GetProcessAffinityMask

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_GetStockObject
; Description ...: Retrieves a handle to one of the predefined stock pens, brushes, fonts, or palettes
; Syntax.........: _WinAPI_GetStockObject($iObject)
; Parameters ....: $iObject     - Specifies the type of stock object. This parameter can be any one of the following values:
;                  |$BLACK_BRUSH         - Black brush
;                  |$DKGRAY_BRUSH        - Dark gray brush
;                  |$GRAY_BRUSH          - Gray brush
;                  |$HOLLOW_BRUSH        - Hollow brush (equivalent to NULL_BRUSH)
;                  |$LTGRAY_BRUSH        - Light gray brush
;                  |$NULL_BRUSH          - Null brush (equivalent to HOLLOW_BRUSH)
;                  |$WHITE_BRUSH         - White brush
;                  |$BLACK_PEN           - Black pen
;                  |$NULL_PEN            - Null pen
;                  |$WHITE_PEN           - White pen
;                  |$ANSI_FIXED_FONT     - Windows fixed-pitch (monospace) system font
;                  |$ANSI_VAR_FONT       - Windows variable-pitch (proportional space) system font
;                  |$DEVICE_DEFAULT_FONT - Device-dependent font
;                  |$DEFAULT_GUI_FONT    - Default font for user interface objects
;                  |$OEM_FIXED_FONT      - OEM dependent fixed-pitch (monospace) font
;                  |$SYSTEM_FONT         - System font
;                  |$SYSTEM_FIXED_FONT   - Fixed-pitch (monospace) system font used in Windows versions earlier than 3.0
;                  |$DEFAULT_PALETTE     - Default palette. This palette consists of the static colors in the system palette.
; Return values .: Success      - The logical object requested
;                  Failure      - 0
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........; @@MsdnLink@@ GetStockObject
; Example .......;
; ===============================================================================================================================
Func _WinAPI_GetStockObject($iObject)
	Local $aResult

	$aResult = DllCall("GDI32.dll", "hwnd", "GetStockObject", "int", $iObject)
	Return $aResult[0]
EndFunc   ;==>_WinAPI_GetStockObject

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_GetStdHandle
; Description ...: Retrieves a handle for the standard input, standard output, or standard error device
; Syntax.........: _WinAPI_GetStdHandle($iStdHandle)
; Parameters ....: $iStdHandle  - Standard device for which a handle is to be returned. This can be one of the following values:
;                  |0 - Handle to the standard input device
;                  |1 - Handle to the standard output device
;                  |2 - Handle to the standard error device
; Return values .: Success      - Handle to the specified device
;                  Failure      - -1
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......: The handle has GENERIC_READ and GENERIC_WRITE access rights, unless the application has used  SetStdHandle  to
;                  set a standard handle with lesser access.  If an application does not have associated  standard  handles,  the
;                  return value is 0.
; Related .......:
; Link ..........; @@MsdnLink@@ GetStdHandle
; Example .......;
; ===============================================================================================================================
Func _WinAPI_GetStdHandle($iStdHandle)
	Local $aHandle[3] = [ -10, -11, -12], $aResult

	$aResult = DllCall("Kernel32.dll", "int", "GetStdHandle", "int", $aHandle[$iStdHandle])
	Return SetError(_WinAPI_GetLastError(), 0, $aResult[0])
EndFunc   ;==>_WinAPI_GetStdHandle

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_GetSysColor
; Description ...: Retrieves the current color of the specified display element
; Syntax.........: _WinAPI_GetSysColor($iIndex)
; Parameters ....: $iIndex      - The display element whose color is to be retrieved
; Return values .: Success      - The red, green, blue (RGB) color value of the given element
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........; @@MsdnLink@@ GetSysColor
; Example .......;
; ===============================================================================================================================
Func _WinAPI_GetSysColor($iIndex)
	Local $aResult

	$aResult = DllCall("User32.dll", "int", "GetSysColor", "int", $iIndex)
	Return $aResult[0]
EndFunc   ;==>_WinAPI_GetSysColor

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_GetSysColorBrush
; Description ...: retrieves a handle identifying a logical brush that corresponds to the specified color index
; Syntax.........: _WinAPI_GetSysColorBrush($iIndex)
; Parameters ....: $iIndex      - The display element whose color is to be retrieved
; Return values .: Success      - A logical brush if $iIndex is supported by the current platform
;                  Failure      - 0
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........; @@MsdnLink@@ GetSysColorBrush
; Example .......;
; ===============================================================================================================================
Func _WinAPI_GetSysColorBrush($iIndex)
	Local $aResult

	$aResult = DllCall("User32.dll", "int", "GetSysColorBrush", "int", $iIndex)
	Return $aResult[0]
EndFunc   ;==>_WinAPI_GetSysColorBrush

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_GetSystemMetrics
; Description ...: Retrieves the specified system metric or system configuration setting
; Syntax.........: _WinAPI_GetSystemMetrics($iIndex)
; Parameters ....: $iIndex      - The system metric or configuration setting to be retrieved
; Return values .: Success      - The requested system metric
;                  Failure      - 0
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........; @@MsdnLink@@ GetSystemMetrics
; Example .......;
; ===============================================================================================================================
Func _WinAPI_GetSystemMetrics($iIndex)
	Local $aResult

	$aResult = DllCall("User32.dll", "int", "GetSystemMetrics", "int", $iIndex)
	Return $aResult[0]
EndFunc   ;==>_WinAPI_GetSystemMetrics

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_GetTextExtentPoint32
; Description ...: Computes the width and height of the specified string of text
; Syntax.........: _WinAPI_GetTextExtentPoint32($hDC, $sText)
; Parameters ....: $hDC         - Identifies the device contex
;                  $sText       - String of text
; Return values .: Success      - $tagSIZE structure in which the dimensions of the string are to be returned
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........; @@MsdnLink@@ GetTextExtentPoint32
; Example .......;
; ===============================================================================================================================
Func _WinAPI_GetTextExtentPoint32($hDC, $sText)
	Local $tSize, $iSize, $aResult

	$tSize = DllStructCreate($tagSIZE)
	$iSize = StringLen($sText)
	$aResult = DllCall("GDI32.dll", "int", "GetTextExtentPoint32", "hwnd", $hDC, "str", $sText, "int", $iSize, "ptr", DllStructGetPtr($tSize))
	_WinAPI_Check("_WinAPI_GetTextExtentPoint32", ($aResult[0] = 0), 0, True)
	Return $tSize
EndFunc   ;==>_WinAPI_GetTextExtentPoint32

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_GetWindow
; Description ...: Retrieves the handle of a window that has a specified relationship to the specified window
; Syntax.........: _WinAPI_GetWindow($hWnd, $iCmd)
; Parameters ....: $hWnd        - Handle of the window
;                  $iCmd        - Specifies the relationship between the specified window and the window whose handle  is  to  be
;                  +retrieved. This parameter can be one of the following values:
;                  |$GW_CHILD    - The retrieved handle identifies the child window at the top of the Z order, if  the  specified
;                  +window is a parent window; otherwise, the retrieved handle is 0.  The function examines only child windows of
;                  +the specified window. It does not examine descendant windows.
;                  |$GW_HWNDFIRST - The retrieved handle identifies the window of the same type that is highest in the  Z  order.
;                  +If the specified window is a topmost window, the handle identifies the topmost window that is highest in  the
;                  +Z order.  If the specified window is a top-level window, the handle identifies the top level window  that  is
;                  +highest in the Z order.  If the specified window is a child window, the handle identifies the sibling  window
;                  +that is highest in the Z order.
;                  |$GW_HWNDLAST - The retrieved handle identifies the window of the same type that is lowest in the Z order.  If
;                  +the specified window is a topmost window, the handle identifies the topmost window that is lowest  in  the  Z
;                  +order. If the specified window is a top-level window the handle identifies the top-level window that's lowest
;                  +in the Z order.  If the specified window is a child window, the handle identifies the sibling window  that is
;                  +lowest in the Z order.
;                  |$GW_HWNDNEXT - The retrieved handle identifies the window below the specified window in the Z order.   If the
;                  +specified window is a topmost window, the handle identifies the topmost window below the specified window. If
;                  +the specified window is a top-level window, the handle identifies the top-level  window  below  the specified
;                  +window.  If the specified window is a child window  the  handle  identifies  the  sibling  window  below  the
;                  +specified window.
;                  |$GW_HWNDPREV - The retrieved handle identifies the window above the specified window in the Z order.   If the
;                  +specified window is a topmost window, the handle identifies the topmost window above the specified window. If
;                  +the specified window is a top-level window, the handle identifies the top-level window  above  the  specified
;                  +window.  If the specified window is a child window, the  handle  identifies  the  sibling  window  above  the
;                  +specified window.
;                  |$GW_OWNER    - The retrieved handle identifies the specified window's owner window if any
; Return values .: Success      - The window handle
;                  Failure      - 0
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........; @@MsdnLink@@ GetWindow
; Example .......;
; ===============================================================================================================================
Func _WinAPI_GetWindow($hWnd, $iCmd)
	Local $aResult

	$aResult = DllCall("User32.dll", "hwnd", "GetWindow", "hwnd", $hWnd, "int", $iCmd)
	Return $aResult[0]
EndFunc   ;==>_WinAPI_GetWindow

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_GetWindowDC
; Description ...: Retrieves the device context (DC) for the entire window
; Syntax.........: _WinAPI_GetWindowDC($hWnd)
; Parameters ....: $hWnd        - Handle of window
; Return values .: Success      - The handle of a device context for the specified window
;                  Failure      - 0
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......: GetWindowDC is intended for special painting effects within a window's nonclient area.  Painting in  nonclient
;                  areas of any window is normally not recommended.  The GetSystemMetrics function can be used  to  retrieve  the
;                  dimensions of various parts of the nonclient area, such as  the  title  bar,  menu,  and  scroll  bars.  After
;                  painting is complete, the _WinAPI_ReleaseDC function must be called to release the device context.  Not releasing
;                  the window device context has serious effects on painting requested by applications.
; Related .......:
; Link ..........; @@MsdnLink@@ GetWindowDC
; Example .......;
; ===============================================================================================================================
Func _WinAPI_GetWindowDC($hWnd)
	Local $aResult

	$aResult = DllCall("User32.dll", "hwnd", "GetWindowDC", "hwnd", $hWnd)
	Return $aResult[0]
EndFunc   ;==>_WinAPI_GetWindowDC

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_GetWindowHeight
; Description ...: Returns the height of the window
; Syntax.........: _WinAPI_GetWindowHeight($hWnd)
; Parameters ....: $hWnd        - Handle to a window
; Return values .: Success      - Height of window
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......: _WinAPI_GetWindowWidth
; Link ..........;
; Example .......;
; ===============================================================================================================================
Func _WinAPI_GetWindowHeight($hWnd)
	Local $tRect

	$tRect = _WinAPI_GetWindowRect($hWnd)
	Return DllStructGetData($tRect, "Bottom") - DllStructGetData($tRect, "Top")
EndFunc   ;==>_WinAPI_GetWindowHeight

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_GetWindowLong
; Description ...: Retrieves information about the specified window
; Syntax.........: _WinAPI_GetWindowLong($hWnd, $iIndex)
; Parameters ....: $hWnd        - Handle of the window
;                  $iIndex      - Specifies the zero based offset to the value to be retrieved.  Valid values are  in  the  range
;                  +zero through the number of bytes of extra window memory, minus four; for example, if you specified 12 or more
;                  +bytes of extra memory, a value of 8 would be an index to the third 32 bit  integer.  To  retrieve  any  other
;                  +value, specify one of the following values:
;                  |$GWL_EXSTYLE    - Retrieves the extended window styles
;                  |$GWL_STYLE      - Retrieves the window styles
;                  |$GWL_WNDPROC    - Retrieves the address of the window procedure
;                  |$GWL_HINSTANCE  - Retrieves the handle of the application instance
;                  |$GWL_HWNDPARENT - Retrieves the handle of the parent window, if any
;                  |$GWL_ID         - Retrieves the identifier of the window
;                  |$GWL_USERDATA   - Retrieves the 32-bit value associated with the window
; Return values .: Success      - The requested value
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........; @@MsdnLink@@ GetWindowLong
; Example .......;
; ===============================================================================================================================
Func _WinAPI_GetWindowLong($hWnd, $iIndex)
	Local $aResult

	$aResult = DllCall("User32.dll", "int", "GetWindowLong", "hwnd", $hWnd, "int", $iIndex)
	Return $aResult[0]
EndFunc   ;==>_WinAPI_GetWindowLong

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_GetWindowRect
; Description ...: Retrieves the dimensions of the bounding rectangle of the specified window
; Syntax.........: _WinAPI_GetWindowRect($hWnd)
; Parameters ....: $hWnd        - Handle of the window
; Return values .: Success      - $tagRECT structure that receives the screen coordinates
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......: $tagRECT
; Link ..........; @@MsdnLink@@ GetWindowRect
; Example .......;
; ===============================================================================================================================
Func _WinAPI_GetWindowRect($hWnd)
	Local $tRect

	$tRect = DllStructCreate($tagRECT)
	DllCall("User32.dll", "int", "GetWindowRect", "hwnd", $hWnd, "ptr", DllStructGetPtr($tRect))
	Return $tRect
EndFunc   ;==>_WinAPI_GetWindowRect

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_GetWindowText
; Description ...: Retrieves the text of the specified window's title bar
; Syntax.........: _WinAPI_GetWindowText($hWnd)
; Parameters ....: $hWnd        - Handle of the window
; Return values .: Success      - Windows title bar
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........; @@MsdnLink@@ GetWindowText
; Example .......;
; ===============================================================================================================================
Func _WinAPI_GetWindowText($hWnd)
	Local $aResult

	$aResult = DllCall("User32.dll", "int", "GetWindowText", "hwnd", $hWnd, "str", "", "int", 4096)
	Return $aResult[2]
EndFunc   ;==>_WinAPI_GetWindowText

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_GetWindowThreadProcessId
; Description ...: Retrieves the identifier of the thread that created the specified window
; Syntax.........: _WinAPI_GetWindowThreadProcessId($hWnd, ByRef $iPID)
; Parameters ....: $hWnd        - Window handle
;                  $iPID        - Process ID of the specified window
; Return values .: Success      - Thread ID of the specified window
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........; @@MsdnLink@@ GetWindowThreadProcessId
; Example .......;
; ===============================================================================================================================
Func _WinAPI_GetWindowThreadProcessId($hWnd, ByRef $iPID)
	Local $pPID, $tPID, $aResult

	$tPID = DllStructCreate("int ID")
	$pPID = DllStructGetPtr($tPID)
	$aResult = DllCall("User32.dll", "int", "GetWindowThreadProcessId", "hwnd", $hWnd, "ptr", $pPID)
	$iPID = DllStructGetData($tPID, "ID")
	Return $aResult[0]
EndFunc   ;==>_WinAPI_GetWindowThreadProcessId

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_GetWindowWidth
; Description ...: Returns the width of the window
; Syntax.........: _WinAPI_GetWindowWidth($hWnd)
; Parameters ....: $hWnd        - Handle to a window
; Return values .: Success      - Width of window
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......: _WinAPI_GetWindowHeight
; Link ..........;
; Example .......;
; ===============================================================================================================================
Func _WinAPI_GetWindowWidth($hWnd)
	Local $tRect

	$tRect = _WinAPI_GetWindowRect($hWnd)
	Return DllStructGetData($tRect, "Right") - DllStructGetData($tRect, "Left")
EndFunc   ;==>_WinAPI_GetWindowWidth

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_GlobalMemStatus
; Description ...: Retrieves information about current available memory
; Syntax.........: _WinAPI_GlobalMemStatus()
; Parameters ....:
; Return values .: Success      - Array with the following format:
;                  |$aMem[0] - Percent of Mem in use
;                  |$aMem[1] - Physical Mem: Total
;                  |$aMem[2] - Physical Mem: Free
;                  |$aMem[3] - Paging file: Total
;                  |$aMem[4] - Paging file: Free
;                  |$aMem[5] - User Mem: Total
;                  |$aMem[6] - User Mem: Free
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......: Unlike the AutoIt MemGetStats() function, this function returns the values in bytes
; Related .......:
; Link ..........; @@MsdnLink@@ GlobalMemStatus
; Example .......;
; ===============================================================================================================================
Func _WinAPI_GlobalMemStatus()
	Local $iMem, $pMem, $tMem, $aMem[7]

	$tMem = DllStructCreate("int;int;int;int;int;int;int;int;int")
	$pMem = DllStructGetPtr($tMem)
	$iMem = DllStructGetSize($tMem)
	DllStructSetData($tMem, 1, $iMem)
	DllCall("Kernel32.dll", "none", "GlobalMemStatus", "ptr", $pMem)
	$aMem[0] = DllStructGetData($tMem, 2)
	$aMem[1] = DllStructGetData($tMem, 3)
	$aMem[2] = DllStructGetData($tMem, 4)
	$aMem[3] = DllStructGetData($tMem, 5)
	$aMem[4] = DllStructGetData($tMem, 6)
	$aMem[5] = DllStructGetData($tMem, 7)
	$aMem[6] = DllStructGetData($tMem, 8)
	Return $aMem
EndFunc   ;==>_WinAPI_GlobalMemStatus

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_GUIDFromString
; Description ...: Converts a string GUID to binary form
; Syntax.........: _WinAPI_GUIDFromString($sGUID)
; Parameters ....: $sGUID       - GUID in string form
; Return values .: Success      - $tagGUID structure
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......: _WinAPI_StringFromGUID
; Link ..........;
; Example .......;
; ===============================================================================================================================
Func _WinAPI_GUIDFromString($sGUID)
	Local $tGUID

	$tGUID = DllStructCreate($tagGUID)
	_WinAPI_GUIDFromStringEx($sGUID, DllStructGetPtr($tGUID))
	Return SetError(@error, 0, $tGUID)
EndFunc   ;==>_WinAPI_GUIDFromString

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_GUIDFromStringEx
; Description ...: Converts a string GUID to binary form
; Syntax.........: _WinAPI_GUIDFromStringEx($sGUID, $pGUID)
; Parameters ....: $sGUID       - GUID in string form
;                  $pGUID       - Pointer to a $tagGUID structure where the GUID will be stored
; Return values .: Success      - True
;                  Failure      - False
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......: _WinAPI_StringFromGUID
; Link ..........; @@MsdnLink@@ CLSIDFromString
; Example .......;
; ===============================================================================================================================
Func _WinAPI_GUIDFromStringEx($sGUID, $pGUID)
	Local $tData, $aResult

	$tData = _WinAPI_MultiByteToWideChar($sGUID)
	$aResult = DllCall("Ole32.dll", "int", "CLSIDFromString", "ptr", DllStructGetPtr($tData), "ptr", $pGUID)
	Return $aResult[0] <> 0
EndFunc   ;==>_WinAPI_GUIDFromStringEx

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_HiWord
; Description ...: Returns the high word of a longword value
; Syntax.........: _WinAPI_HiWord($iLong)
; Parameters ....: $iLong       - Longword value
; Return values .: Success      - High order word of the longword value
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......: _WinAPI_LoWord
; Link ..........;
; Example .......;
; ===============================================================================================================================
Func _WinAPI_HiWord($iLong)
	Return BitShift($iLong, 16)
EndFunc   ;==>_WinAPI_HiWord

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_InProcess
; Description ...: Determines whether a window belongs to the current process
; Syntax.........: _WinAPI_InProcess($hWnd, ByRef $hLastWnd)
; Parameters ....: $hWnd        - Window handle to be tested
;                  $hLastWnd    - Last window tested. If $hWnd = $hLastWnd, this process will immediately return True. Otherwise,
;                  +_WinAPI_InProcess will be called. If $hWnd is in process, $hLastWnd will be set to $hWnd on return.
; Return values .: True         - Window handle belongs to the current process
;                  False        - Window handle does not belong to the current process
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......: This is one of the key functions to the control memory mapping technique pioneered by Auto3Lib.  It checks the
;                  process ID of the window to determine if it belongs to the current process, which means  it  can  be  accessed
;                  without mapping the control memory.
; Related .......:
; Link ..........;
; Example .......;
; ===============================================================================================================================
Func _WinAPI_InProcess($hWnd, ByRef $hLastWnd)
	Local $iI, $iCount, $iProcessID

	If $hWnd = $hLastWnd Then Return True
	For $iI = $winapi_gaInProcess[0][0] To 1 Step - 1
		If $hWnd = $winapi_gaInProcess[$iI][0] Then
			If $winapi_gaInProcess[$iI][1] Then
				$hLastWnd = $hWnd
				Return True
			Else
				Return False
			EndIf
		EndIf
	Next
	_WinAPI_GetWindowThreadProcessId($hWnd, $iProcessID)
	$iCount = $winapi_gaInProcess[0][0] + 1
	If $iCount >= 64 Then $iCount = 1
	$winapi_gaInProcess[0][0] = $iCount
	$winapi_gaInProcess[$iCount][0] = $hWnd
	$winapi_gaInProcess[$iCount][1] = ($iProcessID = @AutoItPID)
	Return $winapi_gaInProcess[$iCount][1]
EndFunc   ;==>_WinAPI_InProcess

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_IntToFloat
; Description ...: Returns a 4 byte integer as a float value
; Syntax.........: _WinAPI_IntToFloat($iInt)
; Parameters ....: $iInt    - Integer value
; Return values .: Success      - 4 byte integer value as a float
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........;
; Example .......;
; ===============================================================================================================================
Func _WinAPI_IntToFloat($iInt)
	Local $tFloat, $tInt

	$tInt = DllStructCreate("int")
	$tFloat = DllStructCreate("float", DllStructGetPtr($tInt))
	DllStructSetData($tInt, 1, $iInt)
	Return DllStructGetData($tFloat, 1)
EndFunc   ;==>_WinAPI_IntToFloat

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_IsClassName
; Description ...: Wrapper to check ClassName of the control.
; Syntax.........: _WinAPI_IsClassName($hWnd, $sClassName)
; Parameters ....: $hWnd        - Handle to a control
;                  $sClassName  - Class name to check
; Return values .: True         - $sClassName matches ClassName retrieved from $hWnd
;                  False        - $sClassName does not match ClassName retrieved from $hWnd
; Author ........: Gary Frost (gafrost)
; Modified.......:
; Remarks .......: Used for checking correct $hWnd is passed into function
; Related .......:
; Link ..........;
; Example .......;
; ===============================================================================================================================
Func _WinAPI_IsClassName($hWnd, $sClassName)
	Local $sSeperator, $aClassName, $sClassCheck
	$sSeperator = Opt("GUIDataSeparatorChar")
	$aClassName = StringSplit($sClassName, $sSeperator)
	If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
	$sClassCheck = _WinAPI_GetClassName($hWnd) ; ClassName from Handle
	; check array of ClassNames against ClassName Returned
	For $x = 1 To UBound($aClassName) - 1
		If StringUpper(StringMid($sClassCheck, 1, StringLen($aClassName[$x]))) = StringUpper($aClassName[$x]) Then
			Return True
		EndIf
	Next
	Return False
EndFunc   ;==>_WinAPI_IsClassName

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_IsWindow
; Description ...: Determines whether the specified window handle identifies an existing window
; Syntax.........: _WinAPI_IsWindow($hWnd)
; Parameters ....: $hWnd        - Handle to be tested
; Return values .: Success      - Handle is a window
;                  Failure      - Handle is not a window
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........; @@MsdnLink@@ IsWindow
; Example .......;
; ===============================================================================================================================
Func _WinAPI_IsWindow($hWnd)
	Local $aResult

	$aResult = DllCall("User32.dll", "int", "IsWindow", "hwnd", $hWnd)
	Return $aResult[0] <> 0
EndFunc   ;==>_WinAPI_IsWindow

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_IsWindowVisible
; Description ...: Retrieves the visibility state of the specified window
; Syntax.........: _WinAPI_IsWindowVisible($hWnd)
; Parameters ....: $hWnd        - Handle of window
; Return values .: True         - Window is visible
;                  Failse       - Window is not visible
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......: The visibility state of a window is indicated by the WS_VISIBLE style bit. When $WS_VISIBLE is set, the window
;                  is displayed and subsequent drawing into it is displayed as long as the window has the $WS_VISIBLE style.
; Related .......:
; Link ..........; @@MsdnLink@@ IsWindowVisible
; Example .......;
; ===============================================================================================================================
Func _WinAPI_IsWindowVisible($hWnd)
	Local $aResult

	$aResult = DllCall("User32.dll", "int", "IsWindowVisible", "hwnd", $hWnd)
	Return $aResult[0] <> 0
EndFunc   ;==>_WinAPI_IsWindowVisible

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_InvalidateRect
; Description ...: Adds a rectangle to the specified window's update region
; Syntax.........: _WinAPI_InvalidateRect($hWnd[, $tRect = 0[, $fErase = True]])
; Parameters ....: $hWnd        - Handle to windows
;                  $tRect       - $tagRECT structure that contains the client coordinates of the rectangle  to  be  added  to  the
;                  +update region. If this parameter is 0 the entire client area is added to the update region.
;                  $fErase      - Specifies whether the background within the update region is  to  be  erased  when  the  update
;                  +region is processed.  If this parameter is True the background is erased  when  the  BeginPaint  function  is
;                  +called. If this parameter is False, the background remains unchanged.
; Return values .: Success      - True
;                  Failure      - False
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........; @@MsdnLink@@ InvalidateRect
; Example .......;
; ===============================================================================================================================
Func _WinAPI_InvalidateRect($hWnd, $tRect = 0, $fErase = True)
	Local $pRect, $aResult

	If $tRect <> 0 Then $pRect = DllStructGetPtr($tRect)
	$aResult = DllCall("User32.dll", "int", "InvalidateRect", "hwnd", $hWnd, "ptr", $pRect, "int", $fErase)
	Return $aResult[0] <> 0
EndFunc   ;==>_WinAPI_InvalidateRect

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_LoadBitmap
; Description ...: Loads the specified bitmap resource from a module's executable file
; Syntax.........: _WinAPI_LoadBitmap($hInstance, $sBitmap)
; Parameters ....: $hInstance   - Handle to the instance of the module whose executable file contains the bitmap to be loaded
;                  $sBitmap      - The name of the bitmap resource to be loaded.  Alternatively this can consist of the  resource
;                  +identifier in the low order word and 0 in the high order word.
; Return values .: Success      - The handle to the specified bitmap
;                  Failure      - 0
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........; @@MsdnLink@@ LoadBitmap
; Example .......;
; ===============================================================================================================================
Func _WinAPI_LoadBitmap($hInstance, $sBitmap)
	Local $aResult, $sType = "int"

	If IsString($sBitmap) Then $sType = "str"
	$aResult = DllCall("User32.dll", "hwnd", "LoadBitmap", "hwnd", $hInstance, $sType, $sBitmap)
	_WinAPI_Check("_WinAPI_LoadBitmap", ($aResult[0] = 0), 0, True)
	Return $aResult[0]
EndFunc   ;==>_WinAPI_LoadBitmap

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_LoadImage
; Description ...: Loads an icon, cursor, or bitmap
; Syntax.........: _WinAPI_LoadImage($hInstance, $sImage, $iType, $iXDesired, $iYDesired, $iLoad)
; Parameters ....: $hInstance   - Identifies an instance of the module that contains the image to  be  loaded.  To  load  an  OEM
;                  +image, set this parameter to zero.
;                  $sImage      - Identifies the image to load.  If the $hInstance parameter is not 0 and  the  $iLoad  parameter
;                  +does not include $LR_LOADFROMFILE $sImage is a string that contains the name of the  image  resource  in  the
;                  +$hInstance module.  If $hInstance is 0 and $LR_LOADFROMFILE is not specified,  the  low-order  word  of  this
;                  +parameter must be the identifier of the OEM image to load.
;                  $iType       - Specifies the type of image to be loaded.  This parameter can be one of the following values:
;                  |$IMAGE_BITMAP - Loads a bitmap
;                  |$IMAGE_CURSOR - Loads a cursor
;                  |$IMAGE_ICON   - Loads an icon
;                  $iXDesired   - Specifies the width, in pixels, of the icon or cursor.  If this is 0
;                   and $iLoad is LR_DEFAULTSIZE the function uses the SM_CXICON or SM_CXCURSOR system
;                   metric value to set the width.   If this parameter is 0 and LR_DEFAULTSIZE is  not
;                   used, the function uses the actual resource width.
;                  $iYDesired   - Specifies the height, in pixels, of the icon or cursor. If this is 0
;                   and $iLoad is LR_DEFAULTSIZE the function uses the SM_CYICON or SM_CYCURSOR system
;                   metric value to set the height.   If this parameter is 0 and LR_DEFAULTSIZE is not
;                   used, the function uses the actual resource height.
;                  $iLoad       - Specifies a combination of the following values:
;                  |$LR_DEFAULTCOLOR     - The default flag
;                  |$LR_CREATEDIBSECTION - When the $iType parameter specifies $IMAGE_BITMAP, causes the function to return a DIB
;                  +section bitmap rather than a compatible bitmap.  This flag is useful for loading a bitmap without mapping  it
;                  +to the colors of the display device.
;                  |$LR_DEFAULTSIZE      - Uses the width or height specified by the system metric values for cursors or icons if
;                  +the $iXDesired or $iYDesired values are set to 0. If this flag is not specified and $iXDesired and $iYDesired
;                  +are set to zero, the function uses the actual resource size. If the resource  contains  multiple  images  the
;                  +function uses the size of the first image.
;                  |$LR_LOADFROMFILE     - Loads the image from the file specified by the $sImage parameter.  If this flag is not
;                  +specified, $sImage is the name of the resource.
;                  |$LR_LOADMAP3DCOLORS  - Searches the color table for the image and replaces the following shades of gray  with
;                  +the corresponding 3D color:
;                  | Dk Gray: RGB(128,128,128) COLOR_3DSHADOW
;                  | Gray   : RGB(192,192,192) COLOR_3DFACE
;                  | Lt Gray: RGB(223,223,223) COLOR_3DLIGHT
;                  |$LR_LOADTRANSPARENT - Gets the color value of the first pixel in the image  and  replaces  the  corresponding
;                  +entry in the color table with the default window color.  All pixels in the image that use that  entry  become
;                  +the default window color. This value applies only to images that have corresponding color tables.  If  $iLoad
;                  +includes both the $LR_LOADTRANSPARENT and $LR_LOADMAP3DCOLORS values,  $LRLOADTRANSPARENT  takes  precedence.
;                  +However, the color table entry is replaced with COLOR_3DFACE rather than COLOR_WINDOW.
;                  |$LR_MONOCHROME      - Loads the image in black and white
;                  |$LR_SHARED          - Shares the image handle if the image is loaded multiple times. If LR_SHARED is not set,
;                  +a second call to LoadImage for the same resource will load the image again and return a different handle.  Do
;                  +not use $LR_SHARED for images that have non-standard sizes, that may change after loading, or that are loaded
;                  +from a file.
; Return values .: Success      - The handle of the newly loaded image
;                  Failure      - 0
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........; @@MsdnLink@@ LoadImage
; Example .......;
; ===============================================================================================================================
Func _WinAPI_LoadImage($hInstance, $sImage, $iType, $iXDesired, $iYDesired, $iLoad)
	Local $aResult, $sType = "int"

	If IsString($sImage) Then $sType = "str"
	$aResult = DllCall("User32.dll", "hwnd", "LoadImage", "hwnd", $hInstance, $sType, $sImage, "int", $iType, "int", $iXDesired, _
			"int", $iYDesired, "int", $iLoad)
	Return $aResult[0]
EndFunc   ;==>_WinAPI_LoadImage

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_LoadLibrary
; Description ...: Maps a specified executable module into the address space of the calling process
; Syntax.........: _WinAPI_LoadLibrary($sFileName)
; Parameters ....: $sFileName   - Names a Win32 executable module (either a .DLL or an .EXE file).  The  name  specified  is  the
;                  +filename of the executable module.
; Return values .: Success      - A handle to the executable module
;                  Failure      - 0
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......: _WinAPI_LoadLibraryEx
; Link ..........; @@MsdnLink@@ LoadLibraryA
; Example .......;
; ===============================================================================================================================
Func _WinAPI_LoadLibrary($sFileName)
	Local $aResult

	$aResult = DllCall("Kernel32.dll", "hwnd", "LoadLibraryA", "str", $sFileName)
	Return $aResult[0]
EndFunc   ;==>_WinAPI_LoadLibrary

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_LoadLibraryEx
; Description ...: Maps a specified executable module into the address space of the calling process
; Syntax.........: _WinAPI_LoadLibraryEx($sFileName[, $iFlags = 0])
; Parameters ....: $sFileName   - Names a Win32 executable module (either a .DLL or an .EXE file).  The  name  specified  is  the
;                  +filename of the executable module.
;                  $iFlags      - Specifies the action to take when loading  the  module.  This  parameter  can  be  one  of  the
;                  +following values:
;                  |$DONT_RESO$LVE_DLL_REFERENCES   - If this value is used and the executable module is a DLL  the  system  does
;                  +not call DllMain for process and thread initialization and  termination.  Also,  the  system  does  not  load
;                  +additional executable modules that are referenced by the specified module.
;                  |$LOAD_LIBRARY_AS_DATAFILE      - If this value is used, the system maps the file into the  calling  process's
;                  +address space as if it were a data file.  Nothing is done to execute or prepare to execute the mapped file.
;                  |$LOAD_WITH_ALTERED_SEARCH_PATH - If this value is used, and $FileName specifies a path, the system  uses  the
;                  +alternate file search strategy to find the associated executable modules that the specified module causes  to
;                  +be loaded.
; Return values .: Success      - A handle to the executable module
;                  Failure      - 0
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......: _WinAPI_LoadLibrary
; Link ..........; @@MsdnLink@@ LoadLibraryExA
; Example .......;
; ===============================================================================================================================
Func _WinAPI_LoadLibraryEx($sFileName, $iFlags = 0)
	Local $aResult

	$aResult = DllCall("Kernel32.dll", "hwnd", "LoadLibraryExA", "str", $sFileName, "hwnd", 0, "int", $iFlags)
	Return $aResult[0]
EndFunc   ;==>_WinAPI_LoadLibraryEx

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_LoadShell32Icon
; Description ...: Extracts an icon from the Shell32.dll file
; Syntax.........: _WinAPI_LoadShell32Icon($iIconID)
; Parameters ....: $iIconID     - ID of the icon to extract
; Return values .: Success      - Handle to the specified icon
;                  Failure      - 0
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......: When you are done with the icon, call _API_DestroyIcon to release the icon handle
; Related .......: _WinAPI_DestroyIcon
; Link ..........;
; Example .......;
; ===============================================================================================================================
Func _WinAPI_LoadShell32Icon($iIconID)
	Local $iIcons, $tIcons, $pIcons

	$tIcons = DllStructCreate("int Data")
	$pIcons = DllStructGetPtr($tIcons)
	$iIcons = _WinAPI_ExtractIconEx("Shell32.dll", $iIconID, 0, $pIcons, 1)
	_WinAPI_Check("_Lib_GetShell32Icon", ($iIcons = 0), -1)
	Return DllStructGetData($tIcons, "Data")
EndFunc   ;==>_WinAPI_LoadShell32Icon

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_LocalFree
; Description ...: Frees the specified local memory object and invalidates its handle
; Syntax.........: _WinAPI_LocalFree($hMem)
; Parameters ....: $hMem        - A handle to the local memory object
; Return values .: Success      - True
;                  Failure      - False
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........; @@MsdnLink@@ LocalFree
; Example .......;
; ===============================================================================================================================
Func _WinAPI_LocalFree($hMem)
	Local $aResult

	$aResult = DllCall("Kernel32.dll", "hwnd", "LocalFree", "hwnd", $hMem)
	_WinAPI_Check("_WinAPI_LocalFree", ($aResult[0] <> 0), 0, True)
	Return $aResult[0] = 0
EndFunc   ;==>_WinAPI_LocalFree

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_LoWord
; Description ...: Returns the low word of a longword
; Syntax.........: _WinAPI_LoWord($iLong)
; Parameters ....: $iLong       - Longword value
; Return values .: Success      - Low order word of the longword value
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......: _WinAPI_HiWord
; Link ..........;
; Example .......;
; ===============================================================================================================================
Func _WinAPI_LoWord($iLong)
	Return BitAND($iLong, 0xFFFF)
EndFunc   ;==>_WinAPI_LoWord

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_MakeDWord
; Description ...: Returns a DWord value from two int values
; Syntax.........: _WinAPI_MakeDWord($HiWord, $LoWord)
; Parameters ....: $HiWord      - Hi word
;                  $LoWord      - Low word
; Return values .: Success      - DWord value
; Author ........: Gary Frost (gafrost)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........;
; Example .......;
; ===============================================================================================================================
Func _WinAPI_MakeDWord($HiWord, $LoWord)
	Return BitOR($LoWord * 0x10000, BitAND($HiWord, 0xFFFF))
EndFunc   ;==>_WinAPI_MakeDWord

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_MAKELANGID
; Description ...: Construct language id from a primary language id and a sublanguage id
; Syntax.........: _WinAPI_MAKELANGID($lgidPrimary, $lgidSub)
; Parameters ....: $lgidPrimary - Primary Language id
;                  $lgidSub     - Sub-Language id
; Return values .: Success      - Language identifier
; Author ........: Gary Frost (gafrost)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........;
; Example .......;
; ===============================================================================================================================
Func _WinAPI_MAKELANGID($lgidPrimary, $lgidSub)
	Return BitOR(BitShift($lgidSub, -10), $lgidPrimary)
EndFunc   ;==>_WinAPI_MAKELANGID

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_MAKELCID
; Description ...: Construct locale id from a language id and a sort id
; Syntax.........: _WinAPI_MAKELCID($lgid, $srtid)
; Parameters ....: $lgid        - Language id
;                  $srtid       - Sort id
; Return values .: Success      - Locale identifier
; Author ........: Gary Frost (gafrost)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........;
; Example .......;
; ===============================================================================================================================
Func _WinAPI_MAKELCID($lgid, $srtid)
	Return BitOR(BitShift($srtid, -16), $lgid)
EndFunc   ;==>_WinAPI_MAKELCID

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_MakeLong
; Description ...: Returns a longint value from two int values
; Syntax.........: _WinAPI_MakeLong($iLo, $iHi)
; Parameters ....: $iLo         - Low word
;                  $iHi         - Hi word
; Return values .: Success      - Longint value
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......: _WinAPI_HiWord, _WinAPI_LoWord
; Link ..........;
; Example .......;
; ===============================================================================================================================
Func _WinAPI_MakeLong($iLo, $iHi)
	Return BitOR(BitShift($iHi, -16), BitAND($iLo, 0xFFFF))
EndFunc   ;==>_WinAPI_MakeLong

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_MessageBeep
; Description ...: Plays a waveform sound
; Syntax.........: _WinAPI_MessageBeep([$iType = 1])
; Parameters ....: $iType       - The sound type, as identified by an entry in the registry.  This can be one  of  the  following
;                  +values:
;                  |0 - Simple beep. If a sound card is not available, the speaker is used.
;                  |1 - OK
;                  |2 - Hand
;                  |3 - Question
;                  |4 - Exclamation
;                  |5 - Asterisk
; Return values .: Success      - True
;                  Failure      - False
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......: After queuing the sound, the MessageBeep function returns control to the calling function and plays the  sound
;                  asynchronously.  If it cannot play the specified alert sound, MessageBeep attempts to play the system  default
;                  sound.  If it cannot play the system default sound, the function produces a standard beep  sound  through  the
;                  computer speaker.
; Related .......:
; Link ..........; @@MsdnLink@@ MessageBeep
; Example .......;
; ===============================================================================================================================
Func _WinAPI_MessageBeep($iType = 1)
	Local $iSound, $aResult

	Switch $iType
		Case 1
			$iSound = $MB_OK
		Case 2
			$iSound = $MB_ICONHAND
		Case 3
			$iSound = $MB_ICONQUESTION
		Case 4
			$iSound = $MB_ICONEXCLAMATION
		Case 5
			$iSound = $MB_ICONASTERISK
		Case Else
			$iSound = -1
	EndSwitch

	$aResult = DllCall("User32.dll", "int", "MessageBeep", "uint", $iSound)
	Return SetError(_WinAPI_GetLastError(), 0, $aResult[0] <> 0)
EndFunc   ;==>_WinAPI_MessageBeep

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_MsgBox
; Description ...: Displays a message box with wider margin than original
; Syntax.........: _WinAPI_MsgBox($iFlags, $sTitle, $sText)
; Parameters ....: $iFlags      - Flags to use during window creation
;                  $sTitle      - Window title
;                  $sText       - Window text
; Return values .:
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......: This function produces (IMO) a better looking message box.  It also makes sure that BlockInput is  turned  off
;                  so the user can move the mouse.
; Related .......: _WinAPI_ShowMsg
; Link ..........;
; Example .......;
; ===============================================================================================================================
Func _WinAPI_MsgBox($iFlags, $sTitle, $sText)
	BlockInput(0)
	MsgBox($iFlags, $sTitle, $sText & "      ")
EndFunc   ;==>_WinAPI_MsgBox

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_Mouse_Event
; Description ...: Synthesizes mouse motion and button clicks
; Syntax.........: _WinAPI_Mouse_Event($iFlags[, $iX = 0[, $iY = 0[, $iData = 0[, $iExtraInfo = 0]]]])
; Parameters ....: $iFlags      - A set of flag bits that specify various aspects of mouse motion and button clicking.  The  bits
;                  +in this parameter can be any reasonable combination of the following values:
;                  |$MOUSEEVENTF_ABSOLUTE   - Specifies that the $iX and $iY parameters contain normal absolute  coordinates.  If
;                  +not set, those parameters contain relative data.  The change in position since the  last  reported  position.
;                  +This flag can be set, or not set, regardless of what kind of mouse or mouse-like device, if any, is connected
;                  +to the system.
;                  |$MOUSEEVENTF_MOVE       - Specifies that movement occurred
;                  |$MOUSEEVENTF_LEFTDOWN   - Specifies that the left button changed to down
;                  |$MOUSEEVENTF_LEFTUP     - Specifies that the left button changed to up
;                  |$MOUSEEVENTF_RIGHTDOWN  - Specifies that the right button changed to down
;                  |$MOUSEEVENTF_RIGHTUP    - Specifies that the right button changed to up
;                  |$MOUSEEVENTF_MIDDLEDOWN - Specifies that the middle button changed to down
;                  |$MOUSEEVENTF_MIDDLEUP   - Specifies that the middle button changed to up
;                  |$MOUSEEVENTF_WHEEL      - Specifies that the wheel has been moved, if the mouse has a wheel
;                  $iX           - Specifies the mouse's absolute position along the X axis or its amount  of  motion  since  the
;                  +last mouse event was generated depending on the setting of $MOUSEEVENTF_ABSOLUTE.  Absolute data is given  as
;                  +the mouse's actual X coordinate relative data is given as the number of mickeys moved.
;                  $iY           - Specifies the mouse's absolute position along the Y axis or its amount  of  motion  since  the
;                  +last mouse event was generated depending on the setting of $MOUSEEVENTF_ABSOLUTE.  Absolute data is given  as
;                  +the mouse's actual Y coordinate relative data is given as the number of mickeys moved.
;                  $iData        - If iFlags is $MOUSEEVENTF_WHEEL, then iData specifies the amount of wheel movement. A positive
;                  +value indicates that the wheel was rotated forward away from the user.  A negative value indicates  that  the
;                  +wheel was rotated backward, toward the user. One wheel click is defined as $WHEEL_DELTA, which  is  120.   If
;                  +iFlags is not $MOUSEEVENTF_WHEEL, then $iData should be zero.
;                  $iExtraInfo   - Specifies a 32 bit value associated with the mouse event
; Return values .:
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........; @@MsdnLink@@ mouse_event
; Example .......;
; ===============================================================================================================================
Func _WinAPI_Mouse_Event($iFlags, $iX = 0, $iY = 0, $iData = 0, $iExtraInfo = 0)
	DllCall("User32.dll", "none", "mouse_event", "int", $iFlags, "int", $iX, "int", $iY, "int", $iData, "int", $iExtraInfo)
EndFunc   ;==>_WinAPI_Mouse_Event

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_MoveWindow
; Description ...: Changes the position and dimensions of the specified window
; Syntax.........: _WinAPI_MoveWindow($hWnd, $iX, $iY, $iWidth, $iHeight[, $fRepaint = True])
; Parameters ....: $hWnd        - Handle of window
;                  $iX          - New position of the left side of the window
;                  $iY          - New position of the top of the window
;                  $iWidth      - New width of the window
;                  $iHeight     - New height of the window
;                  $fRepaint    - Specifies whether the window is to be repainted.  If True,  the  window  receives  a  $WM_PAINT
;                  +message. If False, no repainting of any kind occurs. This applies to the client area, the nonclient area, and
;                  +any part of the parent window uncovered as a result of moving a child window. If False, the application  must
;                  +explicitly invalidate or redraw any parts of the window and parent window that need redrawing.
; Return values .: Success      - True
;                  Failure      - False
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........; @@MsdnLink@@ MoveWindow
; Example .......;
; ===============================================================================================================================
Func _WinAPI_MoveWindow($hWnd, $iX, $iY, $iWidth, $iHeight, $fRepaint = True)
	Local $aResult

	$aResult = DllCall("User32.dll", "int", "MoveWindow", "hwnd", $hWnd, "int", $iX, "int", $iY, "int", $iWidth, "int", $iHeight, "int", $fRepaint)
	Return $aResult[0] <> 0
EndFunc   ;==>_WinAPI_MoveWindow

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_MulDiv
; Description ...: Multiplies two 32-bit values and then divides the 64-bit result by a third 32-bit value
; Syntax.........: _WinAPI_MulDiv($iNumber, $iNumerator, $iDenominator)
; Parameters ....: $iNumber      - Specifies the multiplicand
;                  $iNumerator   - Specifies the multiplier
;                  $iDenominator - Specifies the number by which the result of the multiplication is to be divided
; Return values .: Success      - The result of the multiplication and division
;                  Failure      - -1
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........; @@MsdnLink@@ MulDiv
; Example .......;
; ===============================================================================================================================
Func _WinAPI_MulDiv($iNumber, $iNumerator, $iDenominator)
	Local $aResult

	$aResult = DllCall("Kernel32.dll", "int", "MulDiv", "int", $iNumber, "int", $iNumerator, "int", $iDenominator)
	_WinAPI_Check("_MultDiv", ($aResult[0] = -1), -1)
	Return $aResult[0]
EndFunc   ;==>_WinAPI_MulDiv

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_MultiByteToWideChar
; Description ...: Maps a character string to a wide-character (Unicode) string
; Syntax.........: _WinAPI_MultiByteToWideChar($sText[, $iCodePage = 0[, $iFlags = 0]])
; Parameters ....: $sText       - Text to be converted
;                  $iCodePage   - Specifies the code page to be used to perform the conversion:
;                  |$CP_ACP   - ANSI code page
;                  |$CP_MACCP - Macintosh code page
;                  |$CP_OEMCP - OEM code page
;                  $iFlags      - Flags that indicate whether to translate to precomposed or composite wide characters:
;                  |$MB_PRECOMPOSED   - Always use precomposed characters
;                  |$MB_COMPOSITE     - Always use composite characters
;                  |$MB_USEGLYPHCHARS - Use glyph characters instead of control characters
; Return values .: Success      - Structure that contains the Unicode character string
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......: _WinAPI_WideCharToMultiByte
; Link ..........; @@MsdnLink@@ MultiByteToWideChar
; Example .......;
; ===============================================================================================================================
Func _WinAPI_MultiByteToWideChar($sText, $iCodePage = 0, $iFlags = 0)
	Local $iText, $pText, $tText

	$iText = StringLen($sText) + 1
	$tText = DllStructCreate("byte[" & $iText * 2 & "]")
	$pText = DllStructGetPtr($tText)
	DllCall("Kernel32.dll", "int", "MultiByteToWideChar", "int", $iCodePage, "int", $iFlags, "str", $sText, "int", $iText, _
			"ptr", $pText, "int", $iText * 2)
	Return $tText
EndFunc   ;==>_WinAPI_MultiByteToWideChar

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_MultiByteToWideCharEx
; Description ...: Maps a character string to a wide-character (Unicode) string
; Syntax.........: _WinAPI_MultiByteToWideCharEx($sText, $pText[, $iCodePage = 0[, $iFlags = 0]])
; Parameters ....: $sText       - Text to be converted
;                  $pText       - Pointer to a byte structure where the converted string will be stored
;                  $iCodePage   - Specifies the code page to be used to perform the conversion:
;                  |$CP_ACP   - ANSI code page
;                  |$CP_MACCP - Macintosh code page
;                  |$CP_OEMCP - OEM code page
;                  $iFlags      - Flags that indicate whether to translate to precomposed or composite wide characters:
;                  |$MB_PRECOMPOSED   - Always use precomposed characters
;                  |$MB_COMPOSITE     - Always use composite characters
;                  |$MB_USEGLYPHCHARS - Use glyph characters instead of control characters
; Return values .: Success      - True
;                  Failure      - False
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......: The byte structure must be at least twice the length of $sText
; Related .......: _WinAPI_MultiByteToWideChar
; Link ..........;
; Example .......;
; ===============================================================================================================================
Func _WinAPI_MultiByteToWideCharEx($sText, $pText, $iCodePage = 0, $iFlags = 0)
	Local $aResult

	$aResult = DllCall("Kernel32.dll", "int", "MultiByteToWideChar", "int", $iCodePage, "int", $iFlags, "str", $sText, "int", -1, _
			"ptr", $pText, "int", (StringLen($sText) + 1) * 2)
	Return $aResult[0] <> 0
EndFunc   ;==>_WinAPI_MultiByteToWideCharEx

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_OpenProcess
; Description ...: Returns a handle of an existing process object
; Syntax.........: _WinAPI_OpenProcess($iAccess, $fInherit, $iProcessID[, $fDebugPriv = False])
; Parameters ....: $iAccess     - Specifies the access to the process object
;                  $fInherit    - Specifies whether the returned handle can be inherited
;                  $iProcessID  - Specifies the process identifier of the process to open
;                  $fDebugPriv  - Certain system processes can not be opened unless you have the  debug  security  privilege.  If
;                  +True, this function will attempt to open the process with debug priviliges if the process can not  be  opened
;                  +with standard access privileges.
; Return values .: Success      - Process handle to the object
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........; @@MsdnLink@@ OpenProcess
; Example .......;
; ===============================================================================================================================
Func _WinAPI_OpenProcess($iAccess, $fInherit, $iProcessID, $fDebugPriv = False)
	Local $hToken, $aResult

	; Attempt to open process with standard security priviliges
	$aResult = DllCall("Kernel32.dll", "int", "OpenProcess", "int", $iAccess, "int", $fInherit, "int", $iProcessID)
	If Not $fDebugPriv Or ($aResult[0] <> 0) Then
		_WinAPI_Check("_WinAPI_OpenProcess:Standard", ($aResult[0] = 0), 0, True)
		Return $aResult[0]
	EndIf

	; Enable debug privileged mode
	$hToken = _Security__OpenThreadTokenEx (BitOR($TOKEN_ADJUST_PRIVILEGES, $TOKEN_QUERY))
	_WinAPI_Check("_WinAPI_OpenProcess:OpenThreadTokenEx", @error, @extended)
	_Security__SetPrivilege ($hToken, "SeDebugPrivilege", True)
	_WinAPI_Check("_WinAPI_OpenProcess:SetPrivilege:Enable", @error, @extended)

	; Attempt to open process with debug priviliges
	$aResult = DllCall("Kernel32.dll", "int", "OpenProcess", "int", $iAccess, "int", $fInherit, "int", $iProcessID)
	_WinAPI_Check("_WinAPI_OpenProcess:Priviliged", ($aResult[0] = 0), 0, True)

	; Disable debug privileged mode
	_Security__SetPrivilege ($hToken, "SeDebugPrivilege", False)
	_WinAPI_Check("_WinAPI_OpenProcess:SetPrivilege:Disable", @error, @extended)
	_WinAPI_CloseHandle($hToken)

	Return $aResult[0]
EndFunc   ;==>_WinAPI_OpenProcess

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_PostMessage
; Description ...: Places a message in the message queue and then returns
; Syntax.........: _WinAPI_PostMessage($hWnd, $iMsg, $iwParam, $ilParam)
; Parameters ....: $hWnd        - Identifies the window whose window procedure will receive the message.  If  this  parameter  is
;                  +$HWND_BROADCAST, the message is sent to all top-level windows in the system, including disabled or  invisible
;                  +unowned windows, overlapped windows, and pop-up windows; but the message is not sent to child windows.
;                  $iMsg        - Specifies the message to be sent
;                  $iwParam     - First message parameter
;                  $ilParam     - Second message parameter
; Return values .:
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........; @@MsdnLink@@ PostMessageA
; Example .......;
; ===============================================================================================================================
Func _WinAPI_PostMessage($hWnd, $iMsg, $iwParam, $ilParam)
	Local $aResult

	$aResult = DllCall("User32.dll", "int", "PostMessageA", "hwnd", $hWnd, "int", $iMsg, "int", $iwParam, "int", $ilParam)
	Return $aResult[0]
EndFunc   ;==>_WinAPI_PostMessage

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_PrimaryLangId
; Description ...: Extract primary language id from a language id
; Syntax.........: _WinAPI_PrimaryLangId($lgid)
; Parameters ....: $lgid        - Language id
; Return values .: Success      - Primary language id
; Author ........: Gary Frost (gafrost)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........;
; Example .......;
; ===============================================================================================================================
Func _WinAPI_PrimaryLangId($lgid)
	Return BitAND($lgid, 0x3FF)
EndFunc   ;==>_WinAPI_PrimaryLangId

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_PtInRect
; Description ...: Determines whether the specified point lies within the specified rectangle
; Syntax.........: _WinAPI_PtInRect(ByRef $tRect, ByRef $tPoint)
; Parameters ....: $tRect       - $tagRECT structure that contains the specified rectangle
;                  $tPoint      - $tagPOINT structure that contains the specified point
; Return values .: True  - Point lies within the rectangle
;                  False - Point does not lie within the rectangle
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........; @@MsdnLink@@ PtInRect
; Example .......;
; ===============================================================================================================================
Func _WinAPI_PtInRect(ByRef $tRect, ByRef $tPoint)
	Local $iX, $iY, $aResult

	$iX = DllStructGetData($tPoint, "X")
	$iY = DllStructGetData($tPoint, "Y")
	$aResult = DllCall("User32.dll", "int", "PtInRect", "ptr", DllStructGetPtr($tRect), "int", $iX, "int", $iY)
	Return $aResult[0] <> 0
EndFunc   ;==>_WinAPI_PtInRect

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_ReadFile
; Description ...: Reads data from a file
; Syntax.........: _WinAPI_ReadFile($hFile, $pBuffer, $iToRead, ByRef $iRead[, $pOverlapped = 0])
; Parameters ....: $hFile       - Handle to the file to be read
;                  $pBuffer     - Pointer to the buffer that receives the data read from a file
;                  $iToRead     - Maximum number of bytes to read
;                  $iRead       - Number of bytes read
;                  $pOverlapped - Pointer to a $tagOVERLAPPED structure
; Return values .: Success      - True
;                  Failure      - False
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........; @@MsdnLink@@ ReadFile
; Example .......;
; ===============================================================================================================================
Func _WinAPI_ReadFile($hFile, $pBuffer, $iToRead, ByRef $iRead, $pOverlapped = 0)
	Local $aResult, $pRead, $tRead

	$tRead = DllStructCreate("int Read")
	$pRead = DllStructGetPtr($tRead)
	$aResult = DllCall("Kernel32.dll", "int", "ReadFile", "hwnd", $hFile, "ptr", $pBuffer, "int", $iToRead, "ptr", $pRead, "ptr", $pOverlapped)
	$iRead = DllStructGetData($tRead, "Read")
	Return SetError(_WinAPI_GetLastError(), 0, $aResult[0] <> 0)
EndFunc   ;==>_WinAPI_ReadFile

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_ReadProcessMemory
; Description ...: Reads memory in a specified process
; Syntax.........: _WinAPI_ReadProcessMemory($hProcess, $pBaseAddress, $pBuffer, $iSize, ByRef $iRead)
; Parameters ....: $hProcess     - Identifies an open handle of a process whose memory is read
;                  $pBaseAddress - Points to the base address in the specified process to be read
;                  $pBuffer      - Points to a buffer that receives the contents from the address space
;                  $iSize        - Specifies the requested number of bytes to read from the specified process
;                  $iRead        - The actual number of bytes transferred into the specified buffer
; Return values .: Success       - True
;                  Failure       - False
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......: _WinAPI_WriteProcessMemory
; Link ..........; @@MsdnLink@@ ReadProcessMemory
; Example .......;
; ===============================================================================================================================
Func _WinAPI_ReadProcessMemory($hProcess, $pBaseAddress, $pBuffer, $iSize, ByRef $iRead)
	Local $pRead, $tRead, $aResult

	$tRead = DllStructCreate("int Read")
	$pRead = DllStructGetPtr($tRead)
	$aResult = DllCall("Kernel32.dll", "int", "ReadProcessMemory", "int", $hProcess, "int", $pBaseAddress, "ptr", $pBuffer, "int", $iSize, "ptr", $pRead)
	_WinAPI_Check("_WinAPI_ReadProcessMemory", ($aResult[0] = 0), 0, True)
	$iRead = DllStructGetData($tRead, "Read")
	Return $aResult[0]
EndFunc   ;==>_WinAPI_ReadProcessMemory

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_RectIsEmpty
; Description ...: Determins whether a rectangle is empty
; Syntax.........: _WinAPI_RectIsEmpty(ByRef $tRect)
; Parameters ....: $tRect       - $tagRect structure
; Return values .: True         - Rectangle is empty (all values are zero)
;                  False        - Rectangle is not empty
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........;
; Example .......;
; ===============================================================================================================================
Func _WinAPI_RectIsEmpty(ByRef $tRect)
	Return (DllStructGetData($tRect, "Left") = 0) And (DllStructGetData($tRect, "Top") = 0) And _
			(DllStructGetData($tRect, "Right") = 0) And (DllStructGetData($tRect, "Bottom") = 0)
EndFunc   ;==>_WinAPI_RectIsEmpty

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_RedrawWindow
; Description ...: Updates the specified rectangle or region in a window's client area
; Syntax.........: _WinAPI_RedrawWindow($hWnd[, $tRect = 0[, $hRegion = 0[, $iFlags = 5]]])
; Parameters ....: $hWnd        - Handle to a Window
;                  $tRect       - $tagRECT structure containing the  coordinates  of  the  update  rectangle.  This  parameter  is
;                  +ignored if the $hRegion parameter identifies a region.
;                  $hRegion     - Identifies the update region.  If the $hRegion and $tRect parameters are 0, the  entire  client
;                  +area is added to the update region.
;                  $iFlags      - Specifies the redraw flags.  This parameter can be a combination of flags  that  invalidate  or
;                  +validate a window, control repainting, and control which windows are affected:
;                  |$RDW_ERASE           - Causes the window to receive a WM_ERASEBKGND message when the window is repainted
;                  |$RDW_FRAME           - Causes any part of the nonclient area of the window that intersects the update  region
;                  +to receive a WM_NCPAINT message.
;                  |$RDW_INTERNALPAINT   - Causes a WM_PAINT message to be posted to the window regardless of whether any portion
;                  +of the window is invalid.
;                  |$RDW_INVALIDATE      - Invalidates DllStructGetData($tRect or $hRegion, "") If both are 0, the entire window is invalidated.
;                  |$RDW_NOERASE         - Suppresses any pending WM_ERASEBKGND messages
;                  |$RDW_NOFRAME         - Suppresses any pending WM_NCPAINT messages
;                  |$RDW_NOINTERNALPAINT - Suppresses any pending internal WM_PAINT messages
;                  |$RDW_VALIDATE        - Validates $tRect or $hRegion
;                  |$RDW_ERASENOW        - Causes the affected windows to receive $WM_NCPAINT  and  $WM_ERASEBKGND  messages,  if
;                  +necessary, before the function returns
;                  |$RDW_UPDATENOW       - Causes the affected windows to  receive  $WM_NCPAINT,  $WM_ERASEBKGND,  and  $WM_PAINT
;                  +messages, if necessary, before the function returns.
;                  |$RDW_ALLCHILDREN     - Includes child windows in the repainting operation
;                  |$RDW_NOCHILDREN      - Excludes child windows from the repainting operation
; Return values .: Success      - True
;                  Failure      - False
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......: When RedrawWindow is used to invalidate part of the desktop window, the desktop  window  does  not  receive  a
;                  $WM_PAINT message. To repaint the desktop an application uses the $RDW_ERASE flag to generate a $WM_ERASEBKGND
;                  message.
; Related .......:
; Link ..........; @@MsdnLink@@ RedrawWindow
; Example .......;
; ===============================================================================================================================
Func _WinAPI_RedrawWindow($hWnd, $tRect = 0, $hRegion = 0, $iFlags = 5)
	Local $pRect, $aResult

	If $tRect <> 0 Then $pRect = DllStructGetPtr($tRect)
	$aResult = DllCall("User32.dll", "int", "RedrawWindow", "hwnd", $hWnd, "ptr", $pRect, "int", $hRegion, "int", $iFlags)
	Return ($aResult[0] <> 0)
EndFunc   ;==>_WinAPI_RedrawWindow

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_RegisterWindowMessage
; Description ...: Defines a new window message that is guaranteed to be unique throughout the system
; Syntax.........: _WinAPI_RegisterWindowMessage($sMessage)
; Parameters ....: $sMessage    - String that specifies the message to be registered
; Return values .: Success      - A message identifier in the range 0xC000 through 0xFFFF
;                  Failure      - 0
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......: The RegisterWindowMessage function is used to register messages  for  communicating  between  two  cooperating
;                  applications. If two different applications register the same message string, the applications return the same
;                  message  value. The message remains registered until the session ends.
; Related .......:
; Link ..........; @@MsdnLink@@ RegisterWindowMessage
; Example .......;
; ===============================================================================================================================
Func _WinAPI_RegisterWindowMessage($sMessage)
	Local $aResult

	$aResult = DllCall("User32.dll", "int", "RegisterWindowMessage", "str", $sMessage)
	_WinAPI_Check("_WinAPI_RegisterWindowMessage", ($aResult[0] = 0), 0, True)
	Return $aResult[0]
EndFunc   ;==>_WinAPI_RegisterWindowMessage

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_ReleaseCapture
; Description ...: Releases the mouse capture from a window in the current thread and restores normal mouse input processing
; Syntax.........: _WinAPI_ReleaseCapture()
; Parameters ....:
; Return values .: Success      - True
;                  Failure      - False
; Author ........: Gary Frost (gafrost)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........; @@MsdnLink@@ ReleaseCapture
; Example .......;
; ===============================================================================================================================
Func _WinAPI_ReleaseCapture()
	Local $aResult

	$aResult = DllCall("User32.dll", "int", "ReleaseCapture")
	Return $aResult[0] <> 0
EndFunc   ;==>_WinAPI_ReleaseCapture

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_ReleaseDC
; Description ...: Releases a device context
; Syntax.........: _WinAPI_ReleaseDC($hWnd, $hDC)
; Parameters ....: $hWnd        - Handle of window
;                  $hDC         - Identifies the device context to be released
; Return values .: Success      - True
;                  Failure      - False
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......: The application must call the _WinAPI_ReleaseDC function for each call to the _WinAPI_GetWindowDC function  and  for
;                  each call to the _WinAPI_GetDC function that retrieves a common device context.
; Related .......: _WinAPI_GetDC, _WinAPI_GetWindowDC
; Link ..........; @@MsdnLink@@ ReleaseDC
; Example .......;
; ===============================================================================================================================
Func _WinAPI_ReleaseDC($hWnd, $hDC)
	Local $aResult

	$aResult = DllCall("User32.dll", "int", "ReleaseDC", "hwnd", $hWnd, "hwnd", $hDC)
	Return $aResult[0] <> 0
EndFunc   ;==>_WinAPI_ReleaseDC

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_ScreenToClient
; Description ...: Converts screen coordinates of a specified point on the screen to client coordinates
; Syntax.........: _WinAPI_ScreenToClient($hWnd, ByRef $tPoint)
; Parameters ....: $hWnd        - Identifies the window that be used for the conversion
;                  $tPoint      - $tagPOINT structure that contains the screen coordinates to be converted
; Return values .: Success      - True
;                  Failure      - False
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......: The function uses the window identified by the $hWnd  parameter  and  the  screen  coordinates  given  in  the
;                  $tagPOINT structure to compute client coordinates.  It then replaces the screen  coordinates  with  the  client
;                  coordinates. The new coordinates are relative to the upper-left corner of the specified window's client area.
; Related .......: _WinAPI_ClientToScreen
; Link ..........; @@MsdnLink@@ ScreenToClient
; Example .......;
; ===============================================================================================================================
Func _WinAPI_ScreenToClient($hWnd, ByRef $tPoint)
	Local $aResult

	$aResult = DllCall("User32.dll", "int", "ScreenToClient", "hwnd", $hWnd, "ptr", DllStructGetPtr($tPoint))
	Return $aResult[0] <> 0
EndFunc   ;==>_WinAPI_ScreenToClient

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_SelectObject
; Description ...: Selects an object into the specified device context
; Syntax.........: _WinAPI_SelectObject($hDC, $hGDIObj)
; Parameters ....: $hDC         - Identifies the device context
;                  $hGDIObj     - Identifies the object to be selected
; Return values .: Success      - The handle of the object being replaced
;                  Failure      - 0
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........; @@MsdnLink@@ SelectObject
; Example .......;
; ===============================================================================================================================
Func _WinAPI_SelectObject($hDC, $hGDIObj)
	Local $aResult

	$aResult = DllCall("GDI32.dll", "hwnd", "SelectObject", "hwnd", $hDC, "hwnd", $hGDIObj)
	Return $aResult[0]
EndFunc   ;==>_WinAPI_SelectObject

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_SetBkColor
; Description ...: Sets the current background color to the specified color value
; Syntax.........: _WinAPI_SetBkColor($hDC, $iColor)
; Parameters ....: $hDC         - Handle to the device context
;                  $iColor      - Specifies the new background color
; Return values .: Success      - The previous background color
;                  Failure      - $CLR_INVALID
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........; @@MsdnLink@@ SetBkColor
; Example .......;
; ===============================================================================================================================
Func _WinAPI_SetBkColor($hDC, $iColor)
	Local $aResult

	$aResult = DllCall("GDI32.dll", "int", "SetBkColor", "hwnd", $hDC, "int", $iColor)
	Return $aResult[0]
EndFunc   ;==>_WinAPI_SetBkColor

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_SetCapture
; Description ...: Sets the mouse capture to the specified window belonging to the current thread
; Syntax.........: _WinAPI_SetCapture($hWnd)
; Parameters ....: $hWnd        - Handle to the window in the current thread that is to capture the mouse
; Return values .: Success      - handle to the window that had previously captured the mouse
;                  Failure      - 0
; Author ........: Gary Frost (gafrost)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........; @@MsdnLink@@ SetCapture
; Example .......;
; ===============================================================================================================================
Func _WinAPI_SetCapture($hWnd)
	Local $aResult

	$aResult = DllCall("User32.dll", "hwnd", "SetCapture", "hwnd", $hWnd)
	Return $aResult[0]
EndFunc   ;==>_WinAPI_SetCapture

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_SetCursor
; Description ...: Establishes the cursor shape
; Syntax.........: _WinAPI_SetCursor($hCursor)
; Parameters ....: $hCursor     - Identifies the cursor
; Return values .: Success      - The handle of the previous cursor, if there was one.  If there  was  no  previous  cursor,  the
;                  +return value is 0.
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........; @@MsdnLink@@ SetCursor
; Example .......;
; ===============================================================================================================================
Func _WinAPI_SetCursor($hCursor)
	Local $aResult

	$aResult = DllCall("User32.dll", "hwnd", "SetCursor", "hwnd", $hCursor)
	Return $aResult[0]
EndFunc   ;==>_WinAPI_SetCursor

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_SetDefaultPrinter
; Description ...: Sets the default printer for the current user on the local computer
; Syntax.........: _WinAPI_SetDefaultPrinter($sPrinter)
; Parameters ....: $sPrinter    - The default printer name. For a remote printer, the name format is \\server\printername.  For a
;                  +local printer, the name format is printername.  If this parameter is "", this function does nothing if  there
;                  +is already a default printer. However, if there is no default printer, this function sets the default printer
;                  +to the first printer, if any, in an enumeration of printers installed on the local computer.
; Return values .: Success      - True
;                  Failure      - False
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........; @@MsdnLink@@ SetDefaultPrinterA
; Example .......;
; ===============================================================================================================================
Func _WinAPI_SetDefaultPrinter($sPrinter)
	Local $aResult

	$aResult = DllCall("WinSpool.drv", "int", "SetDefaultPrinterA", "str", $sPrinter)
	Return SetError($aResult[0] = 0, 0, $aResult[0] <> 0)
EndFunc   ;==>_WinAPI_SetDefaultPrinter

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_SetDIBits
; Description ...: Sets the pixels in a compatible bitmap using the color data found in a DIB
; Syntax.........: _WinAPI_SetDIBits($hDC, $hBmp, $iStartScan, $iScanLines, $pBits, $pBMI[, $iColorUse = 0])
; Parameters ....: $hDC         - Handle to a device context
;                  $hBmp        - Handle to the compatible bitmap (DDB) that is to be altered using the color data from the DIB
;                  $iStartScan  - Specifies the starting scan line for the device-independent color data in the array pointed  to
;                  +by the pBits parameter.
;                  $iScanLines  - Specifies the number of scan lines found in the array containing device-independent color data
;                  $pBits       - Pointer to the DIB color data, stored as an array of bytes.  The format of  the  bitmap  values
;                  +depends on the biBitCount member of the $tagBITMAPINFO structure pointed to by the pBMI parameter.
;                  $pBMI        - Pointer to a $tagBITMAPINFO structure that contains information about the DIB
;                  $iColorUse   - Specifies whether the iColors member of the $tagBITMAPINFO structure was provided  and,  if  so,
;                  +whether iColors contains explicit red, green, blue (RGB) values or palette indexes.  The iColorUse  parameter
;                  +must be one of the following values:
;                  |0 - The color table is provided and contains literal RGB values
;                  |1 - The color table consists of an array of 16-bit indexes into the logical palette of hDC
; Return values .: Success      - True
;                  Failure      - False
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......: The device context identified by the hDC parameter is used only if the iColorUse is set to 1, otherwise it  is
;                  ignored.  The bitmap identified by the hBmp parameter must not be selected into a  device  context  when  this
;                  function is called. The scan lines must be aligned on a DWORD except for RLE compressed  bitmaps.  The  origin
;                  for bottom up DIBs is the lower left corner of the bitmap; the origin for top down  DIBs  is  the  upper  left
;                  corner of the bitmap.
; Related .......:
; Link ..........; @@MsdnLink@@ SetDIBits
; Example .......;
; ===============================================================================================================================
Func _WinAPI_SetDIBits($hDC, $hBmp, $iStartScan, $iScanLines, $pBits, $pBMI, $iColorUse = 0)
	Local $aResult

	$aResult = DllCall("GDI32.dll", "int", "SetDIBits", "hwnd", $hDC, "hwnd", $hBmp, "uint", $iStartScan, "uint", $iScanLines, _
			"ptr", $pBits, "ptr", $pBMI, "uint", $iColorUse)
	Return SetError($aResult[0] = 0, _WinAPI_GetLastError(), $aResult[0] <> 0)
EndFunc   ;==>_WinAPI_SetDIBits

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_SetEvent
; Description ...: Sets the specified event object to the signaled state
; Syntax.........: _WinAPI_SetEvent($hEvent)
; Parameters ....: $hEvent      - Handle to the event objec
; Return values .: Success      - True
;                  Failure      - False
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......: The state of a manual-reset event object remains signaled until it is set explicitly to the nonsignaled  state
;                  by the ResetEvent function.  Any number of waiting threads, or threads that subsequently begin wait operations
;                  for the specified event object by calling one of the wait functions, can be released when the  object's  state
;                  is signaled.
; Related .......:
; Link ..........; @@MsdnLink@@ SetEvent
; Example .......;
; ===============================================================================================================================
Func _WinAPI_SetEvent($hEvent)
	Local $aResult

	$aResult = DllCall("Kernel32.dll", "int", "SetEvent", "hwnd", $hEvent)
	Return SetError(_WinAPI_GetLastError(), 0, $aResult[0] <> 0)
EndFunc   ;==>_WinAPI_SetEvent

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_SetFocus
; Description ...: Sets the keyboard focus to the specified window
; Syntax.........: _WinAPI_SetFocus($hWnd)
; Parameters ....: $hWnd        - Identifies the window that will receive the keyboard input.  If this parameter is 0, keystrokes
;                  +are ignored.
; Return values .: Success      - The handle of the window that had the keyboard focus
;                  Failure      - 0
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........; @@MsdnLink@@ SetFocus
; Example .......;
; ===============================================================================================================================
Func _WinAPI_SetFocus($hWnd)
	Local $aResult

	$aResult = DllCall("User32.dll", "hwnd", "SetFocus", "hwnd", $hWnd)
	Return $aResult[0]
EndFunc   ;==>_WinAPI_SetFocus

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_SetFont
; Description ...: Sets a window font
; Syntax.........: _WinAPI_SetFont($hWnd, $hFont[, $fRedraw = True])
; Parameters ....: $hWnd        - Window handle
;                  $hFont       - Font handle
;                  $fRedraw     - True to redraw the control
; Return values .:
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........;
; Example .......;
; ===============================================================================================================================
Func _WinAPI_SetFont($hWnd, $hFont, $fRedraw = True)
	_SendMessage($hWnd, $WM_SETFONT, $hFont, $fRedraw)
EndFunc   ;==>_WinAPI_SetFont

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_SetHandleInformation
; Description ...: Sets certain properties of an object handle
; Syntax.........: _WinAPI_SetHandleInformation($hObject, $iMask, $iFlags)
; Parameters ....: $hObject     - Handle to an object
;                  $iMask       - Specifies the bit flags to be changed
;                  $iFlags      - Specifies properties of the object handle
; Return values .: Success      - True
;                  Failure      - False
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........; @@MsdnLink@@ SetHandleInformation
; Example .......;
; ===============================================================================================================================
Func _WinAPI_SetHandleInformation($hObject, $iMask, $iFlags)
	Local $aResult

	$aResult = DllCall("Kernel32.dll", "int", "SetHandleInformation", "hwnd", $hObject, "uint", $iMask, "uint", $iFlags)
	_WinAPI_Check("_WinAPI_SetHandleInformation", $aResult[0] = 0, 0, True)
	Return $aResult[0]
EndFunc   ;==>_WinAPI_SetHandleInformation

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_SetLastError
; Description ...: Sets the last-error code for the calling thread
; Syntax.........: _WinAPI_SetLastError($iErrCode)
; Parameters ....: $iErrCode    - The last error code for the thread
; Return values .:
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......: The last error code is kept in thread local storage so that multiple threads do  not  overwrite  each  other's
;                  values.
; Related .......:
; Link ..........; @@MsdnLink@@ SetLastError
; Example .......;
; ===============================================================================================================================
Func _WinAPI_SetLastError($iErrCode)
	DllCall("Kernel32.dll", "none", "SetLastError", "dword", $iErrCode)
EndFunc   ;==>_WinAPI_SetLastError

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_SetParent
; Description ...: Changes the parent window of the specified child window
; Syntax.........: _WinAPI_SetParent($hWndChild, $hWndParent)
; Parameters ....: $hWndChild   - Window handle of child window
;                  $hNewParent  - Handle to the new parent window. If 0, the desktop window becomes the new parent window.
; Return values .: Success      - A handle to the previous parent window
;                  Failure      - 0
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......: An application can use the SetParent function to set the parent window  of  a  pop-up,  overlapped,  or  child
;                  window.  The new parent window and the child window must belong to the same application.
; Related .......:
; Link ..........; @@MsdnLink@@ SetParent
; Example .......;
; ===============================================================================================================================
Func _WinAPI_SetParent($hWndChild, $hWndParent)
	Local $aResult

	$aResult = DllCall("User32.dll", "hwnd", "SetParent", "hwnd", $hWndChild, "hwnd", $hWndParent)
	Return $aResult[0]
EndFunc   ;==>_WinAPI_SetParent

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_SetProcessAffinityMask
; Description ...: Sets a processor affinity mask for the threads of a specified process
; Syntax.........: _WinAPI_SetProcessAffinityMask($hProcess, $iMask)
; Parameters ....: $hProcess    - A handle to the process whose affinity mask the function sets
;                  $iMask       - Affinity mask
; Return values .: Success      - True
;                  Failure      - False
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......: An affinity mask is a bit mask in which each bit represents a processor on which the threads  of  the  process
;                  are allowed to run.  For example, if you pass a mask of 0x05, processors 1 and 3 are allowed to run.
; Related .......:
; Link ..........; @@MsdnLink@@ SetProcessAffinityMask
; Example .......;
; ===============================================================================================================================
Func _WinAPI_SetProcessAffinityMask($hProcess, $iMask)
	Local $iResult

	$iResult = DllCall("Kernel32.dll", "int", "SetProcessAffinityMask", "hwnd", $hProcess, "int", $iMask)
	_WinAPI_Check("_WinAPI_SetProcessAffinityMask", ($iResult[0] = 0), 0, True)
	Return $iResult[0] <> 0
EndFunc   ;==>_WinAPI_SetProcessAffinityMask

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_SetTextColor
; Description ...: Sets the current text color to the specified color value
; Syntax.........: _WinAPI_SetTextColor($hDC, $iColor)
; Parameters ....: $hDC         - Handle to the device context
;                  $iColor      - Specifies the new text color
; Return values .: Success      - The previous text color
;                  Failure      - $CLR_INVALID
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........; @@MsdnLink@@ SetTextColor
; Example .......;
; ===============================================================================================================================
Func _WinAPI_SetTextColor($hDC, $iColor)
	Local $aResult

	$aResult = DllCall("GDI32.dll", "int", "SetTextColor", "hwnd", $hDC, "int", $iColor)
	Return $aResult[0]
EndFunc   ;==>_WinAPI_SetTextColor

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_SetWindowLong
; Description ...: Sets information about the specified window
; Syntax.........: _WinAPI_SetWindowLong($hWnd, $iIndex, $iValue)
; Parameters ....: $hWnd        - Handle of the window
;                  $iIndex      - Specifies the zero based offset to the value to be set.  Valid values are  in  the  range  zero
;                  +through the number of bytes of extra window memory, minus four; for example, if  you  specified  12  or  more
;                  +bytes of extra memory, a value of 8 would be an index to the third 32-bit  integer.  To  retrieve  any  other
;                  +value specify one of the following values:
;                  |$GWL_EXSTYLE    - Sets the extended window styles
;                  |$GWL_STYLE      - Sets the window styles
;                  |$GWL_WNDPROC    - Sets the address of the window procedure
;                  |$GWL_HINSTANCE  - Sets the handle of the application instance
;                  |$GWL_HWNDPARENT - Sets the handle of the parent window, if any
;                  |$GWL_ID         - Sets the identifier of the window
;                  |$GWL_USERDATA   - Sets the 32-bit value associated with the window
;                  $iValue      - Specifies the replacement value
; Return values .: Success      - The previous value
;                  Failure      - 0
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......: _WinAPI_GetWindowLong
; Link ..........; @@MsdnLink@@ SetWindowLong
; Example .......;
; ===============================================================================================================================
Func _WinAPI_SetWindowLong($hWnd, $iIndex, $iValue)
	Local $aResult

	$aResult = DllCall("User32.dll", "int", "SetWindowLong", "hwnd", $hWnd, "int", $iIndex, "int", $iValue)
	Return $aResult[0]
EndFunc   ;==>_WinAPI_SetWindowLong

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_SetWindowPos
; Description ...: Changes the size, position, and Z order of a child, pop-up, or top-level  window
; Syntax.........: _WinAPI_SetWindowPos($hWnd, $hAfter, $iX, $iY, $iCX, $iCY, $iFlags)
; Parameters ....: $hWnd        - Handle of window
;                  $hAfter      - Identifies the window to precede the positioned window in the Z order. This parameter must be a
;                  +window handle or one of the following values:
;                  |$HWND_BOTTOM    - Places the window at the bottom of the Z order
;                  |$HWND_NOTOPMOST - Places the window above all non-topmost windows
;                  |$HWND_TOP       - Places the window at the top of the Z order
;                  |$HWND_TOPMOST   - Places the window above all non-topmost windows
;                  $iX          - Specifies the new position of the left side of the window
;                  $iY          - Specifies the new position of the top of the window
;                  $iCX         - Specifies the new width of the window, in pixels
;                  $iCY         - Specifies the new height of the window, in pixels
;                  $iFlags      - Specifies the window sizing and positioning flags:
;                  |$SWP_DRAWFRAME      - Draws a frame around the window
;                  |$SWP_FRAMECHANGED   - Sends a $WM_NCCALCSIZE message to the window, even if the window's size is not changed
;                  |$SWP_HIDEWINDOW     - Hides the window
;                  |$SWP_NOACTIVATE     - Does not activate the window
;                  |$SWP_NOCOPYBITS     - Discards the entire contents of the client area
;                  |$SWP_NOMOVE         - Retains the current position
;                  |$SWP_NOOWNERZORDER  - Does not change the owner window's position in the Z order
;                  |$SWP_NOREDRAW       - Does not redraw changes
;                  |$SWP_NOREPOSITION   - Same as the $SWP_NOOWNERZORDER flag
;                  |$SWP_NOSENDCHANGING - Prevents the window from receiving $WM_WINDOWPOSCHANGING
;                  |$SWP_NOSIZE         - Retains the current size
;                  |$SWP_NOZORDER       - Retains the current Z order
;                  |$SWP_SHOWWINDOW     - Displays the window
; Return values .: Success      - True
;                  Failure      - False
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........; @@MsdnLink@@ SetWindowPos
; Example .......;
; ===============================================================================================================================
Func _WinAPI_SetWindowPos($hWnd, $hAfter, $iX, $iY, $iCX, $iCY, $iFlags)
	Local $aResult

	$aResult = DllCall("User32.dll", "int", "SetWindowPos", "hwnd", $hWnd, "hwnd", $hAfter, "int", $iX, "int", $iY, "int", $iCX, _
			"int", $iCY, "int", $iFlags)
	_WinAPI_Check("_WinAPI_SetWindowPos", ($aResult[0] = 0), 0, True)
	Return $aResult[0] <> 0
EndFunc   ;==>_WinAPI_SetWindowPos

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_SetWindowText
; Description ...: Changes the text of the specified window's title bar
; Syntax.........: _WinAPI_SetWindowText($hWnd, $sText)
; Parameters ....: $hWnd        - Handle to the window or control whose text is to be changed
;                  $sText       - String to be used as the new title or control te
; Return values .: Success      - True
;                  Failure      - False
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......: If the target window is owned by the current process, SetWindowText causes a $WM_SETTEXT message to be sent to
;                  the specified window or control.  If the control is a list box control created  with  the  $WS_CAPTION  style,
;                  however, SetWindowText sets the text for the control, not for the list box entries.  To  set  the  text  of  a
;                  control in another process, send the $WM_SETTEXT message directly instead of calling SetWindowText.
; Related .......:
; Link ..........; @@MsdnLink@@ SetWindowText
; Example .......;
; ===============================================================================================================================
Func _WinAPI_SetWindowText($hWnd, $sText)
	Local $aResult

	$aResult = DllCall("User32.dll", "int", "SetWindowText", "hwnd", $hWnd, "str", $sText)
	Return $aResult[0] <> 0
EndFunc   ;==>_WinAPI_SetWindowText

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_ShowCursor
; Description ...: Displays or hides the cursor
; Syntax.........: _WinAPI_ShowCursor($fShow)
; Parameters ....: $fShow       - If True, the curor is shown, otherwise it is hidden
; Return values .: Success      - The new display counter
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......: This function sets an internal display counter that determines whether the cursor  should  be  displayed.  The
;                  cursor is displayed only if the display count is greater than or equal to 0.  If a  mouse  is  installed,  the
;                  initial display count is 0. If no mouse is installed, the display count is -1.
; Related .......:
; Link ..........; @@MsdnLink@@ ShowCursor
; Example .......;
; ===============================================================================================================================
Func _WinAPI_ShowCursor($fShow)
	Local $aResult

	$aResult = DllCall("User32.dll", "int", "ShowCursor", "int", $fShow)
	Return $aResult[0]
EndFunc   ;==>_WinAPI_ShowCursor

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_ShowError
; Description ...: Displays an error message box with an optional exit
; Syntax.........: _WinAPI_ShowError($sText[, $fExit = True])
; Parameters ....: $sText       - Error text to display
;                  $fExit       - Specifies whether to exit after the display:
;                  | True - Exit program after display
;                  |False - Return normally after display
; Return values .:
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......: _WinAPI_ShowMsg
; Link ..........;
; Example .......;
; ===============================================================================================================================
Func _WinAPI_ShowError($sText, $fExit = True)
	_WinAPI_MsgBox(266256, "Error", $sText)
	If $fExit Then Exit
EndFunc   ;==>_WinAPI_ShowError

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_ShowMsg
; Description ...: Displays an "Information" message box
; Syntax.........: _WinAPI_ShowMsg($sText)
; Parameters ....: $sText       - Error text to display
; Return values .:
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......: _WinAPI_ShowError
; Link ..........;
; Example .......;
; ===============================================================================================================================
Func _WinAPI_ShowMsg($sText)
	_WinAPI_MsgBox(64 + 4096, "Information", $sText)
EndFunc   ;==>_WinAPI_ShowMsg

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_ShowWindow
; Description ...: Sets the specified window's show state
; Syntax.........: _WinAPI_ShowWindow($hWnd[, $iCmdShow = 5])
; Parameters ....: $hWnd        - Handle of window
;                  $iCmdShow    - Specifies how the window is to be shown:
;                  |$SW_HIDE            - Hides the window and activates another window
;                  |$SW_MAXIMIZE        - Maximizes the specified window
;                  |$SW_MINIMIZE        - Minimizes the specified window and activates the next top-level window in the Z order
;                  |$SW_RESTORE         - Activates and displays the window
;                  |$SW_SHOW            - Activates the window and displays it in its current size and position
;                  |$SW_SHOWDEFAULT     - Sets the show state based on the SW_ flag specified in the STARTUPINFO structure
;                  |$SW_SHOWMAXIMIZED   - Activates the window and displays it as a maximized window
;                  |$SW_SHOWMINIMIZED   - Activates the window and displays it as a minimized window
;                  |$SW_SHOWMINNOACTIVE - Displays the window as a minimized window
;                  |$SW_SHOWNA          - Displays the window in its current state
;                  |$SW_SHOWNOACTIVATE  - Displays a window in its most recent size and position
;                  |$SW_SHOWNORMAL      - Activates and displays a window
; Return values .: Success      - True
;                  Failure      - False
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........; @@MsdnLink@@ ShowWindow
; Example .......;
; ===============================================================================================================================
Func _WinAPI_ShowWindow($hWnd, $iCmdShow = 5)
	Local $aResult

	$aResult = DllCall("User32.dll", "int", "ShowWindow", "hwnd", $hWnd, "int", $iCmdShow)
	Return $aResult[0] <> 0
EndFunc   ;==>_WinAPI_ShowWindow

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_StringFromGUID
; Description ...: Converts a binary GUID to string form
; Syntax.........: _WinAPI_StringFromGUID($pGUID)
; Parameters ....: $pGUID       - Pointer to a $tagGUID structure
; Return values .: Success      - GUID in string form
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......: _WinAPI_GUIDFromString, $tagGUID
; Link ..........; @@MsdnLink@@ StringFromGUID2
; Example .......;
; ===============================================================================================================================
Func _WinAPI_StringFromGUID($pGUID)
	Local $aResult

	$aResult = DllCall("Ole32.dll", "int", "StringFromGUID2", "ptr", $pGUID, "wstr", "", "int", 40)
	Return SetError($aResult[0] <> 0, 0, $aResult[2])
EndFunc   ;==>_WinAPI_StringFromGUID

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_SubLangId
; Description ...: Extract sublanguage id from a language id
; Syntax.........: _WinAPI_SubLangId($lgid)
; Parameters ....: $lgid        - Language id
; Return values .: Success      - Sub-Language id
; Author ........: Gary Frost (gafrost)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........;
; Example .......;
; ===============================================================================================================================
Func _WinAPI_SubLangId($lgid)
	Return BitShift($lgid, 10)
EndFunc   ;==>_WinAPI_SubLangId

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_SystemParametersInfo
; Description ...: Retrieves or sets the value of one of the system-wide parameters
; Syntax.........: _WinAPI_SystemParametersInfo($iAction[, $iParam = 0[, $vParam = 0[, $iWinIni = 0]]])
; Parameters ....: $iAction     - The system-wide parameter to be retrieved or set
;                  $iParam      - A parameter whose usage and format depends on the parameter being queried or set
;                  $vParam      - A parameter whose usage and format depends on the parameter being queried or set
;                  $iWinIni      - If a system parameter is being set, specifies whether the user profile is to be  updated,  and
;                  +if so, whether the $WM_SETTINGCHANGE message is to be broadcast. This parameter can be zero if you don't want
;                  +to update the user profile or it can be one or more of the following values:
;                  |$SPIF_UPDATEINIFILE - Writes the new setting to the user profile
;                  |$SPIF_SENDCHANGE    - Broadcasts the $WM_SETTINGCHANGE message after updating the user profile
; Return values .: Success      - True
;                  Failure      - False
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........; @@MsdnLink@@ SystemParametersInfo
; Example .......;
; ===============================================================================================================================
Func _WinAPI_SystemParametersInfo($iAction, $iParam = 0, $vParam = 0, $iWinIni = 0)
	Local $aResult

	$aResult = DllCall("user32.dll", "int", "SystemParametersInfo", "int", $iAction, "int", $iParam, "int", $vParam, "int", $iWinIni)
	Return $aResult[0] <> 0
EndFunc   ;==>_WinAPI_SystemParametersInfo

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_TwipsPerPixelX
; Description ...: Returns the width of a pixel, in twips.
; Syntax.........: _WinAPI_TwipsPerPixelX()
; Parameters ....:
; Return values .: The width of a pixel, in twips.
; Author ........: Gary Frost (gafrost)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........;
; Example .......;
; ===============================================================================================================================
Func _WinAPI_TwipsPerPixelX()
	Local $lngDC, $TwipsPerPixelX
	$lngDC = _WinAPI_GetDC(0)
	$TwipsPerPixelX = 1440 / _WinAPI_GetDeviceCaps($lngDC, $LOGPIXELSX)
	_WinAPI_ReleaseDC(0, $lngDC)
	Return $TwipsPerPixelX
EndFunc   ;==>_WinAPI_TwipsPerPixelX

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_TwipsPerPixelY
; Description ...: Returns the height of a pixel, in twips.
; Syntax.........: _WinAPI_TwipsPerPixelY()
; Parameters ....:
; Return values .: The height of a pixel, in twips.
; Author ........: Gary Frost (gafrost)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........;
; Example .......;
; ===============================================================================================================================
Func _WinAPI_TwipsPerPixelY()
	Local $lngDC, $TwipsPerPixelY
	$lngDC = _WinAPI_GetDC(0)
	$TwipsPerPixelY = 1440 / _WinAPI_GetDeviceCaps($lngDC, $LOGPIXELSY)
	_WinAPI_ReleaseDC(0, $lngDC)
	Return $TwipsPerPixelY
EndFunc   ;==>_WinAPI_TwipsPerPixelY

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_UpdateLayeredWindow
; Description ...: Updates the position, size, shape, content, and translucency of a layered window
; Syntax.........: _WinAPI_UpdateLayeredWindow($hWnd, $hDCDest, $pPTDest, $pSize, $hDCSrce, $pPTSrce, $iRGB, $pBlend, $iFlags)
; Parameters ....: $hWnd        - Handle to a layered window.  A layered window is  created  by  specifying  $WS_EX_LAYERED  when
;                  +creating the window.
;                  $hDCDest     - Handle to a device context for the screen
;                  $pPTDest     - Pointer to a $tagPOINT structure that specifies the new screen position of the  layered  window.
;                  +If the current position is not changing, this can be zero.
;                  $pSize       - Pointer to a $tagSIZE structure that specifies the new size of the layered window.  If the  size
;                  +of the window is not changing, this can be 0.
;                  $hDCSrce     - Handle to a device context for the surface that defines the layered window.  This handle can be
;                  +obtained by calling the _WinAPI_CreateCompatibleDC function.
;                  $pPTSrce     - Pointer to a $tagPOINT structure that specifies the location of the layer in the device context
;                  $iRGB        - The color key to be used when composing the layered window
;                  $pBlend      - Pointer to a $tagBLENDFUNCTION structure that specifies the transparency value to be  used  when
;                  +composing the layered window.
;                  $iFlags      - This parameter can be one of the following values.
;                  |$ULW_ALPHA    - Use $tblend as the blend function
;                  |$ULW_COLORKEY - Use $iRGB as the transparency color
;                  |$ULW_OPAQUE   - Draw an opaque layered window
; Return values .: Success      - True
;                  Failure      - False
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......: $tagBLENDFUNCTION, $tagPOINT, $tagSIZE
; Link ..........; @@MsdnLink@@ UpdateLayeredWindow
; Example .......;
; ===============================================================================================================================
Func _WinAPI_UpdateLayeredWindow($hWnd, $hDCDest, $pPTDest, $pSize, $hDCSrce, $pPTSrce, $iRGB, $pBlend, $iFlags)
	Local $aResult

	$aResult = DllCall("User32.dll", "int", "UpdateLayeredWindow", "hwnd", $hWnd, "hwnd", $hDCDest, "ptr", $pPTDest, "ptr", $pSize, _
			"hwnd", $hDCSrce, "ptr", $pPTSrce, "int", $iRGB, "ptr", $pBlend, "int", $iFlags)
	Return SetError($aResult[0] = 0, 0, $aResult[0] <> 0)
EndFunc   ;==>_WinAPI_UpdateLayeredWindow

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_UpdateWindow
; Description ...: Updates the client area of a window by sending a WM_PAINT message to the window
; Syntax.........: _WinAPI_UpdateWindow($hWnd)
; Parameters ....: $hWnd        - Handle of window to update
; Return values .: Success      - True
;                  Failure      - False
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........; @@MsdnLink@@ UpdateWindow
; Example .......;
; ===============================================================================================================================
Func _WinAPI_UpdateWindow($hWnd)
	Local $aResult

	$aResult = DllCall("User32.dll", "int", "UpdateWindow", "hwnd", $hWnd)
	Return $aResult[0] <> 0
EndFunc   ;==>_WinAPI_UpdateWindow

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_WaitForInputIdle
; Description ...: Waits until a process is waiting for user input with no input pending, or a time out
; Syntax.........: _WinAPI_WaitForInputIdle($hProcess[, $iTimeout = -1])
; Parameters ....: $hProcess    - A handle to the process.  If this process is a console application or does not have  a  message
;                  +queue, this function returns immediately.
;                  $iTimeOut    - The time out interval, in milliseconds.  If set to -1, the function does not return  until  the
;                  +process is idle.
; Return values .: Success      - True
;                  Failure      - False
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......: This function causes a thread to suspend execution until the specified process has finished its initialization
;                  and is waiting for user input with no input pending. This can be useful for synchronizing a parent process and
;                  a newly created child process.  When a parent process creates a  child  process,  the  CreateProcess  function
;                  returns without waiting for the child process to finish its initialization.  Before trying to communicate with
;                  the child process, the parent process can use this function to determine when the child's  initialization  has
;                  been completed. This function can be used at any time, not just during application startup.
; Related .......:
; Link ..........; @@MsdnLink@@ WaitForInputIdle
; Example .......;
; ===============================================================================================================================
Func _WinAPI_WaitForInputIdle($hProcess, $iTimeout = -1)
	Local $aResult

	$aResult = DllCall("User32.dll", "dword", "WaitForInputIdle", "hwnd", $hProcess, "dword", $iTimeout)
	Return SetError(_WinAPI_GetLastError(), 0, $aResult[0] = 0)
EndFunc   ;==>_WinAPI_WaitForInputIdle

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_WaitForMultipleObjects
; Description ...: Waits until one or all of the specified objects are in the signaled state
; Syntax.........: _WinAPI_WaitForMultipleObjects($iCount, $pHandles[, $fWaitAll = False[, $iTimeout = -1]])
; Parameters ....: $iCount      - The number of object handles in the array pointed to by pHandles
;                  $pHandles    - Pointer to an array of object handles
;                  $fWaitAll    - If True, the function returns when the state of all objects in the pHandles array is  signaled.
;                  +If False, the function returns when the state of any one of the objects is set to  signaled.  In  the  latter
;                  +case, the return value indicates the object whose state caused the function to return.
;                  $iTimeout    - The time-out interval, in milliseconds.  The function returns if the interval elapses, even  if
;                  +the conditions specified by the fWaitAll parameter are not met.  If 0, the function tests the states  of  the
;                  +specified objects and returns immediately. If -1, the function's time-out interval never elapses.
; Return values .: Success      - Indicates the event that caused the function to return
;                  Failure      - -1
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......: _WinAPI_WaitForSingleObject
; Link ..........; @@MsdnLink@@ WaitForMultipleObjects
; Example .......;
; ===============================================================================================================================
Func _WinAPI_WaitForMultipleObjects($iCount, $pHandles, $fWaitAll = False, $iTimeout = -1)
	Local $aResult

	$aResult = DllCall("Kernel32.dll", "int", "WaitForMultipleObjects", "int", $iCount, "ptr", $pHandles, "int", $fWaitAll, "int", $iTimeout)
	Return SetError(_WinAPI_GetLastError(), 0, $aResult[0])
EndFunc   ;==>_WinAPI_WaitForMultipleObjects

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_WaitForSingleObject
; Description ...: Waits until the specified object is in the signaled state
; Syntax.........: _WinAPI_WaitForSingleObject($hHandle[, $iTimeout = -1])
; Parameters ....: $hHandle     - A handle to the object
;                  $iTimeout    - The time-out interval, in milliseconds.  The function returns if the interval elapses, even  if
;                  +the conditions specified by the fWaitAll parameter are not met.  If 0, the function tests the states  of  the
;                  +specified objects and returns immediately. If -1, the function's time-out interval never elapses.
; Return values .: Success      - Indicates the event that caused the function to return
;                  Failure      - -1
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......: _WinAPI_WaitForMultipleObjects
; Link ..........; @@MsdnLink@@ WaitForSingleObject
; Example .......;
; ===============================================================================================================================
Func _WinAPI_WaitForSingleObject($hHandle, $iTimeout = -1)
	Local $aResult

	$aResult = DllCall("Kernel32.dll", "int", "WaitForSingleObject", "hwnd", $hHandle, "int", $iTimeout)
	Return SetError(_WinAPI_GetLastError(), 0, $aResult[0])
EndFunc   ;==>_WinAPI_WaitForSingleObject

; #FUNCTION#====================================================================================================================
; Name...........: _WinAPI_WideCharToMultiByte
; Description ...: Converts a Unicode string to an ANSI string
; Syntax.........: _WinAPI_WideCharToMultiByte($pUnicode[, $iCodePage = 0])
; Parameters ....: $pUnicode    - Pointer to a byte array structure containing Unicode text to be converted
;                  $iCodePage   - Code page to use in performing the conversion:
;                  |$CP_ACP        - The current system Windows ANSI code page
;                  |$CP_MACCP      - The current system Macintosh code page
;                  |$CP_OEMCP      - The current system OEM code page
;                  |$CP_SYMBOL     - Symbol code page
;                  |$CP_THREAD_ACP - The Windows ANSI code page for the current thread
;                  |$CP_UTF7       - UTF-7
;                  |$CP_UTF8       - UTF-8
; Return values .: Success      - Converted string
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......: _WinAPI_MultiByteToWideChar
; Link ..........; @@MsdnLink@@ WideCharToMultiByte
; Example .......;
; ===============================================================================================================================
Func _WinAPI_WideCharToMultiByte($pUnicode, $iCodePage = 0)
	Local $aResult

	$aResult = DllCall("Kernel32.dll", "int", "WideCharToMultiByte", "int", $iCodePage, "int", 0, "ptr", $pUnicode, "int", -1, _
			"str", "", "int", 0, "int", 0, "int", 0)
	$aResult = DllCall("Kernel32.dll", "int", "WideCharToMultiByte", "int", $iCodePage, "int", 0, "ptr", $pUnicode, "int", -1, _
			"str", "", "int", $aResult[0], "int", 0, "int", 0)
	Return $aResult[5]
EndFunc   ;==>_WinAPI_WideCharToMultiByte

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_WindowFromPoint
; Description ...: Retrieves the handle of the window that contains the specified point
; Syntax.........: _WinAPI_WindowFromPoint(ByRef $tPoint)
; Parameters ....: $tPoint      - $tagPOINT structure that defines the point to be checked
; Return values .: Success      - The handle of the window thatcontains the point
;                  Failure      - 0
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......: The WindowFromPoint function does not retrieve the handle of a hidden or disabled window, even if the point is
;                  within the window.
; Related .......:
; Link ..........; @@MsdnLink@@ WindowFromPoint
; Example .......;
; ===============================================================================================================================
Func _WinAPI_WindowFromPoint(ByRef $tPoint)
	Local $iX, $iY, $aResult

	$iX = DllStructGetData($tPoint, "X")
	$iY = DllStructGetData($tPoint, "Y")
	$aResult = DllCall("User32.dll", "hwnd", "WindowFromPoint", "int", $iX, "int", $iY)
	Return $aResult[0]
EndFunc   ;==>_WinAPI_WindowFromPoint

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_WriteConsole
; Description ...: Writes a character string to a console screen buffer
; Syntax.........: _WinAPI_WriteConsole($hConsole, $sText)
; Parameters ....: $hConsole    - Handle to the console screen buffer
;                  $sText       - Text to be written to the console screen buffer
; Return values .: Success      - True
;                  Failure      - False
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........; @@MsdnLink@@ WriteConsole
; Example .......;
; ===============================================================================================================================
Func _WinAPI_WriteConsole($hConsole, $sText)
	Local $aResult

	$aResult = DllCall("Kernel32.dll", "int", "WriteConsole", "int", $hConsole, "str", $sText, "int", StringLen($sText), "int*", 0, "int", 0)
	Return SetError(_WinAPI_GetLastError(), 0, $aResult[0] <> 0)
EndFunc   ;==>_WinAPI_WriteConsole

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_WriteFile
; Description ...: Writes data to a file at the position specified by the file pointer
; Syntax.........: _WinAPI_WriteFile($hFile, $pBuffer, $iToWrite, ByRef $iWritten[, $pOverlapped = 0])
; Parameters ....: $hFile       - Handle to the file to be written
;                  $pBuffer     - Pointer to the buffer containing the data to be written
;                  $iToWrite    - Number of bytes to be written to the file
;                  $iWritten    - The number of bytes written
;                  $pOverlapped - Pointer to a $tagOVERLAPPED structure
; Return values .: Success      - True
;                  Failure      - False
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......: _WinAPI_ReadFile
; Link ..........; @@MsdnLink@@ WriteFile
; Example .......;
; ===============================================================================================================================
Func _WinAPI_WriteFile($hFile, $pBuffer, $iToWrite, ByRef $iWritten, $pOverlapped = 0)
	Local $pWritten, $tWritten, $aResult

	$tWritten = DllStructCreate("int Written")
	$pWritten = DllStructGetPtr($tWritten)
	$aResult = DllCall("Kernel32.dll", "int", "WriteFile", "hwnd", $hFile, "ptr", $pBuffer, "uint", $iToWrite, "ptr", $pWritten, "ptr", $pOverlapped)
	$iWritten = DllStructGetData($tWritten, "Written")
	Return SetError(_WinAPI_GetLastError(), 0, $aResult[0] <> 0)
EndFunc   ;==>_WinAPI_WriteFile

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_WriteProcessMemory
; Description ...: Writes memory in a specified process
; Syntax.........: _WinAPI_WriteProcessMemory($hProcess, $pBaseAddress, $pBuffer, $iSize, ByRef $iWritten[, $sBuffer = "ptr"])
; Parameters ....: $hProcess     - Identifies an open handle to a process whose memory is to be written to
;                  $pBaseAddress - Points to the base address in the specified process to be written to
;                  $pBuffer      - Points to the buffer that supplies data to be written into the address space
;                  $iSize        - Specifies the number of bytes to write into the specified process
;                  $iWritten     - The actual number of bytes transferred into the  specified  process
;                  $sBuffer      - Contains the data type that $pBuffer represents
; Return values .: Success       - True
;                  Failure       - False
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......: _WinAPI_ReadProcessMemory
; Link ..........; @@MsdnLink@@ WriteProcessMemory
; Example .......;
; ===============================================================================================================================
Func _WinAPI_WriteProcessMemory($hProcess, $pBaseAddress, $pBuffer, $iSize, ByRef $iWritten, $sBuffer = "ptr")
	Local $pWritten, $tWritten, $aResult

	$tWritten = DllStructCreate("int Written")
	$pWritten = DllStructGetPtr($tWritten)
	$aResult = DllCall("Kernel32.dll", "int", "WriteProcessMemory", "int", $hProcess, "int", $pBaseAddress, $sBuffer, $pBuffer, _
			"int", $iSize, "int", $pWritten)
	_WinAPI_Check("_WinAPI_WriteProcessMemory", ($aResult[0] = 0), 0, True)
	$iWritten = DllStructGetData($tWritten, "Written")
	Return $aResult[0]
EndFunc   ;==>_WinAPI_WriteProcessMemory

; #FUNCTION# ====================================================================================================================
; Name...........: _WinAPI_ValidateClassName
; Description ...: Validates ClassName Type used in UDFs
; Syntax.........: _WinAPI_ValidateClassName($hWnd, $sClassNames)
; Parameters ....: $hwnd        - handle to the control to check ClassName
;                  $sClassNames - delmited string of Valid ClassNames
; Return values .:
; Author ........: Gary Frost (gafrost)
; Modified.......:
; Remarks .......:
; Related .......: _WinAPI_IsClassName
; Link ..........;
; Example .......;
; ===============================================================================================================================
Func _WinAPI_ValidateClassName($hWnd, $sClassNames)
	Local $aClassNames, $sSeperator = Opt("GUIDataSeparatorChar"), $sText
	
	If Not _WinAPI_IsClassName($hWnd, $sClassNames) Then
		$aClassNames = StringSplit($sClassNames, $sSeperator)
		For $x = 1 To $aClassNames[0]
			$sText &= $aClassNames[$x] & ", "
		Next
		$sText = StringTrimRight($sText, 2)

		_WinAPI_ShowError("Invalid Class Type(s):" & @LF & @TAB & _
				"Expecting Type(s): " & $sText & @LF & @TAB & _
				"Received Type : " & _WinAPI_GetClassName($hWnd))
	EndIf
EndFunc   ;==>_WinAPI_ValidateClassName