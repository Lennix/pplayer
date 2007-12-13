#include-once
#include "Constants.au3"
#include "GUIConstants.au3"
#include "StatusBarConstants.au3"

; ===============================================================================================================================
; Description ...: Auto3Lib constants
; Author ........: Paul Campbell
; Notes .........:
; ===============================================================================================================================

; #VARIABLES# ===================================================================================================================
Global $gsConsoleFunc      = ""
Global $gaInProcess[64][2] = [[0,0]]
Global $gaPopups[1][3]     = [[0,0]]
Global $gaWinList[64][2]   = [[0,0]]
; ===============================================================================================================================

; ===============================================================================================================================
; Please do not remove these constants from this file. If you need to use these constants, please copy them to your own  UDF  and
; RENAME THEM so that they do not collide with the Auto3Lib names.
; ===============================================================================================================================

; ===============================================================================================================================
; Common Control Messages
; ===============================================================================================================================

Global Const $CCM_SETBKCOLOR                    = $CCM_FIRST + 1
Global Const $CCM_SETCOLORSCHEME                = $CCM_FIRST + 2
Global Const $CCM_GETCOLORSCHEME                = $CCM_FIRST + 3
Global Const $CCM_GETDROPTARGET                 = $CCM_FIRST + 4
Global Const $CCM_SETWINDOWTHEME                = $CCM_FIRST + 11

; ===============================================================================================================================
; Common Control Styles
; ===============================================================================================================================

; Global Const $CCS_TOP                         = 0x00000001
; Global Const $CCS_NOMOVEY                     = 0x00000002
; Global Const $CCS_BOTTOM                      = 0x00000003
; Global Const $CCS_NORESIZE                    = 0x00000004
; Global Const $CCS_NOPARENTALIGN               = 0x00000008
; Global Const $CCS_ADJUSTABLE                  = 0x00000020
; Global Const $CCS_NODIVIDER                   = 0x00000040
  Global Const $CCS_VERT                        = 0x00000080
  Global Const $CCS_LEFT                        = 0x00000081
  Global Const $CCS_NOMOVEX                     = 0x00000082
  Global Const $CCS_RIGHT                       = 0x00000083

; ===============================================================================================================================
; Drawstate Constants
; ===============================================================================================================================

Global Const $CDDS_PREPAINT                     = 0x00000001
Global Const $CDDS_POSTPAINT                    = 0x00000002
Global Const $CDDS_PREERASE                     = 0x00000003
Global Const $CDDS_POSTERASE                    = 0x00000004
Global Const $CDDS_ITEM                         = 0x00010000
Global Const $CDDS_ITEMPREPAINT                 = 0x00010001
Global Const $CDDS_ITEMPOSTPAINT                = 0x00010002
Global Const $CDDS_ITEMPREERASE                 = 0x00010003
Global Const $CDDS_ITEMPOSTERASE                = 0x00010004
Global Const $CDDS_SUBITEM                      = 0x00020000

; ===============================================================================================================================
; Itemstate Constants
; ===============================================================================================================================

Global Const $CDIS_SELECTED                     = 0x00000001
Global Const $CDIS_GRAYED                       = 0x00000002
Global Const $CDIS_DISABLED                     = 0x00000004
Global Const $CDIS_CHECKED                      = 0x00000008
Global Const $CDIS_FOCUS                        = 0x00000010
Global Const $CDIS_DEFAULT                      = 0x00000020
Global Const $CDIS_HOT                          = 0x00000040
Global Const $CDIS_MARKED                       = 0x00000080
Global Const $CDIS_INDETERMINATE                = 0x00000100
Global Const $CDIS_SHOWKEYBOARDCUES             = 0x00000200

; ===============================================================================================================================
; Custom Draw Return Constants
; ===============================================================================================================================

Global Const $CDRF_DODEFAULT                    = 0x00000000
Global Const $CDRF_NEWFONT                      = 0x00000002
Global Const $CDRF_SKIPDEFAULT                  = 0x00000004
Global Const $CDRF_NOTIFYPOSTPAINT              = 0x00000010
Global Const $CDRF_NOTIFYITEMDRAW               = 0x00000020
Global Const $CDRF_NOTIFYSUBITEMDRAW            = 0x00000020
Global Const $CDRF_NOTIFYPOSTERASE              = 0x00000040

; ===============================================================================================================================
; Color Constants
; ===============================================================================================================================

Global Const $CLR_AQUA                          = 0xFFFF00
Global Const $CLR_BLACK                         = 0x000000
Global Const $CLR_BLUE                          = 0xFF0000
Global Const $CLR_CREAM                         = 0xF0FBFF
Global Const $CLR_DKGRAY                        = 0x808080
Global Const $CLR_FUCHSIA                       = 0xFF00FF
Global Const $CLR_GRAY                          = 0x808080
Global Const $CLR_GREEN                         = 0x008000
Global Const $CLR_LIME                          = 0x00FF00
Global Const $CLR_LTGRAY                        = 0xC0C0C0
Global Const $CLR_MAROON                        = 0x000080
Global Const $CLR_MEDGRAY                       = 0xA4A0A0
Global Const $CLR_MONEYGREEN                    = 0xC0DCC0
Global Const $CLR_NAVY                          = 0x800000
Global Const $CLR_OLIVE                         = 0x008080
Global Const $CLR_PURPLE                        = 0x800080
Global Const $CLR_RED                           = 0x0000FF
Global Const $CLR_SILVER                        = 0xC0C0C0
Global Const $CLR_SKYBLUE                       = 0xF0CAA6
Global Const $CLR_TEAL                          = 0x808000
Global Const $CLR_WHITE                         = 0xFFFFFF
Global Const $CLR_YELLOW                        = 0x00FFFF

; ===============================================================================================================================
; Windows Color Constants
; ===============================================================================================================================

Global Const $COLOR_SCROLLBAR                   = 0
Global Const $COLOR_BACKGROUND                  = 1
Global Const $COLOR_ACTIVECAPTION               = 2
Global Const $COLOR_INACTIVECAPTION             = 3
Global Const $COLOR_MENU                        = 4
Global Const $COLOR_WINDOW                      = 5
Global Const $COLOR_WINDOWFRAME                 = 6
Global Const $COLOR_MENUTEXT                    = 7
Global Const $COLOR_WINDOWTEXT                  = 8
Global Const $COLOR_CAPTIONTEXT                 = 9
Global Const $COLOR_ACTIVEBORDER                = 10
Global Const $COLOR_INACTIVEBORDER              = 11
Global Const $COLOR_APPWORKSPACE                = 12
Global Const $COLOR_HIGHLIGHT                   = 13
Global Const $COLOR_HIGHLIGHTTEXT               = 14
Global Const $COLOR_BTNFACE                     = 15
Global Const $COLOR_BTNSHADOW                   = 16
Global Const $COLOR_GRAYTEXT                    = 17
Global Const $COLOR_BTNTEXT                     = 18
Global Const $COLOR_INACTIVECAPTIONTEXT         = 19
Global Const $COLOR_BTNHIGHLIGHT                = 20
Global Const $COLOR_3DDKSHADOW                  = 21
Global Const $COLOR_3DLIGHT                     = 22
Global Const $COLOR_INFOTEXT                    = 23
Global Const $COLOR_INFOBK                      = 24
Global Const $COLOR_HOTLIGHT                    = 26
Global Const $COLOR_GRADIENTACTIVECAPTION       = 27
Global Const $COLOR_GRADIENTINACTIVECAPTION     = 28
Global Const $COLOR_MENUHILIGHT                 = 29
Global Const $COLOR_MENUBAR                     = 30

Global Const $COLOR_DESKTOP                     = 1
Global Const $COLOR_3DFACE                      = 15
Global Const $COLOR_3DSHADOW                    = 16
Global Const $COLOR_3DHIGHLIGHT                 = 20
Global Const $COLOR_3DHILIGHT                   = 20
Global Const $COLOR_BTNHILIGHT                  = 20

; ===============================================================================================================================
; Control Color Constants
; ===============================================================================================================================

