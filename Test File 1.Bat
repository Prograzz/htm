@Echo off
Title Test File 1
cls
Mode 80,13
:Top
cls
Fn.dll Cursor 0
call typo Pixcel.fo 11 2 88 Test File 1
call typo Pixcel.fo 11 1 ff Test File 1
Getinput /I 500
