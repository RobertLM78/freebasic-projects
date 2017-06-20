' -----------------------------------------------------------------------------
' Title: fileSort.bas - translation unit for LibMasterFBG.bas
' Version: 0.3 - June 2017
' Author: Robert Lock - beannachtai@homtail.com
' License: GPL v3
' About: Outputs CAT()
' -----------------------------------------------------------------------------
' ==== Unit title ====
Cls
Print "LibMasterFBG-0.2  -  Sort by title (no changes written)"
Print "-------------------------------------------------------"
Print
' ====================

' Break CAT() into arrays
Print "Calling on strDiv routine..."
Sleep 150
#include "./units/strDiv.bas"

' Suffix' preceeding articles in title
n = 0
Print "Removing preceeding articles from titles: "
For k = 1 to wRecNum
	zTIT = zpTIT[(k-1)*bTITmax]
	If Mid$(zTIT,1,2) = "A " Then
		n += 1
		Locate 5,42 : Print n;
		zpTIT[(k-1)*bTITmax] = Mid$(zTIT,3,Len(zTIT)-2)&","&Mid$(zTIT,1,2)
		'Sleep 10
	ElseIf Mid$(zTIT,1,3) = "An " Then
		n += 1
		Locate 5,42 : Print n;
		zpTIT[(k-1)*bTITmax] = Mid$(zTIT,4,Len(zTIT)-3)&","&Mid$(zTIT,1,3)
		'Sleep 10
	ElseIf Mid$(zTIT,1,4) = "The " Then
		n += 1
		Locate 5,42 : Print n;
		zpTIT[(k-1)*bTITmax] = Mid$(zTIT,5,Len(zTIT)-4)&","&Mid$(zTIT,1,4)
		'Sleep 10
	End If
Next
For k = 1 to wRecNum ' Trim$ the titles to remove trailing spaces
	zpTIT[(k-1)*bTITmax] = Trim$(zpTIT[(k-1)*bTITmax])
Next
Sleep 150
Print : Print

' Concatenate CAT
Print "Calling on strCat routine..."
Sleep 150
#include "./units/strCat.bas"

' Break off record numbers
Print "Removing record numbers:"
n = 0
For i = 1 To wRecNum
	n += 1
	Locate 8,25 : Print n;
	' Look for delimeter
	iSortDelim = Instr(zpCAT[(i-1)*bCATmax],";")
	'Print ' DEBUG
	zpCAT[(i-1)*bCATmax] = Mid$(zpCAT[(i-1)*bCATmax],1,iSortDelim-1)
	'Print zpCAT[(i-1)*bCATmax] ' DEBUG
	'Sleep 10
Next
Sleep 150
Print : Print

'========================================
' Alphabetize the catalog ('Binary' sort)
Print "Alphabetizing: ";
P = wRecNum
n = 0

Pcheck:
If P <= 1 Then
	Goto LeaveSort:
End If
P = Int(P/2) : M = wRecNum - P

SScheck:
SS = 0
For k = 1 to M
	wColm += 1
	Locate 10,wColm : Print ".";
	If wColm = 65 Then
		For i = 15 to 65
			Locate 10,i : Print " "
		Next
		wColm = 15
	End If
	'Sleep 1
	X = k + P
	n += 1
	If zpCAT[(k-1)*bCATmax] > zpCAT[(X-1)*bCATmax] Then
		zCAT = zpCAT[(k-1)*bCATmax]
		zpCAT[(k-1)*bCATmax] = zpCAT[(X-1)*bCATmax]
		zpCAT[(X-1)*bCATmax] = zCAT
		SS = 1
	End If
Next

If SS > 0 Then
	Goto SScheck:
End If

Goto Pcheck:
LeaveSort:
Print
Print "Sorted in "&Str$(n+1)&" Passes.";
Sleep 150
Print : Print
'========================================

' Add the record numbers back
Print "Replacing record numbers:"
n = 0
For i = 1 To wRecNum
	n += 1
	Locate 13,26 : Print n;
	zpCAT[(i-1)*bCATmax] = zpCAT[(i-1)*bCATmax]&";"&Str$(i)
	'Print zpCAT[(i-1)*bCATmax] ' DEBUG
	'Sleep 10
Next
Sleep 150
Print : Print

' Break CAT() into arrays
Print "Calling on strDiv routine..."
Sleep 150
#include "./units/strDiv.bas"

' 'Re-prefix' preceeding articles
n = 0
Print "Replacing preceeding articles to titles:"
For i = 1 To wRecNum
	' Look for delimeter
	iSortDelim = Instr(zpTIT[(i-1)*bTITmax],",")
	If iSortDelim >= 1 and iSortDelim <=110 Then
		n += 1
		Locate 16,42 : Print n;
		'Print iSortDelim; ' DEBUG
		'Sleep 10
		zpTIT[(i-1)*bTITmax] = Mid$(zpTIT[(i-1)*bTITmax],iSortDelim+1,Len(zpTIT[(i-1)*bTITmax])-iSortDelim)&" "&Mid$(zpTIT[(i-1)*bTITmax],1,iSortDelim-1)
	End If
	'Print ' DEBUG
	'Print zpTIT[(i-1)*bTITmax] ' DEBUG
Next
Sleep 150
Print : Print

' Concatenate CAT
Print "Calling on strCat routine..."
Sleep 150
#include "./units/strCat.bas"
Print

Print "Catalog sorted.  Press any key to continue. ";
Sleep
Cls
' -----------------------------------------------------------------------------
