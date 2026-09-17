' -----------------------------------------------------------------------------
' Title: fileLoad.bas - translation unit for Lin-Regressor.bas
' Version: 0.2 - Sept 2026
' Author: Robert Lock - beannachtai@homtail.com
' License: GPL v3
' About: Outputs sXYarray(), NumDataPts
' -----------------------------------------------------------------------------
' ==== Unit title and Input ====
Cls
Color RGB(255,255,0),RGB(0,0,128)
Line (0,8)-(640,8)
Color RGB(255,255,255),RGB(0,0,128)
Locate 2,25 : Print sLinRegressorT_ &" - Load Points"
Color RGB(255,255,0),RGB(0,0,128)
Locate 3,25 : Print "-------------------------------"
Color RGB(255,255,255),RGB(0,0,128)

' Display the file name once one is loaded.
Color RGB(255,255,0),RGB(0,0,128)
Line (0,844)-(640,844)
Color RGB(255,255,255),RGB(0,0,128)
If fileName = "" Then
    Locate 55,25 : Print "  Current File:  No File loaded"
Else
    Locate 55,25 : Print "  Current File: " &fileName
End If

Color RGB(255,255,0),RGB(0,0,128)
Line (0,904)-(640,904)
Locate 58,34 : Print Date$
Locate 59,35 : Print Time
Color RGB(255,255,255),RGB(0,0,128)

If fileName <> "" Then
    tfileName = fileName
End If
' Input file name
Locate 6,6 : Print "Type <BACK> to return to the Load/Save menu."
Locate 5,3 : Input "Enter a file name (type <DEF> for default file name): ",fileName
While fileName = ""
	Locate 5,3 : Input "Enter a file name (type <DEF> for default file name): ",fileName
Wend
' Then check to see if we want the default or to go back to main menu
If Lcase$(fileName) = "<def>" Then
	fileName = "points.dat"
ElseIf	Lcase$(fileName) = "<back>" Then
    fileName = tfileName : tfileName = ""
	Cls
	Goto SubMenu:
End If
' ==============================

' ==== Load File ====
bCheckCalc = 0 ' Reset calculated state
NumDataPts = 0 ' Initialize record numbers
fileHandle = FreeFile() ' grab a free filehandle number

' Now check to see if the file exists
If Dir(fileName) = "" Then ' DNE
    Locate 6,6 : Print "File Not Found!  Press any key to return to the menu. ";
	Sleep
	Cls
Else ' DE - load sXYarray array and set NumDataPts
	Open fileName For Input As #fileHandle
	While Eof(fileHandle) = 0
		NumDataPts += 1
		Line Input #fileHandle, sXYarray(NumDataPts,1)
	Wend
    Close #fileHandle
	Locate 6,6 : Print "File loaded successfully.  Press any key to continue. ";
    ' Display the file name once one is loaded.
    Locate 55,41 : Print "                                        "
    Locate 55,25 : Print "  Current File: " &fileName
	For i = 1 to NumDataPts
		sXYarray(i,1) = sXYarray(i,1)&" "
	Next
	'Locate 7,6 : Print sXYarray(1,1)&"-:" 'DEBUG
	Sleep
	Cls
End If
' ===================
' -----------------------------------------------------------------------------
