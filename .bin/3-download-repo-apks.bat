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

rem :: https://github.com/warren-bank/fork-Android-My-Places/releases
call :do_download "https://github.com/warren-bank/fork-Android-My-Places/releases/download/modified/v1.20.01/My-Places-release.apk"

rem :: https://github.com/warren-bank/fork-Android-KeePassDX/releases
call :do_download "https://github.com/warren-bank/fork-Android-KeePassDX/releases/download/fork/01-reset-group-when-url-opens/v2.9.1-002/KeePassDX-libre-release.apk"

rem :: https://github.com/warren-bank/Android-ExoPlayer-demos/releases
call :do_download "https://github.com/warren-bank/Android-ExoPlayer-demos/releases/download/r2.14.0.000/1-main-noDecoderExtensions-release.apk"
call :do_download "https://github.com/warren-bank/Android-ExoPlayer-demos/releases/download/r2.14.0.000/2-cast-release.apk"
call :do_download "https://github.com/warren-bank/Android-ExoPlayer-demos/releases/download/r2.14.0.000/3-gl-release.apk"

rem :: https://github.com/warren-bank/Android-libVLC-Demo/releases
call :do_download "https://github.com/warren-bank/Android-libVLC-Demo/releases/download/v2.1.12-007/libVLC-Demo-arm64-v8a-release.apk"
call :do_download "https://github.com/warren-bank/Android-libVLC-Demo/releases/download/v2.1.12-007/libVLC-Demo-armeabi-v7a-release.apk"
call :do_download "https://github.com/warren-bank/Android-libVLC-Demo/releases/download/v2.1.12-007/libVLC-Demo-x86-release.apk"
call :do_download "https://github.com/warren-bank/Android-libVLC-Demo/releases/download/v2.1.12-007/libVLC-Demo-x86_64-release.apk"

rem :: https://github.com/warren-bank/Android-AppRTCMobile/releases
call :do_download "https://github.com/warren-bank/Android-AppRTCMobile/releases/download/v1.0.28513.01/AppRTCMobile-arm64-v8a-release.apk"
call :do_download "https://github.com/warren-bank/Android-AppRTCMobile/releases/download/v1.0.28513.01/AppRTCMobile-armeabi-v7a-release.apk"
call :do_download "https://github.com/warren-bank/Android-AppRTCMobile/releases/download/v1.0.28513.01/AppRTCMobile-x86-release.apk"
call :do_download "https://github.com/warren-bank/Android-AppRTCMobile/releases/download/v1.0.28513.01/AppRTCMobile-x86_64-release.apk"

goto :done

:do_download
  set apk_url=%~1

  wget %wget_opts% "%apk_url%"
  goto :eof

:done
