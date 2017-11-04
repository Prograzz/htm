@Echo off
Title Test File
cls
Mode 25,05
:Top
cls
Fn.dll Cursor 0
call Button.bat 07 1 f0 "Start" X _Var_Box _Var_Hover
Getinput /I 500 /M %_Var_Box%
