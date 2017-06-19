' -----------------------------------------------------------------------------
' Title: fileLoad.bas - translation unit for LibMasterFBG.bas
' Version: 0.2 - June 2017
' Author: Robert Lock - beannachtai@homtail.com
' License: GPL v3
' About: Outputs zpCAT[ ], wRecNum
' -----------------------------------------------------------------------------
' ==== Unit title and Input ====
Cls
Color rgbCyan, rgbBlack 'Cyan on Black
Print "LibMasterFBG-0.2  -  Load File"
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
	Goto Menu:
End If
' ==============================

' ==== Load File ====
wFileHandle = FreeFile() ' grab a free filehandle number

' Error and existence check
If Open(sFileName For Input As #wFileHandle) <> 0 Then ' DNE
    Print "File Not Found!  Press any key to return to the menu. ";
	Sleep
	Cls
Else ' DE - set wRecNum and load file into memory
	' First determine how many records there are
	wRecNum = 0 ' Initialize record numbers
	While Eof(wFileHandle) = 0
		wRecNum += 1
		Line Input #wFileHandle, zCAT
	Wend
	zCAT = ""
	Close #wFileHandle

	' Next reallocate memory
	wRecNumMem = wRecNum
	#include "./units/allocate.bas"

	' Then load data to memory
	Open sFileName For Input As #wFileHandle
	wRecNum = 0 ' Reset record numbers
	While Eof(wFileHandle) = 0
		wRecNum += 1
		Line Input #wFileHandle, zpCAT[(wRecNum-1)*bCATmax]
	Wend
    Close #wFileHandle
	Print "File loaded successfully.  Press any key to continue. ";
	Sleep
	Cls
End If
' ===================
' -----------------------------------------------------------------------------
