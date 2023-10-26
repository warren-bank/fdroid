@echo off

set metadata_dir=%~dp0..\metadata
set default_locale=en

set log_dirpath=%~dp0.\log
set log_filepath=%log_dirpath%\%~n0.txt

set wget_opts=
set wget_opts=%wget_opts% --no-check-certificate
set wget_opts=%wget_opts% --no-hsts
set wget_opts=%wget_opts% -nv -a "%log_filepath%"
rem :: do NOT overwrite if output filepath already exists
set wget_opts=%wget_opts% -nc

if not exist "%log_dirpath%" mkdir "%log_dirpath%"
if exist "%log_filepath%" del "%log_filepath%"

call :do_download "com.github.warren_bank.exoplayer_airplay_receiver"               "https://github.com/warren-bank/Android-ExoPlayer-AirPlay-Receiver/raw/v03/android-studio-project/ExoPlayer-AirPlay-Receiver/src/main/res/drawable/launcher.png"
call :do_download "com.github.warren_bank.mock_location"                            "https://github.com/warren-bank/Android-Mock-Location/raw/service/android-studio-project/Mock-my-GPS/src/main/res/drawable/launcher.png"
call :do_download "com.github.warren_bank.mock_location.service.microg_nlp_backend" "https://github.com/warren-bank/Android-Mock-Location/raw/service/android-studio-project/Mock-my-GPS-UnifiedNlp-Backend/src/main/res/drawable/launcher.png"
call :do_download "com.github.warren_bank.webmonkey"                                "https://github.com/warren-bank/Android-WebMonkey/raw/v03/android-studio-project/WebMonkey/src/main/res/drawable/launcher.png"
call :do_download "com.github.warren_bank.webcast"                                  "https://github.com/warren-bank/Android-WebCast/raw/05-webcast-filename-media3/android-studio-project/WebCast/src/main/res/mipmap-xxxhdpi/ic_launcher_black.png"
call :do_download "com.github.warren_bank.nodejs_frontend"                          "https://github.com/warren-bank/Android-NodeJS-Frontend/raw/master/android-studio-project/NodeJS-Frontend/src/main/res/mipmap-xxxhdpi/launcher.png"
call :do_download "com.github.warren_bank.tiny_television_time_tracker"             "https://github.com/warren-bank/Android-Tiny-Television-Time-Tracker/raw/fork/tmdb/android-studio-project/TV-Tracker/src/main/res/drawable-v21/icon.png"

goto :done

:do_download
  set package_id=%~1
  set icon_url=%~2
  set output_dirpath=%metadata_dir%\%package_id%\%default_locale%
  set output_filepath=%output_dirpath%\icon.png

  if not exist "%output_dirpath%" mkdir "%output_dirpath%"

  wget %wget_opts% -O "%output_filepath%" "%icon_url%"
  goto :eof

:done