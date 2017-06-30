' ------------------------------------------------------------------------------
' Title: Pythag.bas - translation unit for GematriaFBC.bas
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
	ElseIf Abs(ipAscII[i-1]) >= 65 and Abs(ipAscII[i-1]) <= 73 Then
		lSum += ipAscII[i-1] - 64
	ElseIf Abs(ipAscII[i-1]) >= 74 and Abs(ipAscII[i-1]) <= 82 Then
		lSum += ipAscII[i-1] - 73
	ElseIf Abs(ipAscII[i-1]) >= 83 and Abs(ipAscII[i-1]) <= 90 Then
		lSum += ipAscII[i-1] - 82
	End If
Next
Color 10
Print "Pythagorian: "; : Color 15 : Print lSum
If bState = 1 orElse bState = 3 Then
	Print #lFileHandle, "Pythagorian: ";lSum
End If

If bState = 2 orElse bState = 3 Then
	' Print Characters (Pythagorian) ===========================================
	For i = 1 to lWordLen
		If Abs(ipAscII[i-1]) < 65 orElse Abs(ipAscII[i-1]) > 90 Then '@ orElse [
			If Abs(ipAscII[i-1]) >=49 and Abs(ipAscII[i-1]) <= 57 Then
				Locate ,2*i - 1 : Print Str$(ipAscII[i-1] - 48);
			End If
		Else
			Locate ,2*i - 1 : Print Chr$(ipAscII[i-1]);
		End If
	Next
	Print
	' Print digits to be summed (Pythagorian)
	For i = 1 to lWordLen
		If Abs(ipAscII[i-1]) < 65 orElse Abs(ipAscII[i-1]) > 90 Then '@ orElse [
			If Abs(ipAscII[i-1]) >=49 and Abs(ipAscII[i-1]) <= 57 Then
				Locate ,2*i - 1 : Print Str$(ipAscII[i-1] - 48);
				If i <= lWordLen - 1 Then
					Locate ,i*2 : Print "+";
				End If
			End If
		Else
			If Abs(ipAscII[i-1]) >= 65 and Abs(ipAscII[i-1]) <= 73 Then
				Locate ,2*i - 1 : Print Str$(ipAscII[i-1] - 64);
				If i <= lWordLen - 1 Then
					Locate ,i*2 : Print "+";
				End If
			ElseIf Abs(ipAscII[i-1]) >= 74 and Abs(ipAscII[i-1]) <= 82 Then
				Locate ,2*i - 1 : Print Str$(ipAscII[i-1] - 73);
				If i <= lWordLen - 1 Then
					Locate ,i*2 : Print "+";
				End If
			ElseIf Abs(ipAscII[i-1]) >= 83 and Abs(ipAscII[i-1]) <= 90 Then
				Locate ,2*i - 1 : Print Str$(ipAscII[i-1] - 82);
				If i <= lWordLen - 1 Then
					Locate ,i*2 : Print "+";
				End If
			End If
		End If
	Next
	Print
End If
' ------------------------------------------------------------------------------
