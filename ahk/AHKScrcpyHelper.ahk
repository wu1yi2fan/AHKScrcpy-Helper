SetWorkingDir %A_ScriptDir%
SetBatchLines -1

RunScrcpy() {
sc := ComObjCreate("ScriptControl")
sc.Language := "VBScript"
script =
(
CreateObject("Wscript.Shell").Run "cmd /c scrcpy.exe --window-title ""Scrcpy Portal"" --push-target /sdcard/Download/", 0, false
)
sc.ExecuteStatement(script)
}

Gui Add, Tab3, x2 y1 w320 h53, 主要|更多
Gui Tab, 1
Gui Add, Button, x6 y25 w28 h23, ≡
Gui Font, s14 q0
Gui Add, Button, x40 y25 w28 h23, ◻
Gui Font
Gui Add, Button, x74 y25 w28 h23, ＜
Gui Add, Button, x108 y25 w42 h23, 亮屏
Gui Add, Button, x156 y25 w42 h23, 熄屏
Gui Add, Button, x205 y25 w42 h23, 启动
Gui Add, Button, x254 y25 w28 h23,+
Gui Add, Button, x289 y25 w28 h23,-
Gui Tab, 2
Gui Add, Button, x6 y26 w42 h23, 关于
Gui Add, Button, x54 y26 w42 h23, Adb
Gui Add, Button, x102 y26 w42 h23, 调试
Gui Add, Button, x150 y26 w60 h23, 文件传输
Gui Tab

Gui Show, w323 h56, AHKScrcpy Helper
Return

Button启动:
RunScrcpy()
return

Button熄屏:
if (WinExist("Scrcpy Portal")) {
    WinActivate 
	send !{o}
	}
Return

Button亮屏:
if (WinExist("Scrcpy Portal")) {
    WinActivate 
	send +!{o}
	}
Return

Button≡:
if (WinExist("Scrcpy Portal")) {
    WinActivate 
	send !{s}
	}
Return

Button◻:
if (WinExist("Scrcpy Portal")) {
    WinActivate 
	send !{h}
	}
Return

Button＜:
if (WinExist("Scrcpy Portal")) {
    WinActivate 
	send !{b}
	}
Return

Button+:
if (WinExist("Scrcpy Portal")) {
    WinActivate 
	send !{Up}
	}
Return

Button-:
if (WinExist("Scrcpy Portal")) {
    WinActivate 
	send !{Down}
	}
Return

ButtonAdb:
RunWait  %comSpec% /c "adb.bat"
Return

Button文件传输:
RunWait  %comSpec% /c "fileportal.bat"
Return


Button调试:
RUN scrcpy.exe --window-title "Scrcpy Portal" --push-target /sdcard/Download/
return

GuiEscape:
GuiClose:
    ExitApp
