#include-once

; ------------------------------------------------------------------------------
;
; AutoIt Version: 3.2
; Description:    Progress Constants.
;
; ------------------------------------------------------------------------------

; Styles
Global Const $PBS_SMOOTH = 1
Global Const $PBS_VERTICAL = 4
Global Const $PBS_MARQUEE = 0x00000008    ; The progress bar moves like a marquee

; #MESSAGES# ====================================================================================================================
Global Const $PBM_SETRANGE = $WM_USER + 1
Global Const $PBM_SETPOS = $WM_USER + 2
Global Const $PBM_DELTAPOS = $WM_USER + 3
Global Const $PBM_SETSTEP = $WM_USER + 4
Global Const $PBM_STEPIT = $WM_USER + 5
Global Const $PBM_SETRANGE32 = $WM_USER + 6
Global Const $PBM_GETRANGE = $WM_USER + 7
Global Const $PBM_GETPOS = $WM_USER + 8
Global Const $PBM_SETBARCOLOR = $WM_USER + 9
Global Const $PBM_SETMARQUEE = $WM_USER + 10
Global Const $PBM_SETBKCOLOR = $CCM_SETBKCOLOR
; ===============================================================================================================================