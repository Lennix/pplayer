#include-once

; ------------------------------------------------------------------------------
;
; AutoIt Version: 3.2
; Description:    Header Constants.
;
; ------------------------------------------------------------------------------

; #CONSTANTS# ===================================================================================================================
Global Const $HDF_LEFT = 0x00000000
Global Const $HDF_RIGHT = 0x00000001
Global Const $HDF_CENTER = 0x00000002
Global Const $HDF_JUSTIFYMASK = 0x00000003

Global Const $HDF_BITMAP_ON_RIGHT = 0x00001000
Global Const $HDF_BITMAP = 0x00002000
Global Const $HDF_STRING = 0x00004000
Global Const $HDF_OWNERDRAW = 0x00008000
Global Const $HDF_DISPLAYMASK = 0x0000F000

Global Const $HDF_RTLREADING = 0x00000004
Global Const $HDF_SORTDOWN = 0x00000200
Global Const $HDF_IMAGE = 0x00000800
Global Const $HDF_SORTUP = 0x00000400
Global Const $HDF_FLAGMASK = 0x00000E04

Global Const $HDI_WIDTH = 0x00000001
Global Const $HDI_TEXT = 0x00000002
Global Const $HDI_FORMAT = 0x00000004
Global Const $HDI_PARAM = 0x00000008
Global Const $HDI_BITMAP = 0x00000010
Global Const $HDI_IMAGE = 0x00000020
Global Const $HDI_DI_SETITEM = 0x00000040
Global Const $HDI_ORDER = 0x00000080
Global Const $HDI_FILTER = 0x00000100

Global Const $HHT_NOWHERE = 0x00000001
Global Const $HHT_ONHEADER = 0x00000002
Global Const $HHT_ONDIVIDER = 0x00000004
Global Const $HHT_ONDIVOPEN = 0x00000008
Global Const $HHT_ONFILTER = 0x00000010
Global Const $HHT_ONFILTERBUTTON = 0x00000020
Global Const $HHT_ABOVE = 0x00000100
Global Const $HHT_BELOW = 0x00000200
Global Const $HHT_TORIGHT = 0x00000400
Global Const $HHT_TOLEFT = 0x00000800
; ===============================================================================================================================

; #MESSAGES# ====================================================================================================================
Global Const $HDM_FIRST = 0x1200
Global Const $HDM_GETITEMCOUNT = $HDM_FIRST + 0
Global Const $HDM_INSERTITEM = $HDM_FIRST + 1
Global Const $HDM_DELETEITEM = $HDM_FIRST + 2
Global Const $HDM_GETITEM = $HDM_FIRST + 3
Global Const $HDM_SETITEM = $HDM_FIRST + 4
Global Const $HDM_LAYOUT = $HDM_FIRST + 5
Global Const $HDM_HITTEST = $HDM_FIRST + 6
Global Const $HDM_GETITEMRECT = $HDM_FIRST + 7
Global Const $HDM_SETIMAGELIST = $HDM_FIRST + 8
Global Const $HDM_GETIMAGELIST = $HDM_FIRST + 9
Global Const $HDM_INSERTITEMW = $HDM_FIRST + 10
Global Const $HDM_GETITEMW = $HDM_FIRST + 11
Global Const $HDM_SETITEMW = $HDM_FIRST + 12
Global Const $HDM_ORDERTOINDEX = $HDM_FIRST + 15
Global Const $HDM_CREATEDRAGIMAGE = $HDM_FIRST + 16
Global Const $HDM_GETORDERARRAY = $HDM_FIRST + 17
Global Const $HDM_SETORDERARRAY = $HDM_FIRST + 18
Global Const $HDM_SETHOTDIVIDER = $HDM_FIRST + 19
Global Const $HDM_SETBITMAPMARGIN = $HDM_FIRST + 20
Global Const $HDM_GETBITMAPMARGIN = $HDM_FIRST + 21
Global Const $HDM_SETFILTERCHANGETIMEOUT = $HDM_FIRST + 22
Global Const $HDM_EDITFILTER = $HDM_FIRST + 23
Global Const $HDM_CLEARFILTER = $HDM_FIRST + 24
Global Const $HDM_GETUNICODEFORMAT = $CCM_GETUNICODEFORMAT
Global Const $HDM_SETUNICODEFORMAT = $CCM_SETUNICODEFORMAT
; ===============================================================================================================================

