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

goto :done

:do_download
  set apk_url=%~1

  wget %wget_opts% "%apk_url%"
  goto :eof

:done
