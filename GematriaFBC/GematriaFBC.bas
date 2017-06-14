' ------------------------------------------------------------------------------
' Title: GematriaFBC.bas - a simple gemtria calculator
' Version: 0.5 - June 2017
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
' Parse parameters (3 total possible)
If iNumArgs >= 1 Then
	For i = 1 to iNumArgs
	If Command$(i) = "-l" orElse Command$(i) = "--log" Then
		bState = bState xor &b00000001
		Print "This session will be logged in ";CurDir
	ElseIf Command$(i) = "-h" orElse Command$(i) = "--help" Then
		Print "Valid parameters are:"
		Print "     -h, --help"," Show options"
		Print "     -v, --version"," Show version"
		Print "     -l, --log"," Log session (as GematriaFBC.log)"
		System 0
	ElseIf Command$(i) = "-v" orElse Command$(i) = "--version" Then
		Print "GematriaFBC - version 0.5"
		System 0
	Else
		Print Command$(i) &"  is not a vaild parameter"
		Print
		Print "Valid parameters are:"
		Print "     -h, --help"," Show options"
		Print "     -v, --version"," Show version"
		Print "     -l, --log"," Log session (as GematriaFBC.log)"
		System 0 ' quit if there's any invalid parameter
	End If
	Next
End If
' ======================================

Print "GematriaFBC 0.5 - Enter !q to quit"
Print "----------------------------------"
Print
' ==============================================================================
Do

Line Input ":> ", sWordIn
zWordIn = Ucase$(sWordIn)
While Len(zWordIn) = 0
	Line Input ":> ", sWordIn
	zWordIn = Ucase$(sWordIn)
Wend
If zWordIn = "!Q" Then
	Exit Do
End If

lWordLen = Len(zWordIn)
ipAscII = Allocate(lWordLen*SizeOf(Integer))

' Load memory of ASCII codes
For i = 1 to lWordLen
	ipAscII[i-1] = Asc(zWordIn,i)
Next

