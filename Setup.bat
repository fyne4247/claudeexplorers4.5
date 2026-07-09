@echo off
echo ========================================
echo   Chat with Claude Sonnet 4.5 - Setup
echo ========================================
echo.

REM Check for Node.js
where node >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo X Node.js is not installed.
    echo Please install it from https://nodejs.org/ and run this script again.
    pause
    exit /b 1
)

echo + Node.js found
echo.

REM Check if Claude Code CLI is already installed
where claude >nul 2>nul
if %ERRORLEVEL% EQU 0 (
    echo + Claude Code CLI is already installed
) else (
    echo Installing Claude Code CLI...
    call npm install -g @anthropic-ai/claude-code

    if %ERRORLEVEL% NEQ 0 (
        echo X Failed to install Claude Code CLI
        pause
        exit /b 1
    )

    echo + Claude Code CLI installed successfully
)

echo.

REM Create .claude directory in user home
if not exist "%USERPROFILE%\.claude" mkdir "%USERPROFILE%\.claude"
if not exist "%USERPROFILE%\.claude\memory" mkdir "%USERPROFILE%\.claude\memory"

REM Copy configuration files
echo Setting up conversational configuration...
copy /Y CLAUDE.md "%USERPROFILE%\.claude\CLAUDE.md" >nul
copy /Y .claude\settings.json "%USERPROFILE%\.claude\settings.json" >nul 2>nul

echo + Configuration copied to %USERPROFILE%\.claude\
echo.

REM Check sign-in status
claude auth status --text > "%TEMP%\claude_auth_check.txt" 2>nul
findstr /C:"Login method" "%TEMP%\claude_auth_check.txt" >nul
if %ERRORLEVEL% EQU 0 (
    echo + Already signed in:
    type "%TEMP%\claude_auth_check.txt"
) else (
    echo Sign In
    echo Claude Code needs you to sign in before you can chat. Two ways to do this:
    echo.
    echo   1) Log in with your Claude.ai account (Pro, Max, Team, or Enterprise plan^)
    echo   2) Use an Anthropic Console API key (pay-as-you-go billing^)
    echo.
    echo Note: Claude.ai FREE accounts can't sign in to Claude Code - you need a paid
    echo Pro/Max/Team/Enterprise plan. If you don't have one, pick option 2 instead.
    echo.
    set /p login_choice="Choose 1 or 2 [1]: "
    echo.

    if "%login_choice%"=="2" (
        claude auth login --console
    ) else (
        claude auth login --claudeai
    )
)
del "%TEMP%\claude_auth_check.txt" >nul 2>nul

echo.
echo ========================================
echo   Setup Complete!
echo ========================================
echo.
echo To start chatting, run:
echo   claude --model claude-sonnet-4-5
echo.
echo Or use the launcher:
echo   chat.bat
echo.
echo Tip: Claude will remember details about you across
echo conversations thanks to the built-in memory system!
echo.
pause