Global Const $CTLCOLOR_MSGBOX                   = 0
Global Const $CTLCOLOR_EDIT                     = 1
Global Const $CTLCOLOR_LISTBOX                  = 2
Global Const $CTLCOLOR_BTN                      = 3
Global Const $CTLCOLOR_DLG                      = 4
Global Const $CTLCOLOR_SCROLLBAR                = 5
Global Const $CTLCOLOR_STATIC                   = 6
Global Const $CTLCOLOR_MAX                      = 7

; ===============================================================================================================================
; DrawIconEx Constants
; ===============================================================================================================================

Global Const $DI_MASK                           = 0x0001
Global Const $DI_IMAGE                          = 0x0002
Global Const $DI_NORMAL                         = 0x0003
Global Const $DI_COMPAT                         = 0x0004
Global Const $DI_DEFAULTSIZE                    = 0x0008
Global Const $DI_NOMIRROR                       = 0x0010

; ===============================================================================================================================
; EnumDisplayDevice Constants
; ===============================================================================================================================

Global Const $DISPLAY_DEVICE_ATTACHED_TO_DESKTOP= 0x00000001
Global Const $DISPLAY_DEVICE_MULTI_DRIVER       = 0x00000002
Global Const $DISPLAY_DEVICE_PRIMARY_DEVICE     = 0x00000004
Global Const $DISPLAY_DEVICE_MIRRORING_DRIVER   = 0x00000008
Global Const $DISPLAY_DEVICE_VGA_COMPATIBLE     = 0x00000010
Global Const $DISPLAY_DEVICE_REMOVABLE          = 0x00000020
Global Const $DISPLAY_DEVICE_DISCONNECT         = 0x02000000
Global Const $DISPLAY_DEVICE_REMOTE             = 0x04000000
Global Const $DISPLAY_DEVICE_MODESPRUNED        = 0x08000000

; ===============================================================================================================================
; DrawText Constants
; ===============================================================================================================================

Global Const $DT_TOP                            = 0x00000000
Global Const $DT_LEFT                           = 0x00000000
Global Const $DT_CENTER                         = 0x00000001
Global Const $DT_RIGHT                          = 0x00000002
Global Const $DT_VCENTER                        = 0x00000004
Global Const $DT_BOTTOM                         = 0x00000008
Global Const $DT_WORDBREAK                      = 0x00000010
Global Const $DT_SINGLELINE                     = 0x00000020
Global Const $DT_EXPANDTABS                     = 0x00000040
Global Const $DT_TABSTOP                        = 0x00000080
Global Const $DT_NOCLIP                         = 0x00000100
Global Const $DT_EXTERNALLEADING                = 0x00000200
Global Const $DT_CALCRECT                       = 0x00000400
Global Const $DT_NOPREFIX                       = 0x00000800
Global Const $DT_INTERNAL                       = 0x00001000

; ===============================================================================================================================
; Error Constants
; ===============================================================================================================================

Global Const $ERROR_PIPE_BUSY                   = 231
Global Const $ERROR_MORE_DATA                   = 234
Global Const $ERROR_NO_MORE_ITEMS               = 259
Global Const $ERROR_PIPE_CONNECTED              = 535
Global Const $ERROR_IO_PENDING                  = 997

; ===============================================================================================================================
; File Constants
; ===============================================================================================================================

Global Const $FILE_ATTRIBUTE_READONLY           = 0x00000001
Global Const $FILE_ATTRIBUTE_HIDDEN             = 0x00000002
Global Const $FILE_ATTRIBUTE_SYSTEM             = 0x00000004
Global Const $FILE_ATTRIBUTE_DIRECTORY          = 0x00000010
Global Const $FILE_ATTRIBUTE_ARCHIVE            = 0x00000020
Global Const $FILE_ATTRIBUTE_DEVICE             = 0x00000040
Global Const $FILE_ATTRIBUTE_NORMAL             = 0x00000080
Global Const $FILE_ATTRIBUTE_TEMPORARY          = 0x00000100
Global Const $FILE_ATTRIBUTE_SPARSE_FILE        = 0x00000200
Global Const $FILE_ATTRIBUTE_REPARSE_POINT      = 0x00000400
Global Const $FILE_ATTRIBUTE_COMPRESSED         = 0x00000800
Global Const $FILE_ATTRIBUTE_OFFLINE            = 0x00001000
Global Const $FILE_ATTRIBUTE_NOT_CONTENT_INDEXED= 0x00002000
Global Const $FILE_ATTRIBUTE_ENCRYPTED          = 0x00004000

Global Const $FILE_SHARE_READ                   = 0x00000001
Global Const $FILE_SHARE_WRITE                  = 0x00000002
Global Const $FILE_SHARE_DELETE                 = 0x00000004

Global Const $GENERIC_ALL                       = 0x10000000
Global Const $GENERIC_EXECUTE                   = 0x20000000
Global Const $GENERIC_WRITE                     = 0x40000000
Global Const $GENERIC_READ                      = 0x80000000

Global Const $CREATE_NEW                        = 1
Global Const $CREATE_ALWAYS                     = 2
Global Const $OPEN_EXISTING                     = 3
Global Const $OPEN_ALWAYS                       = 4
Global Const $TRUNCATE_EXISTING                 = 5

; ===============================================================================================================================
; FlashWindowEx Constants
; ===============================================================================================================================

Global Const $FLASHW_CAPTION                    = 0x00000001
Global Const $FLASHW_TRAY                       = 0x00000002
Global Const $FLASHW_TIMER                      = 0x00000004
Global Const $FLASHW_TIMERNOFG                  = 0x0000000C

; ===============================================================================================================================
; FormatMessage Constants
; ===============================================================================================================================

Global Const $FORMAT_MESSAGE_ALLOCATE_BUFFER    = 0x0100
Global Const $FORMAT_MESSAGE_IGNORE_INSERTS     = 0x0200
Global Const $FORMAT_MESSAGE_FROM_STRING        = 0x0400
Global Const $FORMAT_MESSAGE_FROM_HMODULE       = 0x0800
Global Const $FORMAT_MESSAGE_FROM_SYSTEM        = 0x1000
Global Const $FORMAT_MESSAGE_ARGUMENT_ARRAY     = 0x2000

; ===============================================================================================================================
; GetAncestor Constants
; ===============================================================================================================================

Global Const $GA_PARENT                         = 1
Global Const $GA_ROOT                           = 2
Global Const $GA_ROOTOWNER                      = 3

; ===============================================================================================================================
; GetWindows Constants
; ===============================================================================================================================

Global Const $GW_HWNDFIRST                      = 0
Global Const $GW_HWNDLAST                       = 1
Global Const $GW_HWNDNEXT                       = 2
Global Const $GW_HWNDPREV                       = 3
Global Const $GW_OWNER                          = 4
Global Const $GW_CHILD                          = 5

; ===============================================================================================================================
; GetWindowLong Constants
; ===============================================================================================================================

Global Const $GWL_WNDPROC                       = 0xFFFFFFFC
Global Const $GWL_HINSTANCE                     = 0xFFFFFFFA
Global Const $GWL_HWNDPARENT                    = 0xFFFFFFF8
Global Const $GWL_ID                            = 0xFFFFFFF4
Global Const $GWL_STYLE                         = 0xFFFFFFF0
Global Const $GWL_EXSTYLE                       = 0xFFFFFFEC
Global Const $GWL_USERDATA                      = 0xFFFFFFEB

; ===============================================================================================================================
; WM_NCHITTEST and MOUSEHOOKSTRUCT Mouse Position Codes
; ===============================================================================================================================

Global Const $HTERROR                           = -2
Global Const $HTTRANSPARENT                     = -1
Global Const $HTNOWHERE                         = 0
Global Const $HTCLIENT                          = 1
Global Const $HTCAPTION                         = 2
Global Const $HTSYSMENU                         = 3
Global Const $HTGROWBOX                         = 4
Global Const $HTSIZE                            = $HTGROWBOX
Global Const $HTMENU                            = 5
Global Const $HTHSCROLL                         = 6
Global Const $HTVSCROLL                         = 7
Global Const $HTMINBUTTON                       = 8
Global Const $HTMAXBUTTON                       = 9
Global Const $HTLEFT                            = 10
Global Const $HTRIGHT                           = 11
Global Const $HTTOP                             = 12
Global Const $HTTOPLEFT                         = 13
Global Const $HTTOPRIGHT                        = 14
Global Const $HTBOTTOM                          = 15
Global Const $HTBOTTOMLEFT                      = 16
Global Const $HTBOTTOMRIGHT                     = 17
Global Const $HTBORDER                          = 18
Global Const $HTREDUCE                          = $HTMINBUTTON
Global Const $HTZOOM                            = $HTMAXBUTTON
Global Const $HTSIZEFIRST                       = $HTLEFT
Global Const $HTSIZELAST                        = $HTBOTTOMRIGHT
Global Const $HTOBJECT                          = 19
Global Const $HTCLOSE                           = 20
Global Const $HTHELP                            = 21