' Open the log file
If bState = 1 Then
	lFileHandle = FreeFile()
	If Open("GematriaFBC.log" For Append As #lFileHandle) <> 0 Then
		Print "Error with filesytem.  Quitting to shell..."
		System 0
	Else
		Print #lFileHandle, ":> ";zWordIn
	End If
End If

' Simple and Regular English gematria
lSum = 0
For i = 1 to lWordLen
	If Abs(ipAscII[i-1]) < 65 orElse Abs(ipAscII[i-1]) > 90 Then '@ orElse [
		lSum += 0
		'Print "non-alpha char @";i
	Else
		lSum += ipAscII[i-1] - 64
		'Print ipAscII[i-1] - 64
		'Print lSum
	End If
Next
lRegSum = lSum*6
Print "Simple:      ";lSum
Print "Regular:     ";lRegSum
If bState = 1 Then
	Print #lFileHandle, "Simple:      ";lSum
	Print #lFileHandle, "Regular:     ";lRegSum
End If

' Jewish
lSum = 0
For i = 1 to lWordLen
	If Abs(ipAscII[i-1]) < 65 orElse Abs(ipAscII[i-1]) > 90 Then '@ orElse [
		lSum += 0
		'Print "non-alpha char @";i
	ElseIf Abs(ipAscII[i-1]) >= 65 and Abs(ipAscII[i-1]) <= 73 Then
		lSum += ipAscII[i-1] - 64
		'Print ipAscII[i-1] - 64,"A - I"
	ElseIf Abs(ipAscII[i-1]) = 74 Then
		lSum += 600
		'Print 600,"J"
	ElseIf Abs(ipAscII[i-1]) >= 75 and Abs(ipAscII[i-1]) <= 83 Then
		lSum += (ipAscII[i-1] - 74)*10
		'Print (ipAscII[i-1] - 74)*10,"K - S"
	ElseIf Abs(ipAscII[i-1]) = 84 orElse Abs(ipAscII[i-1]) = 85 Then
		lSum += (ipAscII[i-1] - 83)*100
		'Print (ipAscII[i-1] - 83)*100,"T,U"
	ElseIf Abs(ipAscII[i-1]) = 86 Then
		lSum += 700
		'Print 700,"V"
	ElseIf Abs(ipAscII[i-1]) = 87 Then
		lSum += 900
		'Print 900,"W"
	ElseIf Abs(ipAscII[i-1]) >= 88 and Abs(ipAscII[i-1]) <= 90 Then
		lSum += (ipAscII[i-1] - 85)*100
		'Print (ipAscII[i-1] - 85)*100,"X - Z"
	End If
Next
Print "Jewish:      ";lSum
If bState = 1 Then
	Print #lFileHandle, "Jewish:      ";lSum
End If

' Chaldean
lSum = 0
For i = 1 to lWordLen
	If Abs(ipAscII[i-1]) < 65 orElse Abs(ipAscII[i-1]) > 90 Then '@ orElse [
		lSum += 0
		'Print "non-alpha char @";i
	ElseIf Abs(ipAscII[i-1]) >= 65 and Abs(ipAscII[i-1]) <= 69 Then 'A-E = 1,2,3,4,5
		lSum += ipAscII[i-1] - 64
		'Print ipAscII[i-1] - 64,"A - E"
	ElseIf Abs(ipAscII[i-1]) = 70 orElse Abs(ipAscII[i-1]) = 80 Then 'F,P = 8
		lSum += 8
		'Print 8,"F,P"
	ElseIf Abs(ipAscII[i-1]) = 71 orElse Abs(ipAscII[i-1]) = 76 orElse Abs(ipAscII[i-1]) = 83  Then 'G,L,S = 3
		lSum += 3
		'Print 3,"G,L,S"
	ElseIf Abs(ipAscII[i-1]) = 72 orElse Abs(ipAscII[i-1]) = 78 orElse Abs(ipAscII[i-1]) = 88  Then 'H,N,X = 5
		lSum += 5
		'Print 5,"H,N,X"
	ElseIf Abs(ipAscII[i-1]) >= 85 and Abs(ipAscII[i-1]) <= 87  Then 'U,V,W = 6
		lSum += 6
		'Print 6,"U,V,W"
	ElseIf Abs(ipAscII[i-1]) = 79 orElse Abs(ipAscII[i-1]) = 90 Then 'O,Z = 7
		lSum += 7
		'Print 7,"O,Z"
	ElseIf Abs(ipAscII[i-1]) = 73 orElse Abs(ipAscII[i-1]) = 74 orElse Abs(ipAscII[i-1]) = 81 orElse Abs(ipAscII[i-1]) = 89  Then 'I,J,Q,Y = 1
		lSum += 1
		'Print 1,"I,J,Q,Y"
	ElseIf Abs(ipAscII[i-1]) = 75 orElse Abs(ipAscII[i-1]) = 82 Then 'K,R = 2
		lSum += 2
		'Print 2,"K,R"
	ElseIf Abs(ipAscII[i-1]) = 77 orElse Abs(ipAscII[i-1]) = 84 Then 'M,T = 4
		lSum += 4
		'Print 4,"M,T"
	End If
Next
Print "Chaldean:    ";lSum
If bState = 1 Then
	Print #lFileHandle, "Chaldean:    ";lSum
End If

' Pythagorian
lSum = 0
For i = 1 to lWordLen
	If Abs(ipAscII[i-1]) < 65 orElse Abs(ipAscII[i-1]) > 90 Then '@ orElse [
		lSum += 0
		'Print "non-alpha char @";i
	ElseIf Abs(ipAscII[i-1]) >= 65 and Abs(ipAscII[i-1]) <= 73 Then
		lSum += ipAscII[i-1] - 64
		'Print ipAscII[i-1] - 64,"A - I"
	ElseIf Abs(ipAscII[i-1]) >= 74 and Abs(ipAscII[i-1]) <= 82 Then
		lSum += ipAscII[i-1] - 73
		'Print ipAscII[i-1] - 73,"J - R"
	ElseIf Abs(ipAscII[i-1]) >= 83 and Abs(ipAscII[i-1]) <= 90 Then
		lSum += ipAscII[i-1] - 82
		'Print ipAscII[i-1] - 64,"S - Z"
	End If
Next
Print "Pythagorian: ";lSum
If bState = 1 Then
	Print #lFileHandle, "Pythagorian: ";lSum
End If

' Reduced
While Len(Str$(lSum)) > 1
	lSumReduce = 0
	ipSumDigits = Allocate(Len(Str$(lSum))*SizeOf(Integer))
	For i = 1 to Len(Str$(lSum))
		ipSumDigits[i-1] = Val(Mid$(Str$(lSum), i , 1))
		lSumReduce += ipSumDigits[i-1]
	Next
	lSum = lSumReduce
	DeAllocate(ipSumDigits)
Wend
Print "Reduced:     ";lSum
If bState = 1 Then
	Print #lFileHandle, "Reduced:     ";lSum
	Print #lFileHandle,
End If

If bState = 1 Then
	Close #lFileHandle
End If

DeAllocate(ipAscII)
Print
Loop
' ==============================================================================