; #NOTIFICATIONS# ===============================================================================================================
Global Const $HDN_BEGINDRAG = 0xFFFFFECA    ; Sent when a drag operation has begun
Global Const $HDN_BEGINTRACK = 0xFFFFFECE    ; Sent when the user has begun dragging a divider
Global Const $HDN_DIVIDERDBLCLICK = 0xFFFFFECF    ; Sent when the user double clicks the divider
Global Const $HDN_ENDDRAG = 0xFFFFFEC9    ; Sent when a drag operation has ended
Global Const $HDN_ENDTRACK = 0xFFFFFECD    ; Sent when the user has finished dragging a divider
Global Const $HDN_FILTERBTNCLICK = 0xFFFFFEC7    ; Sent when filter button is clicked
Global Const $HDN_FILTERCHANGE = 0xFFFFFEC8    ; Sent when the attributes of a header control filter are being changed
Global Const $HDN_GETDISPINFO = 0xFFFFFECB    ; Sent when the control needs information about a callback
Global Const $HDN_ITEMCHANGED = 0xFFFFFED3    ; Sent when a header item has changed
Global Const $HDN_ITEMCHANGING = 0xFFFFFED4    ; Sent when a header item is about to change
Global Const $HDN_ITEMCLICK = 0xFFFFFED2    ; Sent when the user clicks the control
Global Const $HDN_ITEMDBLCLICK = 0xFFFFFED1    ; Sent when the user double clicks the control
Global Const $HDN_TRACK = 0xFFFFFECC    ; Sent when the user is dragging a divider
Global Const $HDN_BEGINTRACKW = 0xFFFFFEBA    ; [Unicode] Sent when the user has begun dragging a divider
Global Const $HDN_DIVIDERDBLCLICKW = 0xFFFFFEBB    ; [Unicode] Sent when the user double clicks the divider
Global Const $HDN_ENDTRACKW = 0xFFFFFEB9    ; [Unicode] Sent when the user has finished dragging a divider
Global Const $HDN_GETDISPINFOW = 0xFFFFFEB7    ; [Unicode] Sent when the control needs information about a callback
Global Const $HDN_ITEMCHANGEDW = 0xFFFFFEBF    ; [Unicode] Sent when a header item has changed
Global Const $HDN_ITEMCHANGINGW = 0xFFFFFEC0    ; [Unicode] Sent when a header item is about to change
Global Const $HDN_ITEMCLICKW = 0xFFFFFEBE    ; [Unicode] Sent when the user clicks the control
Global Const $HDN_ITEMDBLCLICKW = 0xFFFFFEBD    ; [Unicode] Sent when the user double clicks the control
Global Const $HDN_TRACKW = 0xFFFFFEB8    ; [Unicode] Sent when the user is dragging a divider
; ===============================================================================================================================

; #STYLES# ======================================================================================================================
Global Const $HDS_HORZ = 0x00000000    ; Creates a header control with a horizontal orientation
Global Const $HDS_BUTTONS = 0x00000002    ; Each item in the control looks and behaves like a push button
Global Const $HDS_HOTTRACK = 0x00000004    ; Enables hot tracking
Global Const $HDS_HIDDEN = 0x00000008    ; Indicates a header control that is intended to be hidden
Global Const $HDS_DRAGDROP = 0x00000040    ; Allows drag-and-drop reordering of header items
Global Const $HDS_FULLDRAG = 0x00000080    ; Column contents are displayed while the user resizes a column
Global Const $HDS_FILTERBAR = 0x00000100    ; Include a filter bar as part of the standard header control
Global Const $HDS_FLAT = 0x00000200    ; Control is drawn flat when XP is running in classic mode
Global Const $HDS_DEFAULT = 0x00000046    ; Default header style
; ===============================================================================================================================