' ------------------------------------------------------------------------------
' Title: Satanic.bas - translation unit for GematriaFBC.bas
' Version: 0.2 - March 2018
' Author: Robert Lock - beannachtai@homtail.com
' License: GPL v3
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
	Else
		lSum += ipAscII[i-1] - 29
	End If
Next
lRegSum = lSum*6
Color 10
Print "Satanic:     "; : Color 15 : Print lSum
If bState = 1 orElse bState = 3 orElse bState = 5 orElse bState = 7 Then  ' combinations with --log
	Print #lFileHandle, "Satanic:     ";lSum
End If

If bState = 2 orElse bState = 3 orElse bState = 6 orElse bState = 7 Then  ' combinations with --verbose
	' Print Characters (Satanic) ================================================
	For i = 1 to lWordLen
		If Abs(ipAscII[i-1]) < 65 orElse Abs(ipAscII[i-1]) > 90 Then
			If Abs(ipAscII[i-1]) >=49 and Abs(ipAscII[i-1]) <= 57 Then
				Locate ,3*i - 2 : Print Str$(ipAscII[i-1] - 48);
			End If
		Else
			Locate ,3*i - 2 : Print Chr$(ipAscII[i-1]);
		End If
	Next
	Print
	' Print digits to be summed (Satanic)
	For i = 1 to lWordLen
		If Abs(ipAscII[i-1]) < 65 orElse Abs(ipAscII[i-1]) > 90 Then
			If Abs(ipAscII[i-1]) >=49 and Abs(ipAscII[i-1]) <= 57 Then
				Locate ,3*i - 2 : Print Str$(ipAscII[i-1] - 48);
				If i <= lWordLen - 1 Then
					Locate ,i*3 : Print "+";
				End If
			End If
		Else
			Locate ,3*i - 2 : Print Str$(ipAscII[i-1] -29);
			If i <= lWordLen - 1 Then
				Locate ,i*3 : Print "+";
			End If
		End If
	Next
	Print
End If
' ------------------------------------------------------------------------------
