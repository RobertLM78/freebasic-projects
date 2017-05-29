' -----------------------------------------------------------------------------
' Title: fileSave.bas - translation unit for Lin-Regressor.bas
' Version: 0.1 - June 2017
' Author: Robert Lock - beannachtai@homtail.com
' License: GPL v3
' About: No Outputs
' -----------------------------------------------------------------------------
' ==== Unit title and Input ====
Cls
Color RGB(255,255,0),RGB(0,0,128)
Line (0,8)-(640,8)
Color RGB(255,255,255),RGB(0,0,128)
Locate 2,25 : Print "Lin-Regressor 0.1 - Save Points"
Color RGB(255,255,0),RGB(0,0,128)
Locate 3,25 : Print "-------------------------------"
Color RGB(255,255,255),RGB(0,0,128)

Color RGB(255,255,0),RGB(0,0,128)
Line (0,904)-(640,904)
Locate 58,34 : Print Date$
Locate 59,35 : Print Time
Color RGB(255,255,255),RGB(0,0,128)

' Input file name
Locate 5,3 : Input "Enter a file name (type <DEF> for default file name): ",fileName
While fileName = ""
	Locate 5,3 : Input "Enter a file name (type <DEF> for default file name): ",fileName
Wend
' Then check to see if we want the default or to go back to main menu
If Lcase$(fileName) = "<def>" Then
	fileName = "points.dat"
ElseIf	Lcase$(fileName) = "<back>" Then
	Cls
	Goto SubMenu:
End If
' ==============================

' ==== Save File ====
fileHandle = FreeFile() ' grab a free filehandle number
Open fileName For Output As #fileHandle
For i = 1 to NumDataPts
	Print #fileHandle, sXYarray(i,1)
Next
Close #fileHandle
Locate 6,6 : Print "File saved successfully.  Press any key to continue. ";
Sleep
Cls
' ===================
' -----------------------------------------------------------------------------
