' -----------------------------------------------------------------------------
' Title: fileUpdate.bas - translation unit for LibMasterFBC.bas
' Version: 0.1 - May 2017
' Author: Robert Lock - beannachtai@homtail.com
' License: GPL v3
' About: Outputs CAT(),RecNUM
' -----------------------------------------------------------------------------
' ==== Unit title and Input ====
Cls
Print "LibMasterFBC-0.1  -  Data Entry Mode"
Print "------------------------------------"
Print
' Input number of records
Input "How many records to enter?: ",sHowMuch
iHowMuch = Val(sHowMuch)
If iHowMuch = -1 Then
	Cls
	Goto Menu: 'Since there's no 'Return' from a translation unit :(
End If
While sHowMuch = "" or iHowMuch < 1
	Print "Enter a positive integer. "
	Input "How many records to enter?: ",sHowMuch
	iHowMuch = Val(sHowMuch)
	If iHowMuch = -1 Then
		Cls
		Goto Menu: 'Since there's no 'Return' from a translation unit :(
	End If
Wend
' Start inputting data
For i = RecNum + 1 to RecNum + iHowMuch
	Print Str$(i-RecNum)&":[Rec: "&Str$(i)&"]"
	' Enter title
	Input "Enter a title(110 char):  ",TITtmp
	TITtmp = Trim$(TITtmp)
	While TITtmp = ""
		Input "Enter a title(110 char):  ",TITtmp
		TITtmp = Trim$(TITtmp)
	Wend
	' Check if the title is there already
	For k = 1 to RecNum
		If Instr(Lcase$(TIT(k,1)),Lcase$(TITtmp)) = 1 Then
			Print "Title already entered!!  Press any key to return to menu. ";
			Sleep
			Cls
			Goto Menu:
		End If
	Next
	TIT(i,1) = TITtmp
	' Enter Authors
	For k = 1 to 3
		Input "Enter Author(Singly, up to 3,(20 char)): ",AUT(i,k)
		AUT(i,k) = Trim$(AUT(i,k))
		If AUT(i,k) = "" Then
			AUT(i,k) = " "
		End If
	Next
	Input "Enter a subject:   ",SUBJ(i,1)
	SUBJ(i,1) = Ucase$(Trim$(SUBJ(i,1)))
	If SUBJ(i,1) = "" Then
		SUBJ(i,1) = "NOSUB"
	End If
	Input "Enter notes:    ",NTS(i,1)
	NTS(i,1) = Trim$(NTS(i,1))
	If NTS(i,1) = "" Then
		NTS(i,1) = " "
	End If
	Print
Next

' Update RecNum
RecNum = RecNum + iHowMuch
' Update CAT()
#include "./units/strCat.bas"

' Finished updating
Print "Catalog updated. Press any key to save. ";
Sleep
Print : Print
While Inkey$ <> "": Wend ' Flush the buffer
' ==============================

' Input file name
Input "Enter a file name (type <DEF> for default file name): ",fileName
While fileName = ""
	Input "Enter a file name (type <DEF> for default file name): ",fileName
Wend
' Then check to see if we want the default
If Lcase$(fileName) = "<def>" Then
	fileName = "catalog.dat"
End If

' ==== Append File ====
fileHandle = FreeFile() ' grab a free filehandle number

Open fileName For Append As #fileHandle
For i = RecNum - iHowMuch + 1 to RecNum
	Print #fileHandle, CAT(i,1)
Next
    Close #fileHandle
	Print "File saved successfully.  Press any key to continue. ";
	Sleep
	Cls
' =====================
' -----------------------------------------------------------------------------
