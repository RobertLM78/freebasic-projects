' -----------------------------------------------------------------------------
' Title: fileSave.bas - translation unit for LibMasterFBG.bas
' Version: 0.2 - June 2017
' Author: Robert Lock - beannachtai@homtail.com
' License: GPL v3
' About: No Outputs
' -----------------------------------------------------------------------------
' ==== Unit title and Input ====
Cls
Color rgbCyan, rgbBlack 'Cyan on Black
Print "LibMasterFBG-0.2  -  Save File"
Print "------------------------------"
Color rgbWhite, rgbBlack 'White on Black
Print
' Input file name
Input "Enter a file name (type <DEF> for default file name): ",sFileName
While sFileName = ""
	Input "Enter a file name (type <DEF> for default file name): ",sFileName
Wend
' Then check to see if we want the default or to go back to main menu
If Lcase$(sFileName) = "<def>" Then
	sFileName = "catalog.dat"
ElseIf	Lcase$(sFileName) = "<back>" Then
	Cls
	Goto Menu: 'Since there's no 'Return' from a translation unit :(
End If
' ==============================

' ==== Save File ====
wFileHandle = FreeFile() ' grab a free filehandle number

Open sFileName For Output As #wFileHandle
For i = 1 to wRecNum
	Print #wFileHandle, zpCAT[(i-1)*bCATmax]
Next
    Close #wFileHandle
	Print "File saved successfully.  Press any key to continue. ";
	Sleep
	Cls
' ===================
' -----------------------------------------------------------------------------
