#include-once

; ------------------------------------------------------------------------------
;
; AutoIt Version: 3.2
; Description:    ToolTip Constants.
;
; ------------------------------------------------------------------------------

; #CONSTANTS# ===================================================================================================================
Global Const $TTF_IDISHWND = 0x00000001
Global Const $TTF_CENTERTIP = 0x00000002
Global Const $TTF_RTLREADING = 0x00000004
Global Const $TTF_SUBCLASS = 0x00000010
Global Const $TTF_TRACK = 0x00000020
Global Const $TTF_ABSOLUTE = 0x00000080
Global Const $TTF_TRANSPARENT = 0x00000100
Global Const $TTF_PARSELINKS = 0x00001000
Global Const $TTF_DI_SETITEM = 0x00008000
; ===============================================================================================================================

; #MESSAGES# ====================================================================================================================
Global Const $TTM_ACTIVATE = $WM_USER + 1
Global Const $TTM_SETDELAYTIME = $WM_USER + 3
Global Const $TTM_ADDTOOL = $WM_USER + 4
Global Const $TTM_DELTOOL = $WM_USER + 5
Global Const $TTM_NEWTOOLRECT = $WM_USER + 6
Global Const $TTM_GETTOOLINFO = $WM_USER + 8
Global Const $TTM_SETTOOLINFO = $WM_USER + 9
Global Const $TTM_HITTEST = $WM_USER + 10
Global Const $TTM_GETTEXT = $WM_USER + 11
Global Const $TTM_UPDATETIPTEXT = $WM_USER + 12
Global Const $TTM_GETTOOLCOUNT = $WM_USER + 13
Global Const $TTM_ENUMTOOLS = $WM_USER + 14
Global Const $TTM_GETCURRENTTOOL = $WM_USER + 15
Global Const $TTM_WINDOWFROMPOINT = $WM_USER + 16
Global Const $TTM_TRACKACTIVATE = $WM_USER + 17
Global Const $TTM_TRACKPOSITION = $WM_USER + 18
Global Const $TTM_SETTIPBKCOLOR = $WM_USER + 19
Global Const $TTM_SETTIPTEXTCOLOR = $WM_USER + 20
Global Const $TTM_GETDELAYTIME = $WM_USER + 21
Global Const $TTM_GETTIPBKCOLOR = $WM_USER + 22
Global Const $TTM_GETTIPTEXTCOLOR = $WM_USER + 23
Global Const $TTM_SETMAXTIPWIDTH = $WM_USER + 24
Global Const $TTM_GETMAXTIPWIDTH = $WM_USER + 25
Global Const $TTM_SETMARGIN = $WM_USER + 26
Global Const $TTM_GETMARGIN = $WM_USER + 27
Global Const $TTM_POP = $WM_USER + 28
Global Const $TTM_UPDATE = $WM_USER + 29
Global Const $TTM_GETBUBBLESIZE = $WM_USER + 30
Global Const $TTM_ADJUSTRECT = $WM_USER + 31
Global Const $TTM_SETTITLE = $WM_USER + 32
Global Const $TTM_SETTITLEW = $WM_USER + 33
Global Const $TTM_POPUP = $WM_USER + 34
Global Const $TTM_GETTITLE = $WM_USER + 35
Global Const $TTM_ADDTOOLW = $WM_USER + 50
Global Const $TTM_DELTOOLW = $WM_USER + 51
Global Const $TTM_NEWTOOLRECTW = $WM_USER + 52
Global Const $TTM_GETTOOLINFOW = $WM_USER + 53
Global Const $TTM_SETTOOLINFOW = $WM_USER + 54
Global Const $TTM_HITTESTW = $WM_USER + 55
Global Const $TTM_GETTEXTW = $WM_USER + 56
Global Const $TTM_UPDATETIPTEXTW = $WM_USER + 57
Global Const $TTM_ENUMTOOLSW = $WM_USER + 58
Global Const $TTM_GETCURRENTTOOLW = $WM_USER + 59
Global Const $TTM_SETWINDOWTHEME = $CCM_SETWINDOWTHEME
; ===============================================================================================================================

; #NOTIFICATIONS# ===============================================================================================================
Global Const $TTN_GETDISPINFO = 0xFFFFFDF8    ; Sent to retrieve information needed to display a ToolTip
Global Const $TTN_SHOW = 0xFFFFFDF7    ; Notifies the owner window that a ToolTip control is about to be displayed
Global Const $TTN_POP = 0xFFFFFDF6    ; Notifies the owner window that a ToolTip is about to be hidden
Global Const $TTN_LINKCLICK = 0xFFFFFDF5    ; Sent when a text link inside a balloon ToolTip is clicked
Global Const $TTN_GETDISPINFOW = 0xFFFFFDEE    ; [Unicode] Sent to retrieve information needed to display a ToolTip
; ===============================================================================================================================

; #STYLES# ======================================================================================================================
Global Const $TTS_ALWAYSTIP = 0x00000001    ; The control appears when the cursor is on a tool
Global Const $TTS_NOPREFIX = 0x00000002    ; Prevents the stripping of the ampersand character from a string
Global Const $TTS_NOANIMATE = 0x00000010    ; Disables sliding ToolTip animation
Global Const $TTS_NOFADE = 0x00000020    ; Disables fading ToolTip animation
Global Const $TTS_BALLOON = 0x00000040    ; The control has the appearance of a cartoon balloon
Global Const $TTS_CLOSE = 0x00000080    ; Displays a close box in the ToolTip corner
; ===============================================================================================================================