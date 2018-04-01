' ------------------------------------------------------------------------------
' Title: GematriaFBC.bas - a simple gemtaria calculator
' Version: 1.4 - March 2018
' Author: Robert Lock - beannachtai@homtail.com
' License: GPL v3
' About: Console version
' ------------------------------------------------------------------------------
Dim As Long i
Dim As String        sWordIn
Dim As zString *256  zWordIn
Dim As uLong lWordLen
Dim As Integer Ptr ipAscII
Dim As uLong lSum
Dim As uLong lSumLength
Dim As uLong lSumReduce
Dim As uLong lRegSum
Dim As Integer Ptr ipSumDigits
Dim As uLong lSumTmp
' ===  Command$ variables  ===
Dim As Integer iNumArgs
Dim As String sArg
Dim As uByte  bState = &b00000000
Dim As uLong lFileHandle

' =============  Command$  =============
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
' Parse parameters (6 total possible, 3 using bitfield)
If iNumArgs >= 1 Then
	For i = 1 to iNumArgs
	If Command$(i) = "-l" orElse Command$(i) = "--log" Then
		bState = bState xor &b00000001
		Print "This session will be logged in ";CurDir
	ElseIf Command$(i) = "-V" orElse  Command$(i) = "--verbose" Then
		bState = bState xor &b00000010
	ElseIf Command$(i) = "-r" orElse Command$(i) = "--reverse" Then
		bState = bState xor &b00000100
	ElseIf Command$(i) = "-h" orElse Command$(i) = "--help" Then
		Print "Valid parameters are:"
		Print "     -h, --help"," Show options"
		Print "     -v, --version"," Show version"
		Print "     -w, --warranty"," Warranty and license conditions"
		Print "     -l, --log"," Log session (as GematriaFBC.log)"
		Print "     -r, --reverse"," Append reversed forms to output"
		Print "     -V, --verbose"," Verbose output"
		System 0
	ElseIf Command$(i) = "-v" orElse Command$(i) = "--version" Then
		Color 10
		Print "GematriaFBC - version 1.4"
		Color 15
		System 0
	ElseIf Command$(i) = "-w" orElse Command$(i) = "--warranty" Then
		Color 10
		Print "GematriaFBC-1.4; Copyright (C) 2017  Robert Lock (RobertLM78) - beannachtai@hotmail.com"
		Color 15
		Print "This program comes with ABSOLUTELY NO WARRANTY."
		Print "This is free software, and you are welcome to redistribute it under certain conditions."
		Print
		Color 10
		Print "GematriaFBC-1.4 - a simple gemtria calculator"
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
	Else
		Print Command$(i) &"  is not a vaild parameter"
		Print
		Print "Valid parameters are:"
		Print "     -h, --help"," Show options"
		Print "     -v, --version"," Show version"
		Print "     -w, --warranty"," Warranty and license conditions"
		Print "     -l, --log"," Log session (as GematriaFBC.log)"
		Print "     -r, --reverse"," Append reversed forms to output"
		Print "     -V, --verbose"," Verbose output"
		System 0 ' quit if there's any invalid parameter
	End If
	Next
End If
' ======================================
Color 11
Print "GematriaFBC 1.4 - Enter !q to quit"
Print "----------------------------------"
Color 15
Print
' ==============================================================================
Do
'Prompt:
Color 11
Line Input ":> ", sWordIn
zWordIn = Trim$(Ucase$(sWordIn))
While Len(zWordIn) = 0
	Line Input ":> ", sWordIn
	zWordIn = Trim$(Ucase$(sWordIn))
Wend
Color 15
If zWordIn = "!Q" Then
	Exit Do
ElseIf zWordIn = "!CLR" Then
	#ifdef __FB_WIN32__
		Shell "CLS"
	#endif
	#ifdef __FB_LINUX__
		Shell "clear"
	#endif
	'Goto Prompt:
	Color 11  ' Carry on with the input as usual after clearing screen
	Line Input ":> ", sWordIn
	zWordIn = Trim$(Ucase$(sWordIn))
	While Len(zWordIn) = 0
		Line Input ":> ", sWordIn
		zWordIn = Trim$(Ucase$(sWordIn))
	Wend
End If

' Allocate memory
lWordLen = Len(zWordIn)
ipAscII = Allocate(lWordLen*SizeOf(Integer))
' Load memory of ASCII codes
For i = 1 to lWordLen
	ipAscII[i-1] = Asc(zWordIn,i)
Next

' Open the log file
If bState = 1 orElse bState = 3 orElse bState = 5 orElse bState = 7 Then  '--log combinations
	lFileHandle = FreeFile()
	If Open("GematriaFBC.log" For Append As #lFileHandle) <> 0 Then
		Print "Error with filesytem.  Quitting to shell..."
		System 0
	Else
		Print #lFileHandle, ":> ";zWordIn
	End If
End If

' Simple and Regular English gematria
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
If bState = 4 orElse bState = 5 orElse bState = 6 orElse bState = 7 Then  '--reverse combinations
	' Reverse Simple and Regular
	#include "./units/RevSimpleAndReg.bas"
	' Reverse Phythagorean
	#include "./units/RevPythag.bas"
	' Reverse Reduced
	#include "./units/RevReduced.bas"
End If

' Close the log file
If bState = 1 orElse bState = 3 orElse bState = 5 orElse bState = 7 Then  '--log combinations
	Print #lFileHandle,
	Close #lFileHandle
End If
' Clear memory
DeAllocate(ipAscII)
Print
Loop
' ==============================================================================
' ---- EOF ---------------------------------------------------------------------