; ===============================================================================================================================
; SetWindowPos Constants
; ===============================================================================================================================

Global Const $HWND_TOP                          = 0x00000000
Global Const $HWND_BOTTOM                       = 0x00000001
Global Const $HWND_TOPMOST                      = 0xFFFFFFFF
Global Const $HWND_NOTOPMOST                    = 0xFFFFFFFE

; ===============================================================================================================================
; Standard Resource Identifier Constants
; ===============================================================================================================================

Global Const $HINST_COMMCTRL                    = -1

Global Const $IDB_STD_SMALL_COLOR               = 0
Global Const $IDB_STD_LARGE_COLOR               = 1
Global Const $IDB_VIEW_SMALL_COLOR              = 4
Global Const $IDB_VIEW_LARGE_COLOR              = 5
Global Const $IDB_HIST_SMALL_COLOR              = 8
Global Const $IDB_HIST_LARGE_COLOR              = 9

; ===============================================================================================================================
; Image Type Constants
; ===============================================================================================================================

Global Const $IMAGE_BITMAP                      = 0
Global Const $IMAGE_ICON                        = 1
Global Const $IMAGE_CURSOR                      = 2

; ===============================================================================================================================
; LoadLibraryEx Constants
; ===============================================================================================================================

Global Const $DONT_RESOLVE_DLL_REFERENCES       = 0x01
Global Const $LOAD_LIBRARY_AS_DATAFILE          = 0x02
Global Const $LOAD_WITH_ALTERED_SEARCH_PATH     = 0x08

; ===============================================================================================================================
; Image Load Constants
; ===============================================================================================================================

Global Const $LR_DEFAULTCOLOR                   = 0x0000
Global Const $LR_MONOCHROME                     = 0x0001
Global Const $LR_COLOR                          = 0x0002
Global Const $LR_COPYRETURNORG                  = 0x0004
Global Const $LR_COPYDELETEORG                  = 0x0008
Global Const $LR_LOADFROMFILE                   = 0x0010
Global Const $LR_LOADTRANSPARENT                = 0x0020
Global Const $LR_DEFAULTSIZE                    = 0x0040
Global Const $LR_VGACOLOR                       = 0x0080
Global Const $LR_LOADMAP3DCOLORS                = 0x1000
Global Const $LR_CREATEDIBSECTION               = 0x2000
Global Const $LR_COPYFROMRESOURCE               = 0x4000
Global Const $LR_SHARED                         = 0x8000

; ===============================================================================================================================
; VirtualAlloc Allocation Type Constants
; ===============================================================================================================================

Global Const $MEM_COMMIT                        = 0x00001000
Global Const $MEM_RESERVE                       = 0x00002000
Global Const $MEM_TOP_DOWN                      = 0x00100000
Global Const $MEM_SHARED                        = 0x08000000

; ===============================================================================================================================
; VirtualFree FreeType Constants
; ===============================================================================================================================

Global Const $MEM_DECOMMIT                      = 0x00004000
Global Const $MEM_RELEASE                       = 0x00008000

; ===============================================================================================================================
; Mouse Message Key State Constants
; ===============================================================================================================================

Global Const $MK_LBUTTON                        = 0x01
Global Const $MK_RBUTTON                        = 0x02
Global Const $MK_SHIFT                          = 0x04
Global Const $MK_CONTROL                        = 0x08
Global Const $MK_MBUTTON                        = 0x10

; ===============================================================================================================================
; Mouse_Event Constants
; ===============================================================================================================================

Global Const $MOUSEEVENTF_MOVE                  = 0x0001
Global Const $MOUSEEVENTF_LEFTDOWN              = 0x0002
Global Const $MOUSEEVENTF_LEFTUP                = 0x0004
Global Const $MOUSEEVENTF_RIGHTDOWN             = 0x0008
Global Const $MOUSEEVENTF_RIGHTUP               = 0x0010
Global Const $MOUSEEVENTF_MIDDLEDOWN            = 0x0020
Global Const $MOUSEEVENTF_MIDDLEUP              = 0x0040
Global Const $MOUSEEVENTF_WHEEL                 = 0x0800
Global Const $MOUSEEVENTF_ABSOLUTE              = 0x8000

; ===============================================================================================================================
; Windows Notification Message Constants
; ===============================================================================================================================

Global Const $NM_FIRST                          = 0

Global Const $NM_OUTOFMEMORY                    = $NM_FIRST - 1
Global Const $NM_CLICK                          = $NM_FIRST - 2
Global Const $NM_DBLCLK                         = $NM_FIRST - 3
Global Const $NM_RETURN                         = $NM_FIRST - 4
Global Const $NM_RCLICK                         = $NM_FIRST - 5
Global Const $NM_RDBLCLK                        = $NM_FIRST - 6
Global Const $NM_SETFOCUS                       = $NM_FIRST - 7
Global Const $NM_KILLFOCUS                      = $NM_FIRST - 8
Global Const $NM_CUSTOMDRAW                     = $NM_FIRST - 12
Global Const $NM_HOVER                          = $NM_FIRST - 13
Global Const $NM_NCHITTEST                      = $NM_FIRST - 14
Global Const $NM_KEYDOWN                        = $NM_FIRST - 15
Global Const $NM_RELEASEDCAPTURE                = $NM_FIRST - 16
Global Const $NM_SETCURSOR                      = $NM_FIRST - 17
Global Const $NM_CHAR                           = $NM_FIRST - 18
Global Const $NM_TOOLTIPSCREATED                = $NM_FIRST - 19
Global Const $NM_LDOWN                          = $NM_FIRST - 20
Global Const $NM_RDOWN                          = $NM_FIRST - 21
Global Const $NM_THEMECHANGED                   = $NM_FIRST - 22

; ===============================================================================================================================
; OEM Resource Ordinal Numbers
; ===============================================================================================================================

Global Const $OBM_CLOSE                         = 32754
Global Const $OBM_UPARROW                       = 32753
Global Const $OBM_DNARROW                       = 32752
Global Const $OBM_RGARROW                       = 32751
Global Const $OBM_LFARROW                       = 32750
Global Const $OBM_REDUCE                        = 32749
Global Const $OBM_ZOOM                          = 32748
Global Const $OBM_RESTORE                       = 32747
Global Const $OBM_REDUCED                       = 32746
Global Const $OBM_ZOOMD                         = 32745
Global Const $OBM_RESTORED                      = 32744
Global Const $OBM_UPARROWD                      = 32743
Global Const $OBM_DNARROWD                      = 32742
Global Const $OBM_RGARROWD                      = 32741
Global Const $OBM_LFARROWD                      = 32740
Global Const $OBM_MNARROW                       = 32739
Global Const $OBM_COMBO                         = 32738
Global Const $OBM_UPARROWI                      = 32737
Global Const $OBM_DNARROWI                      = 32736
Global Const $OBM_RGARROWI                      = 32735
Global Const $OBM_LFARROWI                      = 32734
Global Const $OBM_OLD_CLOSE                     = 32767
Global Const $OBM_SIZE                          = 32766
Global Const $OBM_OLD_UPARROW                   = 32765
Global Const $OBM_OLD_DNARROW                   = 32764
Global Const $OBM_OLD_RGARROW                   = 32763
Global Const $OBM_OLD_LFARROW                   = 32762
Global Const $OBM_BTSIZE                        = 32761
Global Const $OBM_CHECK                         = 32760
Global Const $OBM_CHECKBOXES                    = 32759
Global Const $OBM_BTNCORNERS                    = 32758
Global Const $OBM_OLD_REDUCE                    = 32757
Global Const $OBM_OLD_ZOOM                      = 32756
Global Const $OBM_OLD_RESTORE                   = 32755

