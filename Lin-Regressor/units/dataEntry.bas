' -----------------------------------------------------------------------------
' Title: dataEntry.bas - translation unit for Lin-Regressor.bas
' Version: 0.1 - June 2017
' Author: Robert Lock - beannachtai@homtail.com
' License: GPL v3
' About: Outputs sXYarray(),NumDataPts
' -----------------------------------------------------------------------------
' ==== Unit title and Input ====
Cls
Color RGB(255,255,0),RGB(0,0,128)
Line (0,8)-(640,8)
Color RGB(255,255,255),RGB(0,0,128)
Locate 2,24 : Print "Lin-Regressor 0.1 - Enter Points"
Color RGB(255,255,0),RGB(0,0,128)
Locate 3,24 : Print "--------------------------------"
Color RGB(255,255,255),RGB(0,0,128)

Color RGB(255,255,0),RGB(0,0,128)
Line (0,904)-(640,904)
Locate 58,34 : Print Date$
Locate 59,35 : Print Time
Color RGB(255,255,255),RGB(0,0,128)

' Input number of points
Locate 5,3 : Input "How many points to enter?: ",sHowMuch
iHowMuch = Int(Val(sHowMuch))
If iHowMuch = -1 Then
	Cls
	Goto Menu:
End If
While iHowMuch < 1 or iHowMuch > 5000 or sHowMuch = ""
	Locate 5,1 : Print Blnk
	Locate 5,3 : Input "How many points to enter?: ",sHowMuch
	Locate 6,3 : Print "Enter a positive integer (no more than 5000). "
	iHowMuch = Int(Val(sHowMuch))
	If iHowMuch = -1 Then
		Cls
		Goto Menu: 'Since there's no 'Return' from a translation unit :(
	End If
Wend
Locate 6,1 : Print Blnk
' Start inputting data
For i = NumDataPts + 1 to NumDataPts + iHowMuch
	Color RGB(255,255,0),RGB(0,0,128)
	Locate 7,1 : Print Str$(i-NumDataPts)&":[Set: "&Str$(i)&"]"
	Color RGB(255,255,255),RGB(0,0,128)
	' Enter title
	Locate 8,6 : Input "X: ",dXarray(i,1)
	Locate 10,6 : Input "Y: ",dYarray(i,1)
	'Locate 13,15 : Print "Press any key to continue. ";
	'Sleep
	For k = 8 to 13
		Locate k,1 : Print Blnk
	Next
Next

' Update NumDataPts
NumDataPts = NumDataPts + iHowMuch
' Update sXYarray()
#include "./units/strCat.bas"
' Reset calculated state
bCheckCalc = 0

' Finished updating
Locate 8,15 : Print "Finished entering data. Press any key to save. ";
Sleep
While Inkey$ <> "": Wend ' Flush the buffer
' ==============================

' Input file name
Locate 10,3 : Input "Enter a file name (type <DEF> for default file name): ",fileName
While fileName = ""
	Locate 10,3 : Input "Enter a file name (type <DEF> for default file name): ",fileName
Wend
' Then check to see if we want the default
If Lcase$(fileName) = "<def>" Then
	fileName = "points.dat"
ElseIf	Lcase$(fileName) = "<back>" Then
	Cls
	Goto Menu:
End If

' ==== Append File ====
fileHandle = FreeFile() ' grab a free filehandle number

Open fileName For Append As #fileHandle
For i = NumDataPts - iHowMuch + 1 to NumDataPts
	Print #fileHandle, sXYarray(i,1)
Next
    Close #fileHandle
	Locate 11,6 : Print "File saved successfully.  Press any key to continue. ";
	Sleep
	Cls
' =====================
' -----------------------------------------------------------------------------
