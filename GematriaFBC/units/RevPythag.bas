' ------------------------------------------------------------------------------
' Title: RevPythag.bas - translation unit for GematriaFBC.bas
' Version: 0.3 - May 2018
' Author: Robert Lock - beannachtai@homtail.com
' License: GPL v3
' About: Reversed Full Reduction
' ------------------------------------------------------------------------------
' Calculate the sum ============================================================
lSum = 0
For i = 1 to lWordLen
	If ipAscII[i-1] < 65 orElse ipAscII[i-1] > 90 Then
		If ipAscII[i-1] >=49 and ipAscII[i-1] <= 57 Then
			lSum += ipAscII[i-1] - 48
		Else
			lSum += 0
		End If
	ElseIf ipAscII[i-1] >= 65 and ipAscII[i-1] <= 72 Then
		lSum += -(ipAscII[i-1]) + 73
	ElseIf ipAscII[i-1] >= 73 and ipAscII[i-1] <= 81 Then
		lSum += -(ipAscII[i-1]) + 82
	ElseIf ipAscII[i-1] >= 82 and ipAscII[i-1] <= 90 Then
		lSum += -(ipAscII[i-1]) + 91
	End If
Next
Color 10
Print "RevPythag.:  "; : Color 15 : Print lSum
If (bState and mask1) = 1 Then '--log
	Print #lFileHandle, "RevPyth.:    ";lSum
End If

If (bState and mask2) = 2 Then '--verbose
	' Print Characters (RevPythagorian) ===========================================
	For i = 1 to lWordLen
		If ipAscII[i-1] < 65 orElse ipAscII[i-1] > 90 Then
			If ipAscII[i-1] >=49 and ipAscII[i-1] <= 57 Then
				Locate ,2*i - 1 : Print Str$(ipAscII[i-1] - 48);
			End If
		Else
			Locate ,2*i - 1 : Print Chr$(ipAscII[i-1]);
		End If
	Next
	Print
	' Print digits to be summed (RevPythagorian)
	For i = 1 to lWordLen
		If ipAscII[i-1] < 65 orElse ipAscII[i-1] > 90 Then
			If ipAscII[i-1] >=49 and ipAscII[i-1] <= 57 Then
				Locate ,2*i - 1 : Print Str$(ipAscII[i-1] - 48);
				If i <= lWordLen - 1 Then
					Locate ,i*2 : Print "+";
				End If
			End If
		Else
			If ipAscII[i-1] >= 65 and ipAscII[i-1] <= 72 Then
				Locate ,2*i - 1 : Print Str$(-(ipAscII[i-1]) + 73);
				If i <= lWordLen - 1 Then
					Locate ,i*2 : Print "+";
				End If
			ElseIf ipAscII[i-1] >= 73 and ipAscII[i-1] <= 81 Then
				Locate ,2*i - 1 : Print Str$(-(ipAscII[i-1]) + 82);
				If i <= lWordLen - 1 Then
					Locate ,i*2 : Print "+";
				End If
			ElseIf ipAscII[i-1] >= 82 and ipAscII[i-1] <= 90 Then
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