; ===============================================================================================================================
; Reserved IDs for System Objects
; ===============================================================================================================================

Global Const $OBJID_WINDOW                      = 0x00000000
Global Const $OBJID_SYSMENU                     = 0xFFFFFFFF
Global Const $OBJID_TITLEBAR                    = 0xFFFFFFFE
Global Const $OBJID_MENU                        = 0xFFFFFFFD
Global Const $OBJID_CLIENT                      = 0xFFFFFFFC
Global Const $OBJID_VSCROLL                     = 0xFFFFFFFB
Global Const $OBJID_HSCROLL                     = 0xFFFFFFFA
Global Const $OBJID_SIZEGRIP                    = 0xFFFFFFF9
Global Const $OBJID_CARET                       = 0xFFFFFFF8
Global Const $OBJID_CURSOR                      = 0xFFFFFFF7
Global Const $OBJID_ALERT                       = 0xFFFFFFF6
Global Const $OBJID_SOUND                       = 0xFFFFFFF5

; ===============================================================================================================================
; VirtualAlloc Protection Constants
; ===============================================================================================================================

Global Const $PAGE_NOACCESS                     = 0x00000001
Global Const $PAGE_READONLY                     = 0x00000002
Global Const $PAGE_READWRITE                    = 0x00000004
Global Const $PAGE_EXECUTE                      = 0x00000010
Global Const $PAGE_EXECUTE_READ                 = 0x00000020
Global Const $PAGE_EXECUTE_READWRITE            = 0x00000040
Global Const $PAGE_GUARD                        = 0x00000100
Global Const $PAGE_NOCACHE                      = 0x00000200

; ===============================================================================================================================
; OpenProcess Constants
; ===============================================================================================================================

Global Const $PROCESS_TERMINATE                 = 0x00000001
Global Const $PROCESS_CREATE_THREAD             = 0x00000002
Global Const $PROCESS_SET_SESSIONID             = 0x00000004
Global Const $PROCESS_VM_OPERATION              = 0x00000008
Global Const $PROCESS_VM_READ                   = 0x00000010
Global Const $PROCESS_VM_WRITE                  = 0x00000020
Global Const $PROCESS_DUP_HANDLE                = 0x00000040
Global Const $PROCESS_CREATE_PROCESS            = 0x00000080
Global Const $PROCESS_SET_QUOTA                 = 0x00000100
Global Const $PROCESS_SET_INFORMATION           = 0x00000200
Global Const $PROCESS_QUERY_INFORMATION         = 0x00000400
Global Const $PROCESS_SUSPEND_RESUME            = 0x00000800
Global Const $PROCESS_ALL_ACCESS                = 0x001F0FFF

; ===============================================================================================================================
; RedrawWindow Constants
; ===============================================================================================================================

Global Const $RDW_INVALIDATE                    = 0x0001
Global Const $RDW_INTERNALPAINT                 = 0x0002
Global Const $RDW_ERASE                         = 0x0004
Global Const $RDW_VALIDATE                      = 0x0008
Global Const $RDW_NOINTERNALPAINT               = 0x0010
Global Const $RDW_NOERASE                       = 0x0020
Global Const $RDW_NOCHILDREN                    = 0x0040
Global Const $RDW_ALLCHILDREN                   = 0x0080
Global Const $RDW_UPDATENOW                     = 0x0100
Global Const $RDW_ERASENOW                      = 0x0200
Global Const $RDW_FRAME                         = 0x0400
Global Const $RDW_NOFRAME                       = 0x0800

; ===============================================================================================================================
; System Menu Command Constants
; ===============================================================================================================================

Global Const $SC_SIZE                           = 0xF000
Global Const $SC_SEPARATOR                      = 0xF00F
Global Const $SC_MOVE                           = 0xF010
Global Const $SC_MINIMIZE                       = 0xF020
Global Const $SC_MAXIMIZE                       = 0xF030
Global Const $SC_NEXTWINDOW                     = 0xF040
Global Const $SC_PREVWINDOW                     = 0xF050
Global Const $SC_CLOSE                          = 0xF060
Global Const $SC_VSCROLL                        = 0xF070
Global Const $SC_HSCROLL                        = 0xF080
Global Const $SC_MOUSEMENU                      = 0xF090
Global Const $SC_KEYMENU                        = 0xF100
Global Const $SC_ARRANGE                        = 0xF110
Global Const $SC_RESTORE                        = 0xF120
Global Const $SC_TASKLIST                       = 0xF130
Global Const $SC_SCREENSAVE                     = 0xF140
Global Const $SC_HOTKEY                         = 0xF150
Global Const $SC_DEFAULT                        = 0xF160
Global Const $SC_MONITORPOWER                   = 0xF170
Global Const $SC_CONTEXTHELP                    = 0xF180

; ===============================================================================================================================
; GetSystemMetrics Constants
; ===============================================================================================================================

Global Const $SM_CXSCREEN                       = 0
Global Const $SM_CYSCREEN                       = 1
Global Const $SM_CXVSCROLL                      = 2
Global Const $SM_CYHSCROLL                      = 3
Global Const $SM_CYCAPTION                      = 4
Global Const $SM_CXBORDER                       = 5
Global Const $SM_CYBORDER                       = 6
Global Const $SM_CXDLGFRAME                     = 7
Global Const $SM_CYDLGFRAME                     = 8
Global Const $SM_CYVTHUMB                       = 9
Global Const $SM_CXHTHUMB                       = 10
Global Const $SM_CXICON                         = 11
Global Const $SM_CYICON                         = 12
Global Const $SM_CXCURSOR                       = 13
Global Const $SM_CYCURSOR                       = 14
Global Const $SM_CYMENU                         = 15
Global Const $SM_CXFULLSCREEN                   = 16
Global Const $SM_CYFULLSCREEN                   = 17
Global Const $SM_CYKANJIWINDOW                  = 18
Global Const $SM_MOUSEPRESENT                   = 19
Global Const $SM_CYVSCROLL                      = 20
Global Const $SM_CXHSCROLL                      = 21
Global Const $SM_DEBUG                          = 22
Global Const $SM_SWAPBUTTON                     = 23
Global Const $SM_RESERVED1                      = 24
Global Const $SM_RESERVED2                      = 25
Global Const $SM_RESERVED3                      = 26
Global Const $SM_RESERVED4                      = 27
Global Const $SM_CXMIN                          = 28
Global Const $SM_CYMIN                          = 29
Global Const $SM_CXSIZE                         = 30
Global Const $SM_CYSIZE                         = 31
Global Const $SM_CXFRAME                        = 32
Global Const $SM_CYFRAME                        = 33
Global Const $SM_CXMINTRACK                     = 34
Global Const $SM_CYMINTRACK                     = 35
Global Const $SM_CXDOUBLECLK                    = 36
Global Const $SM_CYDOUBLECLK                    = 37
Global Const $SM_CXICONSPACING                  = 38
Global Const $SM_CYICONSPACING                  = 39
Global Const $SM_MENUDROPALIGNMENT              = 40
Global Const $SM_PENWINDOWS                     = 41
Global Const $SM_DBCSENABLED                    = 42
Global Const $SM_CMOUSEBUTTONS                  = 43
Global Const $SM_SECURE                         = 44
Global Const $SM_CXEDGE                         = 45
Global Const $SM_CYEDGE                         = 46
Global Const $SM_CXMINSPACING                   = 47
Global Const $SM_CYMINSPACING                   = 48
Global Const $SM_CXSMICON                       = 49
Global Const $SM_CYSMICON                       = 50
Global Const $SM_CYSMCAPTION                    = 51
Global Const $SM_CXSMSIZE                       = 52
Global Const $SM_CYSMSIZE                       = 53
Global Const $SM_CXMENUSIZE                     = 54
Global Const $SM_CYMENUSIZE                     = 55
Global Const $SM_ARRANGE                        = 56
Global Const $SM_CXMINIMIZED                    = 57
Global Const $SM_CYMINIMIZED                    = 58
Global Const $SM_CXMAXTRACK                     = 59
Global Const $SM_CYMAXTRACK                     = 60
Global Const $SM_CXMAXIMIZED                    = 61
Global Const $SM_CYMAXIMIZED                    = 62
Global Const $SM_NETWORK                        = 63
Global Const $SM_CLEANBOOT                      = 67
Global Const $SM_CXDRAG                         = 68
Global Const $SM_CYDRAG                         = 69
Global Const $SM_SHOWSOUNDS                     = 70
Global Const $SM_CXMENUCHECK                    = 71
Global Const $SM_CYMENUCHECK                    = 72
Global Const $SM_SLOWMACHINE                    = 73
Global Const $SM_MIDEASTENABLED                 = 74
Global Const $SM_MOUSEWHEELPRESENT              = 75
Global Const $SM_XVIRTUALSCREEN                 = 76
Global Const $SM_YVIRTUALSCREEN                 = 77
Global Const $SM_CXVIRTUALSCREEN                = 78
Global Const $SM_CYVIRTUALSCREEN                = 79
Global Const $SM_CMONITORS                      = 80
Global Const $SM_SAMEDISPLAYFORMAT              = 81
Global Const $SM_IMMENABLED                     = 82
Global Const $SM_CXFOCUSBORDER                  = 83
Global Const $SM_CYFOCUSBORDER                  = 84
Global Const $SM_TABLETPC                       = 86
Global Const $SM_MEDIACENTER                    = 87
Global Const $SM_STARTER                        = 88
Global Const $SM_SERVERR2                       = 89
Global Const $SM_CMETRICS                       = 90
Global Const $SM_REMOTESESSION                  = 0x1000
Global Const $SM_SHUTTINGDOWN                   = 0x2000
Global Const $SM_REMOTECONTROL                  = 0x2001
Global Const $SM_CARETBLINKINGENABLED           = 0x2002

