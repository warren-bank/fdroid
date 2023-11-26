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

rem :: https://github.com/warren-bank/Android-Mock-Location/releases
call :do_download "https://github.com/warren-bank/Android-Mock-Location/releases/download/service/v02.03.01/Mock-my-GPS-002.03.01-03API-withAllLanguageTranslations-withAospLocationProviders-release.apk"
call :do_download "https://github.com/warren-bank/Android-Mock-Location/releases/download/service/v02.03.01/Mock-my-GPS-002.03.01-19API-withAllLanguageTranslations-withGooglePlayServicesFusedLocationProvider-release.apk"
call :do_download "https://github.com/warren-bank/Android-Mock-Location/releases/download/service/v02.03.01/Mock-my-GPS-002.03.01-19API-withAllLanguageTranslations-withHuaweiMobileServicesFusedLocationProvider-release.apk"
call :do_download "https://github.com/warren-bank/Android-Mock-Location/releases/download/service/v02.03.01/Mock-my-GPS-UnifiedNlp-Backend-002.03.01-09API-withAllLanguageTranslations-release.apk"

rem :: https://github.com/warren-bank/Android-WebMonkey/releases
call :do_download "https://github.com/warren-bank/Android-WebMonkey/releases/download/v03.00.01/WebMonkey-003.00.01-08API-english-noAdBlock-release.apk"
call :do_download "https://github.com/warren-bank/Android-WebMonkey/releases/download/v03.00.01/WebMonkey-003.00.01-08API-english-withAdBlock-release.apk"
call :do_download "https://github.com/warren-bank/Android-WebMonkey/releases/download/v03.00.01/WebMonkey-003.00.01-08API-withAllLanguageTranslations-noAdBlock-release.apk"
call :do_download "https://github.com/warren-bank/Android-WebMonkey/releases/download/v03.00.01/WebMonkey-003.00.01-08API-withAllLanguageTranslations-withAdBlock-release.apk"

rem :: https://github.com/warren-bank/Android-WebCast/releases
call :do_download "https://github.com/warren-bank/Android-WebCast/releases/download/v05.01.00/WebCast-005.01.00-16API-withAllLanguageTranslations-withAdBlock-release.apk"

rem :: https://github.com/warren-bank/Android-NodeJS-Frontend/releases
call :do_download "https://github.com/warren-bank/Android-NodeJS-Frontend/releases/download/v1.0.2/NodeJS-Frontend-001.00.02-19API-withAllLanguageTranslations-arm64-v8a-release.apk"
call :do_download "https://github.com/warren-bank/Android-NodeJS-Frontend/releases/download/v1.0.2/NodeJS-Frontend-001.00.02-19API-withAllLanguageTranslations-armeabi-v7a-release.apk"
call :do_download "https://github.com/warren-bank/Android-NodeJS-Frontend/releases/download/v1.0.2/NodeJS-Frontend-001.00.02-19API-withAllLanguageTranslations-x86-release.apk"
call :do_download "https://github.com/warren-bank/Android-NodeJS-Frontend/releases/download/v1.0.2/NodeJS-Frontend-001.00.02-19API-withAllLanguageTranslations-x86_64-release.apk"

rem :: https://github.com/warren-bank/Android-Tiny-Television-Time-Tracker/releases
call :do_download "https://github.com/warren-bank/Android-Tiny-Television-Time-Tracker/releases/download/tmdb/008.00.24-09API/TV-Tracker-008.00.24-09API-english-release.apk"
call :do_download "https://github.com/warren-bank/Android-Tiny-Television-Time-Tracker/releases/download/tmdb/008.00.24-09API/TV-Tracker-008.00.24-09API-withAllLanguageTranslations-release.apk"

rem :: https://github.com/warren-bank/Android-Bookmarks/releases
call :do_download "https://github.com/warren-bank/Android-Bookmarks/releases/download/002.00.01-09API/Bookmarks-002.00.01-09API-withUserRuntimePermissions-english-release.apk"
call :do_download "https://github.com/warren-bank/Android-Bookmarks/releases/download/002.00.01-09API/Bookmarks-002.00.01-09API-withUserRuntimePermissions-withAllLanguageTranslations-release.apk"

rem :: https://github.com/warren-bank/Android-MyPlaces/releases
call :do_download "https://github.com/warren-bank/Android-MyPlaces/releases/download/v05.00.05/MyPlaces-release.apk"

rem :: https://github.com/warren-bank/fork-Java-OneClipboard/releases
call :do_download "https://github.com/warren-bank/fork-Java-OneClipboard/releases/download/improvements/v3.1.3/OneClipboardAndroidServer-3.01.03-release.apk"
call :do_download "https://github.com/warren-bank/fork-Java-OneClipboard/releases/download/improvements/v3.1.3/OneClipboardAndroidClient-3.01.03-release.apk"

rem :: https://github.com/warren-bank/Android-AirPlay-Client/releases
call :do_download "https://github.com/warren-bank/Android-AirPlay-Client/releases/download/v0.5.5/AirPlay-Client-000.05.05-14API-english-release.apk"
call :do_download "https://github.com/warren-bank/Android-AirPlay-Client/releases/download/v0.5.5/AirPlay-Client-000.05.05-14API-withAllLanguageTranslations-release.apk"

rem :: https://github.com/warren-bank/Android-Locale-Changer/releases
call :do_download "https://github.com/warren-bank/Android-Locale-Changer/releases/download/v1.1.0/Locale-Changer-release.apk"

