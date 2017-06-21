' -----------------------------------------------------------------------------
' Title: deleteRec.bas - translation unit for LibMasterFBG.bas
' Version: 0.2 - June 2017
' Author: Robert Lock - beannachtai@homtail.com
' License: GPL v3
' About: Outputs CAT(),RecNUM
' -----------------------------------------------------------------------------
' ==== Unit title and Input ====
Cls
Color rgbCyan, rgbBlack 'Cyan on Black
Print "LibMasterFBG-0.2  -  Delete a Record (no changes written)"
Print "---------------------------------------------------------"
Color rgbWhite, rgbBlack 'White on Black
Print
' Input number of records
Input "Record to Delete?: ",sDelRec
lDelRec = Val(sDelRec)
If lDelRec = -1 Then
	Cls
	Goto Menu:
End If
While sDelRec = "" or lDelRec < 1 or lDelRec > wRecNum
	Print "Enter a positive integer. "
	Input "Record to Delete?: ",sDelRec
	lDelRec = Val(sDelRec)
	If lDelRec = -1 Then
		Cls
		Goto Menu:
	End If
Wend
' ==============================

' Confirm delete
Print
Color rgbCyan, rgbBlack 'Cyan on Black
Print "     Record #"&Str$(lDelRec)&" selected:"
Color rgbWhite, rgbBlack 'White on Black
Print
Print
Print "       "&zpTIT[(lDelRec-1)*bTITmax]
Print "       "&zpAUT0[(lDelRec-1)*bAUTmax]
Print "       "&zpAUT1[(lDelRec-1)*bAUTmax]
Print "       "&zpAUT2[(lDelRec-1)*bAUTmax]
Print
Input "Are you sure?(Y/N): ",sConfirmDel
While sConfirmDel = "" or sConfirmDel <> "y" and sConfirmDel <> "Y" and sConfirmDel <> "n" and sConfirmDel <> "N"
	Input "Are you sure?(Y/N): ",sConfirmDel
Wend
sConfirmDel = Lcase$(sConfirmDel)
Print

Select Case sConfirmDel
	Case "n"
		Print "No record deleted.  Press any key to continue. ";
		Sleep
		Cls
		Goto Menu:
	Case "y"
		zpCAT[(lDelRec-1)*bCATmax] = ""
		For i = lDelRec to wRecNum - 1
			zpCAT[(i-1)*bCATmax] = zpCAT[i*bCATmax]
		Next
		wRecNum -= 1
		' Break off record numbers
		For i = 1 to wRecNum
			iSortDelim = Instr(zpCAT[(i-1)*bCATmax],";")
			zpCAT[(i-1)*bCATmax] = Mid$(zpCAT[(i-1)*bCATmax],1,iSortDelim-1)
		Next
		' Add the record numbers back
		For i = 1 to wRecNum
			zpCAT[(i-1)*bCATmax] = zpCAT[(i-1)*bCATmax]&";"&Str$(i)
		Next
		' Reallocate memory
		wRecNumMem = wRecNum
		If wRecNumMem = 0 Then
			wRecNumMem = 1
		End If
		#include "./units/allocate.bas"
		#include "./units/strDiv.bas"   'Outputs zpTIT[ ],zpAUT# [ ],zpSUBJ[ ],zpNTS[ ]
		Print "Record deleted.  Press any key to continue. ";
		Sleep
		Cls
End Select
' -----------------------------------------------------------------------------
