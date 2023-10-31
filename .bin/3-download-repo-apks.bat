@echo off

set repo_dir=%~dp0..\repo

set log_dirpath=%~dp0.\log
set log_filepath=%log_dirpath%\%~n0.txt

set wget_opts=
set wget_opts=%wget_opts% -P "%repo_dir%"
set wget_opts=%wget_opts% --no-check-certificate
set wget_opts=%wget_opts% --no-hsts
set wget_opts=%wget_opts% -nv -a "%log_filepath%"
rem :: do NOT overwrite if output filepath already exists
set wget_opts=%wget_opts% -nc

if not exist "%log_dirpath%" mkdir "%log_dirpath%"
if exist "%log_filepath%" del "%log_filepath%"

if not exist "%repo_dir%" mkdir "%repo_dir%"

rem :: https://github.com/warren-bank/Android-RTSP-ScreenCaster/releases
call :do_download "https://github.com/warren-bank/Android-RTSP-ScreenCaster/releases/download/v01.01.05/RTSP-ScreenCaster-release.apk"

rem :: https://github.com/warren-bank/Android-AirTunes-Client/releases
call :do_download "https://github.com/warren-bank/Android-AirTunes-Client/releases/download/v1.0.0/AirTunes-Client-001.00.00-01API-release.apk"

rem :: https://github.com/warren-bank/Android-Broadcast-Mock-SMS/releases
call :do_download "https://github.com/warren-bank/Android-Broadcast-Mock-SMS/releases/download/v02.00.05/Broadcast-Mock-SMS-release.apk"

rem :: https://github.com/warren-bank/Android-Broadcast-SMS_SENT/releases
call :do_download "https://github.com/warren-bank/Android-Broadcast-SMS_SENT/releases/download/v0.2.0/Broadcast-SMS_SENT-release.apk"

rem :: https://github.com/warren-bank/fork-Android-Plumble/releases
call :do_download "https://github.com/warren-bank/fork-Android-Plumble/releases/download/3.3.0-rc1.mod-0.0.11/Plumble.apk"

goto :done

:do_download
  set apk_url=%~1

  wget %wget_opts% "%apk_url%"
  goto :eof

:done