rem :: https://github.com/warren-bank/Android-SMS-Automatic-Reply-GPS/releases
call :do_download "https://github.com/warren-bank/Android-SMS-Automatic-Reply-GPS/releases/download/v2.1.7/SMS-my-GPS-release.apk"

rem :: https://github.com/warren-bank/Android-SMS-Automatic-Forwarding/releases
call :do_download "https://github.com/warren-bank/Android-SMS-Automatic-Forwarding/releases/download/v1.0.3/SMS-Forwarding-release.apk"

rem :: https://github.com/warren-bank/Android-Image-Slideshow-Screensaver/releases
call :do_download "https://github.com/warren-bank/Android-Image-Slideshow-Screensaver/releases/download/v2.1.4/Slideshow-Screensaver-002.01.04-17API-withAllLanguageTranslations-release.apk"

rem :: https://github.com/warren-bank/Android-ADB-over-WiFi/releases
call :do_download "https://github.com/warren-bank/Android-ADB-over-WiFi/releases/download/v01.00.01/ADB-over-WiFi-release.apk"

rem :: https://github.com/warren-bank/Android-Root-Script-Runner/releases
call :do_download "https://github.com/warren-bank/Android-Root-Script-Runner/releases/download/v01.00.01/Root-Script-Runner-release.apk"

rem :: https://github.com/warren-bank/Android-CLI-Feedback/releases
call :do_download "https://github.com/warren-bank/Android-CLI-Feedback/releases/download/v02.00.00/CLI-Feedback-release.apk"

rem :: https://github.com/warren-bank/Android-PTT-Bluetooth-Speaker/releases
call :do_download "https://github.com/warren-bank/Android-PTT-Bluetooth-Speaker/releases/download/v1.1.3/PTT-Bluetooth-Speaker-Receiver-001.01.03-10API-withAllLanguageTranslations-release.apk"
call :do_download "https://github.com/warren-bank/Android-PTT-Bluetooth-Speaker/releases/download/v1.1.3/PTT-Bluetooth-Speaker-Sender-001.01.03-10API-withAllLanguageTranslations-release.apk"

rem :: https://github.com/warren-bank/Android-Bonjour-WebRTC/releases
call :do_download "https://github.com/warren-bank/Android-Bonjour-WebRTC/releases/download/v01.03.09/Bonjour-WebRTC-001.03.09-16API-withAllLanguageTranslations-arm64-v8a-release.apk"
call :do_download "https://github.com/warren-bank/Android-Bonjour-WebRTC/releases/download/v01.03.09/Bonjour-WebRTC-001.03.09-16API-withAllLanguageTranslations-armeabi-v7a-release.apk"
call :do_download "https://github.com/warren-bank/Android-Bonjour-WebRTC/releases/download/v01.03.09/Bonjour-WebRTC-001.03.09-16API-withAllLanguageTranslations-x86-release.apk"
call :do_download "https://github.com/warren-bank/Android-Bonjour-WebRTC/releases/download/v01.03.09/Bonjour-WebRTC-001.03.09-16API-withAllLanguageTranslations-x86_64-release.apk"

rem :: https://github.com/warren-bank/fork-Android-proxydroid/releases
call :do_download "https://github.com/warren-bank/fork-Android-proxydroid/releases/download/no-ads/v3.2.0.003/proxydroid-3.2.0.003-withAllLanguageTranslations-universal-release.apk"

rem :: https://github.com/warren-bank/fork-Android-Httper/releases
call :do_download "https://github.com/warren-bank/fork-Android-Httper/releases/download/1.04.02-periodic-requests-service/Httper-1.04.02-periodic-requests-service-arm64-v8a-release.apk"
call :do_download "https://github.com/warren-bank/fork-Android-Httper/releases/download/1.04.02-periodic-requests-service/Httper-1.04.02-periodic-requests-service-armeabi-v7a-release.apk"
call :do_download "https://github.com/warren-bank/fork-Android-Httper/releases/download/1.04.02-periodic-requests-service/Httper-1.04.02-periodic-requests-service-x86-release.apk"
call :do_download "https://github.com/warren-bank/fork-Android-Httper/releases/download/1.04.02-periodic-requests-service/Httper-1.04.02-periodic-requests-service-x86_64-release.apk"

rem :: https://github.com/warren-bank/Android-RTSP-IPCam-Viewer/releases
call :do_download "https://github.com/warren-bank/Android-RTSP-IPCam-Viewer/releases/download/v02.04.01/RTSP-IPCam-Viewer-002.04.01-16API-withAllLanguageTranslations-release.apk"

rem :: https://github.com/warren-bank/fork-Android-fdroidclient/releases
call :do_download "https://github.com/warren-bank/fork-Android-fdroidclient/releases/download/fork/1.18.0/v1.0.0/fdroidclient-1.18.0-fork-v1.0.0-full-release.apk"
call :do_download "https://github.com/warren-bank/fork-Android-fdroidclient/releases/download/fork/1.12.1/v1.0.0/fdroidclient-1.12.1-fork-v1.0.0-full-release.apk"
call :do_download "https://github.com/warren-bank/fork-Android-fdroidclient/releases/download/fork/1.18.0/v1.0.0/fdroidclient-1.18.0-fork-v1.0.0-basic-release.apk"
call :do_download "https://github.com/warren-bank/fork-Android-fdroidclient/releases/download/fork/1.12.1/v1.0.0/fdroidclient-1.12.1-fork-v1.0.0-basic-release.apk"

goto :done

:do_download
  set apk_url=%~1

  wget %wget_opts% "%apk_url%"
  goto :eof

:done
