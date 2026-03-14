@echo off
setlocal EnableExtensions

title Hexo Preview Dev

set "ROOT=%~dp0"
cd /d "%ROOT%"

set "PORT=%~1"
if "%PORT%"=="" set "PORT=4004"

where npm >nul 2>nul
if errorlevel 1 (
  echo npm was not found in PATH.
  echo Please open this project from a terminal where Node.js is available.
  pause
  exit /b 1
)

for /f "tokens=5" %%a in ('netstat -ano ^| findstr :%PORT% ^| findstr LISTENING') do (
  echo Port %PORT% is already in use. Stopping old process %%a...
  taskkill /PID %%a /F >nul 2>nul
)

set "PORT_BUSY="
for /l %%i in (1,1,10) do (
  set "PORT_BUSY="
  for /f "tokens=5" %%a in ('netstat -ano ^| findstr :%PORT% ^| findstr LISTENING') do set "PORT_BUSY=1"
  call set "PORT_BUSY=%%PORT_BUSY%%"
  if not defined PORT_BUSY goto port_ready
  timeout /t 1 /nobreak >nul
)

echo Port %PORT% is still busy after waiting.
echo Please close the old preview window and try again.
pause
exit /b 1

:port_ready

echo [1/4] Cleaning old cache...
call npm run clean
if errorlevel 1 (
  echo.
  echo Clean failed.
  pause
  exit /b 1
)

echo.
echo [2/4] Rebuilding site...
call npm run build
if errorlevel 1 (
  echo.
  echo Build failed.
  pause
  exit /b 1
)

echo.
echo [3/4] Starting Hexo preview...
echo Preview URL: http://localhost:%PORT%/
echo.

echo [4/4] Tips
echo - After changing Markdown files, refresh the page.
echo - After changing _config.yml, _config.solitude.yml, or layout files, rerun this script.
echo.

call npm run server -- -p %PORT%
if errorlevel 1 (
  echo.
  echo Preview server stopped with an error.
  pause
  exit /b 1
)
