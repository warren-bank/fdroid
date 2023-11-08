@echo off

set metadata_dir=%~dp0..\metadata
set default_locale=en

set log_dirpath=%~dp0.\log
set log_filepath=%log_dirpath%\%~n0.txt

if not exist "%log_dirpath%" mkdir "%log_dirpath%"
if exist "%log_filepath%" del "%log_filepath%"

rem :: -------------------------------------------
rem :: https://github.com/warren-bank/node-translate-fdroid-metadata-text-files
rem :: -------------------------------------------

call "%USERPROFILE%\IBM_TRANSLATOR_API_CREDENTIALS.bat"

call translate-fdroid-metadata-text-files -i "%default_locale%" -d "%metadata_dir%" -c "icon.png" --html-entities >>"%log_filepath%" 2>&1
