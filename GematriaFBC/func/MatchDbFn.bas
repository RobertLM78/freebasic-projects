' Title: MatchDbFn.bas - Build database function
' Version: 0.3 - May 2018
' Author: Robert Lock - beannachtai@hotmail.com
' License: GPL v3
' Function MatchDb(word,filename)
' ==============================================================================
Function MatchDb(sInputWord As String = "" ,sDbInputFile As String = "") As String

Dim As Integer Ptr ipAscII
Dim As Integer Ptr ipSumDigits
Dim As zString *98  zWordIn
Dim As zString *128 zRec
Dim As Double  dTime = Timer
Dim As Long    i,k
Dim As uLong   lDbInHandle, lDbOutHandle
Dim As uLong   lWordLen
Dim As uLong   lSum
Dim As uLong   lRegSum
Dim As uLong   lSumLength
Dim As uLong   lSumReduce
Dim As uLong   lSumTmp
Dim As uLong   lSimple, lRegular, lJewish, lSatanic, lExtended, lSeptenary
Dim As uLong   lChaldean, lPythagorean, lReduced, lRevSimple, lRevRegular
Dim As uLong   lRevPythag, lRevReduced
Dim As uByte   bDelim(1,2)
Dim As uByte   bCnt
Dim As String  sDbOutput = sInputWord + "-" + sDbInputFile

' First calculate the word passed via command line  ============================
zWordIn = Trim$(Ucase$(sInputWord))

' Allocate memory
lWordLen = Len(zWordIn)
ipAscII = Allocate(lWordLen*SizeOf(Integer))
' Load memory of ASCII codes
For i = 1 to lWordLen
	ipAscII[i-1] = Asc(zWordIn,i)
Next

zRec = Trim$(sInputWord) + ":"

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
lSimple = lSum : lRegular = lRegSum
zRec = zRec + Str$(lSum) + ":" + Str$(lRegSum) + ":"

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
lJewish = lSum
zRec = zRec + Str$(lSum) + ":"

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
lSatanic = lSum
zRec = zRec + Str$(lSum) + ":"

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
lExtended = lSum
zRec = zRec + Str$(lSum) + ":"

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
lSeptenary = lSum
zRec = zRec + Str$(lSum) + ":"

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
lChaldean = lSum
zRec = zRec + Str$(lSum) + ":"

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
lPythagorean = lSum
zRec = zRec + Str$(lSum) + ":"

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
lReduced = lSum
zRec = zRec + Str$(lSum) + ":"

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
lRevSimple = lSum : lRevRegular = lRegSum
zRec = zRec + Str$(lSum) + ":" + Str$(lRegSum) + ":"

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
lRevPythag = lSum
zRec = zRec + Str$(lSum) + ":"

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
lRevReduced = lSum
zRec = zRec + Str$(lSum) + ":"
DeAllocate(ipAscII)
' End calculation  =============================================================

