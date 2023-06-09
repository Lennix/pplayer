#include-once
#include "Constants.au3"
; ------------------------------------------------------------------------------
;
; AutoIt Version: 3.2
; Description:    ListView Constants.
;
; ------------------------------------------------------------------------------

; Styles
Global Const $LVS_ALIGNLEFT = 0x00000800    ; Items are left aligned in icon and small icon view
Global Const $LVS_ALIGNMASK = 0x00000C00    ; Determines the control's current alignment
Global Const $LVS_ALIGNTOP = 0x00000000    ; Items are aligned at the top in icon and small icon view
Global Const $LVS_AUTOARRANGE = 0x00000100    ; Icons are automatically kept arranged in icon and small icon view
Global Const $LVS_DEFAULT = 0x0000000D    ; Default control style
Global Const $LVS_EDITLABELS = 0x00000200    ; Item text can be edited in place
Global Const $LVS_ICON = 0x00000000    ; This style specifies icon view
Global Const $LVS_REPORT = 0x00000001    ; This style specifies report view
Global Const $LVS_SMALLICON = 0x00000002    ; This style specifies small icon view
Global Const $LVS_LIST = 0x00000003    ; This style specifies list view
Global Const $LVS_NOCOLUMNHEADER = 0x00004000    ; Column headers are not displayed in report view
Global Const $LVS_NOLABELWRAP = 0x00000080    ; Item text is displayed on a single line in icon view
Global Const $LVS_NOSCROLL = 0x00002000    ; Scrolling is disabled
Global Const $LVS_NOSORTHEADER = 0x00008000    ; Column headers do not work like buttons
Global Const $LVS_OWNERDRAWFIXED = 0x00000400    ; The owner window can paint items in report view
Global Const $LVS_SHAREIMAGELISTS = 0x00000040    ; The image list will not be deleted when the control is destroyed
Global Const $LVS_SHOWSELALWAYS = 0x00000008    ; The selection is always shown
Global Const $LVS_SINGLESEL = 0x00000004    ; Only one item at a time can be selected
Global Const $LVS_SORTASCENDING = 0x00000010    ; Item indexes are sorted based on item text in ascending order
Global Const $LVS_SORTDESCENDING = 0x00000020    ; Item indexes are sorted based on item text in descending order
Global Const $LVS_TYPEMASK = 0x00000003    ; Determines the control's current window style
Global Const $LVS_TYPESTYLEMASK = 0x0000FC00    ; Determines the window styles

; listView Extended Styles
Global Const $LVS_EX_BORDERSELECT = 0x00008000    ; The border color of the item changes when selected
Global Const $LVS_EX_CHECKBOXES = 0x00000004    ; Enables check boxes for items
Global Const $LVS_EX_DOUBLEBUFFER = 0x00010000    ; Paints via double-buffering, which reduces flicker
Global Const $LVS_EX_FULLROWSELECT = 0x00000020    ; When an item is selected, the item and all its subitems are highlighted
Global Const $LVS_EX_FLATSB = 0x00000100    ; Enables flat scroll bars
Global Const $LVS_EX_GRIDLINES = 0x00000001    ; Displays gridlines around items and subitems
Global Const $LVS_EX_HEADERDRAGDROP = 0x00000010    ; Enables drag-and-drop reordering of columns
Global Const $LVS_EX_INFOTIP = 0x00000400    ; A message is sent to the parent before displaying an item's ToolTip
Global Const $LVS_EX_LABELTIP = 0x00004000    ; If a partially hidden label lacks ToolTip text, the label will unfold
Global Const $LVS_EX_MULTIWORKAREAS = 0x00002000    ; The control will not autoarrange its icons until a work area is defined
Global Const $LVS_EX_ONECLICKACTIVATE = 0x00000040    ; Sends an $LVN_ITEMACTIVATE message when the user clicks an item
Global Const $LVS_EX_REGIONAL = 0x00000200    ; Sets the region to include only the icons and text using SetWindowRgn
Global Const $LVS_EX_SNAPTOGRID = 0x00080000    ; Icons automatically snap to grid
Global Const $LVS_EX_SIMPLESELECT = 0x00100000    ; Moves the state image to the top right of the large icon rendering#cs
Global Const $LVS_EX_SUBITEMIMAGES = 0x00000002    ; Allows images to be displayed for subitems
Global Const $LVS_EX_TRACKSELECT = 0x00000008    ; Enables hot-track selection
Global Const $LVS_EX_TWOCLICKACTIVATE = 0x00000080    ; Sends an $LVN_ITEMACTIVATE message when the user double clicks an item
Global Const $LVS_EX_UNDERLINECOLD = 0x00001000    ; Causes non-hot items to be displayed with underlined text
Global Const $LVS_EX_UNDERLINEHOT = 0x00000800    ; Causes hot items to be displayed with underlined text

