@echo off
:start
cls
title ADB常用命令合集
echo =========================================================
echo ADB常用命令合集
echo 1 启动Shizuku服务
echo 2 启动黑阈
echo 3 fooview权限授予
echo 0 手动输入命令
echo =========================================================
set /p command=

if "%command%"=="1" (
echo =======================
echo 正在启动Shizuku服务
echo =======================
@echo on
adb.exe shell sh /data/user_de/0/moe.shizuku.privileged.api/start.sh
@echo off
echo =======================
echo 运行结束
pause
goto start
)

if "%command%"=="2" (
echo =======================
echo 正在启动黑阈服务
echo =======================
@echo on
adb.exe shell sh /data/data/me.piebridge.brevent/brevent.sh
@echo off
echo =======================
echo 运行结束
pause
goto start
)

if "%command%"=="3" (
echo =======================
echo 正在授予fooview相关权限
echo =======================
@echo on
adb.exe pm grant com.fooview.android.fooview android.permission.READ_LOGS
adb.exe pm grant com.fooview.android.fooview android.permission.WRITE_SECURE_SETTINGS
@echo off
echo =======================
echo 运行结束
pause
goto start
)

if "%command%"=="0" (
echo =======================
echo 正在打开命令提示符。
echo 你可以随时通过输入adb.bat返回菜单
echo =======================
cmd.exe
)