; ===============================================================================================================================
; SystemParametersInfo Action Constants
; ===============================================================================================================================

Global Const $SPI_GETBEEP                       = 0x0001
Global Const $SPI_SETBEEP                       = 0x0002
Global Const $SPI_GETMOUSE                      = 0x0003
Global Const $SPI_SETMOUSE                      = 0x0004
Global Const $SPI_GETBORDER                     = 0x0005
Global Const $SPI_SETBORDER                     = 0x0006
Global Const $SPI_GETKEYBOARDSPEED              = 0x000A
Global Const $SPI_SETKEYBOARDSPEED              = 0x000B
Global Const $SPI_LANGDRIVER                    = 0x000C
Global Const $SPI_ICONHORIZONTALSPACING         = 0x000D
Global Const $SPI_GETSCREENSAVETIMEOUT          = 0x000E
Global Const $SPI_SETSCREENSAVETIMEOUT          = 0x000F
Global Const $SPI_GETSCREENSAVEACTIVE           = 0x0010
Global Const $SPI_SETSCREENSAVEACTIVE           = 0x0011
Global Const $SPI_GETGRIDGRANULARITY            = 0x0012
Global Const $SPI_SETGRIDGRANULARITY            = 0x0013
Global Const $SPI_SETDESKWALLPAPER              = 0x0014
Global Const $SPI_SETDESKPATTERN                = 0x0015
Global Const $SPI_GETKEYBOARDDELAY              = 0x0016
Global Const $SPI_SETKEYBOARDDELAY              = 0x0017
Global Const $SPI_ICONVERTICALSPACING           = 0x0018
Global Const $SPI_GETICONTITLEWRAP              = 0x0019
Global Const $SPI_SETICONTITLEWRAP              = 0x001A
Global Const $SPI_GETMENUDROPALIGNMENT          = 0x001B
Global Const $SPI_SETMENUDROPALIGNMENT          = 0x001C
Global Const $SPI_SETDOUBLECLKWIDTH             = 0x001D
Global Const $SPI_SETDOUBLECLKHEIGHT            = 0x001E
Global Const $SPI_GETICONTITLELOGFONT           = 0x001F
Global Const $SPI_SETDOUBLECLICKTIME            = 0x0020
Global Const $SPI_SETMOUSEBUTTONSWAP            = 0x0021
Global Const $SPI_SETICONTITLELOGFONT           = 0x0022
Global Const $SPI_GETFASTTASKSWITCH             = 0x0023
Global Const $SPI_SETFASTTASKSWITCH             = 0x0024
Global Const $SPI_SETDRAGFULLWINDOWS            = 0x0025
Global Const $SPI_GETDRAGFULLWINDOWS            = 0x0026
Global Const $SPI_GETNONCLIENTMETRICS           = 0x0029
Global Const $SPI_SETNONCLIENTMETRICS           = 0x002A
Global Const $SPI_GETMINIMIZEDMETRICS           = 0x002B
Global Const $SPI_SETMINIMIZEDMETRICS           = 0x002C
Global Const $SPI_GETICONMETRICS                = 0x002D
Global Const $SPI_SETICONMETRICS                = 0x002E
Global Const $SPI_SETWORKAREA                   = 0x002F
Global Const $SPI_GETWORKAREA                   = 0x0030
Global Const $SPI_SETPENWINDOWS                 = 0x0031
Global Const $SPI_GETHIGHCONTRAST               = 0x0042
Global Const $SPI_SETHIGHCONTRAST               = 0x0043
Global Const $SPI_GETKEYBOARDPREF               = 0x0044
Global Const $SPI_SETKEYBOARDPREF               = 0x0045
Global Const $SPI_GETSCREENREADER               = 0x0046
Global Const $SPI_SETSCREENREADER               = 0x0047
Global Const $SPI_GETANIMATION                  = 0x0048
Global Const $SPI_SETANIMATION                  = 0x0049
Global Const $SPI_GETFONTSMOOTHING              = 0x004A
Global Const $SPI_SETFONTSMOOTHING              = 0x004B
Global Const $SPI_SETDRAGWIDTH                  = 0x004C
Global Const $SPI_SETDRAGHEIGHT                 = 0x004D
Global Const $SPI_SETHANDHELD                   = 0x004E
Global Const $SPI_GETLOWPOWERTIMEOUT            = 0x004F
Global Const $SPI_GETPOWEROFFTIMEOUT            = 0x0050
Global Const $SPI_SETLOWPOWERTIMEOUT            = 0x0051
Global Const $SPI_SETPOWEROFFTIMEOUT            = 0x0052
Global Const $SPI_GETLOWPOWERACTIVE             = 0x0053
Global Const $SPI_GETPOWEROFFACTIVE             = 0x0054
Global Const $SPI_SETLOWPOWERACTIVE             = 0x0055
Global Const $SPI_SETPOWEROFFACTIVE             = 0x0056
Global Const $SPI_SETCURSORS                    = 0x0057
Global Const $SPI_SETICONS                      = 0x0058
Global Const $SPI_GETDEFAULTINPUTLANG           = 0x0059
Global Const $SPI_SETDEFAULTINPUTLANG           = 0x005A
Global Const $SPI_SETLANGTOGGLE                 = 0x005B
Global Const $SPI_GETWINDOWSEXTENSION           = 0x005C
Global Const $SPI_SETMOUSETRAILS                = 0x005D
Global Const $SPI_GETMOUSETRAILS                = 0x005E
Global Const $SPI_SETSCREENSAVERRUNNING         = 0x0061
Global Const $SPI_SCREENSAVERRUNNING            = 0x0061
Global Const $SPI_GETFILTERKEYS                 = 0x0032
Global Const $SPI_SETFILTERKEYS                 = 0x0033
Global Const $SPI_GETTOGGLEKEYS                 = 0x0034
Global Const $SPI_SETTOGGLEKEYS                 = 0x0035
Global Const $SPI_GETMOUSEKEYS                  = 0x0036
Global Const $SPI_SETMOUSEKEYS                  = 0x0037
Global Const $SPI_GETSHOWSOUNDS                 = 0x0038
Global Const $SPI_SETSHOWSOUNDS                 = 0x0039
Global Const $SPI_GETSTICKYKEYS                 = 0x003A
Global Const $SPI_SETSTICKYKEYS                 = 0x003B
Global Const $SPI_GETACCESSTIMEOUT              = 0x003C
Global Const $SPI_SETACCESSTIMEOUT              = 0x003D
Global Const $SPI_GETSERIALKEYS                 = 0x003E
Global Const $SPI_SETSERIALKEYS                 = 0x003F
Global Const $SPI_GETSOUNDSENTRY                = 0x0040
Global Const $SPI_SETSOUNDSENTRY                = 0x0041
Global Const $SPI_GETSNAPTODEFBUTTON            = 0x005F
Global Const $SPI_SETSNAPTODEFBUTTON            = 0x0060
Global Const $SPI_GETMOUSEHOVERWIDTH            = 0x0062
Global Const $SPI_SETMOUSEHOVERWIDTH            = 0x0063
Global Const $SPI_GETMOUSEHOVERHEIGHT           = 0x0064
Global Const $SPI_SETMOUSEHOVERHEIGHT           = 0x0065
Global Const $SPI_GETMOUSEHOVERTIME             = 0x0066
Global Const $SPI_SETMOUSEHOVERTIME             = 0x0067
Global Const $SPI_GETWHEELSCROLLLINES           = 0x0068
Global Const $SPI_SETWHEELSCROLLLINES           = 0x0069
Global Const $SPI_GETMENUSHOWDELAY              = 0x006A
Global Const $SPI_SETMENUSHOWDELAY              = 0x006B
Global Const $SPI_GETSHOWIMEUI                  = 0x006E
Global Const $SPI_SETSHOWIMEUI                  = 0x006F
Global Const $SPI_GETMOUSESPEED                 = 0x0070
Global Const $SPI_SETMOUSESPEED                 = 0x0071
Global Const $SPI_GETSCREENSAVERRUNNING         = 0x0072
Global Const $SPI_GETDESKWALLPAPER              = 0x0073
Global Const $SPI_GETACTIVEWINDOWTRACKING       = 0x1000
Global Const $SPI_SETACTIVEWINDOWTRACKING       = 0x1001
Global Const $SPI_GETMENUANIMATION              = 0x1002
Global Const $SPI_SETMENUANIMATION              = 0x1003
Global Const $SPI_GETCOMBOBOXANIMATION          = 0x1004
Global Const $SPI_SETCOMBOBOXANIMATION          = 0x1005
Global Const $SPI_GETLISTBOXSMOOTHSCROLLING     = 0x1006
Global Const $SPI_SETLISTBOXSMOOTHSCROLLING     = 0x1007
Global Const $SPI_GETGRADIENTCAPTIONS           = 0x1008
Global Const $SPI_SETGRADIENTCAPTIONS           = 0x1009
Global Const $SPI_GETKEYBOARDCUES               = 0x100A
Global Const $SPI_SETKEYBOARDCUES               = 0x100B
Global Const $SPI_GETMENUUNDERLINES             = 0x100A
Global Const $SPI_SETMENUUNDERLINES             = 0x100B
Global Const $SPI_GETACTIVEWNDTRKZORDER         = 0x100C
Global Const $SPI_SETACTIVEWNDTRKZORDER         = 0x100D
Global Const $SPI_GETHOTTRACKING                = 0x100E
Global Const $SPI_SETHOTTRACKING                = 0x100F
Global Const $SPI_GETMENUFADE                   = 0x1012
Global Const $SPI_SETMENUFADE                   = 0x1013
Global Const $SPI_GETSELECTIONFADE              = 0x1014
Global Const $SPI_SETSELECTIONFADE              = 0x1015
Global Const $SPI_GETTOOLTIPANIMATION           = 0x1016
Global Const $SPI_SETTOOLTIPANIMATION           = 0x1017
Global Const $SPI_GETTOOLTIPFADE                = 0x1018
Global Const $SPI_SETTOOLTIPFADE                = 0x1019
Global Const $SPI_GETCURSORSHADOW               = 0x101A
Global Const $SPI_SETCURSORSHADOW               = 0x101B
Global Const $SPI_GETMOUSESONAR                 = 0x101C
Global Const $SPI_SETMOUSESONAR                 = 0x101D
Global Const $SPI_GETMOUSECLICKLOCK             = 0x101E
Global Const $SPI_SETMOUSECLICKLOCK             = 0x101F
Global Const $SPI_GETMOUSEVANISH                = 0x1020
Global Const $SPI_SETMOUSEVANISH                = 0x1021
Global Const $SPI_GETFLATMENU                   = 0x1022
Global Const $SPI_SETFLATMENU                   = 0x1023
Global Const $SPI_GETDROPSHADOW                 = 0x1024
Global Const $SPI_SETDROPSHADOW                 = 0x1025
Global Const $SPI_GETBLOCKSENDINPUTRESETS       = 0x1026
Global Const $SPI_SETBLOCKSENDINPUTRESETS       = 0x1027
Global Const $SPI_GETUIEFFECTS                  = 0x103E
Global Const $SPI_SETUIEFFECTS                  = 0x103F
Global Const $SPI_GETFOREGROUNDLOCKTIMEOUT      = 0x2000
Global Const $SPI_SETFOREGROUNDLOCKTIMEOUT      = 0x2001
Global Const $SPI_GETACTIVEWNDTRKTIMEOUT        = 0x2002
Global Const $SPI_SETACTIVEWNDTRKTIMEOUT        = 0x2003
Global Const $SPI_GETFOREGROUNDFLASHCOUNT       = 0x2004
Global Const $SPI_SETFOREGROUNDFLASHCOUNT       = 0x2005
Global Const $SPI_GETCARETWIDTH                 = 0x2006
Global Const $SPI_SETCARETWIDTH                 = 0x2007
Global Const $SPI_GETMOUSECLICKLOCKTIME         = 0x2008
Global Const $SPI_SETMOUSECLICKLOCKTIME         = 0x2009
Global Const $SPI_GETFONTSMOOTHINGTYPE          = 0x200A
Global Const $SPI_SETFONTSMOOTHINGTYPE          = 0x200B
Global Const $SPI_GETFONTSMOOTHINGCONTRAST      = 0x200C
Global Const $SPI_SETFONTSMOOTHINGCONTRAST      = 0x200D
Global Const $SPI_GETFOCUSBORDERWIDTH           = 0x200E
Global Const $SPI_SETFOCUSBORDERWIDTH           = 0x200F
Global Const $SPI_GETFOCUSBORDERHEIGHT          = 0x2010
Global Const $SPI_SETFOCUSBORDERHEIGHT          = 0x2011
Global Const $SPI_GETFONTSMOOTHINGORIENTATION   = 0x2012
Global Const $SPI_SETFONTSMOOTHINGORIENTATION   = 0x2013