; error
Global Const $LV_ERR = -1

Global Const $LVM_FIRST = 0x1000

Global Const $LVBKIF_SOURCE_NONE = 0x00000000
Global Const $LVBKIF_SOURCE_HBITMAP = 0x00000001
Global Const $LVBKIF_SOURCE_URL = 0x00000002
Global Const $LVBKIF_SOURCE_MASK = 0x00000003
Global Const $LVBKIF_STYLE_NORMAL = 0x00000000
Global Const $LVBKIF_STYLE_TILE = 0x00000010
Global Const $LVBKIF_STYLE_MASK = 0x00000010
Global Const $LVBKIF_FLAG_TILEOFFSET = 0x00000100
Global Const $LVBKIF_TYPE_WATERMARK = 0x10000000

Global Const $LV_VIEW_DETAILS = $LVS_REPORT
Global Const $LV_VIEW_ICON = $LVS_ICON
Global Const $LV_VIEW_LIST = $LVS_LIST
Global Const $LV_VIEW_SMALLICON = $LVS_SMALLICON
Global Const $LV_VIEW_TILE = 0x4

Global Const $LVA_ALIGNLEFT = 0x1
Global Const $LVA_ALIGNTOP = 0x2
Global Const $LVA_DEFAULT = 0x0
Global Const $LVA_SNAPTOGRID = 0x5

Global Const $LVCF_ALLDATA = 0X0000003F
Global Const $LVCF_FMT = 0x1
Global Const $LVCF_IMAGE = 0x00000010
Global Const $LVCFMT_JUSTIFYMASK = 0x00000003
Global Const $LVCF_TEXT = 0x4
Global Const $LVCF_WIDTH = 0x2

Global Const $LVCFMT_BITMAP_ON_RIGHT = 0x00001000
Global Const $LVCFMT_CENTER = 0x2
Global Const $LVCFMT_COL_HAS_IMAGES = 0x00008000
Global Const $LVCFMT_IMAGE = 0x00000800
Global Const $LVCFMT_LEFT = 0x0
Global Const $LVCFMT_RIGHT = 0x1

Global Const $LVFI_NEARESTXY = 0x00000040
Global Const $LVFI_PARAM = 0x1
Global Const $LVFI_PARTIAL = 0x8
Global Const $LVFI_STRING = 0x2
Global Const $LVFI_WRAP = 0x20

Global Const $LVGA_HEADER_LEFT = 0x00000001
Global Const $LVGA_HEADER_CENTER = 0x00000002
Global Const $LVGA_HEADER_RIGHT = 0x00000004

Global Const $LVGF_ALIGN = 0x00000008
Global Const $LVGF_GROUPID = 0x00000010
Global Const $LVGF_HEADER = 0x00000001

Global Const $LVHT_ABOVE = 0x00000008
Global Const $LVHT_BELOW = 0x00000010
Global Const $LVHT_NOWHERE = 0x00000001
Global Const $LVHT_ONITEMICON = 0x00000002
Global Const $LVHT_ONITEMLABEL = 0x00000004
Global Const $LVHT_ONITEMSTATEICON = 0x00000008
Global Const $LVHT_ONITEM = 0x0000000E
Global Const $LVHT_TOLEFT = 0x00000040
Global Const $LVHT_TORIGHT = 0x00000020

Global Const $LVIF_GROUPID = 0x00000100
Global Const $LVIF_IMAGE = 0x2
Global Const $LVIF_INDENT = 0x00000010
Global Const $LVIF_PARAM = 0x00000004
Global Const $LVIF_STATE = 0x8
Global Const $LVIF_TEXT = 0x1

Global Const $LVIM_AFTER = 0x00000001

Global Const $LVIR_BOUNDS = 0
Global Const $LVIR_ICON = 0x00000001

Global Const $LVIS_CUT = 0x4
Global Const $LVIS_DROPHILITED = 0x8
Global Const $LVIS_FOCUSED = 0x1
Global Const $LVIS_OVERLAYMASK = 0xF00
Global Const $LVIS_SELECTED = 0x2
Global Const $LVIS_STATEIMAGEMASK = 0xF000

Global Const $LVM_APPROXIMATEVIEWRECT = ($LVM_FIRST + 64)
Global Const $LVM_ARRANGE = ($LVM_FIRST + 22)

Global Const $LVM_CANCELEDITLABEL = ($LVM_FIRST + 179)
Global Const $LVM_CREATEDRAGIMAGE = ($LVM_FIRST + 33)

