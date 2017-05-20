' -----------------------------------------------------------------------------
' Title: fileLoad.bas - translation unit for LibMasterFBG.bas
' Version: 0.1 - May 2017
' Author: Robert Lock - beannachtai@homtail.com
' License: GPL v3
' About: Outputs CAT(), RecNum
' -----------------------------------------------------------------------------
' ==== Unit title and Input ====
Cls
Color RGB(0, 255, 255), RGB(0, 0, 0) 'Cyan on Black
Print "LibMasterFBG-0.1  -  Load File"
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

' ==== Load File ====
RecNum = 0 ' Initialize record numbers
fileHandle = FreeFile() ' grab a free filehandle number

' Now check to see if the file exists
If Dir(fileName) = "" Then ' DNE
    Print "File Not Found!  Press any key to return to the menu. ";
	Sleep
	Cls
Else ' DE - load CAT array and set RecNum
	Open fileName For Input As #fileHandle
	Do Until Eof(fileHandle)
		RecNum += 1
		Line Input #fileHandle, CAT(RecNum,1)
	Loop
    Close #fileHandle
	Print "File loaded successfully.  Press any key to continue. ";
	Sleep
	Cls
End If
' ===================
' -----------------------------------------------------------------------------
