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
call :do_download "com.github.warren_bank.bookmarks"                                "https://github.com/warren-bank/Android-Bookmarks/raw/v02/android-studio-project/Bookmarks/src/main/res/drawable/icon_app.png"
call :do_download "com.github.warren_bank.myplaces"                                 "https://github.com/warren-bank/Android-MyPlaces/raw/master/android-studio-project/MyPlaces/src/main/res/drawable/ic_launcher.png"
call :do_download "com.cb.oneclipboard.android.server"                              "https://github.com/warren-bank/fork-Java-OneClipboard/raw/improvements/android-studio-project/OneClipboardAndroidServer/src/main/res/drawable/logo.png"
call :do_download "com.cb.oneclipboard.android.client"                              "https://github.com/warren-bank/fork-Java-OneClipboard/raw/improvements/android-studio-project/OneClipboardAndroidClient/src/main/res/drawable/logo.png"
call :do_download "com.github.warren_bank.airplay_client"                           "https://github.com/warren-bank/Android-AirPlay-Client/raw/master/android-studio-project/AirPlay-Client/src/main/res/drawable-xxhdpi/ic_launcher.png"
call :do_download "com.github.warren_bank.locale_changer"                           "https://github.com/warren-bank/Android-Locale-Changer/raw/master/android-studio-project/Locale-Changer/src/main/res/drawable/ic_launcher.png"
call :do_download "com.github.warren_bank.sms_automatic_reply_gps"                  "https://github.com/warren-bank/Android-SMS-Automatic-Reply-GPS/raw/master/android-studio-project/SMS-my-GPS/src/main/res/drawable/launcher.png"
call :do_download "com.github.warren_bank.sms_automatic_forwarding"                 "https://github.com/warren-bank/Android-SMS-Automatic-Forwarding/raw/master/android-studio-project/SMS-Forwarding/src/main/res/drawable/launcher.png"
call :do_download "com.github.warren_bank.slideshow_screensaver"                    "https://github.com/warren-bank/Android-Image-Slideshow-Screensaver/raw/v02/android-studio-project/Slideshow-Screensaver/src/main/res/drawable/launcher.png"
call :do_download "com.github.warren_bank.adb_over_wifi"                            "https://github.com/warren-bank/Android-ADB-over-WiFi/raw/master/android-studio-project/ADB-over-WiFi/src/main/res/drawable/ic_launcher.png"
call :do_download "com.github.warren_bank.root_script_runner"                       "https://github.com/warren-bank/Android-Root-Script-Runner/raw/master/android-studio-project/Root-Script-Runner/src/main/res/drawable/ic_launcher.png"
call :do_download "com.github.warren_bank.cli_feedback"                             "https://github.com/google/material-design-icons/raw/4.0.0/png/social/notifications_active/materialiconstwotone/48dp/2x/twotone_notifications_active_black_48dp.png"
call :do_download "com.github.warren_bank.ptt_bluetooth_speaker.receiver"           "https://github.com/warren-bank/Android-PTT-Bluetooth-Speaker/raw/master/android-studio-project/PTT-Bluetooth-Speaker-Receiver/src/main/res/drawable/phone_bluetooth_speaker.png"
call :do_download "com.github.warren_bank.ptt_bluetooth_speaker.sender"             "https://github.com/warren-bank/Android-PTT-Bluetooth-Speaker/raw/master/android-studio-project/PTT-Bluetooth-Speaker-Sender/src/main/res/drawable/phone_in_talk.png"
call :do_download "com.github.warren_bank.bonjour_webrtc"                           "https://github.com/warren-bank/Android-Bonjour-WebRTC/raw/master/android-studio-project/Bonjour-WebRTC/src/main/res/drawable/launcher.png"
call :do_download "org.proxydroid"                                                  "https://github.com/warren-bank/fork-Android-proxydroid/raw/no-ads/android-studio-project/proxydroid/src/main/res/mipmap-xxxhdpi/ic_launcher.png"
call :do_download "org.mushare.httper"                                              "https://github.com/warren-bank/fork-Android-Httper/raw/feature/01-periodic-requests-service/app/src/main/res/mipmap-xxxhdpi/ic_launcher.png"
call :do_download "com.github.warren_bank.rtsp_ipcam_viewer"                        "https://github.com/warren-bank/Android-RTSP-IPCam-Viewer/raw/master/android-studio-project/RTSP-IPCam-Viewer/src/main/res/mipmap-xxxhdpi/ic_launcher.png"
call :do_download "org.fdroid.fdroid"                                               "https://github.com/warren-bank/fork-Android-fdroidclient/raw/master/app/src/main/res/drawable-xxxhdpi/ic_launcher.png"
call :do_download "org.fdroid.basic"                                                "https://github.com/warren-bank/fork-Android-fdroidclient/raw/master/app/src/main/res/drawable-xxxhdpi/ic_launcher.png"
call :do_download "com.looker.droidify"                                             "https://github.com/warren-bank/fork-Android-Droidify/raw/main/app/src/main/res/mipmap-xxxhdpi/ic_launcher_round.png"

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