Global Const $LVM_DELETECOLUMN = ($LVM_FIRST + 28)
Global Const $LVM_DELETEALLITEMS = ($LVM_FIRST + 9)
Global Const $LVM_DELETEITEM = ($LVM_FIRST + 8)

Global Const $LVM_EDITLABELA = ($LVM_FIRST + 23)
Global Const $LVM_EDITLABELW = ($LVM_FIRST + 118)
Global Const $LVM_EDITLABEL = $LVM_EDITLABELA
Global Const $LVM_ENABLEGROUPVIEW = ($LVM_FIRST + 157)
Global Const $LVM_ENSUREVISIBLE = ($LVM_FIRST + 19)

Global Const $LVM_FINDITEM = ($LVM_FIRST + 13)

Global Const $LVM_GETBKCOLOR = ($LVM_FIRST + 0)
Global Const $LVM_GETBKIMAGEA = ($LVM_FIRST + 69)
Global Const $LVM_GETBKIMAGEW = ($LVM_FIRST + 139)
Global Const $LVM_GETCALLBACKMASK = ($LVM_FIRST + 10)
Global Const $LVM_GETCOLUMNA = ($LVM_FIRST + 25)
Global Const $LVM_GETCOLUMNW = ($LVM_FIRST + 95)
Global Const $LVM_GETCOLUMNORDERARRAY = ($LVM_FIRST + 59)
Global Const $LVM_GETCOLUMNWIDTH = ($LVM_FIRST + 29)
Global Const $LVM_GETCOUNTPERPAGE = ($LVM_FIRST + 40)
Global Const $LVM_GETEDITCONTROL = ($LVM_FIRST + 24)
Global Const $LVM_GETEXTENDEDLISTVIEWSTYLE = ($LVM_FIRST + 55)
Global Const $LVM_GETGROUPINFO = ($LVM_FIRST + 149)
Global Const $LVM_GETHEADER = ($LVM_FIRST + 31)
Global Const $LVM_GETHOTCURSOR = ($LVM_FIRST + 63)
Global Const $LVM_GETHOTITEM = ($LVM_FIRST + 61)
Global Const $LVM_GETHOVERTIME = ($LVM_FIRST + 72)
Global Const $LVM_GETIMAGELIST = ($LVM_FIRST + 2)
Global Const $LVM_GETINSERTMARK = ($LVM_FIRST + 167)
Global Const $LVM_GETINSERTMARKCOLOR = ($LVM_FIRST + 171)
Global Const $LVM_GETINSERTMARKRECT = ($LVM_FIRST + 169)
Global Const $LVM_GETISEARCHSTRINGA = ($LVM_FIRST + 52)
Global Const $LVM_GETISEARCHSTRINGW = ($LVM_FIRST + 117)
Global Const $LVM_GETITEMA = ($LVM_FIRST + 5)
Global Const $LVM_GETITEMW = ($LVM_FIRST + 75)
Global Const $LVM_GETITEMCOUNT = ($LVM_FIRST + 4)
Global Const $LVM_GETITEMPOSITION = ($LVM_FIRST + 16)
Global Const $LVM_GETITEMRECT = ($LVM_FIRST + 14)
Global Const $LVM_GETITEMSPACING = ($LVM_FIRST + 51)
Global Const $LVM_GETITEMSTATE = ($LVM_FIRST + 44)
Global Const $LVM_GETITEMTEXTA = ($LVM_FIRST + 45)
Global Const $LVM_GETITEMTEXTW = ($LVM_FIRST + 115)
Global Const $LVM_GETNEXTITEM = ($LVM_FIRST + 12)
Global Const $LVM_GETNUMBEROFWORKAREAS = ($LVM_FIRST + 73)
Global Const $LVM_GETORIGIN = ($LVM_FIRST + 41)
Global Const $LVM_GETOUTLINECOLOR = ($LVM_FIRST + 176)
Global Const $LVM_GETSELECTEDCOLUMN = ($LVM_FIRST + 174)
Global Const $LVM_GETSELECTEDCOUNT = ($LVM_FIRST + 50)
Global Const $LVM_GETSELECTIONMARK = ($LVM_FIRST + 66)
Global Const $LVM_GETSTRINGWIDTHA = ($LVM_FIRST + 17)
Global Const $LVM_GETSTRINGWIDTHW = ($LVM_FIRST + 87)
Global Const $LVM_GETSUBITEMRECT = ($LVM_FIRST + 56)
Global Const $LVM_GETTEXTBKCOLOR = ($LVM_FIRST + 37)
Global Const $LVM_GETTEXTCOLOR = ($LVM_FIRST + 35)
Global Const $LVM_GETTOOLTIPS = ($LVM_FIRST + 78)
Global Const $LVM_GETTOPINDEX = ($LVM_FIRST + 39)
Global Const $LVM_GETUNICODEFORMAT = $CCM_GETUNICODEFORMAT
Global Const $LVM_GETVIEW = ($LVM_FIRST + 143)
Global Const $LVM_GETVIEWRECT = ($LVM_FIRST + 34)

