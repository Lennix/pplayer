#include-once

; ------------------------------------------------------------------------------
;
; AutoIt Version: 3.2.3++
; Language:       English
; ------------------------------------------------------------------------------

; #CONSTANTS# ===================================================================================================================
; ===============================================================================================================================
Global Const $IPM_CLEARADDRESS = ($WM_USER + 100)
Global Const $IPM_SETADDRESS = ($WM_USER + 101)
Global Const $IPM_GETADDRESS = ($WM_USER + 102)
Global Const $IPM_SETRANGE = ($WM_USER + 103)
Global Const $IPM_SETFOCUS = ($WM_USER + 104)
Global Const $IPM_ISBLANK = ($WM_USER + 105)

; #NOTIFICATIONS# ===============================================================================================================
Global Const $IPN_FIRST = (-860)
Global Const $IPN_FIELDCHANGED = ($IPN_FIRST - 0) ; Sent when the user changes a field or moves from one field to another