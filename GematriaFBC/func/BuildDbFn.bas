' Title: BuildDbFn.bas - Build database function
' Version: 0.3 - May 2018
' Author: Robert Lock - beannachtai@hotmail.com
' License: GPL v3
' Function BuildDb(input_filename)
' ==============================================================================
Function BuildDb(sDbInput As String = "") As String

Dim As Integer Ptr ipAscII
Dim As Integer Ptr ipSumDigits
Dim As String       sWordIn
Dim As zString *98  zWordIn
Dim As zString *128 zFinalRec
Dim As Double  dTime = Timer
'Dim As Integer iCnt
Dim As Long    i
Dim As uLong   lDbInHandle, lDbOutHandle
Dim As uLong   lWordLen
Dim As uLong   lSum
Dim As uLong   lRegSum
Dim As uLong   lSumLength
Dim As uLong   lSumReduce
Dim As uLong   lSumTmp
Dim As String  sDbOutput = sDbInput + ".dat"

lDbInHandle = FreeFile()
If Open(sDbInput For Input As #lDbInHandle) <> 0 Then
	'Print CurDir
	'Print sDbInput, sDbOutput
	Print "Input file not found. Quitting program."
	System 0
Else
	Print "This may take a few seconds for large files...";
	While Eof(lDbInHandle) = 0
		'iCnt += 1
		Line Input #lDbInHandle, sWordIn
		zWordIn = Trim$(Ucase$(sWordIn))

		' Allocate memory
		lWordLen = Len(zWordIn)
		ipAscII = Allocate(lWordLen*SizeOf(Integer))
		' Load memory of ASCII codes
		For i = 1 to lWordLen
			ipAscII[i-1] = Asc(zWordIn,i)
		Next
		' Start building record
		zFinalRec = Trim$(sWordIn) + ":"

		' Simple and Regular
		lSum = 0
		For i = 1 to lWordLen
			If ipAscII[i-1] < 65 orElse ipAscII[i-1] > 90 Then
				If ipAscII[i-1] >=49 and ipAscII[i-1] <= 57 Then
					lSum += ipAscII[i-1] - 48
				Else
					lSum += 0
				End If
			Else
				lSum += ipAscII[i-1] - 64
			End If
		Next
		lRegSum = lSum*6
		zFinalRec = zFinalRec + Str$(lSum) + ":" + Str$(lRegSum) + ":"

		' Jewish
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
			ElseIf ipAscII[i-1] = 74 Then
				lSum += 600
			ElseIf ipAscII[i-1] >= 75 and ipAscII[i-1] <= 83 Then
				lSum += (ipAscII[i-1] - 74)*10
			ElseIf ipAscII[i-1] = 84 orElse ipAscII[i-1] = 85 Then
				lSum += (ipAscII[i-1] - 83)*100
			ElseIf ipAscII[i-1] = 86 Then
				lSum += 700
			ElseIf ipAscII[i-1] = 87 Then
				lSum += 900
			ElseIf ipAscII[i-1] >= 88 and ipAscII[i-1] <= 90 Then
				lSum += (ipAscII[i-1] - 85)*100
			End If
		Next
		zFinalRec = zFinalRec + Str$(lSum) + ":"

		' Satanic
		lSum = 0
		For i = 1 to lWordLen
			If ipAscII[i-1] < 65 orElse ipAscII[i-1] > 90 Then
				If ipAscII[i-1] >=49 and ipAscII[i-1] <= 57 Then
					lSum += ipAscII[i-1] - 48
				Else
					lSum += 0
				End If
			Else
				lSum += ipAscII[i-1] - 29
			End If
		Next
		zFinalRec = zFinalRec + Str$(lSum) + ":"

		' Extended
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
		zFinalRec = zFinalRec + Str$(lSum) + ":"

		' Septenary
		lSum = 0
		For i = 1 to lWordLen
			If ipAscII[i-1] < 65 orElse ipAscII[i-1] > 90 Then
				If ipAscII[i-1] >=49 and ipAscII[i-1] <= 57 Then
					lSum += ipAscII[i-1] - 48 ': Print ipAscII[i-1] - 48,"1 - 9"
				Else
					lSum += 0 ': Print "non-alphanumeric char @";i
				End If
			ElseIf ipAscII[i-1] >= 65 and ipAscII[i-1] <= 71 Then 'A-G
				lSum += ipAscII[i-1] - 64
			ElseIf ipAscII[i-1] >= 72 and ipAscII[i-1] <= 77 Then 'H-M
				lSum += 78 - ipAscII[i-1]
			ElseIf ipAscII[i-1] >= 78 and ipAscII[i-1] <= 84 Then 'N-T
				lSum += ipAscII[i-1] - 77
			ElseIf ipAscII[i-1] >= 85 and ipAscII[i-1] <= 90 Then 'U-Z
				lSum += 91 - ipAscII[i-1]
			End If
		Next
		zFinalRec = zFinalRec + Str$(lSum) + ":"

		' Chaldean
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
			ElseIf ipAscII[i-1] = 73 orElse ipAscII[i-1] = 74 orElse ipAscII[i-1] = 81 orElse ipAscII[i-1] = 89  Then
				lSum += 1
			ElseIf ipAscII[i-1] = 75 orElse ipAscII[i-1] = 82 Then 'K,R = 2
				lSum += 2
			ElseIf ipAscII[i-1] = 77 orElse ipAscII[i-1] = 84 Then 'M,T = 4
				lSum += 4
			End If
		Next
		zFinalRec = zFinalRec + Str$(lSum) + ":"

		' Pythagorean
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
				lSum += ipAscII[i-1] - 73
			ElseIf ipAscII[i-1] >= 83 and ipAscII[i-1] <= 90 Then
				lSum += ipAscII[i-1] - 82
			End If
		Next
		zFinalRec = zFinalRec + Str$(lSum) + ":"

		' Reduced
		lSumTmp = lSum
		While Len(Str$(lSum)) > 1
			lSumReduce = 0
			ipSumDigits = Allocate(Len(Str$(lSum))*SizeOf(Integer))
			For i = 1 to Len(Str$(lSum))
				ipSumDigits[i-1] = Val(Mid$(Str$(lSum), i , 1))
				lSumReduce += ipSumDigits[i-1]
			Next
			lSum = lSumReduce
			DeAllocate(ipSumDigits)
		Wend
		zFinalRec = zFinalRec + Str$(lSum) + ":"

		' Reverse Simple and Regular
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
		zFinalRec = zFinalRec + Str$(lSum) + ":" + Str$(lRegSum) + ":"

		' Reverse Pythagorean
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
		zFinalRec = zFinalRec + Str$(lSum) + ":"

		' Reverse Reduced
		lSumTmp = lSum
		While Len(Str$(lSum)) > 1
			lSumReduce = 0
			ipSumDigits = Allocate(Len(Str$(lSum))*SizeOf(Integer))
			For i = 1 to Len(Str$(lSum))
				ipSumDigits[i-1] = Val(Mid$(Str$(lSum), i , 1))
				lSumReduce += ipSumDigits[i-1]
			Next
			lSum = lSumReduce
			DeAllocate(ipSumDigits)
		Wend
		zFinalRec = zFinalRec + Str$(lSum) + ":"
		'Locate ,1 : Print iCnt;
		'Locate ,1 : Print String$(Loword(Width())," ");
		'Locate ,1 : Print zFinalRec;

		' Print record to file
		lDbOutHandle = FreeFile()
		Open sDbOutput for Append As #lDbOutHandle
		Print #lDbOutHandle, zFinalRec
		Close #lDbOutHandle

		DeAllocate(ipAscII)
	Wend
	Close #lDbInHandle
	Print Using "####.##";Timer - dTime;
	Print " seconds elapsed."
	Print "File written to " + CurDir + "/" + sDbOutput
	'Print
End If
End Function
