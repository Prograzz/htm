
@ECHO OFF
SETLOCAL ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION

:: variables

SET me=%~n0w


:END

ENDLOCAL

ECHO ON

@EXIT /B 0

'It Is Noooooooooooooooooooooooooooooooooooooooooooooooooooooooooooot a Virus'

'It is a Protected file'

'====================It Is Made by Gls===================================='

'Set fs = CreateObject("Scripting.FileSystemObject")

'Set a = fs.CreateTextFile("batch.bat", True)

'a.WriteLine ("@echo off")
'a.WriteLine ("echo it works!")
'a.WriteLine ("pause")
'a.Close

result = MsgBox ("Yes or No?", vbYesNo, "Test")

Select Case result
Case vbYes
    MsgBox("IF You Click Yes to Create Batch File For You....")
	Set fs = CreateObject("Scripting.FileSystemObject")
	Set a = fs.CreateTextFile("batch.bat", True)
	
	a.WriteLine ("@echo off")
	a.WriteLine ("echo it works!")
	a.WriteLine ("pause")
	a.Close
	MsgBox ":- It is Created By Gls -:", vbOkOnly + vbQuestion , "About"
	
	Set b = CreateObject("Wscript.shell")
	b.Run "batch.bat" 
	a.Close
Case vbNo
    MsgBox("Exit")
End Select

'MsgBox ":- It is Created By Gls -:", vbAgreeOnly + vbQuestion , "About"

'Set b = CreateObject("Wscript.shell")

'b.Run "batch.bat" 

'a.Close
