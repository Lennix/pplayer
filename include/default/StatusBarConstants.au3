#include-once
#include "Constants.au3"
; ------------------------------------------------------------------------------
;
; AutoIt Version: 3.2
; Language:       English
; Description:    StatusBar Constants.
;
; ------------------------------------------------------------------------------

Global Const $CCS_TOP = 0x1
Global Const $CCS_NOMOVEY = 0x2
Global Const $CCS_BOTTOM = 0x3
Global Const $CCS_NORESIZE = 0x4
Global Const $CCS_NOPARENTALIGN = 0x8
Global Const $CCS_NOHILITE = 0x10
Global Const $CCS_ADJUSTABLE = 0x20
Global Const $CCS_NODIVIDER = 0x40
;=== Status Bar Styles
Global Const $SBARS_SIZEGRIP = 0x100
Global Const $SBT_TOOLTIPS = 0x800
Global Const $SBARS_TOOLTIPS = 0x800
;=== uFlags
Global Const $SBT_SUNKEN = 0x0          ;Default
Global Const $SBT_NOBORDERS = 0x100     ;The text is drawn without borders.
Global Const $SBT_POPOUT = 0x200        ; The text is drawn with a border to appear higher than the plane of the window.
Global Const $SBT_RTLREADING = 0x400    ;SB_SETTEXT, SB_SETTEXT, SB_GETTEXTLENGTH flags only: Displays text using right-to-left reading order on Hebrew or Arabic systems.
Global Const $SBT_NOTABPARSING = 0x800  ;Tab characters are ignored.
Global Const $SBT_OWNERDRAW = 0x1000    ;The text is drawn by the parent window.
;=== Messages to send to Statusbar
Global Const $SB_GETBORDERS = ($WM_USER + 7)
Global Const $SB_GETICON = ($WM_USER + 20)
Global Const $SB_GETPARTS = ($WM_USER + 6)
Global Const $SB_GETRECT = ($WM_USER + 10)
Global Const $SB_GETTEXTA = ($WM_USER + 2)
Global Const $SB_GETTEXTW = ($WM_USER + 13)
Global Const $SB_GETTEXT = $SB_GETTEXTA
Global Const $SB_GETTEXTLENGTHA = ($WM_USER + 3)
Global Const $SB_GETTEXTLENGTHW = ($WM_USER + 12)
Global Const $SB_GETTEXTLENGTH = $SB_GETTEXTLENGTHA
Global Const $SB_GETTIPTEXTA = ($WM_USER + 18)
Global Const $SB_GETTIPTEXTW = ($WM_USER + 19)
Global Const $SB_GETTIPTEXT = $SB_GETTIPTEXTA
Global Const $SB_GETUNICODEFORMAT = $CCM_GETUNICODEFORMAT

Global Const $SB_ISSIMPLE = ($WM_USER + 14)

Global Const $SB_SETBKCOLOR = $CCM_SETBKCOLOR
Global Const $SB_SETICON = ($WM_USER + 15)
Global Const $SB_SETMINHEIGHT = ($WM_USER + 8)
Global Const $SB_SETPARTS = ($WM_USER + 4)
Global Const $SB_SETTEXTA = ($WM_USER + 1)
Global Const $SB_SETTEXTW = ($WM_USER + 11)
Global Const $SB_SETTEXT = $SB_SETTEXTA
Global Const $SB_SETTIPTEXTA = ($WM_USER + 16)
Global Const $SB_SETTIPTEXTW = ($WM_USER + 17)
Global Const $SB_SETTIPTEXT = $SB_SETTIPTEXTA
Global Const $SB_SETUNICODEFORMAT = $CCM_SETUNICODEFORMAT
Global Const $SB_SIMPLE = ($WM_USER + 9)

Global Const $SB_SIMPLEID = 0xff

; scroll constants
Global Const $SB_LINEDOWN = 1
Global Const $SB_LINEUP = 0
Global Const $SB_PAGEDOWN = 3
Global Const $SB_PAGEUP = 2
Global Const $SB_SCROLLCARET = 4

; #NOTIFICATIONS# ===============================================================================================================
Global Const $SBN_SIMPLEMODECHANGE = 0xFFFFFC90    ; Sent when the simple mode changes due to a $SB_SIMPLE message
; ===============================================================================================================================