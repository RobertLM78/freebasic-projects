' -----------------------------------------------------------------------------
' Title: dataDelete.bas - translation unit for LibMasterFBG.bas
' Version: 0.1 - May 2017
' Author: Robert Lock - beannachtai@homtail.com
' License: GPL v3
' About: Outputs sXYarray(),NumDataPts
' -----------------------------------------------------------------------------
' ==== Unit title and Input ====
Cls
Color RGB(255,255,0),RGB(0,0,128)
Line (0,8)-(640,8)
Color RGB(255,255,255),RGB(0,0,128)
Locate 2,24 : Print "Lin-Regressor 0.1 - Delete point"
Color RGB(255,255,0),RGB(0,0,128)
Locate 3,24 : Print "--------------------------------"
Color RGB(255,255,255),RGB(0,0,128)

Color RGB(255,255,0),RGB(0,0,128)
Line (0,904)-(640,904)
Locate 58,34 : Print Date$
Locate 59,35 : Print Time
Color RGB(255,255,255),RGB(0,0,128)

' Input number of records
Locate 5,3 : Input "Point to delete (-1 back to menu, -2 delete all)?: ",sDelPnt
iDelPnt = Val(sDelPnt)
If iDelPnt = -1 Then
	Cls
	Goto Menu:
ElseIf iDelPnt = -2 Then
	sXYarray(1,1) = ""
	NumDataPts = 0
	Cls
	Goto Menu:
End If
While sDelPnt = "" or iDelPnt < -2 or iDelPnt > NumDataPts
	Locate 5,1 : Print Blnk
	Locate 5,3 : Input "Point to delete (-1 back to menu, -2 delete all)?: ",sDelPnt
	Locate 6,3 : Print "Enter a valid point. "
	iDelPnt = Val(sDelPnt)
	If iDelPnt = -1 Then
		Cls
		Goto Menu:
	ElseIf iDelPnt = -2 Then
		sXYarray(1,1) = ""
		NumDataPts = 0
		Cls
		Goto Menu:
	End If
Wend
Locate 6,1 : Print Blnk
' ==============================

' Confirm delete
Color RGB(255,255,0),RGB(0,0,128)
Locate 8,3 : Print "     Point #"&Str$(iDelPnt)&" selected:"
Color RGB(255,255,255),RGB(0,0,128)
Locate 10,3 : Print "X = ";dXarray(iDelPnt,1)
Locate 11,3 : Print "Y = ";dYarray(iDelPnt,1)
Locate 13,3 : Input "Are you sure?(Y/N): ",confirmD
While confirmD = "" or confirmD <> "y" and confirmD <> "Y" and confirmD <> "n" and confirmD <> "N"
	Locate 13,1 : Print Blnk
	Locate 13,3 : Input "Are you sure?(Y/N): ",confirmD
Wend
confirmD = Lcase$(confirmD)

Select Case confirmD
	Case "n"
		Locate 14,6 : Print "No point deleted.  Press any key to continue. ";
		Sleep
		Cls
		Goto Menu:
	Case "y"
		sXYarray(iDelPnt,1) = ""
		For i = iDelPnt to NumDataPts - 1
			sXYarray(i,1) = sXYarray(i+1,1)
		Next
		NumDataPts -= 1 ' Decrease the number of points by 1
		bCheckCalc = 0 ' Reset calculated state
		#include "./units/strDiv.bas"
		Locate 14,6 : Print "Point deleted.  Press any key to continue. ";
		Sleep
		Cls
End Select
' -----------------------------------------------------------------------------
