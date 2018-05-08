' ------------------------------------------------------------------------------
' Title: Extended.bas - translation unit for GematriaFBC.bas
' Version: 0.3 - May 2018
' Author: Robert Lock - beannachtai@homtail.com
' License: GPL v3
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
	ElseIf ipAscII[i-1] >= 65 and ipAscII[i-1] <= 73 Then
		lSum += ipAscII[i-1] - 64
	ElseIf ipAscII[i-1] >= 74 and ipAscII[i-1] <= 82 Then
		lSum += (ipAscII[i-1] - 73)*10
	ElseIf ipAscII[i-1] >= 83 and ipAscII[i-1] <= 90 Then
		lSum += (ipAscII[i-1] - 82)*100
	End If
Next
Color 10
Print "Extended:    "; : Color 15 : Print lSum
If (bState and mask1) = 1 Then '--log
	Print #lFileHandle, "Extended:    ";lSum
End If

If (bState and mask2) = 2 Then '--verbose
	' Print Characters (Extended) ===========================================
	For i = 1 to lWordLen
		If ipAscII[i-1] < 65 orElse ipAscII[i-1] > 90 Then
			If ipAscII[i-1] >=49 and ipAscII[i-1] <= 57 Then
				Locate ,4*i - 3 : Print Str$(ipAscII[i-1] - 48);
			End If
		Else
			Locate ,4*i - 3 : Print Chr$(ipAscII[i-1]);
		End If
	Next
	Print
	' Print digits to be summed (Extended)
	For i = 1 to lWordLen
		If ipAscII[i-1] < 65 orElse ipAscII[i-1] > 90 Then
			If ipAscII[i-1] >=49 and ipAscII[i-1] <= 57 Then
				Locate ,4*i - 3 : Print Str$(ipAscII[i-1] - 48);
				If i <= lWordLen - 1 Then
					Locate ,i*4 : Print "+";
				End If
			End If
		Else
			If ipAscII[i-1] >= 65 and ipAscII[i-1] <= 73 Then
				Locate ,4*i - 3 : Print Str$(ipAscII[i-1] - 64);
				If i <= lWordLen - 1 Then
					Locate ,i*4 : Print "+";
				End If
			ElseIf ipAscII[i-1] >= 74 and ipAscII[i-1] <= 82 Then
				Locate ,4*i - 3 : Print Str$((ipAscII[i-1] - 73)*10);
				If i <= lWordLen - 1 Then
					Locate ,i*4 : Print "+";
				End If
			ElseIf ipAscII[i-1] >= 83 and ipAscII[i-1] <= 90 Then
				Locate ,4*i - 3 : Print Str$((ipAscII[i-1] - 82)*100);
				If i <= lWordLen - 1 Then
					Locate ,i*4 : Print "+";
				End If
			End If
		End If
	Next
	Print
End If
' ------------------------------------------------------------------------------
