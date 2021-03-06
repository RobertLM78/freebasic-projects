' ------------------------------------------------------------------------------
' Title: RevSimpleAndReg.bas - translation unit for GematriaFBC.bas
' Version: 0.3 - May 2018
' Author: Robert Lock - beannachtai@homtail.com
' License: GPL v3
' About: Reversed Simple (Ordinal) and Regular (Sumerian) English Gematria
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
	Else
		lSum += -(ipAscII[i-1]) + 91
	End If
Next
lRegSum = lSum*6
Color 10
Print "RevSimple:   "; : Color 15 : Print lSum
Color 10
Print "RevRegular:  "; : Color 15 : Print lRegSum
If (bState and mask1) = 1 Then '--log
	Print #lFileHandle, "RevSimple:   ";lSum
	Print #lFileHandle, "RevRegular:  ";lRegSum
End If

If (bState and mask2) = 2 Then '--verbose
	' Print Characters (RevSimple) =============================================
	For i = 1 to lWordLen
		If ipAscII[i-1] < 65 orElse ipAscII[i-1] > 90 Then
			If ipAscII[i-1] >=49 and ipAscII[i-1] <= 57 Then
				Locate ,3*i - 2 : Print Str$(ipAscII[i-1] - 48);
			End If
		Else
			Locate ,3*i - 2 : Print Chr$(ipAscII[i-1]);
		End If
	Next
	Print
	' Print digits to be summed (RevSimple)
	For i = 1 to lWordLen
		If ipAscII[i-1] < 65 orElse ipAscII[i-1] > 90 Then
			If ipAscII[i-1] >=49 and ipAscII[i-1] <= 57 Then
				Locate ,3*i - 2 : Print Str$(ipAscII[i-1] - 48);
				If i <= lWordLen - 1 Then
					Locate ,i*3 : Print "+";
				End If
			End If
		Else
			Locate ,3*i - 2 : Print Str$(-(ipAscII[i-1]) + 91);
			If i <= lWordLen - 1 Then
				Locate ,i*3 : Print "+";
			End If
		End If
	Next
	Print

	' Print Characters (RevRegular) ============================================
	For i = 1 to lWordLen
		If ipAscII[i-1] < 65 orElse ipAscII[i-1] > 90 Then
			If ipAscII[i-1] >=49 and ipAscII[i-1] <= 57 Then
				Locate ,4*i - 3 : Print Str$((ipAscII[i-1] - 48)*6);
			End If
		Else
			Locate ,4*i - 3 : Print Chr$(ipAscII[i-1]);
		End If
	Next
	Print
	' Print digits to be summed (RevRegular)
	For i = 1 to lWordLen
		If ipAscII[i-1] < 65 orElse ipAscII[i-1] > 90 Then
			If ipAscII[i-1] >=49 and ipAscII[i-1] <= 57 Then
				Locate ,4*i - 3 : Print Str$((ipAscII[i-1] - 48)*6);
				If i <= lWordLen - 1 Then
					Locate ,i*4 : Print "+";
				End If
			End If
		Else
			Locate ,4*i - 3 : Print Str$((-(ipAscII[i-1]) + 91)*6);
			If i <= lWordLen - 1 Then
				Locate ,i*4 : Print "+";
			End If
		End If
	Next
	Print
End If
' ------------------------------------------------------------------------------