; ===============================================================================================================================
; SystemParametersInfo WinIni Constants
; ===============================================================================================================================

Global Const $SPIF_UPDATEINIFILE                = 0x0001
Global Const $SPIF_SENDCHANGE                   = 0x0002

; ===============================================================================================================================
; STARTUPINFO Flag Constants
; ===============================================================================================================================

Global Const $STARTF_USESHOWWINDOW              = 0x00000001
Global Const $STARTF_USESIZE                    = 0x00000002
Global Const $STARTF_USEPOSITION                = 0x00000004
Global Const $STARTF_USECOUNTCHARS              = 0x00000008
Global Const $STARTF_USEFILLATTRIBUTE           = 0x00000010
Global Const $STARTF_RUNFULLSCREEN              = 0x00000020
Global Const $STARTF_FORCEONFEEDBACK            = 0x00000040
Global Const $STARTF_FORCEOFFFEEDBACK           = 0x00000080
Global Const $STARTF_USESTDHANDLES              = 0x00000100

; ===============================================================================================================================
; ShowWindow Constants
; ===============================================================================================================================

Global Const $SW_HIDE                           = 0
Global Const $SW_SHOWNORMAL                     = 1
Global Const $SW_NORMAL                         = 1
Global Const $SW_SHOWMINIMIZED                  = 2
Global Const $SW_SHOWMAXIMIZED                  = 3
Global Const $SW_MAXIMIZE                       = 3
Global Const $SW_SHOWNOACTIVATE                 = 4
Global Const $SW_SHOW                           = 5
Global Const $SW_MINIMIZE                       = 6
Global Const $SW_SHOWMINNOACTIVE                = 7
Global Const $SW_SHOWNA                         = 8
Global Const $SW_RESTORE                        = 9
Global Const $SW_SHOWDEFAULT                    = 10
Global Const $SW_FORCEMINIMIZE                  = 11
Global Const $SW_MAX                            = 11

