' ------------------------------------------------------------------------------
' Title: Chaldean.bas - translation unit for GematriaFBC.bas
' Version: 0.2 - March 2018
' Author: Robert Lock - beannachtai@homtail.com
' License: GPL v3
' ------------------------------------------------------------------------------
' Calculate the sum ============================================================
lSum = 0
For i = 1 to lWordLen
	If ipAscII[i-1] < 65 orElse ipAscII[i-1] > 90 Then
		If ipAscII[i-1] >=49 and ipAscII[i-1] <= 57 Then
			lSum += ipAscII[i-1] - 48 ': Print ipAscII[i-1] - 48,"1 - 9"
		Else
			lSum += 0 ': Print "non-alphanumeric char @";i
		End If
	ElseIf ipAscII[i-1] >= 65 and ipAscII[i-1] <= 69 Then 'A-E = 1,2,3,4,5
		lSum += ipAscII[i-1] - 64
	ElseIf ipAscII[i-1] = 70 orElse ipAscII[i-1] = 80 Then 'F,P = 8
		lSum += 8
	ElseIf ipAscII[i-1] = 71 orElse ipAscII[i-1] = 76 orElse ipAscII[i-1] = 83  Then 'G,L,S = 3
		lSum += 3
	ElseIf ipAscII[i-1] = 72 orElse ipAscII[i-1] = 78 orElse ipAscII[i-1] = 88  Then 'H,N,X = 5
		lSum += 5
	ElseIf ipAscII[i-1] >= 85 and ipAscII[i-1] <= 87  Then 'U,V,W = 6
		lSum += 6
	ElseIf ipAscII[i-1] = 79 orElse ipAscII[i-1] = 90 Then 'O,Z = 7
		lSum += 7
	ElseIf ipAscII[i-1] = 73 orElse ipAscII[i-1] = 74 orElse ipAscII[i-1] = 81 orElse ipAscII[i-1] = 89  Then 'I,J,Q,Y = 1
		lSum += 1
	ElseIf ipAscII[i-1] = 75 orElse ipAscII[i-1] = 82 Then 'K,R = 2
		lSum += 2
	ElseIf ipAscII[i-1] = 77 orElse ipAscII[i-1] = 84 Then 'M,T = 4
		lSum += 4
	End If
Next
Color 10
Print "Chaldean:    "; : Color 15 : Print lSum
If bState = 1 orElse bState = 3 orElse bState = 5 orElse bState = 7 Then  ' combinations with --log
	Print #lFileHandle, "Chaldean:    ";lSum
End If

If bState = 2 orElse bState = 3 orElse bState = 6 orElse bState = 7 Then  ' combinations with --verbose
	' Print Characters (Chaldean) ==============================================
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
	' Print digits to be summed (Chaldean)
	For i = 1 to lWordLen
		If ipAscII[i-1] < 65 orElse ipAscII[i-1] > 90 Then
			If ipAscII[i-1] >=49 and ipAscII[i-1] <= 57 Then
				Locate ,2*i - 1 : Print Str$(ipAscII[i-1] - 48);
				If i <= lWordLen - 1 Then
					Locate ,i*2 : Print "+";
				End If
			End If
		Else
			If ipAscII[i-1] >= 65 and ipAscII[i-1] <= 69 Then 'A-E = 1,2,3,4,5
				Locate ,2*i - 1 : Print Str$(ipAscII[i-1] - 64);
				If i <= lWordLen - 1 Then
					Locate ,i*2 : Print "+";
				End If
			ElseIf ipAscII[i-1] = 70 orElse ipAscII[i-1] = 80 Then 'F,P = 8
				Locate ,2*i - 1 : Print Str$(8);
				If i <= lWordLen - 1 Then
					Locate ,i*2 : Print "+";
				End If
			ElseIf ipAscII[i-1] = 71 orElse ipAscII[i-1] = 76 orElse ipAscII[i-1] = 83  Then 'G,L,S = 3
				Locate ,2*i - 1 : Print Str$(3);
				If i <= lWordLen - 1 Then
					Locate ,i*2 : Print "+";
				End If
			ElseIf ipAscII[i-1] = 72 orElse ipAscII[i-1] = 78 orElse ipAscII[i-1] = 88  Then 'H,N,X = 5
				Locate ,2*i - 1 : Print Str$(5);
				If i <= lWordLen - 1 Then
					Locate ,i*2 : Print "+";
				End If
			ElseIf ipAscII[i-1] >= 85 and ipAscII[i-1] <= 87  Then 'U,V,W = 6
				Locate ,2*i - 1 : Print Str$(6);
				If i <= lWordLen - 1 Then
					Locate ,i*2 : Print "+";
				End If
			ElseIf ipAscII[i-1] = 79 orElse ipAscII[i-1] = 90 Then 'O,Z = 7
				Locate ,2*i - 1 : Print Str$(7);
				If i <= lWordLen - 1 Then
					Locate ,i*2 : Print "+";
				End If
			ElseIf ipAscII[i-1] = 73 orElse ipAscII[i-1] = 74 orElse ipAscII[i-1] = 81 orElse ipAscII[i-1] = 89  Then 'I,J,Q,Y = 1
				Locate ,2*i - 1 : Print Str$(1);
				If i <= lWordLen - 1 Then
					Locate ,i*2 : Print "+";
				End If
			ElseIf ipAscII[i-1] = 75 orElse ipAscII[i-1] = 82 Then 'K,R = 2
				Locate ,2*i - 1 : Print Str$(2);
				If i <= lWordLen - 1 Then
					Locate ,i*2 : Print "+";
				End If
			ElseIf ipAscII[i-1] = 77 orElse ipAscII[i-1] = 84 Then 'M,T = 4
				Locate ,2*i - 1 : Print Str$(4);
				If i <= lWordLen - 1 Then
					Locate ,i*2 : Print "+";
				End If
			End If
		End If
	Next
	Print
End If
' ------------------------------------------------------------------------------
