@echo off
setlocal enabledelayedexpansion
rem This is the function to print Batch file 1.0v
rem Created by GLS
rem :: http://www.Myworksite.tk

rem [%~1] : Font file to load...
REM [%~2] : x_POS of text...
rem [%~3] : y_POS of text...
rem [%~4] : color code [hexadecimal] e.g. f0
rem [%~5] : text to print on console...

rem ::---- checking if the variables are defined or not... ----
if /i "%~1" == "" (exit /b 1)
if /i "%~2" == "" (exit /b 1)
if /i "%~3" == "" (exit /b 1)
if /i "%~4" == "" (exit /b 1)
if /i "%~5" == "" (exit /b 1)

rem :: -----------checking If the defined variables are correct or not...
if not exist "%~1" (exit /b 404)

call :chk_window_size Lines Columns
set /a columns-=6

:Load_file
for /f "eol=# tokens=1,2 delims==" %%A in (%~1) do (
	FOR /f "tokens=1,2,3 delims=x" %%a in ("%%B") do (
		set "_%%A_X=%%a"
		set "_%%A_Y=%%b"
		set "_%%A=%%c"
		)
	)

set _X=%~2
set _Y=%~3
set color=%~4
set _final=

:loopy
if /i "%~5" == "" (goto end)
set "char=%~5"
set _string=
set _words=0

getlen "!char!"
set /a len=!errorlevel!-1

rem :: --- Adding a additional space in between the characters/ words...
for /l %%a in (0,1,!len!) do (
set "_string=!_string!!char:~%%a,1! "
)

set "_string=!_string:  =[Space]!"

char2int !_string!>"!tmp!\typo_temp.tmp"
set /p int=<"!tmp!\typo_temp.tmp"


for %%A in (!int!) do (
set "_final=!_final!/o !_X! !_Y! !_%%A! "
set /a _X+=!_%%A_X!
if !_X! GEQ !columns! (set /a _Y+=13 && set _X=1)
)

set "_final=!_final!/o !_X! !_Y! !_32! "
set /a _X+=!_32_X!

shift /5
goto loopy

:end
batbox /c 0x!color! !_final! /c 0x07
exit /b 0


rem ::-------------Extra functions by GLS --------------

:chk_window_size
mode con | find "%~1">"%temp%\%~1.tmp"
mode con | find "%~2">"%temp%\%~2.tmp"
set /p q=<"%temp%\%~1.tmp"
set /p w=<"%temp%\%~2.tmp"
set /a %~1=%q:~-6%
set /a %~2=%w:~-6%
goto :eof
