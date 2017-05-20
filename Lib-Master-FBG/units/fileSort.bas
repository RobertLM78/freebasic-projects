' -----------------------------------------------------------------------------
' Title: fileSort.bas - translation unit for LibMasterFBG.bas
' Version: 0.2 - May 2017
' Author: Robert Lock - beannachtai@homtail.com
' License: GPL v3
' About: Outputs CAT()
' -----------------------------------------------------------------------------
' ==== Unit title ====
Cls
Color RGB(0, 255, 255), RGB(0, 0, 0) 'Cyan on Black
Print "LibMasterFBG-0.1  -  Sort by title (no changes written)"
Print "-------------------------------------------------------"
Color RGB(255, 255, 255), RGB(0, 0, 0) 'White on Black
Print
' ====================

Color RGB(0, 255, 255), RGB(0, 0, 0) 'Cyan on Black
' Break CAT() into arrays
Print "Calling on strDiv routine..."
Sleep 30
#include "./units/strDiv.bas"

' Suffix' preceeding articles in title
n = 0
Print "Removing preceeding articles from titles: "
Color RGB(255, 255, 255), RGB(0, 0, 0) 'White on Black
For k = 1 to RecNum
	TITtmp = TIT(k,1)
	If Mid$(TITtmp,1,2) = "A " Then
		n += 1
		Locate 5,42 : Print n;
		TIT(k,1) = Mid$(TITtmp,3,Len(TITtmp)-2)&","&Mid$(TITtmp,1,2)
		Sleep 10
	ElseIf Mid$(TITtmp,1,3) = "An " Then
		n += 1
		Locate 5,42 : Print n;
		TIT(k,1) = Mid$(TITtmp,4,Len(TITtmp)-3)&","&Mid$(TITtmp,1,3)
		Sleep 10
	ElseIf Mid$(TITtmp,1,4) = "The " Then
		n += 1
		Locate 5,42 : Print n;
		TIT(k,1) = Mid$(TITtmp,5,Len(TITtmp)-4)&","&Mid$(TITtmp,1,4)
		Sleep 10
	End If
Next
For k = 1 to RecNum ' Trim$ the titles to remove trailing spaces
	TIT(k,1) = Trim$(TIT(k,1))
Next
Print : Print

Color RGB(0, 255, 255), RGB(0, 0, 0) 'Cyan on Black
' Concatenate CAT
Print "Calling on strCat routine..."
Sleep 30
#include "./units/strCat.bas"

' Break off record numbers
Print "Removing record numbers:"
Color RGB(255, 255, 255), RGB(0, 0, 0) 'White on Black
For i = 1 To RecNum
	Locate 8,25 : Print i;
	' Look for delimeter
	sortDelim = Instr(CAT(i,1),";")
	'Print ' DEBUG
	CAT(i,1) = Mid$(CAT(i,1),1,sortDelim-1)
	'Print CAT(i,1) ' DEBUG
	Sleep 10
Next
Print : Print

'========================================
' Alphabetize the catalog ('Binary' sort)
Color RGB(0, 255, 255), RGB(0, 0, 0) 'Cyan on Black
Print "Alphabetizing: ";
Color RGB(255, 255, 255), RGB(0, 0, 0) 'White on Black
P = RecNum
n = 0

Pcheck:
If P <= 1 Then
	Goto LeaveSort:
End If
P = Int(P/2) : M = RecNum - P

SScheck:
SS = 0
For k = 1 to M
	Colm += 1
	Locate 10,Colm : Print ".";
	If Colm = 116 Then
		For i = 15 to 116
			Locate 10,i : Print " "
		Next
		Colm = 15
	End If
	Sleep 1
	X = k + P
	n += 1
	If CAT(k,1)>CAT(X,1) Then
		CATtmp = CAT(k,1)
		CAT(k,1) = CAT(X,1)
		CAT(X,1) = CATtmp
		SS = 1
	End If
Next

If SS > 0 Then
	Goto SScheck:
End If

Goto Pcheck:
LeaveSort:
Print
Color RGB(0, 255, 255), RGB(0, 0, 0) 'Cyan on Black
Print "Sorted in "&Str$(n+1)&" Passes.";
Color RGB(255, 255, 255), RGB(0, 0, 0) 'White on Black
Print : Print
'========================================

' Add the record numbers back
Color RGB(0, 255, 255), RGB(0, 0, 0) 'Cyan on Black
Print "Replacing record numbers:"
Color RGB(255, 255, 255), RGB(0, 0, 0) 'White on Black
For i = 1 To RecNum
	Locate 13,26 : Print i;
	CAT(i,1) = CAT(i,1)&";"&Str$(i)
	'Print CAT(i,1) ' DEBUG
	Sleep 10
Next
Print : Print

' Break CAT() into arrays
Color RGB(0, 255, 255), RGB(0, 0, 0) 'Cyan on Black
Print "Calling on strDiv routine..."
Sleep 30
#include "./units/strDiv.bas"

' 'Re-prefix' preceeding articles
n = 0
Print "Replacing preceeding articles to titles:"
Color RGB(255, 255, 255), RGB(0, 0, 0) 'White on Black
For i = 1 To RecNum
	' Look for delimeter
	sortDelim = Instr(TIT(i,1),",")
	If sortDelim >= 1 Then
		n += 1
		Locate 16,42 : Print n;
		'Print sortDelim; ' DEBUG
		Sleep 10
		TIT(i,1) = Mid$(TIT(i,1),sortDelim+1,Len(TIT(i,1))-sortDelim)&" "&Mid$(TIT(i,1),1,sortDelim-1)
	End If
	'Print ' DEBUG
	'Print TIT(i,1) ' DEBUG
Next
Print : Print

Color RGB(0, 255, 255), RGB(0, 0, 0) 'Cyan on Black
' Concatenate CAT
Print "Calling on strCat routine..."
Color RGB(255, 255, 255), RGB(0, 0, 0) 'White on Black
Sleep 30
#include "./units/strCat.bas"
Print

Print "Catalog sorted.  Press any key to continue. ";
Sleep
Cls
' -----------------------------------------------------------------------------