; ===============================================================================================================================
; Standard Icon Index Constants
; ===============================================================================================================================

Global Const $STD_CUT                           = 0
Global Const $STD_COPY                          = 1
Global Const $STD_PASTE                         = 2
Global Const $STD_UNDO                          = 3
Global Const $STD_REDOW                         = 4
Global Const $STD_DELETE                        = 5
Global Const $STD_FILENEW                       = 6
Global Const $STD_FILEOPEN                      = 7
Global Const $STD_FILESAVE                      = 8
Global Const $STD_PRINTPRE                      = 9
Global Const $STD_PROPERTIES                    = 10
Global Const $STD_HELP                          = 11
Global Const $STD_FIND                          = 12
Global Const $STD_REPLACE                       = 13
Global Const $STD_PRINT                         = 14

; ===============================================================================================================================
; SetWindowPos Constants
; ===============================================================================================================================

Global Const $SWP_NOSIZE                        = 0x0001
Global Const $SWP_NOMOVE                        = 0x0002
Global Const $SWP_NOZORDER                      = 0x0004
Global Const $SWP_NOREDRAW                      = 0x0008
Global Const $SWP_NOACTIVATE                    = 0x0010
Global Const $SWP_FRAMECHANGED                  = 0x0020
Global Const $SWP_DRAWFRAME                     = 0x0020
Global Const $SWP_SHOWWINDOW                    = 0x0040
Global Const $SWP_HIDEWINDOW                    = 0x0080
Global Const $SWP_NOCOPYBITS                    = 0x0100
Global Const $SWP_NOOWNERZORDER                 = 0x0200
Global Const $SWP_NOREPOSITION                  = 0x0200
Global Const $SWP_NOSENDCHANGING                = 0x0400
Global Const $SWP_DEFERERASE                    = 0x2000
Global Const $SWP_ASYNCWINDOWPOS                = 0x4000

; ===============================================================================================================================
; Token Constants
; ===============================================================================================================================

Global Const $TOKEN_ASSIGN_PRIMARY              = 0x00000001
Global Const $TOKEN_DUPLICATE                   = 0x00000002
Global Const $TOKEN_IMPERSONATE                 = 0x00000004
Global Const $TOKEN_QUERY                       = 0x00000008
Global Const $TOKEN_QUERY_SOURCE                = 0x00000010
Global Const $TOKEN_ADJUST_PRIVILEGES           = 0x00000020
Global Const $TOKEN_ADJUST_GROUPS               = 0x00000040
Global Const $TOKEN_ADJUST_DEFAULT              = 0x00000080
Global Const $TOKEN_ADJUST_SESSIONID            = 0x00000100

; ===============================================================================================================================
; Standard Icon Index Constants
; ===============================================================================================================================

Global Const $VIEW_LARGEICONS                   = 0
Global Const $VIEW_SMALLICONS                   = 1
Global Const $VIEW_LIST                         = 2
Global Const $VIEW_DETAILS                      = 3
Global Const $VIEW_SORTNAME                     = 4
Global Const $VIEW_SORTSIZE                     = 5
Global Const $VIEW_SORTDATE                     = 6
Global Const $VIEW_SORTTYPE                     = 7
Global Const $VIEW_PARENTFOLDER                 = 8
Global Const $VIEW_NETCONNECT                   = 9
Global Const $VIEW_NETDISCONNECT                = 10
Global Const $VIEW_NEWFOLDER                    = 11
Global Const $VIEW_VIEWMENU                     = 12

; ===============================================================================================================================
; Wait Constants
; ===============================================================================================================================

Global Const $WAIT_OBJECT_0                     = 0
Global Const $WAIT_ABANDONED_0                  = 128
Global Const $WAIT_TIMEOUT                      = 258

; ===============================================================================================================================
; Windows Message Constants
; ===============================================================================================================================

Global Const $WM_CREATE                         = 0x0001
Global Const $WM_DESTROY                        = 0x0002
Global Const $WM_MOVE                           = 0x0003
Global Const $WM_ACTIVATE                       = 0x0006
Global Const $WM_SETFOCUS                       = 0x0007
Global Const $WM_KILLFOCUS                      = 0x0008
Global Const $WM_ENABLE                         = 0x000A
Global Const $WM_SETREDRAW                      = 0x000B
Global Const $WM_SETTEXT                        = 0x000C
Global Const $WM_PAINT                          = 0x000F
Global Const $WM_CLOSE                          = 0x0010
Global Const $WM_QUIT                           = 0x0012
Global Const $WM_ERASEBKGND                     = 0x0014
Global Const $WM_SYSCOLORCHANGE                 = 0x0015
Global Const $WM_SHOWWINDOW                     = 0x0018
Global Const $WM_WININICHANGE                   = 0x001A
Global Const $WM_DEVMODECHANGE                  = 0x001B
Global Const $WM_ACTIVATEAPP                    = 0x001C
Global Const $WM_FONTCHANGE                     = 0x001D
Global Const $WM_TIMECHANGE                     = 0x001E
Global Const $WM_CANCELMODE                     = 0x001F
Global Const $WM_SETCURSOR                      = 0x0020
Global Const $WM_MOUSEACTIVATE                  = 0x0021
Global Const $WM_CHILDACTIVATE                  = 0x0022
Global Const $WM_QUEUESYNC                      = 0x0023
Global Const $WM_GETMINMAXINFO                  = 0x0024
Global Const $WM_PAINTICON                      = 0x0026
Global Const $WM_ICONERASEBKGND                 = 0x0027
Global Const $WM_NEXTDLGCTL                     = 0x0028
Global Const $WM_SPOOLERSTATUS                  = 0x002A
Global Const $WM_DRAWITEM                       = 0x002B
Global Const $WM_MEASUREITEM                    = 0x002C
Global Const $WM_DELETEITEM                     = 0x002D
Global Const $WM_VKEYTOITEM                     = 0x002E
Global Const $WM_CHARTOITEM                     = 0x002F
Global Const $WM_SETFONT                        = 0x0030
Global Const $WM_GETFONT                        = 0x0031
Global Const $WM_SETHOTKEY                      = 0x0032
Global Const $WM_GETHOTKEY                      = 0x0033
Global Const $WM_QUERYDRAGICON                  = 0x0037
Global Const $WM_COMPAREITEM                    = 0x0039
Global Const $WM_GETOBJECT                      = 0x003D
Global Const $WM_COMPACTING                     = 0x0041
Global Const $WM_COMMNOTIFY                     = 0x0044
Global Const $WM_WINDOWPOSCHANGING              = 0x0046
Global Const $WM_WINDOWPOSCHANGED               = 0x0047
Global Const $WM_POWER                          = 0x0048
Global Const $WM_NOTIFY                         = 0x004E
Global Const $WM_COPYDATA                       = 0x004A
Global Const $WM_CANCELJOURNAL                  = 0x004B
Global Const $WM_INPUTLANGCHANGEREQUEST         = 0x0050
Global Const $WM_INPUTLANGCHANGE                = 0x0051
Global Const $WM_TCARD                          = 0x0052
Global Const $WM_HELP                           = 0x0053
Global Const $WM_USERCHANGED                    = 0x0054
Global Const $WM_NOTIFYFORMAT                   = 0x0055

Global Const $WM_CONTEXTMENU                    = 0x007B
Global Const $WM_STYLECHANGING                  = 0x007C
Global Const $WM_STYLECHANGED                   = 0x007D
Global Const $WM_DISPLAYCHANGE                  = 0x007E
Global Const $WM_GETICON                        = 0x007F
Global Const $WM_SETICON                        = 0x0080
Global Const $WM_NCCREATE                       = 0x0081
Global Const $WM_NCDESTROY                      = 0x0082
Global Const $WM_NCCALCSIZE                     = 0x0083
Global Const $WM_NCHITTEST                      = 0x0084
Global Const $WM_NCPAINT                        = 0x0085
Global Const $WM_NCACTIVATE                     = 0x0086
Global Const $WM_GETDLGCODE                     = 0x0087
Global Const $WM_SYNCPAINT                      = 0x0088