Global Const $LVM_HITTEST = ($LVM_FIRST + 18)

Global Const $LVM_INSERTCOLUMNA = ($LVM_FIRST + 27)
Global Const $LVM_INSERTCOLUMNW = ($LVM_FIRST + 97)
Global Const $LVM_INSERTGROUP = ($LVM_FIRST + 145)
Global Const $LVM_INSERTITEMA = ($LVM_FIRST + 7)
Global Const $LVM_INSERTITEMW = ($LVM_FIRST + 77)
Global Const $LVM_INSERTMARKHITTEST = ($LVM_FIRST + 168)
Global Const $LVM_ISGROUPVIEWENABLED = ($LVM_FIRST + 175)

Global Const $LVM_MAPIDTOINDEX = 0x10B5
Global Const $LVM_MAPINDEXTOID = 0x10B4
Global Const $LVM_MOVEGROUP = ($LVM_FIRST + 151)

Global Const $LVM_REDRAWITEMS = ($LVM_FIRST + 21)
Global Const $LVM_REMOVEALLGROUPS = ($LVM_FIRST + 160)
Global Const $LVM_REMOVEGROUP = ($LVM_FIRST + 150)

Global Const $LVM_SCROLL = ($LVM_FIRST + 20)

Global Const $LVM_SETBKCOLOR = ($LVM_FIRST + 1)
Global Const $LVM_SETBKIMAGEA = ($LVM_FIRST + 68)
Global Const $LVM_SETBKIMAGEW = ($LVM_FIRST + 138)
Global Const $LVM_SETCALLBACKMASK = ($LVM_FIRST + 11)
Global Const $LVM_SETCOLUMNA = ($LVM_FIRST + 26)
Global Const $LVM_SETCOLUMNW = ($LVM_FIRST + 96)
Global Const $LVM_SETCOLUMNORDERARRAY = ($LVM_FIRST + 58)
Global Const $LVM_SETCOLUMNWIDTH = ($LVM_FIRST + 30)
Global Const $LVM_SETEXTENDEDLISTVIEWSTYLE = ($LVM_FIRST + 54)
Global Const $LVM_SETGROUPINFO = ($LVM_FIRST + 147)
Global Const $LVM_SETHOTCURSOR = ($LVM_FIRST + 62)
Global Const $LVM_SETHOTITEM = ($LVM_FIRST + 60)
Global Const $LVM_SETHOVERTIME = ($LVM_FIRST + 71)
Global Const $LVM_SETICONSPACING = ($LVM_FIRST + 53)
Global Const $LVM_SETIMAGELIST = ($LVM_FIRST + 3)
Global Const $LVM_SETINFOTIP = ($LVM_FIRST + 173)
Global Const $LVM_SETINSERTMARK = ($LVM_FIRST + 166)
Global Const $LVM_SETINSERTMARKCOLOR = ($LVM_FIRST + 170)
Global Const $LVM_SETITEMA = ($LVM_FIRST + 6)
Global Const $LVM_SETITEMW = ($LVM_FIRST + 76)
Global Const $LVM_SETITEMCOUNT = ($LVM_FIRST + 47)
Global Const $LVM_SETITEMPOSITION = ($LVM_FIRST + 15)
Global Const $LVM_SETITEMPOSITION32 = ($LVM_FIRST + 49)
Global Const $LVM_SETITEMSTATE = ($LVM_FIRST + 43)
Global Const $LVM_SETITEMTEXTA = ($LVM_FIRST + 46)
Global Const $LVM_SETITEMTEXTW = ($LVM_FIRST + 116)
Global Const $LVM_SETOUTLINECOLOR = ($LVM_FIRST + 177)
Global Const $LVM_SETSELECTEDCOLUMN = ($LVM_FIRST + 140)
Global Const $LVM_SETSELECTIONMARK = ($LVM_FIRST + 67)
Global Const $LVM_SETTEXTCOLOR = ($LVM_FIRST + 36)
Global Const $LVM_SETTEXTBKCOLOR = ($LVM_FIRST + 38)
Global Const $LVM_SETTOOLTIPS = ($LVM_FIRST + 74)
Global Const $LVM_SETUNICODEFORMAT = $CCM_SETUNICODEFORMAT
Global Const $LVM_SETVIEW = ($LVM_FIRST + 142)
Global Const $LVM_SETWORKAREAS = ($LVM_FIRST + 65)

