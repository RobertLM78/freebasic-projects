' -----------------------------------------------------------------------------
' Title: fileSave.bas - translation unit for LibMasterFBG.bas
' Version: 0.1 - May 2017
' Author: Robert Lock - beannachtai@homtail.com
' License: GPL v3
' About: No Outputs
' -----------------------------------------------------------------------------
' ==== Unit title and Input ====
Cls
Color RGB(0, 255, 255), RGB(0, 0, 0) 'Cyan on Black
Print "LibMasterFBG-0.1  -  Save File"
Print "------------------------------"
Color RGB(255, 255, 255), RGB(0, 0, 0) 'White on Black
Print
' Input file name
Input "Enter a file name (type <DEF> for default file name): ",fileName
While fileName = ""
	Input "Enter a file name (type <DEF> for default file name): ",fileName
Wend
' Then check to see if we want the default or to go back to main menu
If Lcase$(fileName) = "<def>" Then
	fileName = "catalog.dat"
ElseIf	Lcase$(fileName) = "<back>" Then
	Cls
	Goto Menu: 'Since there's no 'Return' from a translation unit :(
End If
' ==============================

' ==== Save File ====
fileHandle = FreeFile() ' grab a free filehandle number

Open fileName For Output As #fileHandle
For i = 1 to RecNum
	Print #fileHandle, CAT(i,1)
Next
    Close #fileHandle
	Print "File saved successfully.  Press any key to continue. ";
	Sleep
	Cls
' ===================
' -----------------------------------------------------------------------------
