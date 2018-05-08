' ------------------------------------------------------------------------------
' Title: GematriaFBC.bas - a simple gemtaria calculator
' Version: 3.0 - April 2018
' Author: Robert Lock - beannachtai@homtail.com
' License: GPL v3
' About: Console version
' ------------------------------------------------------------------------------
Dim As zString *8    zVersion  = "3.0"
Dim As zString *28   zGemTitle = "GematriaFBC-" + zVersion
Dim As zString *8    zPrompt   = ":> "
Dim As Long          i
Dim As String        sWordIn
Dim As zString *128  zWordIn   ' Max. entry length + 1
Dim As uLong         lWordLen
Dim As Integer Ptr   ipAscII
Dim As uLong         lSum
Dim As uLong         lSumLength
Dim As uLong         lSumReduce
Dim As uLong         lRegSum
Dim As Integer Ptr   ipSumDigits
Dim As uLong         lSumTmp
Dim As Integer       iWid = width()
' === Command$ variables ===
Dim As Integer iNumArgs
Dim As String sArg
Dim As uByte  bState = &b00000000
Dim As uByte  mask1  = &b00000001 '--log
Dim As uByte  mask2  = &b00000010 '--Verbose
Dim As uByte  mask4  = &b00000100 '--reverse
Dim As uByte  mask8  = &b00001000 '--build
Dim As uByte  mask16 = &b00010000 '--match
Dim As String sDbInputFile
Dim As uLong  lFileHandle
'Dim As uLong  lFileHandle2

' =======================  Command$  =======================
' Count how many parameters were passed
iNumArgs = 1
Do
	sArg = Trim$(Command$(iNumArgs))
	If Len(sArg) = 0 Then
		Exit Do
	End If
	iNumArgs += 1
Loop
iNumArgs -= 1
' Parse parameters (8 total possible, 5 using bitfield)
If iNumArgs >= 1 Then
	For i = 1 to iNumArgs
	If Command$(i) = "-l" orElse Command$(i) = "--log" Then
		bState = bState xor mask1
	ElseIf Command$(i) = "-V" orElse  Command$(i) = "--verbose" Then
		bState = bState xor mask2
	ElseIf Command$(i) = "-r" orElse Command$(i) = "--reverse" Then
		bState = bState xor mask4
	ElseIf Command$(i) = "-b" orElse Command$(i) = "--build" Then
		bState = bState xor mask8
		sDbInputFile = Command$(i+1)
	ElseIf Command$(i) = "-m" orElse Command$(i) = "--match" Then
		bState = bState xor mask16
		sWordIn = Command$(i+1)
		sDbInputFile = Command$(i+2)
	ElseIf Command$(i) = "-h" orElse Command$(i) = "--help" Then
		Print "Valid parameters are:"
		Print "     -h, --help",,," Report the command options and exit."
		Print "     -v, --version",,," Report version and exit."
		Print "     -w, --warranty",,," Report warranty and license conditions then exit."
		Print "     -b [filename], --build [filename]",," Build a database from file.  Outputs to file."
		Print "     -l, --log",,," Log the session (to file in current directory as GematriaFBC.log)"
		Print "     -m [word] [filename], --match [word] [filename]"," Match a word, phrase or value to a database. Outputs to file."
		Print "     -r, --reverse",,," Append reversed forms to output."
		Print "     -V, --verbose",,," Verbose output."
		System 0
	ElseIf Command$(i) = "-v" orElse Command$(i) = "--version" Then
		Color 11  ' Cyan
		Print "GematriaFBC - version " + zVersion
		Color 15  ' White
		System 0
	ElseIf Command$(i) = "-w" orElse Command$(i) = "--warranty" Then
		Color 11
		Print zGemTitle + "; Copyright (C) 2017  Robert Lock (RobertLM78) - beannachtai@hotmail.com"
		Color 15
		Print "This program comes with ABSOLUTELY NO WARRANTY."
		Print "This is free software, and you are welcome to redistribute it under certain conditions."
		Print
		Color 11
		Print zGemTitle + " - a simple gemtria calculator"
		Color 15
		Print
		Print "This program is distributed in the hope that it will be useful,"
		Print "but WITHOUT ANY WARRANTY; without even the implied warranty of"
		Print "MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the"
		Print "GNU General Public License for more details."
		Print
		Print "You should have received a copy of the GNU General Public License"
		Print "along with this program.  If not, see <http://www.gnu.org/licenses/>."
		Print
		Print "This program is free software: you can redistribute it and/or modify"
		Print "it under the terms of the GNU General Public License as published by "
		Print "the Free Software Foundation, either version 3 of the License, or"
		Print "(at your option) any later version."
		System 0
	ElseIf Mid$(Command$(i),1,1) = "-" orElse Mid$(Command$(i),1,2) = "--" Then
		Print Command$(i) &"  is not a vaild parameter"
		Print
		Print "Valid parameters are:"
		Print "     -h, --help",,," Report the command options and exit."
		Print "     -v, --version",,," Report version and exit."
		Print "     -w, --warranty",,," Report warranty and license conditions then exit."
		Print "     -b [filename], --build [filename]",," Build a database from file.  Outputs to file."
		Print "     -l, --log",,," Log the session (to file in current directory as GematriaFBC.log)"
		Print "     -m [word] [filename], --match [word] [filename]"," Match a word, phrase or value to a database. Outputs to file."
		Print "     -r, --reverse",,," Append reversed forms to output."
		Print "     -V, --verbose",,," Verbose output."
		System 0 ' quit if there's any invalid parameter
	End If
	Next
