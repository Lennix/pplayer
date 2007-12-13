#include-once

; #INDEX# =======================================================================================================================
; Title .........: Structures
; AutoIt Version: 3.2.++
; Description:    Structures.
; ===============================================================================================================================

#cs==============================================================================================================================
	; #LISTING# =====================================================================================================================
	$tagCOMBOBOXEXITEM
	$tagNMCBEDRAGBEGIN
	$tagNMCBEENDEDIT
	$tagNMCOMBOBOXEX
	$tagDTPRANGE
	$tagDTPTIME
	$tagNMDATETIMECHANGE
	$tagNMDATETIMEFORMAT
	$tagNMDATETIMEFORMATQUERY
	$tagNMDATETIMEKEYDOWN
	$tagNMDATETIMESTRING
	$tagEVENTLOGRECORD
	$tagGDIPBITMAPDATA
	$tagGDIPENCODERPARAM
	$tagGDIPENCODERPARAMS
	$tagGDIPRECTF
	$tagGDIPSTARTUPINPUT
	$tagGDIPSTARTUPOUTPUT
	$tagGDIPIMAGECODECINFO
	$tagGDIPPENCODERPARAMS
	$tagHDITEM
	$tagNMHDDISPINFO
	$tagNMHDFILTERBTNCLICK
	$tagNMHEADER
	$tagGETIPAddress
	$tagNMIPADDRESS
	$tagLVITEM
	$tagNMLISTVIEW
	$tagNMLVDISPINFO
	$tagNMLVFINDITEM
	$tagNMLVGETINFOTIP
	$tagNMITEMACTIVATE
	$tagNMLVKEYDOWN
	$tagNMLVSCROLL
	$tagMCHITTESTINFO
	$tagMCMONTHRANGE
	$tagMCRANGE
	$tagMCSELRANGE
	$tagNMDAYSTATE
	$tagNMSELCHANGE
	$tagNMOBJECTNOTIFY
	$tagNMTCKEYDOWN
	$tagTVITEMEX
	$tagNMTREEVIEW
	$tagNMTVCUSTOMDRAW
	$tagNMTVDISPINFO
	$tagNMTVGETINFOTIP
	$tagTVHITTESTINFO
	$tagNMTVKEYDOWN
	$tagNMHDR
	$tagNMMOUSE
	$tagPOINT
	$tagRECT
	$tagSIZE
	$tagTOKEN_PRIVILEGES
	$tagIMAGEINFO
	$tagFILETIME
	$tagSYSTEMTIME
	$tagTIME_ZONE_INFORMATION
	$tagBLENDFUNCTION
	$tagGUID
	$tagWINDOWPOS
	; ===============================================================================================================================
	
	; #INTERNAL_USE_ONLY#============================================================================================================
	$tagCOMBOBOXINFO
	$tagEDITBALLOONTIP
	$tagEVENTREAD
	$tagHDHITTESTINFO
	$tagHDLAYOUT
	$tagHDTEXTFILTER
	$tagLVBKIMAGE
	$tagLVCOLUMN
	$tagLVFINDINFO
	$tagLVGROUP
	$tagLVHITTESTINFO
	$tagLVINSERTMARK
	$tagLVSETINFOTIP
	$tagTCHITTESTINFO
	$tagTCITEM
	$tagNMTTDISPINFO
	$tagTTGETTITLE
	$tagTTHITTESTINFO
	$tagTVINSERTSTRUCT
	$tagBITMAPINFO
	$tagBORDERS
	$tagCHOOSECOLOR
	$tagCHOOSEFONT
	$tagCURSORINFO
	$tagDISPLAY_DEVICE
	$tagFLASHWINDOW
	$tagICONINFO
	$tagIMAGELISTDRAWPARAMS
	$tagLOGFONT
	$tagMEMMAP
	$tagPBRANGE
	$tagTOOLINFO
#ce==============================================================================================================================

; ===============================================================================================================================
; *******************************************************************************************************************************
; ComboBox Structures
; *******************************************************************************************************************************
; ===============================================================================================================================
; #INTERNAL_USE_ONLY#============================================================================================================
; Name...........: $tagCOMBOBOXINFO
; Description ...: Contains combo box status information
; Fields ........: cbSize      - The size, in bytes, of the structure. The calling application must set this to sizeof(COMBOBOXINFO).
;                  rcItem      - A RECT structure that specifies the coordinates of the edit box.
;                  |EditLeft
;                  |EditTop
;                  |EditRight
;                  |EditBottom
;                  rcButton    - A RECT structure that specifies the coordinates of the button that contains the drop-down arrow.
;                  |BtnLeft
;                  |BtnTop
;                  |BtnRight
;                  |BtnBottom
;                  stateButton - The combo box button state. This parameter can be one of the following values.
;                  |0                       - The button exists and is not pressed.
;                  |$STATE_SYSTEM_INVISIBLE - There is no button.
;                  |$STATE_SYSTEM_PRESSED   - The button is pressed.
;                  hCombo      - A handle to the combo box.
;                  hEdit       - A handle to the edit box.
;                  hList       - A handle to the drop-down list.
; Author ........: Gary Frost (gafrost)
; Remarks .......:
; ===============================================================================================================================
Global Const $tagCOMBOBOXINFO = "dword Size;int EditLeft;int EditTop;int EditRight;int EditBottom;int BtnLeft;int BtnTop;" & _
		"int BtnRight;int BtnBottom;dword BtnState;hwnd hCombo;hwnd hEdit;hwnd hList"

; ===============================================================================================================================
; *******************************************************************************************************************************
; ComboBoxEx Structures
; *******************************************************************************************************************************
; ===============================================================================================================================
; #STRUCTURE# ===================================================================================================================
; Name...........: $tagCOMBOBOXEXITEM
; Description ...: Contains information about an item in a ComboBoxEx control
; Fields ........: Mask                 - A set of bit flags that specify attributes.  Can be a combination of the following values.
;                  |CBEIF_DI_SETITEM    - Set this flag when processing CBEN_GETDISPINFO
;                  |CBEIF_IMAGE         - The iImage member is valid or must be filled in.
;                  |CBEIF_INDENT        - The iIndent member is valid or must be filled in.
;                  |CBEIF_LPARAM        - The lParam member is valid or must be filled in.
;                  |CBEIF_OVERLAY       - The iOverlay member is valid or must be filled in.
;                  |CBEIF_SELECTEDIMAGE - The iSelectedImage member is valid or must be filled in.
;                  |CBEIF_TEXT          - The pszText member is valid or must be filled in.
;                  Item                 - The zero-based index of the item.
;                  pszText              - A pointer to a character buffer that contains or receives the item's text.
;                  TextMax              - The length of pszText, in TCHARs. If text information is being set, this member is ignored.
;                  Image                - The zero-based index of an image within the image list.
;                  SelectedImage        - The zero-based index of an image within the image list.
;                  OverlayImage         - The one-based index of an overlay image within the image list.
;                  Indent               - The number of indent spaces to display for the item. Each indentation equals 10 pixels.
;                  Param                - A value specific to the item.
; Author ........: Gary Frost (gafrost)
; Remarks .......:
; ===============================================================================================================================
Global Const $tagCOMBOBOXEXITEM = "int Mask;int Item;ptr Text;int TextMax;int Image;int SelectedImage;int OverlayImage;" & _
		"int Indent;int Param"

; #STRUCTURE# ===================================================================================================================
; Name...........: $tagNMCBEDRAGBEGIN
; Description ...: Contains information used with the $CBEN_DRAGBEGIN notification message
; Fields ........: hWndFrom             - A window handle to the control sending the message
;                  IDFrom               - An identifier of the control sending the message
;                  Code                 - A notification code
;                  ItemID               - The zero-based index of the item being dragged.  This value will always be -1,
;                  +indicating that the item being dragged is the item displayed in the edit portion of the control.
;                  Text                 - The character buffer that contains the text of the item being dragged
; Author ........: Gary Frost (gafrost)
; Remarks .......:
; ===============================================================================================================================
Global Const $tagNMCBEDRAGBEGIN = "hwnd hWndFrom;int IDFrom;int Code;int ItemID;char Text[1024]"

; #STRUCTURE# ===================================================================================================================
; Name...........: $tagNMCBEENDEDIT
; Description ...: Contains information about the conclusion of an edit operation within a ComboBoxEx control
; Fields ........: hWndFrom             - A window handle to the control sending the message
;                  IDFrom               - An identifier of the control sending the message
;                  Code                 - A notification code
;                  fChanged             - Indicating whether the contents of the control's edit box have changed
;                  NewSelection         - The zero-based index of the item that will be selected after completing the edit operation
;                  +This value can be $CB_ERR if no item will be selected
;                  Text                  - A zero-terminated string that contains the text from within the control's edit box
;                  Why                   - The action that generated the $CBEN_ENDEDIT notification message
;                  +This value can be one of the following:
;                  |$CBENF_DROPDOWN      - The user activated the drop-down list
;                  |$CBENF_ESCAPE        - The user pressed ESC
;                  |$CBENF_KILLFOCUS     - The edit box lost the keyboard focus
;                  |$CBENF_RETURN        - The user completed the edit operation by pressing ENTER
; Author ........: Gary Frost (gafrost)
; Remarks .......:
; ===============================================================================================================================
Global Const $tagNMCBEENDEDIT = "hwnd hWndFrom;int IDFrom;int Code;int fChanged;int NewSelection;char Text[1024];int Why"

; #STRUCTURE# ===================================================================================================================
; Name...........: $tagNMCOMBOBOXEX
; Description ...: Contains information specific to ComboBoxEx items for use with notification messages
; Fields ........: hWndFrom             - A window handle to the control sending the message
;                  IDFrom               - An identifier of the control sending the message
;                  Code                 - A notification code
;                  Mask                 - A set of bit flags that specify attributes.  Can be a combination of the following values.
;                  |CBEIF_DI_SETITEM    - Set this flag when processing CBEN_GETDISPINFO
;                  |CBEIF_IMAGE         - The iImage member is valid or must be filled in.
;                  |CBEIF_INDENT        - The iIndent member is valid or must be filled in.
;                  |CBEIF_LPARAM        - The lParam member is valid or must be filled in.
;                  |CBEIF_OVERLAY       - The iOverlay member is valid or must be filled in.
;                  |CBEIF_SELECTEDIMAGE - The iSelectedImage member is valid or must be filled in.
;                  |CBEIF_TEXT          - The pszText member is valid or must be filled in.
;                  Item                 - The zero-based index of the item.
;                  pszText              - A pointer to a character buffer that contains or receives the item's text.
;                  TextMax              - The length of pszText, in TCHARs. If text information is being set, this member is ignored.
;                  Image                - The zero-based index of an image within the image list.
;                  SelectedImage        - The zero-based index of an image within the image list.
;                  OverlayImage         - The one-based index of an overlay image within the image list.
;                  Indent               - The number of indent spaces to display for the item. Each indentation equals 10 pixels.
;                  Param                - A value specific to the item.
; Author ........: Gary Frost (gafrost)
; Remarks .......:
; ===============================================================================================================================
Global Const $tagNMCOMBOBOXEX = "hwnd hWndFrom;int IDFrom;int Code;int Mask;int Item;ptr Text;int TextMax;int Image;" & _
		"int SelectedImage;int OverlayImage;int Indent;int Param"

; ===============================================================================================================================
; *******************************************************************************************************************************
; Date/Time Structures
; *******************************************************************************************************************************
; ===============================================================================================================================
; #STRUCTURE# ===================================================================================================================
; Name...........: $tagDTPRANGE
; Description ...: Specifies a date and time, in coordinated universal time (UTC)
; Fields ........: MinYear    - Minimum year
;                  MinMonth   - Minimum month
;                  MinDOW     - Minimum day of week
;                  MinDay     - Minimum day
;                  MinHour    - Minimum hour
;                  MinMinute  - Minimum minute
;                  MinSecond  - Minimum second
;                  MinMSecond - Minimum milliseconds
;                  MaxYear    - Maximum year
;                  MaxMonth   - Maximum month
;                  MaxDOW     - Maximum day of week
;                  MaxDay     - Maximum day
;                  MaxHour    - Maximum hour
;                  MaxMaxute  - Maximum Minute
;                  MaxSecond  - Maximum second
;                  MaxMSecond - Maximum milliseconds
;                  MinValid   - If True, minimum data is valid
;                  MaxValid   - If True, maximum data is valid
; Author ........: Paul Campbell (PaulIA)
; Remarks .......:
; ===============================================================================================================================
Global Const $tagDTPRANGE = "short MinYear;short MinMonth;short MinDOW;short MinDay;short MinHour;short MinMinute;" & _
		"short MinSecond;short MinMSecond;short MaxYear;short MaxMonth;short MaxDOW;short MaxDay;short MaxHour;" & _
		"short MaxMinute;short MaxSecond;short MaxMSecond;int MinValid;int MaxValid"

; #STRUCTURE# ===================================================================================================================
; Name...........: $tagDTPTIME
; Description ...: Specifies a date and time, in coordinated universal time (UTC)
; Fields ........: Year    - Year
;                  Month   - Month
;                  DOW     - Day of week
;                  Day     - Day
;                  Hour    - Hour
;                  Minute  - Minute
;                  Second  - Second
;                  MSecond - Milliseconds
; Author ........: Paul Campbell (PaulIA)
; Remarks .......:
; ===============================================================================================================================
Global Const $tagDTPTIME = "short Year;short Month;short DOW;short Day;short Hour;short Minute;short Second;short MSecond"

; #STRUCTURE# ===================================================================================================================
; Name...........: $tagNMDATETIMECHANGE
; Description ...: Contains information about a change that has taken place in a date and time picker (DTP) control
; Fields ........: hWndFrom - Window handle to the control sending a message
;                  IDFrom  - Identifier of the control sending a message
;                  Code    - Notification code
;                  Flags   - Indicates if the control is set to "no date" status.  This flag also specifies whether the  contents
;                  +of the date are valid and contain current time information. This value can be one of the following:
;                  | $GDT_NONE  - The control is set to "no date" status
;                  | $GDT_VALID - The control is not set to the "no date" status
;                  Year    - Year
;                  Month   - Month
;                  DOW     - Day of week
;                  Day     - Day
;                  Hour    - Hour
;                  Minute  - Minute
;                  Second  - Second
;                  MSecond - Milliseconds
; Author ........: Paul Campbell (PaulIA)
; Remarks .......: This  structure  is  used  with  the $DTN_DATETIMECHANGE notification message
; ===============================================================================================================================
Global Const $tagNMDATETIMECHANGE = "hwnd hWndFrom;int IDFrom;int Code;int Flag;short Year;short Month;short DOW;short Day;" & _
		"short Hour;short Minute;short Second;short MSecond"

; #STRUCTURE# ===================================================================================================================
; Name...........: $tagNMDATETIMEFORMAT
; Description ...: Contains information about a portion of the format string that defines a callback field within a date and time picker (DTP) control
; Fields ........: hWndFrom  - Window handle to the control sending a message
;                  IDFrom   - Identifier of the control sending a message
;                  Code     - Notification code
;                  Format   - Pointer to a null terminated string that defines the control callback field.  The string  comprises
;                  +one or more "X" characters.
;                  Year     - Year
;                  Month    - Month
;                  DOW      - Day of week
;                  Day      - Day
;                  Hour     - Hour
;                  Minute   - Minute
;                  Second   - Second
;                  MSecond  - Milliseconds
;                  pDisplay - Pointer to a null terminated string that contains the display text of the control. By default, this
;                  +is the address of the Display member of this structure.  It is acceptable to have pDisplay point to an
;                  +existing string. In this case, you don't need to assign a value to Display. However, the string that pDisplay
;                  +points to must remain valid until another $DTN_FORMAT notification is sent or until the control is destroyed.
;                  Display  - 64 character buffer that is to receive the null terminated string that the control will display. It
;                  +is not necessary to fill the entire buffer.
; Author ........: Paul Campbell (PaulIA)
; Remarks .......: It carries the string that defines the callback field and contains a buffer to receive the string that will
;                  be displayed in the callback field. This structure is used with the $DTN_FORMAT notification message.
; ===============================================================================================================================
Global Const $tagNMDATETIMEFORMAT = "hwnd hWndFrom;int IDFrom;int Code;ptr Format;short Year;short Month;short DOW;short Day;" & _
		"short Hour;short Minute;short Second;short MSecond;ptr pDisplay;char Display[64]"

