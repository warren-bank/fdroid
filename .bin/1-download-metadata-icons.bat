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

call :do_download "com.github.warren_bank.rtsp_screencaster"                        "https://github.com/warren-bank/Android-RTSP-ScreenCaster/raw/master/android-studio-project/libscreening-examples/RTSP-ScreenCaster/src/main/res/drawable/launcher.png"
call :do_download "com.github.warren_bank.airtunes_client"                          "https://upload.wikimedia.org/wikipedia/commons/thumb/6/64/AirPlay_Audio_logo.svg/240px-AirPlay_Audio_logo.svg.png"
call :do_download "com.github.warren_bank.broadcast_mock_sms"                       "https://github.com/warren-bank/Android-Broadcast-Mock-SMS/raw/master/android-studio-project/Broadcast-Mock-SMS/src/main/res/drawable/ic_launcher.png"
call :do_download "com.github.warren_bank.broadcast_sms_sent"                       "https://cdn-icons-png.flaticon.com/256/4279/4279725.png"
call :do_download "com.morlunk.mumbleclient"                                        "https://github.com/warren-bank/fork-Android-Plumble/raw/master/app/src/main/res/drawable-xxhdpi/ic_launcher.png"
call :do_download "rrapps.myplaces"                                                 "https://github.com/warren-bank/fork-Android-My-Places/raw/fork/05-minor-tweaks-and-customizations/android-studio-project/My-Places/src/main/res/drawable-xxxhdpi/m_places_launcher_256.png"

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