End If
' ==========================================================

' =========  Init/Special Functions  =========
' Set max. entry length
iWid = loword(iWid) - (Len(zPrompt)+1)  ' minus 4 for length of prompt + 1
If iWid >= 127 Then
	iWid = 127
End If
' Functions
#include "./func/sIkInputFn.bas" ' Keyboard Input
#include "./func/BuildDbFn.bas"  '--build
#include "./func/MatchDbFn.bas"  '--match
' Special functions' calls - quit when finished
If (bState and mask8) = 8 Then '--build
	BuildDb(sDbInputFile)
	System 0
End If
If (bState and mask16) = 16 Then '--match
	MatchDb(sWordIn,sDbInputFile)
	System 0
End If
' Splash
#include "./units/splash.bas"
Cls
' Print save location of log file
If (bState and mask1) = 1 Then '--log
	Print "This session will be logged in ";CurDir
End If
' Opening title ======
Color 11 ' Cyan
Print zGemTitle + " - Enter !q to quit"
Print String$(loword(width()),"-")
Color 15 ' White
Print
' ============================================

' ==  Start Main Program Loop  =================================================
Do
' Enter the input
Color 11
sWordIn = sIkInputFn(zPrompt,iWid)
zWordIn = Trim$(Ucase$(sWordIn))

Color 15
If zWordIn = "!Q" Then      ' Quit
	Exit Do
ElseIf zWordIn = "!C" Then  ' Clear the screen
	Print String$(Width() shr 16,10)
	Locate 1,1
Else                        ' Else do some calculating :)
	' Allocate memory
	lWordLen = Len(zWordIn)
	ipAscII = Allocate(lWordLen*SizeOf(Integer))
	' Load memory of ASCII codes
	For i = 1 to lWordLen
		ipAscII[i-1] = Asc(zWordIn,i)
	Next

	' Open the log file
	If (bState and mask1) = 1 Then '--log
		lFileHandle = FreeFile()
		If Open("GematriaFBC.log" For Append As #lFileHandle) <> 0 Then
			Print "Error with filesytem.  Quitting to shell..."
			System 0
		Else
			Print #lFileHandle, ":> ";zWordIn
		End If
	End If

	' Simple and Regular
	#include "./units/SimpleAndReg.bas"
	' Jewish
	#include "./units/Jewish.bas"
	' Satanic
	#include "./units/Satanic.bas"
	' Extended
	#include "./units/Extended.bas"
	' Septenary
	#include "./units/Septenary.bas"
	' Chaldean
	#include "./units/Chaldean.bas"
	' Pythagorean
	#include "./units/Pythag.bas"
	' Reduced
	#include "./units/Reduced.bas"
	If (bState and mask4) = 4 Then '--reverse
		' Reverse Simple and Regular
		#include "./units/RevSimpleAndReg.bas"
		' Reverse Phythagorean
		#include "./units/RevPythag.bas"
		' Reverse Reduced
		#include "./units/RevReduced.bas"
	End If

	' Close the log file
	If (bState and mask1) = 1 Then '--log
		Print #lFileHandle,
		Close #lFileHandle
	End If
	' Clear memory
	DeAllocate(ipAscII)
	Print
End If
Loop
' ==  End Main Loop  ===========================================================
' ---- EOF ---------------------------------------------------------------------
