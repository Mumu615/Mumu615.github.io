@echo off
setlocal EnableExtensions

title Hexo Build And Push

set "ROOT=%~dp0"
cd /d "%ROOT%"

set "MSG=%~1"
if "%MSG%"=="" set "MSG=site update %date% %time%"

set "PAGES_URL=https://mumu615.github.io"

for /f %%i in ('git branch --show-current') do set "BRANCH=%%i"
if "%BRANCH%"=="" set "BRANCH=main"

where pnpm >nul 2>nul
if errorlevel 1 (
  set "PKG_CMD=npm"
) else (
  set "PKG_CMD=pnpm"
)

echo [1/5] Building site...
call %PKG_CMD% run build
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
  git push origin %BRANCH%
  if errorlevel 1 exit /b 1
  goto done
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
git push origin %BRANCH%
if errorlevel 1 (
  echo Push failed.
  exit /b 1
)

:done
echo.
echo Done.
echo.
echo Current branch: %BRANCH%
if /I not "%BRANCH%"=="main" (
  echo Note: GitHub Pages workflow only auto-deploys when pushing to main.
  echo Switch to main or merge this branch before expecting the site to update.
) else (
  echo GitHub Pages should start deploying from Actions after this push.
)
echo Site URL: %PAGES_URL%
echo Actions URL: https://github.com/Mumu615/Mumu615.github.io/actions
exit /b 0
