@echo off
:start
title �ļ�����
echo ==============================================
echo ��������Ҫͨ���ֻ�Download�ļ��д���
echo ���ֻ������ļ�ʱ��ȷ�����ļ���Download�ļ�����
echo ==============================================
echo ѡ���书��
echo 0 �ֶ���������
echo 1 ���ֻ������ļ�
echo 2 �ӵ��Դ����ļ�
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
echo ���ڻ�ȡ�ļ��б�
echo ��û�п�����Ҫ������ļ����뽫�临�Ƶ��ֻ������Download�ļ�����
echo ==============================================
adb.exe shell ls /sdcard/Download
echo ==============================================
echo ��������Ҫ������ļ���
set /p fileName=
echo ==============================================
md %TEMP%\Portal\
adb.exe pull /sdcard/Download/%fileName% %TEMP%\Portal\%fileName%
echo ==============================================
echo ������ɣ����ڵ������Ĵ����н��ļ��ƶ�����Ҫ��ŵĵط��������ļ���ʧ
echo ==============================================
start %TEMP%\Portal
goto start


:filepush
echo =======================
echo �����ļ������»س����ļ����ᴫ�䵽�ֻ������Download�ļ�����
echo ע�⣺һ��ֻ�ܴ���һ���ļ���
echo =======================
set /p filePath=
call :push %filePath%

:push
set fileName=%~nx1
echo =
adb.exe push %filePath% /sdcard/Download/%fileName%
echo =
echo �������
pause
goto start

:cmd
echo =======================
echo ���ڴ�������ʾ����
echo �������ʱͨ������fileportal.bat���ز˵�
echo �����ļ������ʽΪ
echo adb.exe push/pull "Դ�ļ���ַ" "���䵽�ļ���ַ"
echo ע�⣬������Ҫͬ�����������ļ���
echo =======================
cmd.exe