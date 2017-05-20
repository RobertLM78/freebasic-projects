' -----------------------------------------------------------------------------
' Title: deleteRec.bas - translation unit for LibMasterFBG.bas
' Version: 0.1 - May 2017
' Author: Robert Lock - beannachtai@homtail.com
' License: GPL v3
' About: Outputs CAT(),RecNUM
' -----------------------------------------------------------------------------
' ==== Unit title and Input ====
Cls
Color RGB(0, 255, 255), RGB(0, 0, 0) 'Cyan on Black
Print "LibMasterFBG-0.1  -  Delete a Record (no changes written)"
Print "---------------------------------------------------------"
Color RGB(255, 255, 255), RGB(0, 0, 0) 'White on Black
Print
' Input number of records
Input "Record to Delete?: ",sDelRec
iDelRec = Val(sDelRec)
If iDelRec = -1 Then
	Cls
	Goto Menu: 'Since there's no 'Return' from a translation unit :(
End If
While sDelRec = "" or iDelRec < 1 or iDelRec > RecNum
	Print "Enter a positive integer. "
	Input "Record to Delete?: ",sDelRec
	iDelRec = Val(sDelRec)
	If iDelRec = -1 Then
		Cls
		Goto Menu: 'Since there's no 'Return' from a translation unit :(
	End If
Wend
' ==============================

' Confirm delete
Print
Color RGB(0, 255, 255), RGB(0, 0, 0) 'Cyan on Black
Print "     Record #"&Str$(iDelRec)&" selected:"
Color RGB(255, 255, 255), RGB(0, 0, 0) 'White on Black
Print
Print
Print "       "&TIT(iDelRec,1)
Print "       "&AUT(iDelRec,1)
Print "       "&AUT(iDelRec,2)
Print "       "&AUT(iDelRec,3)
Print
Input "Are you sure?(Y/N): ",confirmD
While confirmD = "" or confirmD <> "y" and confirmD <> "Y" and confirmD <> "n" and confirmD <> "N"
	Input "Are you sure?(Y/N): ",confirmD
Wend
confirmD = Lcase$(confirmD)
Print

Select Case confirmD
	Case "n"
		Print "No record deleted.  Press any key to continue. ";
		Sleep
		Cls
		Goto Menu: 'Since there's no 'Return' from a translation unit :(
	Case "y"
		CAT(iDelRec,1) = ""
		For i = iDelRec to RecNum - 1
			CAT(i,1) = CAT(i+1,1)
		Next
		RecNum -= 1
		' Break off record numbers
		For i = 1 to RecNum
			sortDelim = Instr(CAT(i,1),";")
			CAT(i,1) = Mid$(CAT(i,1),1,sortDelim-1)
		Next
		' Add the record numbers back
		For i = 1 to RecNum
			CAT(i,1) = CAT(i,1)&";"&Str$(i)
		Next
		#include "./units/strDiv.bas"   'Outputs TIT(),AUT(),SUBJ(),NTS()
		Print "Record deleted.  Press any key to continue. ";
		Sleep
		Cls
End Select
' -----------------------------------------------------------------------------
