@echo off

rem :: -------------------------------------------
rem :: https://github.com/warren-bank/fdroidserver-for-windows
rem :: https://github.com/warren-bank/fdroidserver-for-windows#use-fdroidserver-cmd
rem :: -------------------------------------------

set fdsdir=E:\fdroidserver-for-windows
set fdrepo=%~dp0..

set log_dirpath=%~dp0.\log
set log_filepath=%log_dirpath%\%~n0.txt

if not exist "%log_dirpath%" mkdir "%log_dirpath%"
if exist "%log_filepath%" del "%log_filepath%"

if not exist "%fdsdir%\scripts\cmd" (
  echo "fdroidserver-for-windows" directory not found.>>"%log_filepath%"
  exit /b 1
)

if not exist "%fdrepo%" (
  echo "fdroid repo" directory not found.>>"%log_filepath%"
  exit /b 2
)

if not exist "%fdrepo%\repo" (
  echo "fdroid repo" is missing APK files.>>"%log_filepath%"
  exit /b 3
)

if not defined WINPYDIR (
  echo WINPYDIR is not defined.>>"%log_filepath%"
  echo requirements: python, git.>>"%log_filepath%"
  echo assumptions: WinPythonZero 3.7.1.0, PortableGit 2.16.2.>>"%log_filepath%"
  exit /b 4
)

call "%fdsdir%\scripts\cmd\virtualenv-activate.bat"

cd /D "%fdrepo%"
fdroid update >>"%log_filepath%" 2>&1

call "%fdsdir%\scripts\cmd\virtualenv-deactivate.bat"
