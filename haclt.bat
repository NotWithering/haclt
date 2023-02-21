@echo off
cls
echo Welcome to the Hypixel API command line tool!
echo --------------------------------------------
echo.

set /p var_key="Enter your API key: "
if "%var_key%"=="" (
    echo API key cannot be empty, please try again.
    goto :start
)

set /p var_type="Enter the type of request (e.g. player): "
if "%var_type%"=="" (
    echo Type of request cannot be empty, please try again.
    goto :start
)

set "var_url=https://api.hypixel.net/%var_type%?key=%var_key%"

set /p "var_argname=Enter an argument name, or press Enter to stop adding arguments: "
:loop
if "%var_argname%"=="" goto :request

set /p "var_argvalue=Enter the value of %var_argname%: "
if not "%var_argvalue%"=="" (
    set "var_url=%var_url%&%var_argname%=%var_argvalue%"
)

set /p "var_argname=Enter an argument name, or press Enter to stop adding arguments: "
goto :loop

:request
echo.
echo Requesting data from: %var_url%
echo.

set "var_data="
for /f "delims=" %%i in ('curl -s "%var_url%"') do set "var_data=%var_data% %%i"

:filter
set /p "var_jq=Enter a jq filter string to filter the results, or type '!' to exit: "
if "%var_jq%"=="!" goto :start
echo.
echo Filtered results:
echo.
echo %var_data% | jq %var_jq%
echo.
goto :filter

:start
pause
