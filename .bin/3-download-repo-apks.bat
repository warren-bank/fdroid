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

rem :: https://github.com/warren-bank/Android-ExoPlayer-AirPlay-Receiver/releases
call :do_download "https://github.com/warren-bank/Android-ExoPlayer-AirPlay-Receiver/releases/download/v3.4.5/ExoPlayer-AirPlay-Receiver-003.04.05-16API-withAllLanguageTranslations-noDecoderExtensions-release.apk"
call :do_download "https://github.com/warren-bank/Android-ExoPlayer-AirPlay-Receiver/releases/download/v3.4.5/ExoPlayer-AirPlay-Receiver-003.04.05-16API-withAllLanguageTranslations-withDecoderExtensions-arm64-v8a-release.apk"
call :do_download "https://github.com/warren-bank/Android-ExoPlayer-AirPlay-Receiver/releases/download/v3.4.5/ExoPlayer-AirPlay-Receiver-003.04.05-16API-withAllLanguageTranslations-withDecoderExtensions-armeabi-v7a-release.apk"
call :do_download "https://github.com/warren-bank/Android-ExoPlayer-AirPlay-Receiver/releases/download/v3.4.5/ExoPlayer-AirPlay-Receiver-003.04.05-16API-withAllLanguageTranslations-withDecoderExtensions-x86-release.apk"
call :do_download "https://github.com/warren-bank/Android-ExoPlayer-AirPlay-Receiver/releases/download/v3.4.5/ExoPlayer-AirPlay-Receiver-003.04.05-16API-withAllLanguageTranslations-withDecoderExtensions-x86_64-release.apk"

goto :done

:do_download
  set apk_url=%~1

  wget %wget_opts% "%apk_url%"
  goto :eof

:done
