@echo off
:start
cls
title ADB��������ϼ�
echo =========================================================
echo ADB��������ϼ�
echo 1 ����Shizuku����
echo 2 ��������
echo 3 fooviewȨ������
echo 0 �ֶ���������
echo =========================================================
set /p command=

if "%command%"=="1" (
echo =======================
echo ��������Shizuku����
echo =======================
@echo on
adb.exe shell sh /data/user_de/0/moe.shizuku.privileged.api/start.sh
@echo off
echo =======================
echo ���н���
pause
goto start
)

if "%command%"=="2" (
echo =======================
echo �����������з���
echo =======================
@echo on
adb.exe shell sh /data/data/me.piebridge.brevent/brevent.sh
@echo off
echo =======================
echo ���н���
pause
goto start
)

if "%command%"=="3" (
echo =======================
echo ��������fooview���Ȩ��
echo =======================
@echo on
adb.exe pm grant com.fooview.android.fooview android.permission.READ_LOGS
adb.exe pm grant com.fooview.android.fooview android.permission.WRITE_SECURE_SETTINGS
@echo off
echo =======================
echo ���н���
pause
goto start
)

if "%command%"=="0" (
echo =======================
echo ���ڴ�������ʾ����
echo �������ʱͨ������adb.bat���ز˵�
echo =======================
cmd.exe
)