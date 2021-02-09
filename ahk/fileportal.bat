@echo off
:start
title 文件传输
echo ==============================================
echo 本工具主要通过手机Download文件夹传输
echo 从手机复制文件时请确保该文件在Download文件夹中
echo ==============================================
echo 选择传输功能
echo 0 手动输入命令
echo 1 从手机复制文件
echo 2 从电脑传输文件
echo ==============================================
set /p action=
echo ==============================================

if "%action%"=="0" (
goto cmd
)

if "%action%"=="1" (
goto filepull
)

if "%action%"=="2" (
goto filepush
)

:filepull
echo 正在获取文件列表
echo 若没有看到想要传输的文件，请将其复制到手机储存的Download文件夹下
echo ==============================================
adb.exe shell ls /sdcard/Download
echo ==============================================
echo 请输入想要传输的文件名
set /p fileName=
echo ==============================================
md %TEMP%\Portal\
adb.exe pull /sdcard/Download/%fileName% %TEMP%\Portal\%fileName%
echo ==============================================
echo 传输完成，请在弹出来的窗口中将文件移动到需要存放的地方，避免文件丢失
echo ==============================================
start %TEMP%\Portal
goto start


:filepush
echo =======================
echo 拖入文件并按下回车，文件将会传输到手机储存的Download文件夹下
echo 注意：一次只能传输一个文件。
echo =======================
set /p filePath=
call :push %filePath%

:push
set fileName=%~nx1
echo =
adb.exe push %filePath% /sdcard/Download/%fileName%
echo =
echo 传输完毕
pause
goto start

:cmd
echo =======================
echo 正在打开命令提示符。
echo 你可以随时通过输入fileportal.bat返回菜单
echo 传输文件命令格式为
echo adb.exe push/pull "源文件地址" "传输到文件地址"
echo 注意，后者需要同样带上完整文件名
echo =======================
cmd.exe