#include-once
#include "Constants.au3"
; ------------------------------------------------------------------------------
;
; AutoIt Version: 3.1.1 (beta)
; Language:       English
; Description:    DateTime Control Constants.
;
; ------------------------------------------------------------------------------

; Date
Global Const $DTS_SHORTDATEFORMAT = 0
Global Const $DTS_UPDOWN = 1
Global Const $DTS_SHOWNONE = 2
Global Const $DTS_LONGDATEFORMAT = 4
Global Const $DTS_TIMEFORMAT = 9
Global Const $DTS_RIGHTALIGN = 32
Global Const $DTS_SHORTDATECENTFORMAT = 0x0000000C    ; The year is a four-digit field
Global Const $DTS_APPCANPARSE = 0x00000010    ; Allows the owner to parse user input and take necessary action

; Success/Failure
Global Const $GDT_ERROR = -1
Global Const $GDT_VALID = 0
Global Const $GDT_NONE = 1
Global Const $GDTR_MIN = 0x0001
Global Const $GDTR_MAX = 0x0002

; MonthCal
Global Const $MCHT_NOWHERE = 0x00000000
Global Const $MCHT_TITLE = 0x00010000
Global Const $MCHT_CALENDAR = 0x00020000
Global Const $MCHT_TODAYLINK = 0x00030000
Global Const $MCHT_NEXT = 0x01000000
Global Const $MCHT_PREV = 0x02000000

Global Const $MCHT_TITLEBK = 0x00010000
Global Const $MCHT_TITLEMONTH = 0x00010001
Global Const $MCHT_TITLEYEAR = 0x00010002
Global Const $MCHT_TITLEBTNNEXT = 0x01010003
Global Const $MCHT_TITLEBTNPREV = 0x02010003

Global Const $MCHT_CALENDARBK = 0x00020000
Global Const $MCHT_CALENDARDATE = 0x00020001
Global Const $MCHT_CALENDARDAY = 0x00020002
Global Const $MCHT_CALENDARWEEKNUM = 0x00020003
Global Const $MCHT_CALENDARDATENEXT = 0x01020000
Global Const $MCHT_CALENDARDATEPREV = 0x02020000

; #STYLES# ======================================================================================================================
; Month Calendar
Global Const $MCS_DAYSTATE = 0x00000001    ; The control sends $MCN_GETDAYSTATE notifications to request information
Global Const $MCS_MULTISELECT = 0x2
Global Const $MCS_WEEKNUMBERS = 4
Global Const $MCS_NOTODAYCIRCLE = 8
Global Const $MCS_NOTODAY = 16

; Month Calendar Messages
Global Const $MCM_FIRST = 0x1000
Global Const $MCM_GETCURSEL = $MCM_FIRST + 1
Global Const $MCM_GETCOLOR = ($MCM_FIRST + 11)
Global Const $MCM_GETFIRSTDAYOFWEEK = ($MCM_FIRST + 16)
Global Const $MCM_GETMAXSELCOUNT = ($MCM_FIRST + 3)
Global Const $MCM_GETMAXTODAYWIDTH = ($MCM_FIRST + 21)
Global Const $MCM_GETMINREQRECT = ($MCM_FIRST + 9)
Global Const $MCM_GETMONTHDELTA = ($MCM_FIRST + 19)
Global Const $MCM_GETMONTHRANGE = $MCM_FIRST + 7
Global Const $MCM_GETRANGE = $MCM_FIRST + 17
Global Const $MCM_GETSELRANGE = $MCM_FIRST + 5
Global Const $MCM_GETTODAY = $MCM_FIRST + 13
Global Const $MCM_GETUNICODEFORMAT = $CCM_GETUNICODEFORMAT
Global Const $MCM_HITTEST = $MCM_FIRST + 14
Global Const $MCM_SETCOLOR = ($MCM_FIRST + 10)
Global Const $MCM_SETCURSEL = $MCM_FIRST + 2
Global Const $MCM_SETDAYSTATE = $MCM_FIRST + 8
Global Const $MCM_SETFIRSTDAYOFWEEK = ($MCM_FIRST + 15)
Global Const $MCM_SETSELRANGE = $MCM_FIRST + 6
Global Const $MCM_SETMAXSELCOUNT = ($MCM_FIRST + 4)
Global Const $MCM_SETMONTHDELTA = ($MCM_FIRST + 20)
Global Const $MCM_SETRANGE = $MCM_FIRST + 18
Global Const $MCM_SETTODAY = $MCM_FIRST + 12
Global Const $MCM_SETUNICODEFORMAT = $CCM_SETUNICODEFORMAT

