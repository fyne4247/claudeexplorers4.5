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

REM Check for API key
claude config get apiKey >nul 2>nul
if %ERRORLEVEL% EQU 0 (
    echo + API key is already configured
) else (
    echo API Key Setup
    echo You need an Anthropic API key to use Claude.
    echo Get one at: https://console.anthropic.com/
    echo.
    set /p api_key="Enter your API key (or press Enter to skip): "

    if not "%api_key%"=="" (
        claude config set apiKey "%api_key%"
        echo + API key configured
    ) else (
        echo Skipped API key setup. You can set it later with:
        echo    claude config set apiKey YOUR_KEY_HERE
    )
)

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
