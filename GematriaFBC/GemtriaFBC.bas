' -----------------------------------------------------------------------------
' Title: GematriaFBC.bas - a simple gemtria calculator
' Version: 0.2 - June 2017
' Author: Robert Lock - beannachtai@homtail.com
' License: GPL v3
' About: Console version
' -----------------------------------------------------------------------------
Dim As Long i
Dim As String        sWordIn
Dim As zString *256  zWordIn
Dim As uLong lWordLen
Dim As Integer Ptr ipAscII
Dim As uLong lSum
Dim As uLong lSumLength
Dim As uLong lSumReduce
Dim As Integer Ptr ipSumDigits

Print "GematriaFBC 0.2 - Enter !q to quit"
Print "----------------------------------"
Print
' ==============================================================================
Do

Input ":> ", sWordIn
zWordIn = Ucase$(sWordIn)
While Len(zWordIn) = 0
	Input ":> ", sWordIn
	zWordIn = Ucase$(sWordIn)
Wend
If zWordIn = "!Q" Then
	Exit Do
End If

lWordLen = Len(zWordIn)
ipAscII = Allocate(lWordLen*SizeOf(Integer))

' Simple and Regular English gematria
lSum = 0
For i = 1 to lWordLen
	ipAscII[i-1] = Asc(zWordIn,i)
	'Print ipAscII[i-1] - 64
Next

For i = 1 to lWordLen
	If Abs(ipAscII[i-1]) < 65 orElse Abs(ipAscII[i-1]) > 90 Then '@ orElse [
		lSum *= 1
		'Print "non-alpha char @ position";i
	Else
		lSum += ipAscII[i-1] - 64
		'Print lSum
	End If
Next
Print "Simple English:      ";lSum
Print "Regular English:    ";lSum*6

' Pythagorian
lSum = 0
For i = 1 to lWordLen
	If Abs(ipAscII[i-1]) < 65 orElse Abs(ipAscII[i-1]) > 90 Then '@ orElse [
		lSum *= 1
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
Print "Pythagorian English: ";lSum

' Reduced
While Len(Str$(lSum)) > 1
	lSumReduce = 0
	ipSumDigits = Allocate(Len(Str$(lSum))*SizeOf(Integer))
	For i = 1 to Len(Str$(lSum))
		ipSumDigits[i-1] = Val(Mid$(Str$(lSum), i , 1))
		lSumReduce += ipSumDigits[i-1]
		'Print ipSumDigits[i-1]
	Next
	lSum = lSumReduce
	DeAllocate(ipSumDigits)
Wend
Print "Reduced English:     ";lSum

DeAllocate(ipAscII)
Print
Loop
' ==============================================================================
