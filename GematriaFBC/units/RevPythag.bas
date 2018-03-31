' ------------------------------------------------------------------------------
' Title: RevPythag.bas - translation unit for GematriaFBC.bas
' Version: 0.2 - March 2018
' Author: Robert Lock - beannachtai@homtail.com
' License: GPL v3
' Reversed Phythagoren
' ------------------------------------------------------------------------------
' Calculate the sum ============================================================
lSum = 0
For i = 1 to lWordLen
	If Abs(ipAscII[i-1]) < 65 orElse Abs(ipAscII[i-1]) > 90 Then
		If Abs(ipAscII[i-1]) >=49 and Abs(ipAscII[i-1]) <= 57 Then
			lSum += ipAscII[i-1] - 48
		Else
			lSum += 0
		End If
	ElseIf Abs(ipAscII[i-1]) >= 65 and Abs(ipAscII[i-1]) <= 72 Then
		lSum += -(ipAscII[i-1]) + 73
	ElseIf Abs(ipAscII[i-1]) >= 73 and Abs(ipAscII[i-1]) <= 81 Then
		lSum += -(ipAscII[i-1]) + 82
	ElseIf Abs(ipAscII[i-1]) >= 82 and Abs(ipAscII[i-1]) <= 90 Then
		lSum += -(ipAscII[i-1]) + 91
	End If
Next
Color 10
Print "RevPythag.:  "; : Color 15 : Print lSum
If bState = 1 orElse bState = 3 orElse bState = 5 orElse bState = 7 Then  ' combinations with --log
	Print #lFileHandle, "RevPyth.:    ";lSum
End If

If bState = 2 orElse bState = 3 orElse bState = 6 orElse bState = 7 Then  ' combinations with --verbose
	' Print Characters (RevPythagorian) ===========================================
	For i = 1 to lWordLen
		If Abs(ipAscII[i-1]) < 65 orElse Abs(ipAscII[i-1]) > 90 Then
			If Abs(ipAscII[i-1]) >=49 and Abs(ipAscII[i-1]) <= 57 Then
				Locate ,2*i - 1 : Print Str$(ipAscII[i-1] - 48);
			End If
		Else
			Locate ,2*i - 1 : Print Chr$(ipAscII[i-1]);
		End If
	Next
	Print
	' Print digits to be summed (RevPythagorian)
	For i = 1 to lWordLen
		If Abs(ipAscII[i-1]) < 65 orElse Abs(ipAscII[i-1]) > 90 Then
			If Abs(ipAscII[i-1]) >=49 and Abs(ipAscII[i-1]) <= 57 Then
				Locate ,2*i - 1 : Print Str$(ipAscII[i-1] - 48);
				If i <= lWordLen - 1 Then
					Locate ,i*2 : Print "+";
				End If
			End If
		Else
			If Abs(ipAscII[i-1]) >= 65 and Abs(ipAscII[i-1]) <= 72 Then
				Locate ,2*i - 1 : Print Str$(-(ipAscII[i-1]) + 73);
				If i <= lWordLen - 1 Then
					Locate ,i*2 : Print "+";
				End If
			ElseIf Abs(ipAscII[i-1]) >= 73 and Abs(ipAscII[i-1]) <= 81 Then
				Locate ,2*i - 1 : Print Str$(-(ipAscII[i-1]) + 82);
				If i <= lWordLen - 1 Then
					Locate ,i*2 : Print "+";
				End If
			ElseIf Abs(ipAscII[i-1]) >= 82 and Abs(ipAscII[i-1]) <= 90 Then
				Locate ,2*i - 1 : Print Str$(-(ipAscII[i-1]) + 91);
				If i <= lWordLen - 1 Then
					Locate ,i*2 : Print "+";
				End If
			End If
		End If
	Next
	Print
End If
' ------------------------------------------------------------------------------