Global Const $LVM_SUBITEMHITTEST = ($LVM_FIRST + 57)

Global Const $LVM_UPDATE = ($LVM_FIRST + 42)

; #NOTIFICATIONS# ===============================================================================================================
Global Const $LVN_FIRST = -100
Global Const $LVN_LAST = -199
Global Const $LVN_ITEMCHANGING = 0xFFFFFF9C    ; An item is changing
Global Const $LVN_ITEMCHANGED = 0xFFFFFF9B    ; An item has changed
Global Const $LVN_INSERTITEM = 0xFFFFFF9A    ; A new item was inserted
Global Const $LVN_DELETEITEM = 0xFFFFFF99    ; An item is about to be deleted
Global Const $LVN_DELETEALLITEMS = 0xFFFFFF98    ; All items are about to be deleted
Global Const $LVN_BEGINLABELEDIT = 0xFFFFFF97    ; The label editting is starting
Global Const $LVN_ENDLABELEDIT = 0xFFFFFF96    ; The label editting is ending
Global Const $LVN_COLUMNCLICK = 0xFFFFFF94    ; A column was clicked
Global Const $LVN_BEGINDRAG = 0xFFFFFF93    ; A drag and drop involving the left mouse button is being initiated
Global Const $LVN_BEGINRDRAG = 0xFFFFFF91    ; A drag and drop involving the right mouse button is being initiated
Global Const $LVN_ODCACHEHINT = 0xFFFFFF8F    ; The contents of its display area for a virtual control have changed
Global Const $LVN_ITEMACTIVATE = 0xFFFFFF8E    ; The user activated an item
Global Const $LVN_ODSTATECHANGED = 0xFFFFFF8D    ; The state of an item or range of items in a virtual control has changed
Global Const $LVN_HOTTRACK = 0xFFFFFF87    ; The user moved the mouse over an item
Global Const $LVN_GETDISPINFO = 0xFFFFFF6A    ; Request for the parent to provide information
Global Const $LVN_SETDISPINFO = 0xFFFFFF69    ; Sent to the parent when it needs to update item information
Global Const $LVN_ODFINDITEM = 0xFFFFFF68    ; Sent to the parent when it needs to find a callback item
Global Const $LVN_BEGINLABELEDITW = 0xFFFFFF51    ; [Unicode] The label editting is starting
Global Const $LVN_ENDLABELEDITW = 0xFFFFFF50    ; [Unicode] The label editting is ending
Global Const $LVN_GETDISPINFOW = 0xFFFFFF4F    ; [Unicode] Request for the parent to provide information
Global Const $LVN_SETDISPINFOW = 0xFFFFFF4E    ; [Unicode] Sent to the parent when it needs to update item information
Global Const $LVN_ODFINDITEMW = 0xFFFFFF4D    ; [Unicode] Sent to the parent when it needs to find a callback item
Global Const $LVN_BEGINSCROLL = ($LVN_FIRST - 80)
Global Const $LVN_ENDSCROLL = ($LVN_FIRST - 81)
Global Const $LVN_GETINFOTIPA = ($LVN_FIRST - 57)
Global Const $LVN_GETINFOTIP = $LVN_GETINFOTIPA
Global Const $LVN_GETINFOTIPW = ($LVN_FIRST - 58)
Global Const $LVN_KEYDOWN = ($LVN_FIRST - 55)
Global Const $LVN_MARQUEEBEGIN = ($LVN_FIRST - 56)
; ===============================================================================================================================


Global Const $LVNI_ABOVE = 0x100
Global Const $LVNI_BELOW = 0x200
Global Const $LVNI_TOLEFT = 0x400
Global Const $LVNI_TORIGHT = 0x800
Global Const $LVNI_ALL = 0x0
Global Const $LVNI_CUT = 0x4
Global Const $LVNI_DROPHILITED = 0x8
Global Const $LVNI_FOCUSED = 0x1
Global Const $LVNI_SELECTED = 0x2

Global Const $LVSCW_AUTOSIZE = -1
Global Const $LVSCW_AUTOSIZE_USEHEADER = -2

Global Const $LVSICF_NOINVALIDATEALL = 0x1
Global Const $LVSICF_NOSCROLL = 0x2

Global Const $LVSIL_NORMAL = 0
Global Const $LVSIL_SMALL = 1
Global Const $LVSIL_STATE = 2