' ------------------------------------------------------------------------------
' Title: Septenary.bas - translation unit for GematriaFBC.bas
' Version: 0.1 - June 2017
' Author: Robert Lock - beannachtai@homtail.com
' License: GPL v3
' ------------------------------------------------------------------------------
' Calculate the sum ========================================================
lSum = 0
For i = 1 to lWordLen
	If Abs(ipAscII[i-1]) < 65 orElse Abs(ipAscII[i-1]) > 90 Then '@ orElse [
		If Abs(ipAscII[i-1]) >=49 and Abs(ipAscII[i-1]) <= 57 Then
			lSum += ipAscII[i-1] - 48 ': Print ipAscII[i-1] - 48,"1 - 9"
		Else
			lSum += 0 ': Print "non-alphanumeric char @";i
		End If
	ElseIf Abs(ipAscII[i-1]) >= 65 and Abs(ipAscII[i-1]) <= 71 Then 'A-G
		lSum += ipAscII[i-1] - 64
	ElseIf Abs(ipAscII[i-1]) >= 72 and Abs(ipAscII[i-1]) <= 77 Then 'H-M
		lSum += 78 - ipAscII[i-1]
	ElseIf Abs(ipAscII[i-1]) >= 78 and Abs(ipAscII[i-1]) <= 84 Then 'N-T
		lSum += ipAscII[i-1] - 77
	ElseIf Abs(ipAscII[i-1]) >= 85 and Abs(ipAscII[i-1]) <= 90 Then 'U-Z
		lSum += 91 - ipAscII[i-1]
	End If
Next
Color 10
Print "Septenary:   "; : Color 15 : Print lSum
If bState = 1 orElse bState = 3 Then
	Print #lFileHandle, "Septenary:   ";lSum
End If

If bState = 2 orElse bState = 3 Then
	' Print Characters (Septenary) =============================================
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
	' Print digits to be summed (Septenary)
	For i = 1 to lWordLen
		If Abs(ipAscII[i-1]) < 65 orElse Abs(ipAscII[i-1]) > 90 Then '@ orElse [
			If Abs(ipAscII[i-1]) >=49 and Abs(ipAscII[i-1]) <= 57 Then
				Locate ,2*i - 1 : Print Str$(ipAscII[i-1] - 48);
				If i <= lWordLen - 1 Then
					Locate ,i*2 : Print "+";
				End If
			End If
		Else
			If Abs(ipAscII[i-1]) >= 65 and Abs(ipAscII[i-1]) <= 71 Then 'A-G
				Locate ,2*i - 1 : Print Str$(ipAscII[i-1] - 64);
				If i <= lWordLen - 1 Then
					Locate ,i*2 : Print "+";
				End If
			ElseIf Abs(ipAscII[i-1]) >= 72 and Abs(ipAscII[i-1]) <= 77 Then 'H-M
				Locate ,2*i - 1 : Print Str$(78 - ipAscII[i-1]);
				If i <= lWordLen - 1 Then
					Locate ,i*2 : Print "+";
				End If
			ElseIf Abs(ipAscII[i-1]) >= 78 and Abs(ipAscII[i-1]) <= 84 Then 'N-T
				Locate ,2*i - 1 : Print Str$(ipAscII[i-1] - 77);
				If i <= lWordLen - 1 Then
					Locate ,i*2 : Print "+";
				End If
			ElseIf Abs(ipAscII[i-1]) >= 85 and Abs(ipAscII[i-1]) <= 90 Then 'U-Z
				Locate ,2*i - 1 : Print Str$(91 - ipAscII[i-1]);
				If i <= lWordLen - 1 Then
					Locate ,i*2 : Print "+";
				End If
			End If
		End If
	Next
	Print
End If
' ------------------------------------------------------------------------------