Global Const $WM_NCMOUSEMOVE                    = 0x00A0
Global Const $WM_NCLBUTTONDOWN                  = 0x00A1
Global Const $WM_NCLBUTTONUP                    = 0x00A2
Global Const $WM_NCLBUTTONDBLCLK                = 0x00A3
Global Const $WM_NCRBUTTONDOWN                  = 0x00A4
Global Const $WM_NCRBUTTONUP                    = 0x00A5
Global Const $WM_NCRBUTTONDBLCLK                = 0x00A6
Global Const $WM_NCMBUTTONDOWN                  = 0x00A7
Global Const $WM_NCMBUTTONUP                    = 0x00A8
Global Const $WM_NCMBUTTONDBLCLK                = 0x00A9

Global Const $WM_KEYDOWN                        = 0x0100
Global Const $WM_KEYUP                          = 0x0101
Global Const $WM_CHAR                           = 0x0102
Global Const $WM_DEADCHAR                       = 0x0103
Global Const $WM_SYSKEYDOWN                     = 0x0104
Global Const $WM_SYSKEYUP                       = 0x0105
Global Const $WM_SYSCHAR                        = 0x0106
Global Const $WM_SYSDEADCHAR                    = 0x0107

Global Const $WM_INITDIALOG                     = 0x0110
Global Const $WM_COMMAND                        = 0x0111
Global Const $WM_SYSCOMMAND                     = 0x0112
Global Const $WM_TIMER                          = 0x0113
Global Const $WM_HSCROLL                        = 0x0114
Global Const $WM_VSCROLL                        = 0x0115
Global Const $WM_INITMENU                       = 0x0116
Global Const $WM_INITMENUPOPUP                  = 0x0117
Global Const $WM_MENUSELECT                     = 0x011F
Global Const $WM_MENUCHAR                       = 0x0120
Global Const $WM_ENTERIDLE                      = 0x0121
Global Const $WM_MENURBUTTONUP                  = 0x0122
Global Const $WM_MENUDRAG                       = 0x0123
Global Const $WM_MENUGETOBJECT                  = 0x0124
Global Const $WM_UNINITMENUPOPUP                = 0x0125
Global Const $WM_MENUCOMMAND                    = 0x0126
Global Const $WM_CHANGEUISTATE                  = 0x0127
Global Const $WM_UPDATEUISTATE                  = 0x0128
Global Const $WM_QUERYUISTATE                   = 0x0129
Global Const $WM_CTLCOLORMSGBOX                 = 0x0132
Global Const $WM_CTLCOLOREDIT                   = 0x0133
Global Const $WM_CTLCOLORLISTBOX                = 0x0134
Global Const $WM_CTLCOLORBTN                    = 0x0135
Global Const $WM_CTLCOLORDLG                    = 0x0136
Global Const $WM_CTLCOLORSCROLLBAR              = 0x0137
Global Const $WM_CTLCOLORSTATIC                 = 0x0138

Global Const $MN_GETHMENU                       = 0x01E1

; ===============================================================================================================================
; Windows Mouse Messages
; ===============================================================================================================================

Global Const $WM_MOUSEMOVE                      = 0x0200
Global Const $WM_LBUTTONDOWN                    = 0x0201
Global Const $WM_LBUTTONUP                      = 0x0202
Global Const $WM_LBUTTONDBLCLK                  = 0x0203
Global Const $WM_RBUTTONDOWN                    = 0x0204
Global Const $WM_RBUTTONUP                      = 0x0205
Global Const $WM_RBUTTONDBLCLK                  = 0x0206
Global Const $WM_MBUTTONDOWN                    = 0x0207
Global Const $WM_MBUTTONUP                      = 0x0208
Global Const $WM_MBUTTONDBLCLK                  = 0x0209
Global Const $WM_MOUSEWHEEL                     = 0x020A
Global Const $WM_PARENTNOTIFY                   = 0x0210
Global Const $WM_ENTERMENULOOP                  = 0x0211
Global Const $WM_EXITMENULOOP                   = 0x0212
Global Const $WM_NEXTMENU                       = 0x0213
Global Const $WM_CAPTURECHANGED                 = 0x0215
Global Const $WM_MOVING                         = 0x0216
Global Const $WM_NCMOUSEHOVER                   = 0x02A0
Global Const $WM_NCMOUSELEAVE                   = 0x02A2
Global Const $WM_MOUSEHOVER                     = 0x02A1
Global Const $WM_MOUSELEAVE                     = 0x02A3

; ===============================================================================================================================
; GetDeviceCaps Constants
; ===============================================================================================================================

Global Const $DRIVERVERSION                     = 0
Global Const $TECHNOLOGY                        = 2
Global Const $HORZSIZE                          = 4
Global Const $VERTSIZE                          = 6
Global Const $HORZRES                           = 8
Global Const $VERTRES                           = 10
Global Const $BITSPIXEL                         = 12
Global Const $PLANES                            = 14
Global Const $NUMBRUSHES                        = 16
Global Const $NUMPENS                           = 18
Global Const $NUMMARKERS                        = 20
Global Const $NUMFONTS                          = 22
Global Const $NUMCOLORS                         = 24
Global Const $PDEVICESIZE                       = 26
Global Const $CURVECAPS                         = 28
Global Const $LINECAPS                          = 30
Global Const $POLYGONALCAPS                     = 32
Global Const $TEXTCAPS                          = 34
Global Const $CLIPCAPS                          = 36
Global Const $RASTERCAPS                        = 38
Global Const $ASPECTX                           = 40
Global Const $ASPECTY                           = 42
Global Const $ASPECTXY                          = 44
Global Const $LOGPIXELSY                        = 90
Global Const $SIZEPALETTE                       = 104
Global Const $NUMRESERVED                       = 106
Global Const $COLORRES                          = 108
Global Const $PHYSICALWIDTH                     = 110
Global Const $PHYSICALHEIGHT                    = 111
Global Const $PHYSICALOFFSETX                   = 112
Global Const $PHYSICALOFFSETY                   = 113
Global Const $SCALINGFACTORX                    = 114
Global Const $SCALINGFACTORY                    = 115
Global Const $VREFRESH                          = 116
Global Const $DESKTOPVERTRES                    = 117
Global Const $DESKTOPHORZRES                    = 118
Global Const $BLTALIGNMENT                      = 119

; ===============================================================================================================================
; Stock Logical Objects Constants
; ===============================================================================================================================

Global Const $WHITE_BRUSH                       = 0
Global Const $LTGRAY_BRUSH                      = 1
Global Const $GRAY_BRUSH                        = 2
Global Const $DKGRAY_BRUSH                      = 3
Global Const $BLACK_BRUSH                       = 4
Global Const $NULL_BRUSH                        = 5
Global Const $HOLLOW_BRUSH                      = 5
Global Const $WHITE_PEN                         = 6
Global Const $BLACK_PEN                         = 7
Global Const $NULL_PEN                          = 8
Global Const $OEM_FIXED_FONT                    = 10
Global Const $ANSI_FIXED_FONT                   = 11
Global Const $ANSI_VAR_FONT                     = 12
Global Const $SYSTEM_FONT                       = 13
Global Const $DEVICE_DEFAULT_FONT               = 14
Global Const $DEFAULT_PALETTE                   = 15
Global Const $SYSTEM_FIXED_FONT                 = 16
Global Const $DEFAULT_GUI_FONT                  = 17

; ===============================================================================================================================
; Ternary raster operations
; ===============================================================================================================================

Global Const $SRCCOPY                           = 0x00CC0020
Global Const $SRCPAINT                          = 0x00EE0086
Global Const $SRCAND                            = 0x008800C6
Global Const $SRCINVERT                         = 0x00660046
Global Const $SRCERASE                          = 0x00440328
Global Const $NOTSRCCOPY                        = 0x00330008
Global Const $NOTSRCERASE                       = 0x001100A6
Global Const $MERGECOPY                         = 0x00C000CA
Global Const $MERGEPAINT                        = 0x00BB0226
Global Const $PATCOPY                           = 0x00F00021
Global Const $PATPAINT                          = 0x00FB0A09
Global Const $PATINVERT                         = 0x005A0049
Global Const $DSTINVERT                         = 0x00550009
Global Const $BLACKNESS                         = 0x00000042
Global Const $WHITENESS                         = 0x00FF0062