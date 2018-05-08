' ------------------------------------------------------------------------------
' Title: Reduced.bas - translation unit for GematriaFBC.bas
' Version: 0.3 - May 2018
' Author: Robert Lock - beannachtai@homtail.com
' License: GPL v3
' ------------------------------------------------------------------------------
' Calculate the sum ============================================================
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
Color 10
Print "Reduced:     "; : Color 15 : Print lSum
If (bState and mask1) = 1 Then '--log
	Print #lFileHandle, "Reduced:     ";lSum
	'Print #lFileHandle,
End If

If (bState and mask2) = 2 Then '--verbose
	' Print digits to be summed (Simple) =======================================
	lSum = lSumTmp
	While Len(Str$(lSum)) > 1
	lSumReduce = 0
	ipSumDigits = Allocate(Len(Str$(lSum))*SizeOf(Integer))
	For i = 1 to Len(Str$(lSum))
		ipSumDigits[i-1] = Val(Mid$(Str$(lSum), i , 1))
		lSumReduce += ipSumDigits[i-1]
		Locate ,2*i - 1 : Print Str$(ipSumDigits[i-1]);
		If i <= Len(Str$(lSum)) - 1 Then
			Locate ,i*2 : Print "+";
		End If
	Next
	lSum = lSumReduce
	Print
	DeAllocate(ipSumDigits)
	Wend
	Else
End If
' ------------------------------------------------------------------------------
