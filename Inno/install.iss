; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

[Setup]
AppName=PPlayer
AppVerName=PPlayer 0.9.5 Release Candidate 1
AppPublisher=Pascal K�hne
AppPublisherURL=http://pplayer.net.ms
AppSupportURL=http://sourceforge.net/projects/pplayer
AppUpdatesURL=http://sourceforge.net/projects/pplayer
DefaultDirName={pf}\PPlayer
DefaultGroupName=PPlayer
AllowNoIcons=yes
OutputBaseFilename=PPlayer_0.9.5RC1
Compression=lzma
SolidCompression=yes
ChangesAssociations=yes

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"
Name: "german"; MessagesFile: "compiler:Languages\German.isl"

[Registry]
Root: HKCU; Subkey: "Software\PPlayer" ; ValueType: string; ValueName: "DIR"; ValueData: "{app}\"
Root: HKCU; Subkey: "Software\PPlayer" ; ValueType: string; ValueName: "lang"; ValueData: "{language}"
Root: HKCR; Subkey: "pplayer"; ValueType: expandsz; ValueData: "URL:pplayer protocol"
Root: HKCR; Subkey: "pplayer"; ValueType: expandsz; ValueName: "URL Protocol"
Root: HKCR; Subkey: "pplayer\Shell\Open\Command"; ValueType: expandsz; ValueData: " ""{app}\pplayer.exe"" ""%1"""

Root: HKCR; Subkey: ".mp3"; ValueType: string; ValueName: ""; ValueData: "PPlayer MP3"; Flags: uninsdeletevalue; Tasks: associate
Root: HKCR; Subkey: ".wma"; ValueType: string; ValueName: ""; ValueData: "PPlayer WMA"; Flags: uninsdeletevalue; Tasks: associate
Root: HKCR; Subkey: ".ogg"; ValueType: string; ValueName: ""; ValueData: "PPlayer OGG"; Flags: uninsdeletevalue; Tasks: associate
Root: HKCR; Subkey: "PPlayer MP3"; ValueType: string; ValueName: ""; ValueData: "PPlayer MP3"; Flags: uninsdeletekey; Tasks: associate
Root: HKCR; Subkey: "PPlayer MP3\DefaultIcon"; ValueType: string; ValueName: ""; ValueData: "{app}\pplayer.exe,0"; Tasks: associate
Root: HKCR; Subkey: "PPlayer MP3\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\pplayer.exe"" ""%1"""; Tasks: associate

Root: HKCR; Subkey: "PPlayer WMA"; ValueType: string; ValueName: ""; ValueData: "PPlayer WMA"; Flags: uninsdeletekey; Tasks: associate
Root: HKCR; Subkey: "PPlayer WMA\DefaultIcon"; ValueType: string; ValueName: ""; ValueData: "{app}\pplayer.exe,0"; Tasks: associate
Root: HKCR; Subkey: "PPlayer WMA\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\pplayer.exe"" ""%1"""; Tasks: associate

Root: HKCR; Subkey: "PPlayer OGG"; ValueType: string; ValueName: ""; ValueData: "PPlayer OGG"; Flags: uninsdeletekey; Tasks: associate
Root: HKCR; Subkey: "PPlayer OGG\DefaultIcon"; ValueType: string; ValueName: ""; ValueData: "{app}\pplayer.exe,0"; Tasks: associate
Root: HKCR; Subkey: "PPlayer OGG\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\pplayer.exe"" ""%1"""; Tasks: associate

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"
Name: "quicklaunchicon"; Description: "{cm:CreateQuickLaunchIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked
Name: "associate"; Description: "&Associate MP3/WMA/OGG with PPlayer"; GroupDescription: "Other tasks:"

[Files]
Source: "..\pplayer.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\*.au3"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\resource\*"; DestDir: "{app}\resource"; Flags: ignoreversion
Source: "..\include\*"; DestDir: "{app}\include"; Flags: ignoreversion recursesubdirs
Source: "..\..\def\*"; DestDir: "{app}\Skins"; Flags: ignoreversion recursesubdirs
Source: "..\Plugins\*"; DestDir: "{app}\Plugins"; Flags: ignoreversion recursesubdirs

[UninstallDelete]

Type: filesandordirs; Name: "{app}\covers"
Type: filesandordirs; Name: "{app}\Radio"
Type: filesandordirs; Name: "{app}\Skins"
Type: files; Name: "{app}\db\*.ini"
Type: files; Name: "{app}\db\error.log"


; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{group}\PPlayer"; Filename: "{app}\pplayer.exe"
Name: "{group}\{cm:UninstallProgram,PPlayer}"; Filename: "{uninstallexe}"
Name: "{commondesktop}\PPlayer"; Filename: "{app}\pplayer.exe"; Tasks: desktopicon
Name: "{userappdata}\Microsoft\Internet Explorer\Quick Launch\PPlayer"; Filename: "{app}\pplayer.exe"; Tasks: quicklaunchicon

[Run]
Filename: "{app}\pplayer.exe"; Description: "{cm:LaunchProgram,PPlayer}"; Flags: nowait postinstall skipifsilent