; #NOTIFICATIONS# ===============================================================================================================
Global Const $MCN_SELCHANGE = 0xFFFFFD13    ; The currently selected date or range of dates changed
Global Const $MCN_GETDAYSTATE = 0xFFFFFD15    ; Request information about how individual days should be displayed
Global Const $MCN_SELECT = 0xFFFFFD16    ; The user makes an explicit date selection
; ===============================================================================================================================


Global Const $MCSC_BACKGROUND = 0
Global Const $MCSC_MONTHBK = 4
Global Const $MCSC_TEXT = 1
Global Const $MCSC_TITLEBK = 2
Global Const $MCSC_TITLETEXT = 3
Global Const $MCSC_TRAILINGTEXT = 5

; #MESSAGES# ====================================================================================================================
; Date Time Picker
Global Const $DTM_FIRST = 0x1000
Global Const $DTM_GETSYSTEMTIME = $DTM_FIRST + 1
Global Const $DTM_SETSYSTEMTIME = $DTM_FIRST + 2
Global Const $DTM_GETRANGE = $DTM_FIRST + 3
Global Const $DTM_SETRANGE = $DTM_FIRST + 4
Global Const $DTM_SETFORMAT = $DTM_FIRST + 5
Global Const $DTM_SETMCCOLOR = $DTM_FIRST + 6
Global Const $DTM_GETMCCOLOR = $DTM_FIRST + 7
Global Const $DTM_GETMONTHCAL = $DTM_FIRST + 8
Global Const $DTM_SETMCFONT = $DTM_FIRST + 9
Global Const $DTM_GETMCFONT = $DTM_FIRST + 10
; ===============================================================================================================================

; #NOTIFICATIONS# ===============================================================================================================
; Date Time Picker
Global Const $DTN_DATETIMECHANGE = 0xFFFFFD09    ; Sent whenever a change occurs
Global Const $DTN_USERSTRING = 0xFFFFFD0A    ; Sent when a user finishes editing a string in the control
Global Const $DTN_WMKEYDOWN = 0xFFFFFD0B    ; Sent when the user types in a callback field
Global Const $DTN_FORMAT = 0xFFFFFD0C    ; Sent to request text to be displayed in a callback field
Global Const $DTN_FORMATQUERY = 0xFFFFFD0D    ; Sent to retrieve the size of the callback field string
Global Const $DTN_DROPDOWN = 0xFFFFFD0E    ; Sent when the user activates the drop-down month calendar
Global Const $DTN_CLOSEUP = 0xFFFFFD0F    ; Sent when the user closes the drop-down month calendar
Global Const $DTN_USERSTRINGW = 0xFFFFFD17    ; [Unicode] Sent when a user finishes editing a string in the control
Global Const $DTN_WMKEYDOWNW = 0xFFFFFD18    ; [Unicode] Sent when the user types in a callback field
Global Const $DTN_FORMATW = 0xFFFFFD19    ; [Unicode] Sent to request text to be displayed in a callback field
Global Const $DTN_FORMATQUERYW = 0xFFFFFD1A    ; [Unicode] Sent to retrieve the size of the callback field string
; ===============================================================================================================================