' Now start matching  ==========================================================
' Match Simple (and Regular)
lDbInHandle = FreeFile()
If Open(sDbInputFile For Input As #lDbInHandle) <> 0 Then
	'Print CurDir
	'Print sDbInput, sDbOutput
	Print "Input file not found. Quitting program."
	System 0
Else
	Print "This may take a few seconds for large files...";' Unique to this test
	' Print the matched phrase to file first                '
	lDbOutHandle = FreeFile()                               '
	Open sDbOutput for Append As #lDbOutHandle              '
	Print #lDbOutHandle, zRec                               '
	Close #lDbOutHandle                                     ' ====================
	' Then print a section title
	lDbOutHandle = FreeFile()
	Open sDbOutput for Append As #lDbOutHandle
	Print #lDbOutHandle, " @ Simple = " + Str$(lSimple) + " and Regular English = " + Str$(lRegular)
	Print #lDbOutHandle, "================================================================================"
	Close #lDbOutHandle
	While Eof(lDbInHandle) = 0
	Line Input #lDbInHandle, sInputWord
	zWordIn = Trim$(sInputWord)
	bCnt = 0
	For k = 1 to 128
		If Mid$(zWordIn,k,1) = ":" Then
			bCnt += 1
		End If
		If bCnt = 1 Then
			bDelim(1,1) = k
			Exit For
		End If
	Next
	For k = (bDelim(1,1) + 1) to bDelim(1,1) + 5
		If Mid$(zWordIn,k,1) = ":" Then
			bCnt += 1
		End If
		If bCnt = 2 Then
			bDelim(1,2) = k
			Exit For
		End If
	Next
	If Val(Mid$(zWordIn,bDelim(1,1)+1,bDelim(1,2)-bDelim(1,1)-1)) = lSimple Then
		lDbOutHandle = FreeFile()
		Open sDbOutput for Append As #lDbOutHandle
		Print #lDbOutHandle, zWordIn
		Close #lDbOutHandle
	End If
	Wend
End If
Close #lDbInHandle
' Match Jewish
lDbInHandle = FreeFile()
If Open(sDbInputFile For Input As #lDbInHandle) <> 0 Then
	'Print CurDir
	'Print sDbInput, sDbOutput
	Print "Input file not found. Quitting program."
	System 0
Else
	lDbOutHandle = FreeFile()
	Open sDbOutput for Append As #lDbOutHandle
	Print #lDbOutHandle, " @ Jewish = " + Str$(lJewish)
	Print #lDbOutHandle, "================================================================================"
	Close #lDbOutHandle
	While Eof(lDbInHandle) = 0
	Line Input #lDbInHandle, sInputWord
	zWordIn = Trim$(sInputWord)
	bCnt = 0
	For k = 1 to 128
		If Mid$(zWordIn,k,1) = ":" Then
			bCnt += 1
		End If
		If bCnt = 3 Then
			bDelim(1,1) = k
			Exit For
		End If
	Next
	For k = (bDelim(1,1) + 1) to bDelim(1,1) + 5
		If Mid$(zWordIn,k,1) = ":" Then
			bCnt += 1
		End If
		If bCnt = 4 Then
			bDelim(1,2) = k
			Exit For
		End If
	Next
	If Val(Mid$(zWordIn,bDelim(1,1)+1,bDelim(1,2)-bDelim(1,1)-1)) = lJewish Then
		lDbOutHandle = FreeFile()
		Open sDbOutput for Append As #lDbOutHandle
		Print #lDbOutHandle, zWordIn
		Close #lDbOutHandle
	End If
	Wend
End If
Close #lDbInHandle
' Match Satanic
lDbInHandle = FreeFile()
If Open(sDbInputFile For Input As #lDbInHandle) <> 0 Then
	'Print CurDir
	'Print sDbInput, sDbOutput
	Print "Input file not found. Quitting program."
	System 0
Else
	lDbOutHandle = FreeFile()
	Open sDbOutput for Append As #lDbOutHandle
	Print #lDbOutHandle, " @ Satanic = " + Str$(lSatanic)
	Print #lDbOutHandle, "================================================================================"
	Close #lDbOutHandle
	While Eof(lDbInHandle) = 0
	Line Input #lDbInHandle, sInputWord
	zWordIn = Trim$(sInputWord)
	bCnt = 0
	For k = 1 to 128
		If Mid$(zWordIn,k,1) = ":" Then
			bCnt += 1
		End If
		If bCnt = 4 Then
			bDelim(1,1) = k
			Exit For
		End If
	Next
	For k = (bDelim(1,1) + 1) to bDelim(1,1) + 5
		If Mid$(zWordIn,k,1) = ":" Then
			bCnt += 1
		End If
		If bCnt = 5 Then
			bDelim(1,2) = k
			Exit For
		End If
	Next
	If Val(Mid$(zWordIn,bDelim(1,1)+1,bDelim(1,2)-bDelim(1,1)-1)) = lSatanic Then
		lDbOutHandle = FreeFile()
		Open sDbOutput for Append As #lDbOutHandle
		Print #lDbOutHandle, zWordIn
		Close #lDbOutHandle
	End If
	Wend
End If
Close #lDbInHandle
' Match Extended
lDbInHandle = FreeFile()
If Open(sDbInputFile For Input As #lDbInHandle) <> 0 Then
	'Print CurDir
	'Print sDbInput, sDbOutput
	Print "Input file not found. Quitting program."
	System 0
Else
	lDbOutHandle = FreeFile()
	Open sDbOutput for Append As #lDbOutHandle
	Print #lDbOutHandle, " @ Extended = " + Str$(lExtended)
	Print #lDbOutHandle, "================================================================================"
	Close #lDbOutHandle
	While Eof(lDbInHandle) = 0
	Line Input #lDbInHandle, sInputWord
	zWordIn = Trim$(sInputWord)
	bCnt = 0
	For k = 1 to 128
		If Mid$(zWordIn,k,1) = ":" Then
			bCnt += 1
		End If
		If bCnt = 5 Then
			bDelim(1,1) = k
			Exit For
		End If
	Next
	For k = (bDelim(1,1) + 1) to bDelim(1,1) + 5
		If Mid$(zWordIn,k,1) = ":" Then
			bCnt += 1
		End If
		If bCnt = 6 Then
			bDelim(1,2) = k
			Exit For
		End If
	Next
	If Val(Mid$(zWordIn,bDelim(1,1)+1,bDelim(1,2)-bDelim(1,1)-1)) = lExtended Then
		lDbOutHandle = FreeFile()
		Open sDbOutput for Append As #lDbOutHandle
		Print #lDbOutHandle, zWordIn
		Close #lDbOutHandle
	End If
	Wend
End If
Close #lDbInHandle
' Match Septenary
lDbInHandle = FreeFile()
If Open(sDbInputFile For Input As #lDbInHandle) <> 0 Then
	'Print CurDir
	'Print sDbInput, sDbOutput
	Print "Input file not found. Quitting program."
	System 0
Else
	lDbOutHandle = FreeFile()
	Open sDbOutput for Append As #lDbOutHandle
	Print #lDbOutHandle, " @ Septenary = " + Str$(lSeptenary)
	Print #lDbOutHandle, "================================================================================"
	Close #lDbOutHandle
	While Eof(lDbInHandle) = 0
	Line Input #lDbInHandle, sInputWord
	zWordIn = Trim$(sInputWord)
	bCnt = 0
	For k = 1 to 128
		If Mid$(zWordIn,k,1) = ":" Then
			bCnt += 1
		End If
		If bCnt = 6 Then
			bDelim(1,1) = k
			Exit For
		End If
	Next
	For k = (bDelim(1,1) + 1) to bDelim(1,1) + 5
		If Mid$(zWordIn,k,1) = ":" Then
			bCnt += 1
		End If
		If bCnt = 7 Then
			bDelim(1,2) = k
			Exit For
		End If
	Next
	If Val(Mid$(zWordIn,bDelim(1,1)+1,bDelim(1,2)-bDelim(1,1)-1)) = lSeptenary Then
		lDbOutHandle = FreeFile()
		Open sDbOutput for Append As #lDbOutHandle
		Print #lDbOutHandle, zWordIn
		Close #lDbOutHandle
	End If
	Wend
End If
Close #lDbInHandle
' Match Chaldean
lDbInHandle = FreeFile()
If Open(sDbInputFile For Input As #lDbInHandle) <> 0 Then
	'Print CurDir
	'Print sDbInput, sDbOutput
	Print "Input file not found. Quitting program."
	System 0
Else
	lDbOutHandle = FreeFile()
	Open sDbOutput for Append As #lDbOutHandle
	Print #lDbOutHandle, " @ Chaldean = " + Str$(lChaldean)
	Print #lDbOutHandle, "================================================================================"
	Close #lDbOutHandle
	While Eof(lDbInHandle) = 0
	Line Input #lDbInHandle, sInputWord
	zWordIn = Trim$(sInputWord)
	bCnt = 0
	For k = 1 to 128
		If Mid$(zWordIn,k,1) = ":" Then
			bCnt += 1
		End If
		If bCnt = 7 Then
			bDelim(1,1) = k
			Exit For
		End If
	Next
	For k = (bDelim(1,1) + 1) to bDelim(1,1) + 5
		If Mid$(zWordIn,k,1) = ":" Then
			bCnt += 1
		End If
		If bCnt = 8 Then
			bDelim(1,2) = k
			Exit For
		End If
	Next
	If Val(Mid$(zWordIn,bDelim(1,1)+1,bDelim(1,2)-bDelim(1,1)-1)) = lChaldean Then
		lDbOutHandle = FreeFile()
		Open sDbOutput for Append As #lDbOutHandle
		Print #lDbOutHandle, zWordIn
		Close #lDbOutHandle
	End If
	Wend
End If
Close #lDbInHandle
' Match Pythagorean
lDbInHandle = FreeFile()
If Open(sDbInputFile For Input As #lDbInHandle) <> 0 Then
	'Print CurDir
	'Print sDbInput, sDbOutput
	Print "Input file not found. Quitting program."
	System 0
Else
	lDbOutHandle = FreeFile()
	Open sDbOutput for Append As #lDbOutHandle
	Print #lDbOutHandle, " @ Pythagorean = " + Str$(lPythagorean)
	Print #lDbOutHandle, "================================================================================"
	Close #lDbOutHandle
	While Eof(lDbInHandle) = 0
	Line Input #lDbInHandle, sInputWord
	zWordIn = Trim$(sInputWord)
	bCnt = 0
	For k = 1 to 128
		If Mid$(zWordIn,k,1) = ":" Then
			bCnt += 1
		End If
		If bCnt = 8 Then
			bDelim(1,1) = k
			Exit For
		End If
	Next
	For k = (bDelim(1,1) + 1) to bDelim(1,1) + 5
		If Mid$(zWordIn,k,1) = ":" Then
			bCnt += 1
		End If
		If bCnt = 9 Then
			bDelim(1,2) = k
			Exit For
		End If
	Next
	If Val(Mid$(zWordIn,bDelim(1,1)+1,bDelim(1,2)-bDelim(1,1)-1)) = lPythagorean Then
		lDbOutHandle = FreeFile()
		Open sDbOutput for Append As #lDbOutHandle
		Print #lDbOutHandle, zWordIn
		Close #lDbOutHandle
	End If
	Wend
End If
Close #lDbInHandle
' Match Reduced
lDbInHandle = FreeFile()
If Open(sDbInputFile For Input As #lDbInHandle) <> 0 Then
	'Print CurDir
	'Print sDbInput, sDbOutput
	Print "Input file not found. Quitting program."
	System 0
Else
	lDbOutHandle = FreeFile()
	Open sDbOutput for Append As #lDbOutHandle
	Print #lDbOutHandle, " @ Reduced = " + Str$(lReduced)
	Print #lDbOutHandle, "================================================================================"
	Close #lDbOutHandle
	While Eof(lDbInHandle) = 0
	Line Input #lDbInHandle, sInputWord
	zWordIn = Trim$(sInputWord)
	bCnt = 0
	For k = 1 to 128
		If Mid$(zWordIn,k,1) = ":" Then
			bCnt += 1
		End If
		If bCnt = 9 Then
			bDelim(1,1) = k
			Exit For
		End If
	Next
	For k = (bDelim(1,1) + 1) to bDelim(1,1) + 5
		If Mid$(zWordIn,k,1) = ":" Then
			bCnt += 1
		End If
		If bCnt = 10 Then
			bDelim(1,2) = k
			Exit For
		End If
	Next
	If Val(Mid$(zWordIn,bDelim(1,1)+1,bDelim(1,2)-bDelim(1,1)-1)) = lReduced Then
		lDbOutHandle = FreeFile()
		Open sDbOutput for Append As #lDbOutHandle
		Print #lDbOutHandle, zWordIn
		Close #lDbOutHandle
	End If
	Wend
End If
Close #lDbInHandle
' Match RevSimple
lDbInHandle = FreeFile()
If Open(sDbInputFile For Input As #lDbInHandle) <> 0 Then
	'Print CurDir
	'Print sDbInput, sDbOutput
	Print "Input file not found. Quitting program."
	System 0
Else
	lDbOutHandle = FreeFile()
	Open sDbOutput for Append As #lDbOutHandle
	Print #lDbOutHandle, " @ Rev. Simple = " + Str$(lRevSimple) + " and Rev. Regular English = " + Str$(lRevRegular)
	Print #lDbOutHandle, "================================================================================"
	Close #lDbOutHandle
	While Eof(lDbInHandle) = 0
	Line Input #lDbInHandle, sInputWord
	zWordIn = Trim$(sInputWord)
	bCnt = 0
	For k = 1 to 128
		If Mid$(zWordIn,k,1) = ":" Then
			bCnt += 1
		End If
		If bCnt = 10 Then
			bDelim(1,1) = k
			Exit For
		End If
	Next
	For k = (bDelim(1,1) + 1) to bDelim(1,1) + 5
		If Mid$(zWordIn,k,1) = ":" Then
			bCnt += 1
		End If
		If bCnt = 11 Then
			bDelim(1,2) = k
			Exit For
		End If
	Next
	If Val(Mid$(zWordIn,bDelim(1,1)+1,bDelim(1,2)-bDelim(1,1)-1)) = lRevSimple Then
		lDbOutHandle = FreeFile()
		Open sDbOutput for Append As #lDbOutHandle
		Print #lDbOutHandle, zWordIn
		Close #lDbOutHandle
	End If
	Wend
End If
Close #lDbInHandle
' Match RevPythag
lDbInHandle = FreeFile()
If Open(sDbInputFile For Input As #lDbInHandle) <> 0 Then
	'Print CurDir
	'Print sDbInput, sDbOutput
	Print "Input file not found. Quitting program."
	System 0
Else
	lDbOutHandle = FreeFile()
	Open sDbOutput for Append As #lDbOutHandle
	Print #lDbOutHandle, " @ Reverse Pythagorean = " + Str$(lRevPythag)
	Print #lDbOutHandle, "================================================================================"
	Close #lDbOutHandle
	While Eof(lDbInHandle) = 0
	Line Input #lDbInHandle, sInputWord
	zWordIn = Trim$(sInputWord)
	bCnt = 0
	For k = 1 to 128
		If Mid$(zWordIn,k,1) = ":" Then
			bCnt += 1
		End If
		If bCnt = 12 Then
			bDelim(1,1) = k
			Exit For
		End If
	Next
	For k = (bDelim(1,1) + 1) to bDelim(1,1) + 5
		If Mid$(zWordIn,k,1) = ":" Then
			bCnt += 1
		End If
		If bCnt = 13 Then
			bDelim(1,2) = k
			Exit For
		End If
	Next
	If Val(Mid$(zWordIn,bDelim(1,1)+1,bDelim(1,2)-bDelim(1,1)-1)) = lRevPythag Then
		lDbOutHandle = FreeFile()
		Open sDbOutput for Append As #lDbOutHandle
		Print #lDbOutHandle, zWordIn
		Close #lDbOutHandle
	End If
	Wend
End If
Close #lDbInHandle
' Match lRevReduced
lDbInHandle = FreeFile()
If Open(sDbInputFile For Input As #lDbInHandle) <> 0 Then
	'Print CurDir
	'Print sDbInput, sDbOutput
	Print "Input file not found. Quitting program."
	System 0
Else
	lDbOutHandle = FreeFile()
	Open sDbOutput for Append As #lDbOutHandle
	Print #lDbOutHandle, " @ Reverse Reduced = " + Str$(lRevReduced)
	Print #lDbOutHandle, "================================================================================"
	Close #lDbOutHandle
	While Eof(lDbInHandle) = 0
	Line Input #lDbInHandle, sInputWord
	zWordIn = Trim$(sInputWord)
	bCnt = 0
	For k = 1 to 128
		If Mid$(zWordIn,k,1) = ":" Then
			bCnt += 1
		End If
		If bCnt = 13 Then
			bDelim(1,1) = k
			Exit For
		End If
	Next
	For k = (bDelim(1,1) + 1) to bDelim(1,1) + 5
		If Mid$(zWordIn,k,1) = ":" Then
			bCnt += 1
		End If
		If bCnt = 14 Then
			bDelim(1,2) = k
			Exit For
		End If
	Next
	If Val(Mid$(zWordIn,bDelim(1,1)+1,bDelim(1,2)-bDelim(1,1)-1)) = lRevReduced Then
		lDbOutHandle = FreeFile()
		Open sDbOutput for Append As #lDbOutHandle
		Print #lDbOutHandle, zWordIn
		Close #lDbOutHandle
	End If
	Wend
End If
Close #lDbInHandle
Print Using "####.##";Timer - dTime;
Print " seconds elapsed."
Print "File written to " + CurDir + "/" + sDbOutput
' Finish matching  =============================================================
End Function
