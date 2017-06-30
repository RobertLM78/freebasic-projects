' ------------------------------------------------------------------------------
' Title: SimpleAndReg.bas - translation unit for GematriaFBC.bas
' Version: 0.1 - June 2017
' Author: Robert Lock - beannachtai@homtail.com
' License: GPL v3
' ------------------------------------------------------------------------------
' Calculate the sum ========================================================
lSum = 0
For i = 1 to lWordLen
	If Abs(ipAscII[i-1]) < 65 orElse Abs(ipAscII[i-1]) > 90 Then '@ orElse [
		If Abs(ipAscII[i-1]) >=49 and Abs(ipAscII[i-1]) <= 57 Then
			lSum += ipAscII[i-1] - 48
		Else
			lSum += 0
		End If
	Else
		lSum += ipAscII[i-1] - 64
	End If
Next
lRegSum = lSum*6
Color 10
Print "Simple:      "; : Color 15 : Print lSum
Color 10
Print "Regular:     "; : Color 15 : Print lRegSum
If bState = 1 orElse bState = 3 Then
	Print #lFileHandle, "Simple:      ";lSum
	Print #lFileHandle, "Regular:     ";lRegSum
End If

If bState = 2 orElse bState = 3 Then
	' Print Characters (Simple) ================================================
	For i = 1 to lWordLen
		If Abs(ipAscII[i-1]) < 65 orElse Abs(ipAscII[i-1]) > 90 Then '@ orElse [
			If Abs(ipAscII[i-1]) >=49 and Abs(ipAscII[i-1]) <= 57 Then
				Locate ,3*i - 2 : Print Str$(ipAscII[i-1] - 48);
			End If
		Else
			Locate ,3*i - 2 : Print Chr$(ipAscII[i-1]);
		End If
	Next
	Print
	' Print digits to be summed (Simple)
	For i = 1 to lWordLen
		If Abs(ipAscII[i-1]) < 65 orElse Abs(ipAscII[i-1]) > 90 Then '@ orElse [
			If Abs(ipAscII[i-1]) >=49 and Abs(ipAscII[i-1]) <= 57 Then
				Locate ,3*i - 2 : Print Str$(ipAscII[i-1] - 48);
				If i <= lWordLen - 1 Then
					Locate ,i*3 : Print "+";
				End If
			End If
		Else
			Locate ,3*i - 2 : Print Str$(ipAscII[i-1] -64);
			If i <= lWordLen - 1 Then
				Locate ,i*3 : Print "+";
			End If
		End If
	Next
	Print

	' Print Characters (Regular) ===============================================
	For i = 1 to lWordLen
		If Abs(ipAscII[i-1]) < 65 orElse Abs(ipAscII[i-1]) > 90 Then '@ orElse [
			If Abs(ipAscII[i-1]) >=49 and Abs(ipAscII[i-1]) <= 57 Then
				Locate ,4*i - 3 : Print Str$(ipAscII[i-1] - 48);
			End If
		Else
			Locate ,4*i - 3 : Print Chr$(ipAscII[i-1]);
		End If
	Next
	Print
	' Print digits to be summed (Regular)
	For i = 1 to lWordLen
		If Abs(ipAscII[i-1]) < 65 orElse Abs(ipAscII[i-1]) > 90 Then '@ orElse [
			If Abs(ipAscII[i-1]) >=49 and Abs(ipAscII[i-1]) <= 57 Then
				Locate ,4*i - 3 : Print Str$(ipAscII[i-1] - 48);
				If i <= lWordLen - 1 Then
					Locate ,i*4 : Print "+";
				End If
			End If
		Else
			Locate ,4*i - 3 : Print Str$((ipAscII[i-1] -64)*6);
			If i <= lWordLen - 1 Then
				Locate ,i*4 : Print "+";
			End If
		End If
	Next
	Print
End If
' ------------------------------------------------------------------------------