; #STRUCTURE# ===================================================================================================================
; Name...........: $tagNMDATETIMEFORMATQUERY
; Description ...: Contains information about the control callback field
; Fields ........: hWndFrom - Window handle to the control sending a message
;                  IDFrom  - Identifier of the control sending a message
;                  Code    - Notification code
;                  Format  - Pointer to a null terminated string that defines the control callback field.  The string  comprises
;                  +one or more "X" characters.
;                  SizeX   - Must be filled with the maximum width of the text that will be displayed in the callback field
;                  SizeY   - Must be filled with the maximum height of the text that will be displayed in the callback field
; Author ........: Paul Campbell (PaulIA)
; Remarks .......: It contains a string (taken from the control's format string) that defines a callback field. The structure
;                  receives the maximum allowable size of the text that will be displayed in the callback field. This structure
;                  is used with the $DTN_FORMATQUERY notification message.
; ===============================================================================================================================
Global Const $tagNMDATETIMEFORMATQUERY = "hwnd hWndFrom;int IDFrom;int Code;ptr Format;int SizeX;int SizeY"

; #STRUCTURE# ===================================================================================================================
; Name...........: $tagNMDATETIMEKEYDOWN
; Description ...: Carries information used to describe and handle a $DTN_WMKEYDOWN notification message
; Fields ........: hWndFrom - Window handle to the control sending a message
;                  IDFrom  - Identifier of the control sending a message
;                  Code    - Notification code
;                  VirtKey - Virtual key code that represents the key that the user pressed
;                  Format  - Pointer to a null terminated string that defines the control callback field.  The  string  comprises
;                  +one or more "X" characters.
;                  Year    - Year
;                  Month   - Month
;                  DOW     - Day of week
;                  Day     - Day
;                  Hour    - Hour
;                  Minute  - Minute
;                  Second  - Second
;                  MSecond - Milliseconds
; Author ........: Paul Campbell (PaulIA)
; Remarks .......:
; ===============================================================================================================================
Global Const $tagNMDATETIMEKEYDOWN = "hwnd hWndFrom;int IDFrom;int Code;int VirtKey;ptr Format;short Year;short Month;short DOW;" & _
		"short Day;short Hour;short Minute;short Second;short MSecond"

; #STRUCTURE# ===================================================================================================================
; Name...........: $tagNMDATETIMESTRING
; Description ...: Contains information specific to an edit operation that has taken place in the control
; Fields ........: hWndFrom    - Window handle to the control sending a message
;                  IDFrom     - Identifier of the control sending a message
;                  Code       - Notification code
;                  UserString - Address of the null terminated string that the user entered
;                  Year       - Year
;                  Month      - Month
;                  DOW        - Day of week
;                  Day        - Day
;                  Hour       - Hour
;                  Minute     - Minute
;                  Second     - Second
;                  MSecond    - Milliseconds
;                  Flags      - Return field. Set this member to $GDT_VALID to indicate that the date is valid or to $GDT_NONE to
;                  +set the control to "no date" status ($DTS_SHOWNONE style only).
; Author ........: Paul Campbell (PaulIA)
; Remarks .......: This message is used with the $DTN_USERSTRING notification message.
; ===============================================================================================================================
Global Const $tagNMDATETIMESTRING = "hwnd hWndFrom;int IDFrom;int Code;ptr UserString;short Year;short Month;short DOW;short Day;" & _
		"short Hour;short Minute;short Second;short MSecond;int Flags"

; ===============================================================================================================================
; *******************************************************************************************************************************
; Edit Structures
; *******************************************************************************************************************************
; ===============================================================================================================================
; #INTERNAL_USE_ONLY#============================================================================================================
; Name...........: $tagEDITBALLOONTIP
; Description ...: Contains information about a balloon tip
; Fields ........: Size     - Size of this structure, in bytes
;                  Title    - Pointer to the buffer that holds Title of the ToolTip
;                  Text     - Pointer to the buffer that holds Text of the ToolTip
;                  Icon     - Type of Icon.  This can be one of the following values:
;                  |$TTI_ERROR   - Use the error icon
;                  |$TTI_INFO    - Use the information icon
;                  |$TTI_NONE    - Use no icon
;                  |$TTI_WARNING - Use the warning icon
; Author ........: Gary Frost (gafrost)
; Remarks .......: For use with Edit control (minimum O.S. Win XP)
; ===============================================================================================================================
Global Const $tagEDITBALLOONTIP = "dword Size;ptr Title;ptr Text;int Icon"

; ===============================================================================================================================
; *******************************************************************************************************************************
; Event Log Structures
; *******************************************************************************************************************************
; ===============================================================================================================================
; #STRUCTURE# ===================================================================================================================
; Name...........: $tagEVENTLOGRECORD
; Description ...: Contains information about an event record
; Fields ........: Length              - The size of this event record, in bytes
;                  Reserved            - Reserved
;                  RecordNumber        - The number of the record
;                  TimeGenerated       - The time at which this entry was submitted
;                  TimeWritten         - The time at which this entry was received by the service to be written to the log
;                  EventID             - The event identifier
;                  EventType           - The type of event
;                  NumStrings          - The number of strings present in the log
;                  EventCategory       - The category for this event
;                  ReservedFlags       - Reserved
;                  ClosingRecordNumber - Reserved
;                  StringOffset        - The offset of the description strings within this event log record
;                  UserSidLength       - The size of the UserSid member, in bytes
;                  UserSidOffset       - The offset of the security identifier (SID) within this event log record
;                  DataLength          - The size of the event-specific data (at the position indicated by DataOffset), in bytes
;                  DataOffset          - The offset of the event-specific information within this event log record, in bytes
; Author ........: Paul Campbell (PaulIA)
; Remarks .......:
; ===============================================================================================================================
Global Const $tagEVENTLOGRECORD = "int Length;int Reserved;int RecordNumber;int TimeGenerated;int TimeWritten;int EventID;" & _
		"short EventType;short NumStrings;short EventCategory;short ReservedFlags;int ClosingRecordNumber;int StringOffset;" & _
		"int UserSidLength;int UserSidOffset;int DataLength;int DataOffset"

; #INTERNAL_USE_ONLY#============================================================================================================
; Name...........: $tagEVENTREAD
; Description ...: tagEVENTREAD structure
; Fields ........: Buffer    - Buffer for the data read from the event log
;                  BytesRead - The size of the buffer, in bytes
;                  BytesMin  - The number of bytes required for the next log entry
; Author ........: Paul Campbell (PaulIA)
; Remarks .......:
; ===============================================================================================================================
Global Const $tagEVENTREAD = "byte Buffer[4096];int BytesRead;int BytesMin"

; ===============================================================================================================================
; *******************************************************************************************************************************
; GDI+ Structures
; *******************************************************************************************************************************
; ===============================================================================================================================

; #STRUCTURE# ===================================================================================================================
; Name...........: $tagGDIPBITMAPDATA
; Description ...: Bitmap Data
; Fields ........: Width    - Number of pixels in one scan line of the bitmap
;                  Height   - Number of scan lines in the bitmap
;                  Stride   - Offset, in bytes, between consecutive scan lines of the bitmap.  If the  stride  is  positive,  the
;                  +bitmap is top-down. If the stride is negative, the bitmap is bottom-up
;                  Format   - Specifies the pixel format of the bitmap
;                  Scan0    - Pointer to the first (index 0) scan line of the bitmap
;                  Reserved - Reserved for future use
; Author ........: Paul Campbell (PaulIA)
; Remarks .......:
; ===============================================================================================================================
Global Const $tagGDIPBITMAPDATA = "uint Width;uint Height;int Stride;uint Format;ptr Scan0;ptr Reserved"

; #STRUCTURE# ===================================================================================================================
; Name...........: $tagGDIPENCODERPARAM
; Description ...: $tagGDIPENCODERPARAM structure
; Fields ........: GUID   - Indentifies the parameter category (GDI_EPG constants)
;                  Count  - Number of values in the array pointed to by the Value member
;                  Type   - Identifies the data type of the parameters (GDI_EPT constants)
;                  Values - Pointer to an array of values. Each value has the type specified by the Type member.
; Author ........: Paul Campbell (PaulIA)
; Remarks .......:
; ===============================================================================================================================
Global Const $tagGDIPENCODERPARAM = "byte GUID[16];dword Count;dword Type;ptr Values"

; #STRUCTURE# ===================================================================================================================
; Name...........: $tagGDIPENCODERPARAMS
; Description ...: $tagGDIPENCODERPARAMS structure
; Fields ........: Count  - Number of $tagGDIPENCODERPARAM structures in the array
;                  Params - Start of $tagGDIPENCODERPARAM structures
; Author ........: Paul Campbell (PaulIA)
; Remarks .......:
; ===============================================================================================================================
Global Const $tagGDIPENCODERPARAMS = "dword Count;byte Params[0]"

; #STRUCTURE# ===================================================================================================================
; Name...........: $tagGDIPRECTF
; Description ...: $tagGDIPRECTF structure
; Fields ........: X      - X coordinate of upper left hand corner of rectangle
;                  Y      - Y coordinate of upper left hand corner of rectangle
;                  Width  - Rectangle width
;                  Height - Rectangle height
; Author ........: Paul Campbell (PaulIA)
; Remarks .......:
; ===============================================================================================================================
Global Const $tagGDIPRECTF = "float X;float Y;float Width;float Height"

; #STRUCTURE# ===================================================================================================================
; Name...........: $tagGDIPSTARTUPINPUT
; Description ...: $tagGDIPSTARTUPINPUT structure
; Fields ........: Version  - Specifies the version of Microsoft Windows GDI+
;                  Callback - Pointer to a callback function that GDI+ can call, on debug builds, for assertions and warnings
;                  NoThread - Boolean value that specifies whether to suppress the GDI+ background thread. If you set this member
;                  +to True, GdiplusStartup returns a pointer to a hook function and a pointer to an  unhook  function.  You must
;                  +call those functions appropriately to replace the background thread. If you do not want to be responsible for
;                  +calling the hook and unhook functions, set this member to False.
;                  NoCodecs - Boolean value that specifies whether you want GDI+ to suppress external image codecs.  GDI+ version
;                  +1.0 does not support external image codecs, so this parameter is ignored.
; Author ........: Paul Campbell (PaulIA)
; Remarks .......:
; ===============================================================================================================================
Global Const $tagGDIPSTARTUPINPUT = "int Version;ptr Callback;int NoThread;int NoCodecs"

; #STRUCTURE# ===================================================================================================================
; Name...........: $tagGDIPSTARTUPOUTPUT
; Description ...: $tagGDIPSTARTUPOUTPUT structure
; Fields ........: HookProc   - Receives a pointer to a hook function
;                  UnhookProc - Receives a pointer to an unhook function
; Author ........: Paul Campbell (PaulIA)
; Remarks .......:
; ===============================================================================================================================
Global Const $tagGDIPSTARTUPOUTPUT = "ptr HookProc;ptr UnhookProc"

; #STRUCTURE# ===================================================================================================================
; Name...........: $tagGDIPIMAGECODECINFO
; Description ...: $tagGDIPIMAGECODECINFO structure
; Fields ........: CLSID      - Codec identifier (GUID structure)
;                  FormatID   - File format identifier (GUID structure)
;                  CodecName  - Pointer to a Unicode null terminated string that contains the codec name
;                  DllName    - Pointer to a Unicode null terminated string that contains the path name of the DLL in  which  the
;                  +codec resides. If the codec is not in a DLL, this pointer is 0.
;                  FormatDesc - Pointer to a Unicode null terminated string that contains the name of the file format used by the
;                  +codec.
;                  FileExt    - Pointer to a Unicode null terminated string that contains all filename extensions associated with
;                  +the codec. The extensions are separated by semicolons.
;                  MimeType   - Pointer to a null-terminated string that contains the mime type of the codec
;                  Flags      - Combination of $GDIP_ICF flags
;                  Version    - Indicates the version of the codec
;                  SigCount   - Indicates the number of signatures used by the file format associated with the codec
;                  SigSize    - Indicates the number of bytes in each signature
;                  SigPattern - Pointer to an array of bytes that contains the pattern for each signature
;                  SigMask    - Pointer to an array of bytes that contains the mask for each signature
; Author ........: Paul Campbell (PaulIA)
; Remarks .......:
; ===============================================================================================================================
Global Const $tagGDIPIMAGECODECINFO = "byte CLSID[16];byte FormatID[16];ptr CodecName;ptr DllName;ptr FormatDesc;ptr FileExt;" & _
		"ptr MimeType;dword Flags;dword Version;dword SigCount;dword SigSize;ptr SigPattern;ptr SigMask"

; #STRUCTURE# ===================================================================================================================
; Name...........: $tagGDIPPENCODERPARAMS
; Description ...: tagGDIPPENCODERPARAMS structure
; Fields ........: Count  - Number of tagGDIPENCODERPARAM structures in the array
;                  Params - Start of tagGDIPENCODERPARAM structures
; Author ........: Paul Campbell (PaulIA)
; Remarks .......:
; ===============================================================================================================================
Global Const $tagGDIPPENCODERPARAMS = "dword Count;byte Params[0]"

; ===============================================================================================================================
; *******************************************************************************************************************************
; Header Structures
; *******************************************************************************************************************************
; ===============================================================================================================================
; #INTERNAL_USE_ONLY#============================================================================================================
; Name...........: $tagHDHITTESTINFO
; Description ...: Contains information about a hit test
; Fields ........: X     - Horizontal postion to be hit test, in client coordinates
;                  Y     - Vertical position to be hit test, in client coordinates
;                  Flags - Information about the results of a hit test
;                  Item  - If the hit test is successful, contains the index of the item at the hit test point
; Author ........: Paul Campbell (PaulIA)
; Remarks .......: This structure is used with the $HDM_HITTEST message.
; ===============================================================================================================================
Global Const $tagHDHITTESTINFO = "int X;int Y;int Flags;int Item"

; #STRUCTURE# ===================================================================================================================
; Name...........: $tagHDITEM
; Description ...: Contains information about an item in a header control
; Fields ........: Mask    - Flags indicating which other structure members contain valid data or must be filled in
;                  XY      - Width or height of the item
;                  Text    - Address of Item string
;                  hBMP    - Handle to the item bitmap
;                  TextMax - Length of the item string
;                  Fmt     - Flags that specify the item's format
;                  Param   - Application-defined item data
;                  Image   - Zero-based index of an image within the image list
;                  Order   - Order in which the item appears within the header control, from left to right
;                  Type    - Type of filter specified by pFilter
;                  pFilter - Address of an application-defined data item
;                  State   - Item state
; Author ........: Paul Campbell (PaulIA)
; Remarks .......:
; ===============================================================================================================================
Global Const $tagHDITEM = "int Mask;int XY;ptr Text;hwnd hBMP;int TextMax;int Fmt;int Param;int Image;int Order;int Type;ptr pFilter;int State"

; #INTERNAL_USE_ONLY#============================================================================================================
; Name...........: $tagHDLAYOUT
; Description ...: Contains information used to set the size and position of the control
; Fields ........: Rect      - Pointer to a RECT structure that contains the rectangle that the header control will occupy
;                  WindowPos - Pointer to a WINDOWPOS structure that receives information about the size/position of the control
; Author ........: Paul Campbell (PaulIA)
; Remarks .......: This structure is used with the $HDM_LAYOUT message
; ===============================================================================================================================
Global Const $tagHDLAYOUT = "ptr Rect;ptr WindowPos"

; #INTERNAL_USE_ONLY#============================================================================================================
; Name...........: $tagHDTEXTFILTER
; Description ...: Contains information about header control text filters
; Fields ........: Text    - Pointer to the buffer containing the filter
;                  TextMax - The maximum size, in characters, for an edit control buffer
; Author ........: Paul Campbell (PaulIA)
; Remarks .......:
; ===============================================================================================================================
Global Const $tagHDTEXTFILTER = "ptr Text;int TextMax"

; #STRUCTURE# ===================================================================================================================
; Name...........: $tagNMHDDISPINFO
; Description ...: Contains information used in handling $HDN_GETDISPINFO notification messages
; Fields ........: WndFrom - Window handle to the control sending a message
;                  IDFrom  - Identifier of the control sending a message
;                  Code    - Notification code
;                  Item    - Zero based index of the item in the header control
;                  Mask    - Set of bit flags specifying which members of the structure must be filled in by  the  owner  of  the
;                  +control. This value can be a combination of the following values:
;                  |$HDI_TEXT       - The Text field must be filled in
;                  |$HDI_IMAGE      - The Image field must be filled in
;                  |$HDI_LPARAM     - The lParam field must be filled in
;                  |$HDI_DI_SETITEM - A return value. Indicates that the control should store the item information  and  not  ask
;                  +for it again.
;                  Text    - Pointer to a null terminated string containing the text that will be displayed for the header item
;                  TextMax - Size of the buffer that Text points to
;                  Image   - Zero based index of an image within the image list.  The specified image will be displayed with  the
;                  +header item, but it does not take the place of the item's bitmap.  If iImage is set to $I_IMAGECALLBACK,  the
;                  +control requests image information for this item by using an $HDN_GETDISPINFO notification message.
;                  lParam  - An application-defined value to associate with the item
; Author ........: Paul Campbell (PaulIA)
; Remarks .......:
; ===============================================================================================================================
Global Const $tagNMHDDISPINFO = "hwnd WndFrom;int IDFrom;int Code;int Item;int Mask;ptr Text;int TextMax;int Image;int lParam"

; #STRUCTURE# ===================================================================================================================
; Name...........: $tagNMHDFILTERBTNCLICK
; Description ...: Specifies or receives the attributes of a filter button click
; Fields ........: hWndFrom - Window handle to the control sending a message
;                  IDFrom   - Identifier of the control sending a message
;                  Code     - Notification code
;                  Item     - Zero based index of the control to which this structure refers
;                  Left     - X coordinate of the upper left corner of the rectangle
;                  Top      - Y coordinate of the upper left corner of the rectangle
;                  Right    - X coordinate of the lower right corner of the rectangle
;                  Bottom   - Y coordinate of the lower right corner of the rectangle
; Author ........: Paul Campbell (PaulIA)
; Remarks .......:
; ===============================================================================================================================
Global Const $tagNMHDFILTERBTNCLICK = "hwnd hWndFrom;int IDFrom;int Code;int Item;int Left;int Top;int Right;int Bottom"

; #STRUCTURE# ===================================================================================================================
; Name...........: $tagNMHEADER
; Description ...: Contains information about control notification messages
; Fields ........: hWndFrom - Window handle to the control sending a message
;                  IDFrom   - Identifier of the control sending a message
;                  Code     - Notification code
;                  Item     - Zero based index of the control to which this structure refers
;                  Button   - Index of the mouse button used to generate the notification message.  This member can be one of  the
;                  +following values:
;                  |0 - Left button
;                  |1 - Right button
;                  |2 - Middle button
;                  pItem   - Optional pointer to a tagHDITEM structure containing information about the item specified  by  Item.
;                  +The mask member of the tagHDITEM structure indicates which of its members are valid.
; Author ........: Paul Campbell (PaulIA)
; Remarks .......:
; ===============================================================================================================================
Global Const $tagNMHEADER = "hwnd hWndFrom;int IDFrom;int Code;int Item;int Button;ptr pItem"

; ===============================================================================================================================
; *******************************************************************************************************************************
; IPAddress Structures
; *******************************************************************************************************************************
; ===============================================================================================================================
; #STRUCTURE# ===================================================================================================================
; Name...........: $tagGETIPAddress
; Description ...: Contains information for all 4 fields of the IP Address control
; Fields ........: Field4   - contains bits 0 through 7
;                  Field3   - contains bits 8 through 15
;                  Field2   - contains bits 16 through 23
;                  Field1   - contains bits 24 through 31
; Author ........: Gary Frost (gafrost)
; Remarks .......:
; ===============================================================================================================================
Global Const $tagGETIPAddress = "ubyte Field4;ubyte Field3;ubyte Field2;ubyte Field1"

; #STRUCTURE# ===================================================================================================================
; Name...........: $tagNMIPADDRESS
; Description ...: Contains information for the $IPN_FIELDCHANGED notification message
; Fields ........: hWndFrom    - Window handle to the control sending a message
;                  IDFrom     - Identifier of the control sending a message
;                  Code       - Notification code
;                  Field      - The zero-based number of the field that was changed.
;                  Value      - The new value of the field specified in the iField member.
;                  +While processing the $IPN_FIELDCHANGED notification, this member can be set to any value that is within the
;                  +range of the field and the control will place this new value in the field.
; Author ........: Gary Frost (gafrost)
; Remarks .......:
; ===============================================================================================================================
Global Const $tagNMIPADDRESS = "hwnd hWndFrom;int IDFrom;int Code;int Field;int Value"

; ===============================================================================================================================
; *******************************************************************************************************************************
; ListView Structures
; *******************************************************************************************************************************
; ===============================================================================================================================
; #INTERNAL_USE_ONLY#============================================================================================================
; Name...........: $tagLVBKIMAGE
; Description ...: Contains information about the background image of a list-view control
; Fields ........: Flags      - This member may be one or more of the following flags.  You can use the LVBKIF_SOURCE_MASK value
;                  +to mask off all but the source flags.  You can use the LVBKIF_STYLE_MASK value to mask off all but the  style
;                  +flags.
;                  |$LVBKIF_SOURCE_NONE     - The control has no background image
;                  |$LVBKIF_SOURCE_URL      - The Image member contains the URL of the background image
;                  |$LVBKIF_STYLE_NORMAL    - The background image is displayed normally
;                  |$LVBKIF_STYLE_TILE      - The background image will be tiled to fill the entire background of the control
;                  |$LVBKIF_FLAG_TILEOFFSET - You use this flag to specify the coordinates of the first tile.  This flag is valid
;                  +only if the $LVBKIF_STYLE_TILE flag is also specified. If this flag is not specified the first tile begins at
;                  +the upper-left corner of the client area.
;                  hBmp        - Not used
;                  Image       - Address of a string that contains the URL of the background image. This member is only valid if
;                  +the $LVBKIF_SOURCE_URL flag is set in Flags.  This member must be initialized to point  to  the  buffer  that
;                  +contains or receives the text before sending the message.
;                  ImageMax    - Size of the buffer at the address in Image.  If information is being sent to the  control,  this
;                  +member is ignored.
;                  XOffPercent - Percentage of the client area that the image should be offset horizontally.  For example, at  0
;                  +percent, the image will be displayed against the left edge of the control's client area.  At 50 percent,  the
;                  +image will be displayed horizontally centered in the control's client area. At 100 percent, the image will be
;                  +displayed against the right edge  of  the  control's  client  area.  This  member  is  only  valid  when  the
;                  +$LVBKIF_STYLE_NORMAL is specified in  Flags.  If  both  $LVBKIF_FLAG_TILEOFFSET  and  $LVBKIF_STYLE_TILE  are
;                  +specified in Flags, then the value specifies the pixel, not percentage offset, of the first tile.  Otherwise,
;                  +the value is ignored.
;                  YOffPercent - Percentage of the control's client area that the image should be offset vertically. For example
;                  +at 0 percent, the image will be displayed against the top edge of the control's client area.  At 50  percent,
;                  +the image will be displayed vertically centered in the control's client area.  At 100 percent, the image will
;                  +be displayed against the bottom edge of the control's client  area.  This  member  is  only  valid  when  the
;                  +$LVBKIF_STYLE_NORMAL is specified in  Flags.  If  both  $LVBKIF_FLAG_TILEOFFSET  and  $LVBKIF_STYLE_TILE  are
;                  +specified in Flags, then the value specifies the pixel, not percentage offset, of the first tile.  Otherwise,
;                  +the value is ignored.
; Author ........: Paul Campbell (PaulIA)
; Remarks .......:
; ===============================================================================================================================
Global Const $tagLVBKIMAGE = "int Flags;hwnd hBmp;int Image;int ImageMax;int XOffPercent;int YOffPercent"

; #INTERNAL_USE_ONLY#============================================================================================================
; Name...........: $tagLVCOLUMN
; Description ...: Contains information about a column in report view
; Fields ........: Mask    - Variable specifying which members contain valid information.  This member can be zero,  or  one  or
;                  +more of the following values:
;                  |LVCF_FMT     - The Fmt member is valid
;                  |LVCF_WIDTH   - The CX member is valid
;                  |LVCF_TEXT    - The Text member is valid
;                  |LVCF_SUBITEM - The SubItem member is valid
;                  |LVCF_IMAGE   - The Image member is valid
;                  |LVCF_ORDER   - The Order member is valid.
;                  Fmt     - Alignment of the column header and the subitem text in the column.  This member can be one  of  the
;                  +following values. The alignment of the leftmost column is always left-justified; it cannot be changed:
;                  |LVCFMT_LEFT            - Text is left-aligned
;                  |LVCFMT_RIGHT           - Text is right-aligned
;                  |LVCFMT_CENTER          - Text is centered
;                  |LVCFMT_JUSTIFYMASK     - A bitmask used to select those bits of Fmt that control field justification
;                  |LVCFMT_IMAGE           - The item displays an image from an image list
;                  |LVCFMT_BITMAP_ON_RIGHT - The bitmap appears to the right of text
;                  |LVCFMT_COL_HAS_IMAGES  - The header item contains an image in the image list.
;                  CX      - Width of the column, in pixels
;                  Text    - If column information is being set, this member is the address of a string that contains the column
;                  +header text.  If the structure is receiving information about a column, this member specifies the address  of
;                  +the buffer that receives the column header text.
;                  TextMax - Size of the buffer pointed to by the Text member.  If the structure is  not  receiving  information
;                  +about a column, this member is ignored.
;                  SubItem - Index of subitem associated with the column
;                  Image   - Zero based index of an image within the image list
;                  Order   - Zero-based column offset. Column offset is in left-to-right order.
; Author ........: Paul Campbell (PaulIA)
; Remarks .......:
; ===============================================================================================================================
Global Const $tagLVCOLUMN = "int Mask;int Fmt;int CX;ptr Text;int TextMax;int SubItem;int Image;int Order"

; #INTERNAL_USE_ONLY#============================================================================================================
; Name...........: $tagLVFINDINFO
; Description ...: Contains information used when searching for a list-view item
; Fields ........: Flags     - Type of search to perform. This member can be set to one or more of the following values:
;                  |$LVFI_PARAM    - Searches for a match between this structure's Param member and the Param member of an item.
;                  +If $LVFI_PARAM is specified, all other flags are ignored.
;                  |$LVFI_PARTIAL  - Checks to see if the item text begins with the string pointed to by the Text  member.  This
;                  +value implies use of $LVFI_STRING.
;                  |$LVFI_STRING   - Searches based on the item text.  Unless additional values are specified, the item text  of
;                  +the matching item must exactly match the string pointed to by the Text member.
;                  |$LVFI_WRAP     - Continues the search at the beginning if no match is found
;                  |LVFI_NEARESTXY - Finds the item nearest to the position specified in the X and Y members, in  the  direction
;                  +specified by the Direction member. This flag is supported only by large icon and small icon modes.
;                  Text      - Address of a string to compare with the item text.  It is valid if $LVFI_STRING or  $LVFI_PARTIAL
;                  +is set in the Flags member.
;                  Param     - Value to compare with the Param member of an item's  $LVITEM  structure.  It  is  valid  only  if
;                  +$LVFI_PARAM is set in the flags member.
;                  X         - Initial X search position. It is valid only if $LVFI_NEARESTXY is set in the Flags member.
;                  Y         - Initial Y search position. It is valid only if $LVFI_NEARESTXY is set in the Flags member.
;                  Direction - Virtual key code that specifies the direction to search. The following codes are supported:
;                  |VK_LEFT
;                  |VK_RIGHT
;                  |VK_UP
;                  |VK_DOWN
;                  |VK_HOME
;                  |VK_END
;                  |VK_PRIOR
;                  |VK_NEXT
;                  |This member is valid only if $LVFI_NEARESTXY is set in the flags member.
; Author ........: Paul Campbell (PaulIA)
; Remarks .......:
; ===============================================================================================================================
Global Const $tagLVFINDINFO = "int Flags;ptr Text;int Param;int X;int Y;int Direction"

; #INTERNAL_USE_ONLY#============================================================================================================
; Name...........: $tagLVGROUP
; Description ...: Used to set and retrieve groups
; Fields ........: Size      - Size of this structure, in bytes
;                  Mask      - Mask that specifies which members of the structure are valid input.  Can be one or  more  of  the
;                  +following values:
;                  |$LVGF_NONE    - No other items are valid
;                  |$LVGF_HEADER  - Header and HeaderMax members are valid
;                  |$LVGF_FOOTER  - Reserved
;                  |$LVGF_STATE   - Reserved
;                  |$LVGF_ALIGN   - Align member is valid
;                  |$LVGF_GROUPID - GroupId member is valid
;                  Header    - Pointer to a string that contains the header text when item information is being  set.  If  group
;                  +information is being retrieved this member specifies the address of the buffer that receives the header text.
;                  HeaderMax - Size of the buffer pointed to by the Header member. If the structure is not receiving information
;                  +about a group, this member is ignored.
;                  Footer    - Reserved
;                  FooterMax - Reserved
;                  GroupID   - ID of the group
;                  StateMask - Reserved
;                  State     - Reserved
;                  Align     - Indicates the alignment of the header text.  It can have one or more of the following values. Use
;                  +one of the header flags.
;                  |LVGA_HEADER_CENTER - Header text is centered horizontally in the window
;                  |LVGA_HEADER_LEFT   - Header text is aligned at the left of the window
;                  |LVGA_HEADER_RIGHT  - Header text is aligned at the right of the window.
; Author ........: Paul Campbell (PaulIA)
; Remarks .......:
; ===============================================================================================================================
Global Const $tagLVGROUP = "int Size;int Mask;ptr Header;int HeaderMax;ptr Footer;int FooterMax;int GroupID;int StateMask;int State;int Align"

; #INTERNAL_USE_ONLY#============================================================================================================
; Name...........: $tagLVHITTESTINFO
; Description ...: Contains information about a hit test
; Fields ........: X       - X position to hit test
;                  Y       - Y position to hit test
;                  Flags   - Results of a hit test. Can be one or more of the following values:
;                  |$LVHT_ABOVE           - The position is above the control's client area
;                  |$LVHT_BELOW           - The position is below the control's client area
;                  |$LVHT_NOWHERE         - The position is inside the client window, but it is not over a list item
;                  |$LVHT_ONITEMICON      - The position is over an item's icon
;                  |$LVHT_ONITEMLABEL     - The position is over an item's text
;                  |$LVHT_ONITEMSTATEICON - The position is over the state image of an item
;                  |$LVHT_TOLEFT          - The position is to the left of the client area
;                  |$LVHT_TORIGHT         - The position is to the right of the client area
;                  Item    - Receives the index of the matching item. Or if hit-testing a subitem,  this  value  represents  the
;                  +subitem's parent item.
;                  SubItem - Receives the index of the matching subitem. When hit-testing an item, this member will be zero.
; Author ........: Paul Campbell (PaulIA)
; Remarks .......:
; ===============================================================================================================================
Global Const $tagLVHITTESTINFO = "int X;int Y;int Flags;int Item;int SubItem"

; #INTERNAL_USE_ONLY#============================================================================================================
; Name...........: $tagLVINSERTMARK
; Description ...: Used to describe insertion points
; Fields ........: Size     - Size of this structure, in bytes
;                  Flags    - Flag that specifies where the insertion point should appear:
;                  |$LVIM_AFTER - The insertion point appears after the item specified if the $LVIM_AFTER flag is set; otherwise
;                  +it appears before the specified item.
;                  Item     - Item next to which the insertion point appears. If -1, there is no insertion point.
;                  Reserved - Reserved. Must be set to 0.
; Author ........: Paul Campbell (PaulIA)
; Remarks .......:
; ===============================================================================================================================
Global Const $tagLVINSERTMARK = "uint Size;dword Flags;int Item;dword Reserved"

; #STRUCTURE# ===================================================================================================================
; Name...........: $tagLVITEM
; Description ...: Specifies or receives the attributes of a list-view item
; Fields ........: Mask      - Set of flags that specify which members of this structure contain data to be set or which members
;                  +are being requested. This member can have one or more of the following flags set:
;                  |$LVIF_COLUMNS     - The Columns member is valid
;                  |$LVIF_DI_SETITEM  - The operating system should store the requested list item information
;                  |$LVIF_GROUPID     - The GroupID member is valid
;                  |$LVIF_IMAGE       - The Image member is valid
;                  |$LVIF_INDENT      - The Indent member is valid
;                  |$LVIF_NORECOMPUTE - The control will not generate LVN_GETDISPINFO to retrieve text information
;                  |$LVIF_PARAM       - The Param member is valid
;                  |$LVIF_STATE       - The State member is valid
;                  |$LVIF_TEXT        - The Text member is valid
;                  Item      - Zero based index of the item to which this structure refers
;                  SubItem   - One based index of the subitem to which this structure refers
;                  State     - Indicates the item's state, state image, and overlay image
;                  StateMask - Value specifying which bits of the state member will be retrieved or modified
;                  Text      - Pointer to a string containing the item text
;                  TextMax   - Number of bytes in the buffer pointed to by Text, including the string terminator
;                  Image     - Index of the item's icon in the control's image list
;                  Param     - Value specific to the item
;                  Indent    - Number of image widths to indent the item
;                  GroupID   - Identifier of the tile view group that receives the item
;                  Columns   - Number of tile view columns to display for this item
;                  pColumns  - Pointer to the array of column indices
; Author ........: Paul Campbell (PaulIA)
; Remarks .......:
; ===============================================================================================================================
Global Const $tagLVITEM = "int Mask;int Item;int SubItem;int State;int StateMask;ptr Text;int TextMax;int Image;int Param;" & _
		"int Indent;int GroupID;int Columns;ptr pColumns"

; #STRUCTURE# ===================================================================================================================
; Name...........: $tagNMLISTVIEW
; Description ...: Contains information about a list-view notification message
; Fields ........: hWndFrom  - Window handle to the control sending a message
;                  IDFrom   - Identifier of the control sending a message
;                  Code     - Notification code
;                  Item     - Identifies the item, or -1 if not used
;                  SubItem  - Identifies the subitem, or zero if none
;                  NewState - New item state
;                  OldState - Old item state
;                  Changed  - Set of flags that indicate the item attributes that have changed
;                  ActionX  - X position at which the event occurred
;                  ActionY  - Y position at which the event occurred
;                  Param    - Application-defined value of the item
; Author ........: Paul Campbell (PaulIA)
; Remarks .......:
; ===============================================================================================================================
Global Const $tagNMLISTVIEW = "hwnd hWndFrom;int IDFrom;int Code;int Item;int SubItem;int NewState;int OldState;int Changed;" & _
		"int ActionX;int ActionY;int Param"

; #STRUCTURE# ===================================================================================================================
; Name...........: $tagNMLVDISPINFO
; Description ...: Contains information about an $LVN_GETDISPINFO or $LVN_SETDISPINFO notification message
; Fields ........: hWndFrom   - Window handle to the control sending a message
;                  IDFrom    - Identifier of the control sending a message
;                  Code      - Notification code
;                  Mask      - Set of flags that specify which members of this structure contain data to be set or which members
;                  +are being requested. This member can have one or more of the following flags set:
;                  |$LVIF_COLUMNS     - The Columns member is valid
;                  |$LVIF_DI_SETITEM  - The operating system should store the requested list item information
;                  |$LVIF_GROUPID     - The GroupID member is valid
;                  |$LVIF_IMAGE       - The Image member is valid
;                  |$LVIF_INDENT      - The Indent member is valid
;                  |$LVIF_NORECOMPUTE - The control will not generate LVN_GETDISPINFO to retrieve text information
;                  |$LVIF_PARAM       - The Param member is valid
;                  |$LVIF_STATE       - The State member is valid
;                  |$LVIF_TEXT        - The Text member is valid
;                  Item      - Zero based index of the item to which this structure refers
;                  SubItem   - One based index of the subitem to which this structure refers
;                  State     - Indicates the item's state, state image, and overlay image
;                  StateMask - Value specifying which bits of the state member will be retrieved or modified
;                  Text      - Pointer to a string containing the item text
;                  TextMax   - Number of bytes in the buffer pointed to by Text, including the string terminator
;                  Image     - Index of the item's icon in the control's image list
;                  Param     - Value specific to the item
;                  Indent    - Number of image widths to indent the item
;                  GroupID   - Identifier of the tile view group that receives the item
;                  Columns   - Number of tile view columns to display for this item
;                  pColumns  - Pointer to the array of column indices
; Author ........: Paul Campbell (PaulIA)
; Remarks .......:
; ===============================================================================================================================
Global Const $tagNMLVDISPINFO = "hwnd hWndFrom;int IDFrom;int Code;int Mask;int Item;int SubItem;int State;int StateMask;" & _
		"ptr Text;int TextMax;int Image;int Param;int Indent;int GroupID;int Columns;ptr pColumns"

; #STRUCTURE# ===================================================================================================================
; Name...........: $tagNMLVFINDITEM
; Description ...: Contains information the owner needs to find items requested by a virtual list view control
; Fields ........: hWndFrom - Window handle to the control sending a message
;                  IDFrom   - Identifier of the control sending a message
;                  Code     - Notification code
;                  Start    - Index of the item at which the search will start
;                  Flags     - Type of search to perform. This member can be set to one or more of the following values:
;                  |$LVFI_PARAM    - Searches for a match between this structure's Param member and the Param member of an item.
;                  +If $LVFI_PARAM is specified, all other flags are ignored.
;                  |$LVFI_PARTIAL  - Checks to see if the item text begins with the string pointed to by the Text  member.  This
;                  +value implies use of $LVFI_STRING.
;                  |$LVFI_STRING   - Searches based on the item text.  Unless additional values are specified, the item text  of
;                  +the matching item must exactly match the string pointed to by the Text member.
;                  |$LVFI_WRAP     - Continues the search at the beginning if no match is found
;                  |LVFI_NEARESTXY - Finds the item nearest to the position specified in the X and Y members, in  the  direction
;                  +specified by the Direction member. This flag is supported only by large icon and small icon modes.
;                  Text      - Address of a string to compare with the item text.  It is valid if $LVFI_STRING or  $LVFI_PARTIAL
;                  +is set in the Flags member.
;                  Param     - Value to compare with the Param member of an item's  $LVITEM  structure.  It  is  valid  only  if
;                  +$LVFI_PARAM is set in the flags member.
;                  X         - Initial X search position. It is valid only if $LVFI_NEARESTXY is set in the Flags member.
;                  Y         - Initial Y search position. It is valid only if $LVFI_NEARESTXY is set in the Flags member.
;                  Direction - Virtual key code that specifies the direction to search. The following codes are supported:
;                  |VK_LEFT
;                  |VK_RIGHT
;                  |VK_UP
;                  |VK_DOWN
;                  |VK_HOME
;                  |VK_END
;                  |VK_PRIOR
;                  |VK_NEXT
;                  |This member is valid only if $LVFI_NEARESTXY is set in the flags member.
; Author ........: Gary Frost (gafrost)
; Remarks .......: This notification gives an application (or the notification receiver) the opportunity to customize an incremental search.
;                  For example, if the search items are numeric, the application can perform a numerical search instead of a string search.
;                  The application sets the Param member to the result of the search, or to another application defined value to fail the
;                  search and indicate to the control how to proceed
; ===============================================================================================================================
Global Const $tagNMLVFINDITEM = "hwnd hWndFrom;int IDFrom;int Code;int Start;int Flags;ptr Text;int Param;int X;int Y;int Direction"

; #STRUCTURE# ===================================================================================================================
; Name...........: $tagNMLVGETINFOTIP
; Description ...: Contains and receives list-view item information needed to display a ToolTip for an item
; Fields ........: hWndFrom    - Window handle to the control sending a message
;                  IDFrom     - Identifier of the control sending a message
;                  Code       - Notification code
;                  Flags      - Either zero or $LVGIT_UNFOLDED
;                  Text       - Address of a string buffer that receives any additional text information
;                  +If Flags is zero, this member will contain the existing item text
;                  +In this case, you should append any additional text onto the end of this string
;                  TextMax     - Size, in characters, of the buffer pointed to by Text
;                  +Although you should never assume that this buffer will be of any particular size, the $INFOTIPSIZE value can
;                  +be used for design purposes
;                  Item        - Zero-based index of the item to which this structure refers.
;                  SubItem     - One-based index of the subitem to which this structure refers
;                  +If this member is zero, the structure is referring to the item and not a subitem
;                  +This member is not currently used and will always be zero
;                  lParam      - Application-defined value associated with the item
;                  +This member is not currently used and will always be zero.
; Author ........: Gary Frost (gafrost)
; Remarks .......:
; ===============================================================================================================================
Global Const $tagNMLVGETINFOTIP = "hwnd hWndFrom;int IDFrom;int Code;int Flags;ptr Text;int TextMax;int Item;int SubItem;int lParam"

; #STRUCTURE# ===================================================================================================================
; Name...........: $tagNMITEMACTIVATE
; Description ...: Sent by a list-view control when the user activates an item
; Fields ........: hWndFrom    - Window handle to the control sending a message
;                  IDFrom     - Identifier of the control sending a message
;                  Code       - Notification code
;                  Index      - Index of the list-view item. If the item index is not used for the notification,
;                  +this member will contain -1
;                  SubItem    - One-based index of the subitem. If the subitem index is not used for the notification or the
;                  +notification does not apply to a subitem, this member will contain zero.
;                  NewState   - New item state. This member is zero for notification messages that do not use it
;                  OldState   - Old item state. This member is zero for notification messages that do not use it
;                  Changed    - Set of flags that indicate the item attributes that have changed.
;                  +This member is zero for notifications that do not use it.
;                  +This member can have one or more of the following flags set:
;                  |$LVIF_COLUMNS     - The Columns member is valid
;                  |$LVIF_DI_SETITEM  - The operating system should store the requested list item information
;                  |$LVIF_GROUPID     - The GroupID member is valid
;                  |$LVIF_IMAGE       - The Image member is valid
;                  |$LVIF_INDENT      - The Indent member is valid
;                  |$LVIF_NORECOMPUTE - The control will not generate LVN_GETDISPINFO to retrieve text information
;                  |$LVIF_PARAM       - The Param member is valid
;                  |$LVIF_STATE       - The State member is valid
;                  |$LVIF_TEXT        - The Text member is valid
;                  X - Specifies the x-coordinate of the point
;                  Y - Specifies the y-coordinate of the point
;                  lParam             - Application-defined value of the item. This member is undefined for notification messages that do not use it
;                  KeyFlags           - Modifier keys that were pressed at the time of the activation.
;                  +This member contains zero or a combination of the following flags:
;                  |$LVKF_ALT         - The key is pressed.
;                  |$LVKF_CONTROL     - The key is pressed.
;                  |$LVKF_SHIFT       - The key is pressed.
; Author ........: Gary Frost (gafrost)
; Remarks .......:
; ===============================================================================================================================
Global Const $tagNMITEMACTIVATE = "hwnd hWndFrom;int IDFrom;int Code;int Index;int SubItem;int NewState;int OldState;" & _
		"int Changed;int X;int Y;int lParam;int KeyFlags"

; #STRUCTURE# ===================================================================================================================
; Name...........: $tagNMLVKEYDOWN
; Description ...: Contains information used in processing the $LVN_KEYDOWN notification message
; Fields ........: hWndFrom - Window handle to the control sending a message
;                  IDFrom   - Identifier of the control sending a message
;                  Code     - Notification code
;                  VKey     - Virtual key code
;                  Flags    - This member must always be zero
; Author ........: Gary Frost (gafrost)
; Remarks .......:
; ===============================================================================================================================
Global Const $tagNMLVKEYDOWN = "hwnd hWndFrom;int IDFrom;int Code;int VKey;int Flags"

; #STRUCTURE# ===================================================================================================================
; Name...........: $tagNMLVSCROLL
; Description ...: Provides information about a scrolling operation
; Fields ........: hWndFrom    - Window handle to the control sending a message
;                  IDFrom     - Identifier of the control sending a message
;                  Code       - Notification code
;                  DX         - Specifies in pixels the horizontal position where a scrolling operation should begin or end
;                  DY         - Specifies in pixels the vertical position where a scrolling operation should begin or end
; Author ........: Gary Frost (gafrost)
; Remarks .......:
; ===============================================================================================================================
Global Const $tagNMLVSCROLL = "hwnd hWndFrom;int IDFrom;int Code;int DX;int DY"

; #INTERNAL_USE_ONLY#============================================================================================================
; Name...........: $tagLVSETINFOTIP
; Description ...: Provides information about tooltip text that is to be set
; Fields ........: Size    - Size of this structure, in bytes
;                  Flags   - Flag that specifies how the text should be set. Set to zero.
;                  Text    - Pointer to a Unicode string that contains the tooltip text
;                  Item    - Contains the zero based index of the item to which this structure refers
;                  SubItem - Contains the one based index of the subitem to which this structure refers
; Author ........: Paul Campbell (PaulIA)
; Remarks .......:
; ===============================================================================================================================
Global Const $tagLVSETINFOTIP = "int Size;int Flags;ptr Text;int Item;int SubItem"

; ===============================================================================================================================
; *******************************************************************************************************************************
; Month Calendar Structures
; *******************************************************************************************************************************
; ===============================================================================================================================
; #STRUCTURE# ===================================================================================================================
; Name...........: $tagMCHITTESTINFO
; Description ...: Carries information specific to hit-testing points for a month calendar control
; Fields ........: Size     - Size of this structure, in bytes
;                  X        - X position of the point to be hit tested
;                  Y        - Y position of the point to be hit tested
;                  Hit      - Results of the hit test operation. This value will be one of the following:
;                  |$MCHT_CALENDARBK       - The given point was in the calendar's background
;                  |$MCHT_CALENDARDATE     - The given point was on a particular date within the calendar
;                  |$MCHT_CALENDARDATENEXT - The given point was over a date from the next month
;                  |$MCHT_CALENDARDATEPREV - The given point was over a date from the previous month
;                  |$MCHT_CALENDARDAY      - The given point was over a day abbreviation
;                  |$MCHT_CALENDARWEEKNUM  - The given point was over a week number
;                  |$MCHT_NOWHERE          - The given point was not on the month calendar control
;                  |$MCHT_TITLEBK          - The given point was over the background of a month's title
;                  |$MCHT_TITLEBTNNEXT     - The given point was over the button at the top right corner
;                  |$MCHT_TITLEBTNPREV     - The given point was over the button at the top left corner
;                  |$MCHT_TITLEMONTH       - The given point was in a month's title bar, over a month name
;                  |$MCHT_TITLEYEAR        - The given point was in a month's title bar, over the year value
;                  Year     - Year
;                  Month    - Month
;                  DOW      - DOW
;                  Day      - Day
;                  Hour     - Hour
;                  Minute   - Minute
;                  Second   - Seconds
;                  MSeconds - Milliseconds
; Author ........: Paul Campbell (PaulIA)
; Remarks .......:
; ===============================================================================================================================
Global Const $tagMCHITTESTINFO = "int Size;int X;int Y;int Hit;short Year;short Month;short DOW;short Day;short Hour;" & _
		"short Minute;short Second;short MSeconds"

; #STRUCTURE# ===================================================================================================================
; Name...........: $tagMCMONTHRANGE
; Description ...: Retrieves date information that represents the high and low limits of a month calendar control's display
; Fields ........: MinYear     - Year
;                  MinMonth    - Month
;                  MinDOW      - DOW
;                  MinDay      - Day
;                  MinHour     - Hour
;                  MinMinute   - Minute
;                  MinSecond   - Seconds
;                  MinMSeconds - Milliseconds
;                  MaxMonth    - Month
;                  MaxDOW      - DOW
;                  MaxDay      - Day
;                  MaxHour     - Hour
;                  MaxMinute   - Minute
;                  MaxSecond   - Seconds
;                  MaxMSeconds - Milliseconds
;                  Span        - Range, in months, spanned by the two limits
; Author ........: Paul Campbell (PaulIA)
; Remarks .......:
; ===============================================================================================================================
Global Const $tagMCMONTHRANGE = "short MinYear;short MinMonth;short MinDOW;short MinDay;short MinHour;short MinMinute;short MinSecond;" & _
		"short MinMSeconds;short MaxYear;short MaxMonth;short MaxDOW;short MaxDay;short MaxHour;short MaxMinute;short MaxSecond;" & _
		"short MaxMSeconds;short Span"

; #STRUCTURE# ===================================================================================================================
; Name...........: $tagMCRANGE
; Description ...: Contains information for setting the minimum and maximum allowable dates for a month calendar control
; Fields ........: MinYear     - Year
;                  MinMonth    - Month
;                  MinDOW      - DOW
;                  MinDay      - Day
;                  MinHour     - Hour
;                  MinMinute   - Minute
;                  MinSecond   - Seconds
;                  MinMSeconds - Milliseconds
;                  MaxMonth    - Month
;                  MaxDOW      - DOW
;                  MaxDay      - Day
;                  MaxHour     - Hour
;                  MaxMaxute   - Maxute
;                  MaxSecond   - Seconds
;                  MaxMSeconds - Milliseconds
;                  MinSet      - A minimum limit is set for the control
;                  MaxSet      - A maximum limit is set for the control
; Author ........: Paul Campbell (PaulIA)
; Remarks .......:
; ===============================================================================================================================
Global Const $tagMCRANGE = "short MinYear;short MinMonth;short MinDOW;short MinDay;short MinHour;short MinMinute;short MinSecond;" & _
		"short MinMSeconds;short MaxYear;short MaxMonth;short MaxDOW;short MaxDay;short MaxHour;short MaxMinute;short MaxSecond;" & _
		"short MaxMSeconds;short MinSet;short MaxSet"

; #STRUCTURE# ===================================================================================================================
; Name...........: $tagMCSELRANGE
; Description ...: Specifies a date and time, in coordinated universal time (UTC)
; Fields ........: MinYear     - Year
;                  MinMonth    - Month
;                  MinDOW      - DOW
;                  MinDay      - Day
;                  MinHour     - Hour
;                  MinMinute   - Minute
;                  MinSecond   - Seconds
;                  MinMSeconds - Milliseconds
;                  MaxMonth    - Month
;                  MaxDOW      - DOW
;                  MaxDay      - Day
;                  MaxHour     - Hour
;                  MaxMaxute   - Maxute
;                  MaxSecond   - Seconds
;                  MaxMSeconds - Milliseconds
; Author ........: Paul Campbell (PaulIA)
; Remarks .......:
; ===============================================================================================================================
Global Const $tagMCSELRANGE = "short MinYear;short MinMonth;short MinDOW;short MinDay;short MinHour;short MinMinute;short MinSecond;" & _
		"short MinMSeconds;short MaxYear;short MaxMonth;short MaxDOW;short MaxDay;short MaxHour;short MaxMinute;short MaxSecond;" & _
		"short MaxMSeconds"

; #STRUCTURE# ===================================================================================================================
; Name...........: $tagNMDAYSTATE
; Description ...: Carries information required to process the $MCN_GETDAYSTATE notification me
; Fields ........: hWndFrom   - Window handle to the control sending a message
;                  IDFrom    - Identifier of the control sending a message
;                  Code      - Notification code
;                  Year      - Year
;                  Month     - Month
;                  DOW       - DOW
;                  Day       - Day
;                  Hour      - Hour
;                  Minute    - Minute
;                  Second    - Seconds
;                  MSeconds  - Milliseconds
;                  DayState  - The total number of elements that must be in the array at pDayState
;                  pDayState - Address of an array of MONTHDAYSTATE (DWORD bit field that holds the state of each day in a month)
;                  +Each bit (1 through 31) represents the state of a day in a month. If a bit is on, the corresponding day will
;                  +be displayed in bold; otherwise it will be displayed with no emphasis.
;                  +The buffer at this address must be large enough to contain at least DayState elements.
; Author ........: Paul Campbell (PaulIA)
; Remarks .......:
; ===============================================================================================================================
Global Const $tagNMDAYSTATE = "hwnd hWndFrom;int IDFrom;int Code;short Year;short Month;short DOW;short Day;short Hour;" & _
		"short Minute;short Second;short MSeconds;int DayState;ptr pDayState"

; #STRUCTURE# ===================================================================================================================
; Name...........: $tagNMSELCHANGE
; Description ...: Carries information required to process the $MCN_SELCHANGE notification message
; Fields ........: hWndFrom     - Window handle to the control sending a message
;                  IDFrom      - Identifier of the control sending a message
;                  Code        - Notification code
;                  BegYear     - Year
;                  BegMonth    - Month
;                  BegDOW      - DOW
;                  BegDay      - Day
;                  BegHour     - Hour
;                  BegMinute   - Minute
;                  BegSecond   - Seconds
;                  BegMSeconds - Milliseconds
;                  EndYear     - Year
;                  EndMonth    - Month
;                  EndDOW      - DOW
;                  EndDay      - Day
;                  EndHour     - Hour
;                  EndMinute   - Minute
;                  EndSecond   - Seconds
;                  EndMSeconds - Milliseconds
; Author ........: Paul Campbell (PaulIA)
; Remarks .......:
; ===============================================================================================================================
Global Const $tagNMSELCHANGE = "hwnd hWndFrom;int IDFrom;int Code;short BegYear;short BegMonth;short BegDOW;short BegDay;" & _
		"short BegHour;short BegMinute;short BegSecond;short BegMSeconds;short EndYear;short EndMonth;short EndDOW;" & _
		"short EndDay;short EndHour;short EndMinute;short EndSecond;short EndMSeconds"

; ===============================================================================================================================
; *******************************************************************************************************************************
; Tab Structures
; *******************************************************************************************************************************
; ===============================================================================================================================
; #STRUCTURE# ===================================================================================================================
; Name...........: $tagNMOBJECTNOTIFY
; Description ...: Contains information used with the $TCN_GETOBJECT notification messages
; Fields ........: hWndFrom - Window handle to the control sending a message
;                  IDFrom   - Identifier of the control sending a message
;                  Code     - Notification code
;                  Item     - A control-specific item identifier
;                  piid     - A pointer to an interface identifier of the requested object
;                  pObject  - A pointer to an object provided by the window processing the notification message
;                  +The application processing the notification message sets this member
;                  Result   - COM success or failure flags. The application processing the notification message sets this member
; Author ........: Gary Frost (gafrost)
; Remarks .......:
; ===============================================================================================================================
Global Const $tagNMOBJECTNOTIFY = "hwnd hWndFrom;int IDFrom;int Code;int Item;ptr piid;ptr pObject;int Result"

; #STRUCTURE# ===================================================================================================================
; Name...........: $tagNMTCKEYDOWN
; Description ...: Contains information used in processing the $LVN_KEYDOWN notification message
; Fields ........: hWndFrom - Window handle to the control sending a message
;                  IDFrom   - Identifier of the control sending a message
;                  Code     - Notification code
;                  VKey     - Virtual key code
;                  Flags    - Bits as shown in the following table:
;                  |0-15    - Specifies the repeat count for the current message.
;                  |16-23   - Specifies the scan code. The value depends on the OEM.
;                  |24      - Specifies whether the key is an extended key, such as the right-hand ALT and CTRL keys that appear
;                  +on an enhanced 101- or 102-key keyboard. The value is 1 if it is an extended key; otherwise, it is 0.
;                  |25-28   - Reserved; do not use.
;                  |29      - Specifies the context code. The value is always 0 for a $WM_KEYDOWN message.
;                  |30      - Specifies the previous key state. The value is 1 if the key is down before the message is sent,
;                  +or it is zero if the key is up.
;                  |31      - Specifies the transition state. The value is always zero for a $WM_KEYDOWN message
; Author ........: Gary Frost (gafrost)
; Remarks .......:
; ===============================================================================================================================
Global Const $tagNMTCKEYDOWN = "hwnd hWndFrom;int IDFrom;int Code;int VKey;int Flags"

; #INTERNAL_USE_ONLY#============================================================================================================
; Name...........: $tagTCITEM
; Description ...: Specifies or receives the attributes of a tab item
; Fields ........: Mask      - Value that specifies which members to retrieve or set:
;                  |$TCIF_IMAGE      - The Image member is valid
;                  |$TCIF_PARAM      - The Param member is valid
;                  |$TCIF_RTLREADING - The string pointed to by Text will be displayed in the opposite direction
;                  |$TCIF_STATE      - The State member is valid
;                  |$TCIF_TEXT       - The Text member is valid
;                  State     - Specifies the item's current state if information is being retrieved. If item information is being
;                  +set this member contains the state value to be set for the item.
;                  StateMask - Specifies which bits of the dwState member contain valid information
;                  Text      - String that contains the tab text when item information is being set. If item information is being
;                  +retrieved, this member specifies the address of the buffer that receives the tab text.
;                  TextMax   - Size of the buffer pointed to by the Text member.  If the structure is not receiving  information,
;                  +this member is ignored.
;                  Image     - Index in the tab control's image list, or -1 if there is no image for the tab.
;                  Param     - Application-defined data associated with the tab control item
; Author ........: Paul Campbell (PaulIA)
; Remarks .......:
; ===============================================================================================================================
Global Const $tagTCITEM = "int Mask;int State;int StateMask;ptr Text;int TextMax;int Image;int Param"

; #INTERNAL_USE_ONLY#============================================================================================================
; Name...........: $tagTCHITTESTINFO
; Description ...: Contains information about a hit test
; Fields ........: X     - X position to hit test
;                  Y     - Y position to hit test
;                  Flags - Results of a hit test. The control sets this member to one of the following values:
;                  |$TCHT_NOWHERE     - The position is not over a tab
;                  |$TCHT_ONITEM      - The position is over a tab but not over its icon or its text
;                  |$TCHT_ONITEMICON  - The position is over a tab's icon
;                  |$TCHT_ONITEMLABEL - The position is over a tab's text
;                  |$TCHT_ONITEM      - Bitwise OR of $TCHT_ONITEMICON and $TCHT_ONITEMLABEL
; Author ........: Paul Campbell (PaulIA)
; Remarks .......:
; ===============================================================================================================================
Global Const $tagTCHITTESTINFO = "int X;int Y;int Flags"

; ===============================================================================================================================
; *******************************************************************************************************************************
; TreeView Structures
; *******************************************************************************************************************************
; ===============================================================================================================================
; #STRUCTURE# ===================================================================================================================
; Name...........: $tagTVITEMEX
; Description ...: Specifies or receives attributes of a tree-view item
; Fields ........: Mask          - Flags that indicate which of the other structure members contain valid data:
;                  |$TVIF_CHILDREN      - The Children member is valid
;                  |$TVIF_DI_SETITEM    - The will retain the supplied information and will not request it again
;                  |$TVIF_HANDLE        - The hItem member is valid
;                  |$TVIF_IMAGE         - The Image member is valid
;                  |$TVIF_INTEGRAL      - The Integral member is valid
;                  |$TVIF_PARAM         - The Param member is valid
;                  |$TVIF_SELECTEDIMAGE - The SelectedImage member is valid
;                  |$TVIF_STATE         - The State and StateMask members are valid
;                  |$TVIF_TEXT          - The Text and TextMax members are valid
;                  hItem         - Item to which this structure refers
;                  State         - Set of bit flags and image list indexes that indicate the item's state. When setting the state
;                  +of an item, the StateMask member indicates the bits of this member that are valid.  When retrieving the state
;                  +of an item, this member returns the current state for the bits indicated in  the  StateMask  member.  Bits  0
;                  +through 7 of this member contain the item state flags. Bits 8 through 11 of this member specify the one based
;                  +overlay image index.
;                  StateMask     - Bits of the state member that are valid.  If you are retrieving an item's state, set the  bits
;                  +of the stateMask member to indicate the bits to be returned in the state member. If you are setting an item's
;                  +state, set the bits of the stateMask member to indicate the bits of the state member that you want to set.
;                  Text          - Pointer to a null-terminated string that contains the item text.
;                  TextMax       - Size of the buffer pointed to by the Text member, in characters
;                  Image         - Index in the image list of the icon image to use when the item is in the nonselected state
;                  SelectedImage - Index in the image list of the icon image to use when the item is in the selected state
;                  Children      - Flag that indicates whether the item has associated child items. This member can be one of the
;                  +following values:
;                  |0 - The item has no child items
;                  |1 - The item has one or more child items
;                  Param         - A value to associate with the item
;                  Integral      - Height of the item
; Author ........: Paul Campbell (PaulIA)
; Remarks .......:
; ===============================================================================================================================
Global Const $tagTVITEMEX = "int Mask;int hItem;int State;int StateMask;ptr Text;int TextMax;int Image;int SelectedImage;" & _
		"int Children;int Param;int Integral"

; #STRUCTURE# ===================================================================================================================
; Name...........: $tagNMTREEVIEW
; Description ...: Contains information about a tree-view notification message
; Fields ........: hWndFrom          - Window handle to the control sending a message
;                  IDFrom           - Identifier of the control sending a message
;                  Code             - Notification code
;                  Action           - Notification-specific action flag
;                  OldMask          - Flags that indicate which of the other structure members contain valid data.
;                  OldhItem         - Item to which this structure refers
;                  OldState         - Set of bit flags and image list indexes that indicate the item's state
;                  OldStateMask     - Bits of the state member that are valid
;                  OldText          - Pointer to a null-terminated string that contains the item text.
;                  OldTextMax       - Size of the buffer pointed to by the Text member, in characters
;                  OldImage         - Index in the image list of the icon image to use when the item is in the nonselected state
;                  OldSelectedImage - Index in the image list of the icon image to use when the item is in the selected state
;                  OldChildren      - Flag that indicates whether the item has associated child items
;                  OldParam         - A value to associate with the item
;                  NewMask          - Flags that indicate which of the other structure members contain valid data.
;                  NewhItem         - Item to which this structure refers
;                  NewState         - Set of bit flags and image list indexes that indicate the item's state
;                  NewStateMask     - Bits of the state member that are valid
;                  NewText          - Pointer to a null-terminated string that contains the item text.
;                  NewTextMax       - Size of the buffer pointed to by the Text member, in characters
;                  NewImage         - Index in the image list of the icon image to use when the item is in the nonselected state
;                  NewSelectedImage - Index in the image list of the icon image to use when the item is in the selected state
;                  NewChildren      - Flag that indicates whether the item has associated child items
;                  NewParam         - A value to associate with the item
;                  PointX           - X position that of the mouse at the time the event occurred
;                  PointY           - Y position that of the mouse at the time the event occurred
; Author ........: Paul Campbell (PaulIA)
; Remarks .......:
; ===============================================================================================================================
Global Const $tagNMTREEVIEW = "hwnd hWndFrom;int IDFrom;int Code;int Action;int OldMask;int OldhItem;int OldState;int OldStateMask;" & _
		"ptr OldText;int OldTextMax;int OldImage;int OldSelectedImage;int OldChildren;int OldParam;int NewMask;int NewhItem;" & _
		"int NewState;int NewStateMask;ptr NewText;int NewTextMax;int NewImage;int NewSelectedImage;int NewChildren;" & _
		"int NewParam;int PointX; int PointY"

; #STRUCTURE# ===================================================================================================================
; Name...........: $tagNMTVCUSTOMDRAW
; Description ...: Contains information specific to an NM_CUSTOMDRAW (tree view) notification message sent by a tree-view control
; Fields ........: hWndFrom   - Window handle to the control sending a message
;                  IDFrom    - Identifier of the control sending a message
;                  Code      - Notification code
;                  DrawStage - Current drawing stage. This value is one of the following:
;                  |Global Values:
;                  |  CDDS_POSTERASE - After the erasing cycle is complete
;                  |  CDDS_POSTPAINT - After the painting cycle is complete
;                  |  CDDS_PREERASE  - Before the erasing cycle begins
;                  |  CDDS_PREPAINT  - Before the painting cycle begins
;                  |Item-specific Values:
;                  |  CDDS_ITEM          - Indicates that the ItemSpec, ItemState, and ItemParam members are valid
;                  |  CDDS_ITEMPOSTERASE - After an item has been erased
;                  |  CDDS_ITEMPOSTPAINT - After an item has been drawn
;                  |  CDDS_ITEMPREERASE  - Before an item is erased
;                  |  CDDS_ITEMPREPAINT  - Before an item is drawn
;                  |  CDDS_SUBITEM       - Flag combined with CDDS_ITEMPREPAINT or CDDS_ITEMPOSTPAINT if a subitem is being drawn
;                  HDC       - Handle to the control's device context
;                  Left      - X coordinate of upper left corner of bounding rectangle being drawn
;                  Top       - Y coordinate of upper left corner of bounding rectangle being drawn
;                  Right     - X coordinate of lower right corner of bounding rectangle being drawn
;                  Bottom    - Y coordinate of lower right corner of bounding rectangle being drawn
;                  ItemSpec  - Item number
;                  ItemState - Current item state. This value is a combination of the following:
;                  |CDIS_CHECKED          - The item is checked
;                  |CDIS_DEFAULT          - The item is in its default state
;                  |CDIS_DISABLED         - The item is disabled
;                  |CDIS_FOCUS            - The item is in focus
;                  |CDIS_GRAYED           - The item is grayed
;                  |CDIS_HOT              - The item is currently under the pointer
;                  |CDIS_INDETERMINATE    - The item is in an indeterminate state
;                  |CDIS_MARKED           - The item is marked
;                  |CDIS_SELECTED         - The item is selected
;                  |CDIS_SHOWKEYBOARDCUES - The item is a keyboard cue
;                  ItemParam - Application defined item data
;                  ClrText   - The color that will be used to display text foreground in the control
;                  CltTextBk - The color that will be used to display text background in the control
;                  Level     - Zero based level of the item being drawn
; Author ........: Paul Campbell (PaulIA)
; Remarks .......:
; ===============================================================================================================================
Global Const $tagNMTVCUSTOMDRAW = "hwnd hWndFrom;int IDFrom;int Code;uint DrawStage;hwnd HDC;int Left;int Top;int Right;int Bottom;" & _
		"ptr ItemSpec;uint ItemState;int ItemParam;int ClrText;int ClrTextBk;int Level"

; #STRUCTURE# ===================================================================================================================
; Name...........: $tagNMTVDISPINFO
; Description ...: Contains and receives display information for a tree-view item
; Fields ........: hWndFrom   - Window handle to the control sending a message
;                  IDFrom    - Identifier of the control sending a message
;                  Code      - Notification code
;                  Mask          - Specifies which information is being set or retrieved. It can be one or more of the following values:
;                  |$TVIF_CHILDREN      - The Children member is valid
;                  |$TVIF_IMAGE         - The Image member is valid
;                  |$TVIF_SELECTEDIMAGE - The SelectedImage member is valid
;                  |$TVIF_TEXT          - The Text and TextMax members are valid
;                  hItem         - Item to which this structure refers
;                  State         - Set of bit flags and image list indexes that indicate the item's state. When setting the state
;                  +of an item, the StateMask member indicates the bits of this member that are valid.  When retrieving the state
;                  +of an item, this member returns the current state for the bits indicated in  the  StateMask  member.  Bits  0
;                  +through 7 of this member contain the item state flags. Bits 8 through 11 of this member specify the one based
;                  +overlay image index.
;                  StateMask     - Bits of the state member that are valid.  If you are retrieving an item's state, set the  bits
;                  +of the stateMask member to indicate the bits to be returned in the state member. If you are setting an item's
;                  +state, set the bits of the stateMask member to indicate the bits of the state member that you want to set.
;                  Text          - Pointer to a null-terminated string that contains the item text.
;                  TextMax       - Size of the buffer pointed to by the Text member, in characters
;                  Image         - Index in the image list of the icon image to use when the item is in the nonselected state
;                  SelectedImage - Index in the image list of the icon image to use when the item is in the selected state
;                  Children      - Flag that indicates whether the item has associated child items. This member can be one of the
;                  +following values:
;                  |0 - The item has no child items
;                  |1 - The item has one or more child items
;                  Param         - A value to associate with the item
; Author ........: Gary Frost (gafrost)
; Remarks .......:
; ===============================================================================================================================
Global Const $tagNMTVDISPINFO = "hwnd hWndFrom;int IDFrom;int Code;int Mask;int hItem;int State;int StateMask;" & _
		"ptr Text;int TextMax;int Image;int SelectedImage;int Children;int Param"

; #STRUCTURE# ===================================================================================================================
; Name...........: $tagNMTVGETINFOTIP
; Description ...: Contains and receives tree-view item information needed to display a ToolTip for an item
; Fields ........: hWndFrom   - Window handle to the control sending a message
;                  IDFrom    - Identifier of the control sending a message
;                  Code      - Notification code
;                  Text      - Address of a character buffer that contains the text to be displayed
;                  TextMax   - Size of the buffer at Text, in characters. Although you should never assume that this buffer will be
;                  +of any particular size, the $INFOTIPSIZE value can be used for design purposes
;                  hItem     - Tree handle to the item for which the ToolTip is being displayed
;                  lParam    - Application-defined data associated with the item for which the ToolTip is being displayed
; Author ........: Gary Frost (gafrost)
; Remarks .......:
; ===============================================================================================================================
Global Const $tagNMTVGETINFOTIP = "hwnd hWndFrom;int IDFrom;int Code;ptr Text;int TextMax;hwnd hItem;int lParam"

; #STRUCTURE# ===================================================================================================================
; Name...........: $tagTVHITTESTINFO
; Description ...: Contains information used to determine the location of a point relative to a tree-view control
; Fields ........: X     - X position, in client coordiantes, to be tested
;                  Y     - Y position, in client coordiantes, to be tested
;                  Flags - Results of a hit test. This member can be one or more of the following values:
;                  |$TVHT_ABOVE           - Above the client area
;                  |$TVHT_BELOW           - Below the client area
;                  |$TVHT_NOWHERE         - In the client area, but below the last item
;                  |$TVHT_ONITEM          - On the bitmap or label associated with an item
;                  |$TVHT_ONITEMBUTTON    - On the button associated with an item
;                  |$TVHT_ONITEMICON      - On the bitmap associated with an item
;                  |$TVHT_ONITEMINDENT    - In the indentation associated with an item
;                  |$TVHT_ONITEMLABEL     - On the label (string) associated with an item
;                  |$TVHT_ONITEMRIGHT     - In the area to the right of an item
;                  |DllStructGetData($TVHT_ONITEMSTATEICON - On the state icon for an item that is in a user-defined state, "")
;                  |$TVHT_TOLEFT          - To the left of the client area
;                  |$TVHT_TORIGHT         - To the right of the client area
;                  Item  - Handle to the item that occupies the position
; Author ........: Paul Campbell (PaulIA)
; Remarks .......:
; ===============================================================================================================================
Global Const $tagTVHITTESTINFO = "int X;int Y;int Flags;int Item"

; #INTERNAL_USE_ONLY#============================================================================================================
; Name...........: $tagTVINSERTSTRUCT
; Description ...: Contains information used to add a new item to a tree-view control
; Fields ........: Parent        - Handle to the parent item. If this member is $TVI_ROOT, the item is inserted at the root
;                  InsertAfter   - Handle to the item after which the new item is to be inserted, or one of the following values:
;                  |$TVI_FIRST - Inserts the item at the beginning of the list
;                  |$TVI_LAST  - Inserts the item at the end of the list
;                  |$TVI_ROOT  - Add the item as a root item
;                  |$TVI_SORT  - Inserts the item into the list in alphabetical order
;                  Mask          - Flags that indicate which of the other structure members contain valid data:
;                  |$TVIF_CHILDREN      - The Children member is valid
;                  |$TVIF_DI_SETITEM    - The will retain the supplied information and will not request it again
;                  |$TVIF_HANDLE        - The hItem member is valid
;                  |$TVIF_IMAGE         - The Image member is valid
;                  |$TVIF_INTEGRAL      - The Integral member is valid
;                  |$TVIF_PARAM         - The Param member is valid
;                  |$TVIF_SELECTEDIMAGE - The SelectedImage member is valid
;                  |$TVIF_STATE         - The State and StateMask members are valid
;                  |$TVIF_TEXT          - The Text and TextMax members are valid
;                  hItem         - Item to which this structure refers
;                  State         - Set of bit flags and image list indexes that indicate the item's state. When setting the state
;                  +of an item, the StateMask member indicates the bits of this member that are valid.  When retrieving the state
;                  +of an item, this member returns the current state for the bits indicated in  the  StateMask  member.  Bits  0
;                  +through 7 of this member contain the item state flags. Bits 8 through 11 of this member specify the one based
;                  +overlay image index.
;                  StateMask     - Bits of the state member that are valid.  If you are retrieving an item's state, set the  bits
;                  +of the stateMask member to indicate the bits to be returned in the state member. If you are setting an item's
;                  +state, set the bits of the stateMask member to indicate the bits of the state member that you want to set.
;                  Text          - Pointer to a null-terminated string that contains the item text.
;                  TextMax       - Size of the buffer pointed to by the Text member, in characters
;                  Image         - Index in the image list of the icon image to use when the item is in the nonselected state
;                  SelectedImage - Index in the image list of the icon image to use when the item is in the selected state
;                  Children      - Flag that indicates whether the item has associated child items. This member can be one of the
;                  +following values:
;                  |0 - The item has no child items
;                  |1 - The item has one or more child items
;                  Param         - A value to associate with the item
;                  Integral      - Height of the item
; Author ........: Paul Campbell (PaulIA)
; Remarks .......:
; ===============================================================================================================================
Global Const $tagTVINSERTSTRUCT = "hwnd Parent;int InsertAfter;int Mask;hwnd hItem;int State;int StateMask;ptr Text;int TextMax;" & _
		"int Image;int SelectedImage;int Children;int Param"

; #STRUCTURE# ===================================================================================================================
; Name...........: $tagNMTVKEYDOWN
; Description ...: Contains information about a keyboard event in a tree-view control
; Fields ........: hWndFrom - Window handle to the control sending a message
;                  IDFrom   - Identifier of the control sending a message
;                  Code     - Notification code
;                  VKey     - Virtual key code
;                  Flags    - Always zero
; Author ........: Gary Frost (gafrost)
; Remarks .......:
; ===============================================================================================================================
Global Const $tagNMTVKEYDOWN = "hwnd hWndFrom;int IDFrom;int Code;int VKey;int Flags"

; ===============================================================================================================================
; *******************************************************************************************************************************
; ToolTip Structures
; *******************************************************************************************************************************
; ===============================================================================================================================
; #INTERNAL_USE_ONLY#============================================================================================================
; Name...........: $tagNMTTDISPINFO
; Description ...: Contains information used in handling the $TTN_GETDISPINFO notification message
; Fields ........: hWndFrom   - Window handle to the control sending a message
;                  IDFrom    - Identifier of the control sending a message
;                  Code      - Notification code
;                  pText     - Pointer to a string that will be displayed as the ToolTip text.  If Instance specifies an instance
;                  +handle, this member must be the identifier of a string resource.
;                  aText     - Buffer that receives the ToolTip text.  An application can copy the text to this buffer instead of
;                  +specifying a string address or string resource.
;                  Instance  - Handle to the instance that contains a string resource to be used as the ToolTip text. If pText is
;                  +the address of the ToolTip text string, this member must be 0.
;                  Flags     - Flags that indicates how to interpret the IDFrom member:
;                  |$TTF_IDISHWND   - If this flag is set, IDFrom is the tool's handle. Otherwise, it is the tool's identifier.
;                  |$TTF_RTLREADING - Specifies right to left text
;                  |$TTF_DI_SETITEM - If you add this flag to Flags while processing the notification, the ToolTip  control  will
;                  +retain the supplied information and not request it again.
;                  Param     - Application-defined data associated with the tool
; Author ........: Paul Campbell (PaulIA)
; Remarks .......: You need to point the pText array to your own private buffer when the text used in the ToolTip text exceeds 80
;                  +characters in length.  The system automatically strips the accelerator from all strings passed to  a  ToolTip
;                  control, unless the control has the $TTS_NOPREFIX style.
; ===============================================================================================================================
Global Const $tagNMTTDISPINFO = "hwnd hWndFrom;int IDFrom;int Code;ptr pText;char aText[80];hwnd Instance;int Flags;int Param"

; #INTERNAL_USE_ONLY#============================================================================================================
; Name...........: $tagTOOLINFO
; Description ...: Contains information about a tool in a ToolTip contr
; Fields ........: Size    - Size of this structure, in bytes
;                  Flags    - Flags that control the ToolTip display. This member can be a combination of the following values:
;                  |$TTF_ABSOLUTE    - Positions the ToolTip at the same coordinates provided by $TTM_TRACKPOSITION
;                  |$TTF_CENTERTIP   - Centers the ToolTip below the tool specified by the ID member
;                  |$TTF_IDISHWND    - Indicates that the ID member is the window handle to the tool
;                  |$TTF_PARSELINKS  - Indicates that links in the tooltip text should be parsed
;                  |$TTF_RTLREADING  - Indicates that the ToolTip text will be displayed in the opposite direction
;                  |$TTF_SUBCLASS    - Indicates that the ToolTip control should subclass the tool's window to intercept messages
;                  |$TTF_TRACK       - Positions the ToolTip next to the tool to which it corresponds
;                  |$TTF_TRANSPARENT - Causes the ToolTip control to forward mouse event messages to the parent window
;                  hWnd     - Handle to the window that contains the tool
;                  ID       - Application-defined identifier of the tool
;                  Left     - X position of upper left corner of bounding rectangle
;                  Top      - Y position of upper left corner of bounding rectangle
;                  Right    - X position of lower right corner of bounding rectangle
;                  Bottom   - Y position of lower right corner of bounding rectangle
;                  hInst    - Handle to the instance that contains the string resource for the too
;                  Text     - Pointer to the buffer that contains the text for the tool
;                  Param    - A 32-bit application-defined value that is associated with the tool
;                  Reserved - Reserved
; Author ........: Paul Campbell (PaulIA)
; Remarks .......:
; ===============================================================================================================================
Global Const $tagTOOLINFO = "int Size;int Flags;hwnd hWnd;int ID;int Left;int Top;int Right;int Bottom;hwnd hInst;ptr Text;int Param;ptr Reserved"

; #INTERNAL_USE_ONLY#============================================================================================================
; Name...........: $tagTTGETTITLE
; Description ...: Provides information about the title of a tooltip control
; Fields ........: Size     - Size of this structure, in bytes
;                  Bitmap   - The tooltip icon
;                  TitleMax - Specifies the number of characters in the title
;                  Title    - Pointer to a wide character string that contains the title
; Author ........: Paul Campbell (PaulIA)
; Remarks .......:
; ===============================================================================================================================
Global Const $tagTTGETTITLE = "int Size;int Bitmap;int TitleMax;ptr Title"

; #INTERNAL_USE_ONLY#============================================================================================================
; Name...........: $tagTTHITTESTINFO
; Description ...: Contains information that a ToolTip control uses to determine whether a point is in the bounding rectangle of the specified tool
; Fields ........: Tool     - Handle to the tool or window with the specified tool
;                  X        - X position to be tested, in client coordinates
;                  Y        - Y position to be tested, in client coordinates
;                  Size     - Size of a TOOLINFO structure
;                  Flags    - Flags that control the ToolTip display. This member can be a combination of the following values:
;                  |$TTF_ABSOLUTE    - Positions the ToolTip at the same coordinates provided by $TTM_TRACKPOSITION
;                  |$TTF_CENTERTIP   - Centers the ToolTip below the tool specified by the ID member
;                  |$TTF_IDISHWND    - Indicates that the ID member is the window handle to the tool
;                  |$TTF_PARSELINKS  - Indicates that links in the tooltip text should be parsed
;                  |$TTF_RTLREADING  - Indicates that the ToolTip text will be displayed in the opposite direction
;                  |$TTF_SUBCLASS    - Indicates that the ToolTip control should subclass the tool's window to intercept messages
;                  |$TTF_TRACK       - Positions the ToolTip next to the tool to which it corresponds
;                  |$TTF_TRANSPARENT - Causes the ToolTip control to forward mouse event messages to the parent window
;                  hWnd     - Handle to the window that contains the tool
;                  ID       - Application-defined identifier of the tool
;                  Left     - X position of upper left corner of bounding rectangle
;                  Top      - Y position of upper left corner of bounding rectangle
;                  Right    - X position of lower right corner of bounding rectangle
;                  Bottom   - Y position of lower right corner of bounding rectangle
;                  hInst    - Handle to the instance that contains the string resource for the too
;                  Text     - Pointer to the buffer that contains the text for the tool
;                  Param    - A 32-bit application-defined value that is associated with the tool
;                  Reserved - Reserved
; Author ........: Paul Campbell (PaulIA)
; Remarks .......:
; ===============================================================================================================================
Global Const $tagTTHITTESTINFO = "hwnd Tool;int X;int Y;int Size;int Flags;hwnd hWnd;int ID;int Left;int Top;int Right;int Bottom;" & _
		"hwnd hInst;ptr Text;int Param;ptr Reserved"

; #STRUCTURE# ===================================================================================================================
; Name...........: $tagNMHDR
; Description ...: Contains information about a notification message
; Fields ........: hWndFrom - Window handle to the control sending a message
;                  IDFrom   - Identifier of the control sending a message
;                  Code     - Notification code
; Author ........: Paul Campbell (PaulIA)
; Remarks .......:
; ===============================================================================================================================
Global Const $tagNMHDR = "hwnd hWndFrom;int IDFrom;int Code"

; #STRUCTURE# ===================================================================================================================
; Name...........: $tagNMMOUSE
; Description ...: Contains information used with mouse notification messages
; Fields ........: hWndFrom - Window handle to the control sending a message
;                  IDFrom   - Identifier of the control sending a message
;                  Code     - Notification code
;                  ItemSpec - A control-specific item identifier
;                  ItemData - A control-specific item data
;                  X        - Specifies the x-coordinate of the point
;                  Y        - Specifies the y-coordinate of the point
;                  HitInfo  - Carries information about where on the item or control the cursor is pointing
; Author ........: Gary Frost (gafrost)
; Remarks .......:
; ===============================================================================================================================
Global Const $tagNMMOUSE = "hwnd hWndFrom;int IDFrom;int Code;dword ItemSpec;dword ItemData;int X;int Y;dword HitInfo"

; #STRUCTURE# ===================================================================================================================
; Name...........: $tagPOINT
; Description ...: Defines the x- and y- coordinates of a point
; Fields ........: X - Specifies the x-coordinate of the point
;                  Y - Specifies the y-coordinate of the point
; Author ........: Paul Campbell (PaulIA)
; Remarks .......:
; ===============================================================================================================================
Global Const $tagPOINT = "int X;int Y"

; #STRUCTURE# ===================================================================================================================
; Name...........: $tagRECT
; Description ...: Defines the coordinates of the upper-left and lower-right corners of a rectangle
; Fields ........: Left   - Specifies the x-coordinate of the upper-left corner of the rectangle
;                  Top    - Specifies the y-coordinate of the upper-left corner of the rectangle
;                  Right  - Specifies the x-coordinate of the lower-right corner of the rectangle
;                  Bottom - Specifies the y-coordinate of the lower-right corner of the rectangle
; Author ........: Paul Campbell (PaulIA)
; Remarks .......:
; ===============================================================================================================================
Global Const $tagRECT = "int Left;int Top;int Right;int Bottom"

; #STRUCTURE# ===================================================================================================================
; Name...........: $tagSIZE
; Description ...: Stores an ordered pair of integers, typically the width and height of a rectangle
; Fields ........: X - Width
;                  Y - Height
; Author ........: Paul Campbell (PaulIA)
; Remarks .......:
; ===============================================================================================================================
Global Const $tagSIZE = "int X;int Y"

; ===============================================================================================================================
; *******************************************************************************************************************************
; Misc Structures
; *******************************************************************************************************************************
; ===============================================================================================================================
; *******************************************************************************************************************************
; Security Structures
; *******************************************************************************************************************************
; ===============================================================================================================================
; #STRUCTURE# ===================================================================================================================
; Name...........: $tagTOKEN_PRIVILEGES
; Description ...: Contains information about a set of privileges for an access token
; Fields ........: Count      - Specifies the number of entries
;                  LUID       - Specifies a LUID value
;                  Attributes - Specifies attributes of the LUID
; Author ........: Paul Campbell (PaulIA)
; Remarks .......:
; ===============================================================================================================================
Global Const $tagTOKEN_PRIVILEGES = "int Count;int64 LUID;int Attributes"

; ===============================================================================================================================
; *******************************************************************************************************************************
; ImageList Structures
; *******************************************************************************************************************************
; ===============================================================================================================================
; #STRUCTURE# ===================================================================================================================
; Name...........: $tagIMAGEINFO
; Description ...: Contains information about an image in an image list
; Fields ........: hBitmap - Handle to the bitmap that contains the images
;                  hMask   - Handle to a monochrome bitmap that contains the masks for the images
;                  Unused1 - Not used
;                  Unused2 - Not used
;                  Left    - Left side of the rectangle of the image
;                  Top     - Top of the rectangle of the image
;                  Right   - Right side of the rectangle of the image
;                  Bottom  - Bottom of the rectangle of the image
; Author ........: Paul Campbell (PaulIA)
; Remarks .......:
; ===============================================================================================================================
Global Const $tagIMAGEINFO = "hwnd hBitmap;hwnd hMask;int Unused1;int Unused2;int Left;int Top;int Right;int Bottom"

; #INTERNAL_USE_ONLY#============================================================================================================
; Name...........: $tagIMAGELISTDRAWPARAMS
; Description ...: Contains information about an image list draw operation and is used with the ImageList Draw function
; Fields ........: Size    - Size of this structure, in bytes
;                  hWnd    - Handle to the image list that contains the image to be drawn
;                  Image   - Zero based index of the image to be drawn
;                  hDC     - Handle to the destination device context
;                  X       - The X coordinate that specifies where the image is drawn
;                  Y       - The Y coordinate that specifies where the image is drawn
;                  CX      - The number of pixels to draw relative to the upper left corner of the drawing operation as specified
;                  +by XBitmap and YBitmap. If CX and XY are zero, then ImageList_Draw draws the entire valid section. The method
;                  +does not ensure that the parameters are valid.
;                  CY      - The number of pixels to draw relative to the upper left corner of the drawing operation as specified
;                  +by XBitmap and YBitmap. If CX and CY are zero, then ImageList_Draw draws the entire valid section. The method
;                  +does not ensure that the parameters are valid.
;                  XBitmap - The X coordinate that specifies the upper left corner of the drawing operation in reference  to  the
;                  +image itself. Pixels of the image that are to the left of XBitmap and above YBitmap do not appear.
;                  YBitMap - The Y coordinate that specifies the upper left corner of the drawing operation in reference  to  the
;                  +image itself. Pixels of the image that are to the left of XBitmap and above YBitmap do not appear.
;                  BK      - Image background color. This can be an application defined RGB value or one of the following values:
;                  |$CLR_DEFAULT - Default background color. The image is drawn using the image list background color.
;                  |$CLR_NONE    - No background color. The image is drawn transparently.
;                  FG      - Image foreground color. This member is used only if Style includes the $ILD_BLEND25 or  $ILD_BLEND50
;                  +flag. This can be an application defined RGB value or one of the following values:
;                  |$CLR_DEFAULT - Default foreground color. The image is drawn using the system highlight color.
;                  |$CLR_NONE    - No blend color. The image is blended with the color of the destination device context.
;                  Style   - Flag specifying the drawing style and, optionally, the overlay image
;                  ROP     - Value specifying a raster operation code. This defines how the color data for the  source  rectangle
;                  +will be combined with the color data for the destination rectangle to achieve the final color. This member is
;                  +ignored if Style does not include the $ILD_ROP flag. Some common raster operation codes include:
;                  |$BLACKNESS   - Fills the destination rectangle using the color from index zero in the physical palette.
;                  |$DSTINVERT   - Inverts the destination rectangle .
;                  |$MERGECOPY   - Merges the source rectangle colors with the specified pattern using the AND operator .
;                  |$MERGEPAINT  - Merges the inverted source rectangle colors with the destination rectangle colors by using the
;                  +OR operator.
;                  |$NOTSRCCOPY  - Copies the inverted source rectangle to the destination.
;                  |$NOTSRCERASE - Combines the source and destination rectangle colors by using the  OR  operator.  Inverts  the
;                  +resultant color.
;                  |$PATCOPY     - Copies the specified pattern into the destination bitmap
;                  |$PATINVERT   - Combines the specified pattern colors with the destination rectangle colors by using  the  XOR
;                  +operator.
;                  |$PATPAINT    - Combines the pattern colors with the inverted source rectangle colors and combines the  result
;                  +_with the destination rectangle colors by using the OR operator.
;                  |$SRCAND      - Combines the source and destination rectangle colors by using the Boolean AND operator.
;                  |$SRCCOPY     - Copies the source rectangle directly to the destination rectangle.
;                  |$SRCERASE    - Combines the destination rectangle's inverted colors with the source rectangle colors by using
;                  +the AND operator.
;                  |$SRCINVERT   - Combines the source and destination rectangle colors by using the Boolean XOR operator.
;                  |$SRCPAINT    - Combines the source and destination rectangle colors by using the Boolean OR operator.
;                  |$WHITENESS   - Fills the destination rectangle using the color from index one in the physical palette
;                  State   - Flag that specifies the drawing state
;                  Frame   - Used with the alpha-blending effect. When used with $ILS_ALPHA, this member holds the value for  the
;                  +alpha channel. This value can be from 0 to 255, with 0 being completely transparent, and 255 being completely
;                  +opaque.
;                  Effect  - Color used for the glow and shadow effects
; Author ........: Paul Campbell (PaulIA)
; Remarks .......:
; ===============================================================================================================================
Global Const $tagIMAGELISTDRAWPARAMS = "int Size;hwnd hWnd;int Image;hwnd hDC;int X;int Y;int CX;int CY;int XBitmap;int YBitmap;" & _
		"int BK;int FG;int Style;int ROP;int State;int Frame;int Effect"

; ===============================================================================================================================
; *******************************************************************************************************************************
; Memory Structures
; *******************************************************************************************************************************
; ===============================================================================================================================
; #INTERNAL_USE_ONLY#============================================================================================================
; Name...........: $tagMEMMAP
; Description ...: Contains information about the memory
; Fields ........: hProc - Handle to the external process
;                  Size  - Size, in bytes, of the memory block allocated
;                  Mem   - Pointer to the memory block
; Author ........: Paul Campbell (PaulIA)
; Remarks .......:
; ===============================================================================================================================
Global Const $tagMEMMAP = "hwnd hProc;int Size;ptr Mem"

; ===============================================================================================================================
; *******************************************************************************************************************************
; Time Structures
; *******************************************************************************************************************************
; ===============================================================================================================================
; #STRUCTURE# ===================================================================================================================
; Name...........: $tagFILETIME
; Description ...: Contains the number of 100-nanosecond intervals since January 1, 1601
; Fields ........: Lo - The low order part of the file time
;                  Hi - The high order part of the file time
; Author ........: Paul Campbell (PaulIA)
; Remarks .......:
; ===============================================================================================================================
Global Const $tagFILETIME = "dword Lo;dword Hi"

; #STRUCTURE# ===================================================================================================================
; Name...........: $tagSYSTEMTIME
; Description ...: Specifies a date and time, in coordinated universal time (UTC)
; Fields ........: Year     - Year
;                  Month    - Month
;                  Dow      - Day of week
;                  Day      - Day
;                  Hour     - Hour
;                  Minute   - Minute
;                  Second   - Second
;                  MSeconds - MSeconds
; Author ........: Paul Campbell (PaulIA)
; Remarks .......:
; ===============================================================================================================================
Global Const $tagSYSTEMTIME = "short Year;short Month;short Dow;short Day;short Hour;short Minute;short Second;short MSeconds"

; #STRUCTURE# ===================================================================================================================
; Name...........: $tagTIME_ZONE_INFORMATION
; Description ...: Specifies information specific to the time zone
; Fields ........: Bias    - The current bias for local time translation on this computer, in minutes
;                  StdName - A description for standard time
;                  StdDate - A SYSTEMTIME structure that contains a date and local time when the transition from daylight  saving
;                  +time to standard time occurs on this operating system.
;                  StdBias - The bias value to be used during local time translations that occur during standard time
;                  DayName - A description for daylight saving time
;                  DayDate - A SYSTEMTIME structure that contains a date and local time when the transition  from  standard  time
;                  +to daylight saving time occurs on this operating system.
;                  DayBias - The bias value to be used during local time translations that occur during daylight saving time
; Author ........: Paul Campbell (PaulIA)
; Remarks .......:
; ===============================================================================================================================
Global Const $tagTIME_ZONE_INFORMATION = "dword Bias;byte StdName[64];ushort StdDate[8];dword StdBias;byte DayName[64];ushort DayDate[8];dword DayBias"

; ===============================================================================================================================
; *******************************************************************************************************************************
; ProgressBar Structures
; *******************************************************************************************************************************
; ===============================================================================================================================
; #INTERNAL_USE_ONLY#============================================================================================================
; Name...........: $tagPBRANGE
; Description ...: Contains information about the high and low limits of a progress bar control
; Fields ........: Low          - Low limit for the progress bar control
;                  High         - High limit for the progress bar control
; Author ........: Paul Campbell (PaulIA)
; Remarks .......:
; ===============================================================================================================================
Global Const $tagPBRANGE = "int Low;int High"

; ===============================================================================================================================
; #INTERNAL_USE_ONLY#============================================================================================================
; Name...........: $tagBITMAPINFO
; Description ...: This structure defines the dimensions and color information of a Windows-based device-independent bitmap (DIB).
; Fields ........: Size          - The number of bytes required by the structure, minus the size of the RGBQuad data
;                  Width         - Specifies the width of the bitmap, in pixels
;                  Height        - Specifies the height of the bitmap, in pixels
;                  Planes        - Specifies the number of planes for the target device. This must be set to 1
;                  BitCount      - Specifies the number of bits-per-pixel
;                  Compression   - Specifies the type of compression for a compressed bottom-up bitmap
;                  SizeImage     - Specifies the size, in bytes, of the image
;                  XPelsPerMeter - Specifies the horizontal resolution, in pixels-per-meter, of the target device for the bitmap
;                  YPelsPerMeter - Specifies the vertical resolution, in pixels-per-meter, of the target device for the bitmap
;                  ClrUsed       - Specifies the number of color indexes in the color table that are actually used by the bitmap
;                  ClrImportant  - Specifies the number of color indexes that are required for displaying the bitmap
;                  RGBQuad       - An array of tagRGBQUAD structures. The elements of the array that make up the color table.
; Author ........: Paul Campbell (PaulIA)
; Remarks .......:
; ===============================================================================================================================
Global Const $tagBITMAPINFO = "dword Size;long Width;long Height;ushort Planes;ushort BitCount;dword Compression;dword SizeImage;" & _
		"long XPelsPerMeter;long YPelsPerMeter;dword ClrUsed;dword ClrImportant;dword RGBQuad"

; #STRUCTURE# ===================================================================================================================
; Name...........: $tagBLENDFUNCTION
; Description ...: $tagBLENDFUNCTION structure controls blending by specifying the blending functions for source and destination bitmaps
; Fields ........: Op     - Specifies the source blend operation:
;                  Flags  - Must be zero
;                  Alpha  - Specifies an alpha transparency value to be used on the entire source bitmap.  This value is combined
;                  +with any per-pixel alpha values in the source bitmap.  If set  to  0,  it  is  assumed  that  your  image  is
;                  +transparent. Set to 255 (opaque) when you only want to use per-pixel alpha values.
;                  Format - This member controls the way the source and destination bitmaps are interpreted:
;                  |$AC_SRC_ALPHA - This flag is set when the bitmap has an Alpha channel (that is, per-pixel alpha).  Note  that
;                  +the APIs use premultiplied alpha, which means that the red, green and blue channel values in the bitmap  must
;                  +be premultiplied with the alpha channel value.
; Author ........: Paul Campbell (PaulIA)
; Remarks .......: The source bitmap used with $tagBLENDFUNCTION must be 32 bpp
; ===============================================================================================================================
Global Const $tagBLENDFUNCTION = "byte Op;byte Flags;byte Alpha;byte Format"

; #INTERNAL_USE_ONLY#============================================================================================================
; Name...........: $tagBORDERS
; Description ...: Structure that recieves the current widths of the horizontal and vertical borders of a status window
; Fields ........: BX - Width of the horizontal border
;                  BY - Width of the vertical border
;                  RX - Width of the border between rectangles
; Author ........: Gary Frost (gafrost)
; Remarks .......:
; ===============================================================================================================================
Global Const $tagBORDERS = "int BX;int BY;int RX"

; #INTERNAL_USE_ONLY#============================================================================================================
; Name...........: $tagCHOOSECOLOR
; Description ...: Contains information the _ChooseColor function uses to initialize the Color dialog box
; Fields ........: Size           - Specifies the size, in bytes, of the structure
;                  hWndOwner      - Handle to the window that owns the dialog box
;                  hInstance      - If the $CC_ENABLETEMPLATEHANDLE flag is set in the Flags member, hInstance is a handle to a memory
;                  +object containing a dialog box template. If the $CC_ENABLETEMPLATE flag is set, hInstance is a handle to a module
;                  +that contains a dialog box template named by the lpTemplateName member. If neither $CC_ENABLETEMPLATEHANDLE
;                  +nor $CC_ENABLETEMPLATE is set, this member is ignored.
;                  rgbResult      - If the $CC_RGBINIT flag is set, rgbResult specifies the color initially selected when the dialog
;                  +box is created.
;                  CustColors     - Pointer to an array of 16 values that contain red, green, blue (RGB) values for the custom color
;                  +boxes in the dialog box.
;                  Flags          - A set of bit flags that you can use to initialize the Color dialog box. When the dialog box returns,
;                  +it sets these flags to indicate the user's input. This member can be a combination of the following flags:
;                  |$CC_ANYCOLOR             - Causes the dialog box to display all available colors in the set of basic colors
;                  |$CC_ENABLEHOOK           - Enables the hook procedure specified in the lpfnHook member
;                  |$CC_ENABLETEMPLATE       - Indicates that the hInstance and lpTemplateName members specify a dialog box template
;                  |$CC_ENABLETEMPLATEHANDLE - Indicates that the hInstance member identifies a data block that contains a preloaded
;                  +dialog box template
;                  |$CC_FULLOPEN             - Causes the dialog box to display the additional controls that allow the user to create
;                  +custom colors
;                  |$CC_PREVENTFULLOPEN      - Disables the Define Custom Color
;                  |$CC_RGBINIT              - Causes the dialog box to use the color specified in the rgbResult member as the initial
;                  +color selection
;                  |$CC_SHOWHELP             - Causes the dialog box to display the Help button
;                  |$CC_SOLIDCOLOR           - Causes the dialog box to display only solid colors in the set of basic colors
;                  lCustData      - Specifies application-defined data that the system passes to the hook procedure identified by the
;                  +lpfnHook member
;                  lpfnHook       - Pointer to a CCHookProc hook procedure that can process messages intended for the dialog box.
;                  +This member is ignored unless the CC_ENABLEHOOK flag is set in the Flags member
;                  lpTemplateName - Pointer to a null-terminated string that names the dialog box template resource in the module
;                  +identified by the hInstance m
; Author ........: Gary Frost (gafrost)
; Remarks .......:
; ===============================================================================================================================
Global Const $tagCHOOSECOLOR = "dword Size;hwnd hWndOwnder;hwnd hInstance;int rgbResult;ptr CustColors;dword Flags;int lCustData;" & _
		"ptr lpfnHook;ptr lpTemplateName"

; #INTERNAL_USE_ONLY#============================================================================================================
; Name...........: $tagCHOOSEFONT
; Description ...: Contains information that the _ChooseFont function uses to initialize the Font dialog box
; Fields ........: Size           - Specifies the size, in bytes, of the structure
;                  hWndOwner      - Handle to the window that owns the dialog box
;                  hDC            - Handle to the device context
;                  LogFont        - Pointer to a structure
;                  PointSize      - Specifies the size of the selected font, in units of 1/10 of a point
;                  Flags   - A set of bit flags that you can use to initialize the Font dialog box.
;                  +This parameter can be one of the following values:
;                  |$CF_APPLY          - Causes the dialog box to display the Apply button
;                  |$CF_ANSIONLY       - This flag is obsolete
;                  |$CF_TTONLY         - Specifies that ChooseFont should only enumerate and allow the selection of TrueType fonts
;                  |$CF_EFFECTS        - Causes the dialog box to display the controls that allow the user to specify strikeout,
;                  +underline, and text color options
;                  |$CF_ENABLEHOOK     - Enables the hook procedure specified in the lpfnHook member of this structure
;                  |$CF_ENABLETEMPLATE - Indicates that the hInstance and lpTemplateName members specify a dialog box template to use
;                  +in place of the default template
;                  |$CF_ENABLETEMPLATEHANDLE - Indicates that the hInstance member identifies a data block that contains a preloaded
;                  +dialog box template
;                  |$CF_FIXEDPITCHONLY - Specifies that ChooseFont should select only fixed-pitch fonts
;                  |$CF_FORCEFONTEXIST - Specifies that ChooseFont should indicate an error condition if the user attempts to select
;                  +a font or style that does not exist.
;                  |$CF_INITTOLOGFONTSTRUCT - Specifies that ChooseFont should use the structure pointed to by the lpLogFont member
;                  +to initialize the dialog box controls.
;                  |$CF_LIMITSIZE - Specifies that ChooseFont should select only font sizes within the range specified by the nSizeMin and nSizeMax members.
;                  |$CF_NOOEMFONTS - Same as the $CF_NOVECTORFONTS flag.
;                  |$CF_NOFACESEL - When using a LOGFONT structure to initialize the dialog box controls, use this flag to selectively prevent the dialog box
;                  +from displaying an initial selection for the font name combo box.
;                  |$CF_NOSCRIPTSEL - Disables the Script combo box.
;                  |$CF_NOSTYLESEL - When using a LOGFONT structure to initialize the dialog box controls, use this flag to selectively prevent the dialog box
;                  +from displaying an initial selection for the font style combo box.
;                  |$CF_NOSIZESEL - When using a structure to initialize the dialog box controls, use this flag to selectively prevent the dialog box from
;                  +displaying an initial selection for the font size combo box.
;                  |$CF_NOSIMULATIONS - Specifies that ChooseFont should not allow graphics device interface (GDI) font simulations.
;                  |$CF_NOVECTORFONTS - Specifies that ChooseFont should not allow vector font selections.
;                  |$CF_NOVERTFONTS - Causes the Font dialog box to list only horizontally oriented fonts.
;                  |$CF_PRINTERFONTS - Causes the dialog box to list only the fonts supported by the printer associated with the device context
;                  +(or information context) identified by the hDC member.
;                  |$CF_SCALABLEONLY - Specifies that ChooseFont should allow only the selection of scalable fonts.
;                  |$CF_SCREENFONTS - Causes the dialog box to list only the screen fonts supported by the system.
;                  |$CF_SCRIPTSONLY - Specifies that ChooseFont should allow selection of fonts for all non-OEM and Symbol character sets, as well as
;                  +the ANSI character set. This supersedes the $CF_ANSIONLY value.
;                  |$CF_SELECTSCRIPT - When specified on input, only fonts with the character set identified in the lfCharSet member of the LOGFONT
;                  +structure are displayed.
;                  |$CF_SHOWHELP - Causes the dialog box to display the Help button. The hwndOwner member must specify the window to receive the HELPMSGSTRING
;                  +registered messages that the dialog box sends when the user clicks the Help button.
;                  |$CF_USESTYLE - Specifies that the lpszStyle member is a pointer to a buffer that contains style data that ChooseFont should use to initialize
;                  +the Font Style combo box. When the user closes the dialog box, ChooseFont copies style data for the user's selection to this buffer.
;                  |$CF_WYSIWYG - Specifies that ChooseFont should allow only the selection of fonts available on both the printer and the display
;                  rgbColors - If the CF_EFFECTS flag is set, rgbColors specifies the initial text color
;                  CustData - Specifies application-defined data that the system passes to the hook procedure identified by the lpfnHook member
;                  fnHook - Pointer to a CFHookProc hook procedure that can process messages intended for the dialog box
;                  TemplateName - Pointer to a null-terminated string that names the dialog box template resource in the module
;                  +identified by the hInstance member
;                  hInstance - If the $CF_ENABLETEMPLATEHANDLE flag is set in the Flags member, hInstance is a handle to a memory
;                  +object containing a dialog box template. If the $CF_ENABLETEMPLATE flag is set, hInstance is a handle to a
;                  +module that contains a dialog box template named by the TemplateName member. If neither $CF_ENABLETEMPLATEHANDLE
;                  +nor $CF_ENABLETEMPLATE is set, this member is ignored.
;                  szStyle - Pointer to a buffer that contains style data
;                  FontType - Specifies the type of the selected font when ChooseFont returns. This member can be one or more of the following values.
;                  |$BOLD_FONTTYPE - The font weight is bold. This information is duplicated in the lfWeight member of the LOGFONT
;                  +structure and is equivalent to FW_BOLD.
;                  |$ITALIC_FONTTYPE - The italic font attribute is set. This information is duplicated in the lfItalic member of the LOGFONT structure.
;                  |$PRINTER_FONTTYPE - The font is a printer font.
;                  |$REGULAR_FONTTYPE - The font weight is normal. This information is duplicated in the lfWeight member of the LOGFONT structure and is
;                  +equivalent to FW_REGULAR.
;                  |$SCREEN_FONTTYPE - The font is a screen font.
;                  |$SIMULATED_FONTTYPE - The font is simulated by the graphics device interface (GDI).
;                  SizeMin - Specifies the minimum point size a user can select
;                  SizeMax - Specifies the maximum point size a user can select
; Author ........: Gary Frost (gafrost)
; Remarks .......:
; ===============================================================================================================================
Global Const $tagCHOOSEFONT = "dword Size;hwnd hWndOwner;hwnd hDC;ptr LogFont;int PointSize;dword Flags;int rgbColors;int CustData;" & _
		"ptr fnHook;ptr TemplateName;hwnd hInstance;ptr szStyle;dword FontType;int SizeMin;int SizeMax"

; #INTERNAL_USE_ONLY#============================================================================================================
; Name...........: $tagCURSORINFO
; Description ...: Contains global cursor information
; Fields ........: Size    - Specifies the size, in bytes, of the structure
;                  Flags   - Specifies the cursor state. This parameter can be one of the following values:
;                  |0               - The cursor is hidden
;                  |$CURSOR_SHOWING - The cursor is showing
;                  hCursor - Handle to the cursor
;                  X       - X position of the cursor, in screen coordinates
;                  Y       - Y position of the cursor, in screen coordinates
; Author ........: Paul Campbell (PaulIA)
; Remarks .......:
; ===============================================================================================================================
Global Const $tagCURSORINFO = "int Size;int Flags;hwnd hCursor;int X;int Y"

; #INTERNAL_USE_ONLY#============================================================================================================
; Name...........: $tagDISPLAY_DEVICE
; Description ...: Receives information about the display device
; Fields ........: Size   - Specifies the size, in bytes, of the structure
;                  Name   - Either the adapter device or the monitor device
;                  String - Either a description of the display adapter or of the display monitor
;                  Flags  - Device state flags:
;                  |$DISPLAY_DEVICE_ATTACHED_TO_DESKTOP - The device is part of the desktop
;                  |$DISPLAY_DEVICE_MIRRORING_DRIVER    - Represents a pseudo device used to mirror drawing for remoting or other
;                  +purposes. An invisible pseudo monitor is associated with this device.
;                  |$DISPLAY_DEVICE_MODESPRUNED         - The device has more display modes than its output devices support
;                  |$DISPLAY_DEVICE_PRIMARY_DEVICE      - The primary desktop is on the device
;                  |$DISPLAY_DEVICE_REMOVABLE           - The device is removable; it cannot be the primary display
;                  |$DISPLAY_DEVICE_VGA_COMPATIBLE      - The device is VGA compatible.
;                  ID     - This is the Plug and Play identifier
;                  Key    - Reserved
; Author ........: Paul Campbell (PaulIA)
; Remarks .......:
; ===============================================================================================================================
Global Const $tagDISPLAY_DEVICE = "int Size;char Name[32];char String[128];int Flags;char ID[128];char Key[128]"

; #INTERNAL_USE_ONLY#============================================================================================================
; Name...........: $tagFLASHWINDOW
; Description ...: Contains the flash status for a window and the number of times the system should flash the window
; Fields ........: Size    - The size of the structure, in bytes
;                  hWnd    - A handle to the window to be flashed. The window can be either opened or minimized.
;                  Flags   - The flash status. This parameter can be one or more of the following values:
;                  |$FLASHW_ALL       - Flash both the window caption and taskbar button
;                  |$FLASHW_CAPTION   - Flash the window caption
;                  |$FLASHW_STOP      - Stop flashing
;                  |$FLASHW_TIMER     - Flash continuously, until the $FLASHW_STOP flag is set
;                  |$FLASHW_TIMERNOFG - Flash continuously until the window comes to the foreground
;                  |$FLASHW_TRAY      - Flash the taskbar button
;                  Count   - The number of times to flash the window
;                  Timeout - The rate at which the window is to be flashed, in milliseconds
; Author ........: Paul Campbell (PaulIA)
; Remarks .......:
; ===============================================================================================================================
Global Const $tagFLASHWINDOW = "int Size;hwnd hWnd;int Flags;int Count;int TimeOut"

; #STRUCTURE# ===================================================================================================================
; Name...........: $tagGUID
; Description ...: Represents a globally unique identifier (GUID)
; Fields ........: Data1 - Data 1 element
;                  Data2 - Data 2 element
;                  Data3 - Data 2 element
;                  Data4 - Data 2 element
; Author ........: Paul Campbell (PaulIA)
; Remarks .......:
; ===============================================================================================================================
Global Const $tagGUID = "int Data1;short Data2;short Data3;byte Data4[8]"

; #INTERNAL_USE_ONLY#============================================================================================================
; Name...........: $tagICONINFO
; Description ...: Contains information about an icon or a cursor
; Fields ........: Icon     - Specifies the contents of the structure:
;                  |True  - Icon
;                  |False - Cursor
;                  XHotSpot - Specifies the x-coordinate of a cursor's hot spot
;                  YHotSpot - Specifies the y-coordinate of the cursor's hot spot
;                  hMask    - Specifies the icon bitmask bitmap
;                  hColor   - Handle to the icon color bitmap
; Author ........: Paul Campbell (PaulIA)
; Remarks .......:
; ===============================================================================================================================
Global Const $tagICONINFO = "int Icon;int XHotSpot;int YHotSpot;hwnd hMask;hwnd hColor"

; #INTERNAL_USE_ONLY#============================================================================================================
; Name...........: $tagLOGFONT
; Description ...: Defines the attributes of a font
; Fields ........: Height         - Height, in logical units, of the font's character cell or character
;                  Width          - Specifies the average width, in logical units, of characters in the font
;                  Escapement     - Specifies the angle, in tenths of degrees, between the escapement vector and the X axis
;                  Orientation    - Specifies the angle, in tenths of degrees, between each character's base line and the X axis
;                  Weight         - Specifies the weight of the font in the range 0 through 1000
;                  Italic         - Specifies an italic font if set to True
;                  Underline      - Specifies an underlined font if set to True
;                  StrikeOut      - Specifies a strikeout font if set to True
;                  CharSet        - Specifies the character set
;                  OutPrecision   - Specifies the output precision
;                  ClipPrecision  - Specifies the clipping precision
;                  Quality        - Specifies the output quality
;                  PitchAndFamily - Specifies the pitch and family of the font
;                  FaceName       - Specifies the typeface name of the font
; Author ........: Paul Campbell (PaulIA)
; Remarks .......:
; ===============================================================================================================================
Global Const $tagLOGFONT = "int Height;int Width;int Escapement;int Orientation;int Weight;byte Italic;byte Underline;" & _
		"byte Strikeout;byte CharSet;byte OutPrecision;byte ClipPrecision;byte Quality;byte PitchAndFamily;char FaceName[32]"

; #STRUCTURE# ===================================================================================================================
; Name...........: $tagWINDOWPOS
; Description ...: The WINDOWPOS structure contains information about the size and position of a window
; Fields ........: hWnd        - Handle to the window
;                  InsertAfter - Specifies the position of the window in Z order
;                  X           - Specifies the position of the left edge of the window
;                  Y           - Specifies the position of the top edge of the window
;                  CX          - Specifies the window width, in pixels
;                  CY          - Specifies the window height, in pixels
;                  Flags       - Specifies the window position. This member can be one or more of the following values:
;                  |$SWP_DRAWFRAME      - Draws a frame around the window
;                  |$SWP_FRAMECHANGED   - Sends a WM_NCCALCSIZE message to the window, even if the window's size is not being changed
;                  |$SWP_HIDEWINDOW     - Hides the window
;                  |$SWP_NOACTIVATE     - Does not activate the window
;                  |$SWP_NOCOPYBITS     - Discards the entire contents of the client area
;                  |$SWP_NOMOVE         - Retains the current position (ignores the x and y parameters)
;                  |$SWP_ NOOWNERZORDER - Does not change the owner window's position in the Z order
;                  |$SWP_NOREDRAW       - Does not redraw changes
;                  |$SWP_NOREPOSITION   - Same as the SWP_NOOWNERZORDER flag
;                  |$SWP_NOSENDCHANGING - Prevents the window from receiving the WM_WINDOWPOSCHANGING message
;                  |$SWP_NOSIZE         - Retains the current size (ignores the cx and cy parameters)
;                  |$SWP_NOZORDER       - Retains the current Z order (ignores the InsertAfter parameter)
;                  |$SWP_SHOWWINDOW     - Displays the window
; Author ........: Paul Campbell (PaulIA)
; Remarks .......:
; ===============================================================================================================================
Global Const $tagWINDOWPOS = "hwnd hWnd;int InsertAfter;int X;int Y;int CX;int CY;int Flags"