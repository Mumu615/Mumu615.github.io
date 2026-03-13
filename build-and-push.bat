@echo off
setlocal EnableExtensions

title Hexo Build And Push

set "ROOT=%~dp0"
cd /d "%ROOT%"

set "MSG=%~1"
if "%MSG%"=="" set "MSG=site update %date% %time%"

echo [1/5] Building site...
call npm run build
if errorlevel 1 (
  echo.
  echo Build failed. Nothing was committed or pushed.
  exit /b 1
)

echo.
echo [2/5] Staging changes...
git add -A
if errorlevel 1 (
  echo Git add failed.
  exit /b 1
)

echo.
echo [3/5] Checking for staged changes...
git diff --cached --quiet
if not errorlevel 1 (
  echo No changes to commit.
  echo.
  echo [4/5] Pushing current branch...
  git push
  exit /b %errorlevel%
)

echo.
echo [4/5] Creating commit...
git commit -m "%MSG%"
if errorlevel 1 (
  echo Commit failed.
  exit /b 1
)

echo.
echo [5/5] Pushing current branch...
git push
if errorlevel 1 (
  echo Push failed.
  exit /b 1
)

echo.
echo Done.
exit /b 0
