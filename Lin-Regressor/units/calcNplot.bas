' -----------------------------------------------------------------------------
' Title:calcNplot.bas - translation unit for Lin-Regressor.bas
' Version: 0.1 - June 2017
' Author: Robert Lock - beannachtai@homtail.com
' License: GPL v3
' About: Calculate the regression and plot
' -----------------------------------------------------------------------------
' ==== Unit title and Input ====
Cls
Color RGB(255,255,0),RGB(0,0,128)
Line (0,8)-(640,8)
Color RGB(255,255,255),RGB(0,0,128)
Locate 2,22 : Print "Lin-Regressor 0.1 - Calculate and plot"
Color RGB(255,255,0),RGB(0,0,128)
Locate 3,22 : Print "--------------------------------------"
Color RGB(255,255,255),RGB(0,0,128)

Color RGB(255,255,0),RGB(0,0,128)
Line (0,904)-(640,904)
Locate 58,34 : Print Date$
Locate 59,35 : Print Time
Color RGB(255,255,255),RGB(0,0,128)
' ==============================
' Check to see if the line is already calculated, calculate it if not
If bCheckCalc = 0 Then
	' Mean
	dSumX = 0
	dSumY = 0
	For i = 1 to NumDataPts
		dSumX = dSumX + dXarray(i,1)
		dSumY = dSumY + dYarray(i,1)
	Next
	dMeanX = dSumX/NumDataPts
	dMeanY = dSumY/NumDataPts
	' Standard deviation
	dSX=0
	dSY=0
	For i = 1 to NumDataPts
		dSX = dSX + (dXarray(i,1)-dMeanX)^2
		dSY = dSY + (dYarray(i,1)-dMeanY)^2
	Next
	dStdX=(1/(NumDataPts-1)*dSX)^0.5
	dStdY=(1/(NumDataPts-1)*dSY)^0.5
	' Correlation
	dCorr = 0
	For i = 1 to NumDataPts
		dCorr = dCorr + ((dXarray(i,1) - dMeanX)/dStdX * (dYarray(i,1) - dMeanY)/dStdY)
	Next
	dCorr = dCorr/(NumDataPts-1)
	' Define the line
	dSlope = dCorr * dStdY/dStdX
	dIntercept = dMeanY - dSlope*dMeanX
	If dIntercept < 0 Then
		zSign = "-"
	ElseIf dIntercept >= 0 Then
		zSign = "+"
	End If
	dInterceptABS = Abs(dIntercept)
	' Set the calculated state
	bCheckCalc = 1
End If

' ======= Plot the graph =======
' Define the min and max values
' X
dMinX = dXarray(1,1)
If dMinX >= 0 Then
	dMinX = -2
End If
dMaxX = dXarray(NumDataPts,1) + .1*dXarray(NumDataPts,1)

' Y
If dSlope < 0 Then
	dMinY = dSlope * dMaxX + dIntercept
	dMinY = dMinY - .1*dMinY
	If dMinY > 0 Then
		dMinY = -2
	End If
	dMaxY = dSlope * dMinX + dIntercept
	dMaxY = dMaxY + .1*dMaxY
End If
If dSlope > 0 Then
	dMinY = dSlope * dMinX + dIntercept
	dMinY = dMinY - .1*dMinY
	If dMinY > 0 Then
		dMinY = -2
	End If
	dMaxY = dSlope * dMaxX + dIntercept
	dMaxY = dMaxY + .1*dMaxY
End If
'' define clipping area starting at row 5, ending at row 40
View (10, 64) - (630, 624),RGB(0,0,0),RGB(0,255,255)

'' set view coordinates
Window (dMinX,dMinY) - (dMaxX,dMaxY)

'' Draw X axis
Color RGB(255,0,0),RGB(0,0,0)
Line (dMinX,0)-(dMaxX,0)
Color RGB(255,255,255),RGB(0,0,0)
'Draw String ( 0.8, -0.1 ), "X"

'' Draw Y axis
Color RGB(255,0,0),RGB(0,0,0)
Line (0,dMinY)-(0,dMaxY)
Color RGB(255,255,255),RGB(0,0,0)
'Draw String ( 0.1, 0.8 ), "Y"

'' compute step size
dStep = 2 / PMap( 1, 0 )
'' plot the function
For dX = dMinX To dMaxX Step dStep
	dY = dSlope * dX + dIntercept
	PSet(dX, dY ),RGB(255,255,255)
Next
For i = 1 to NumDataPts
	'Pset(dXarray(i,1), dYarray(i,1)),RGB(255,255,0)
	Circle(dXarray(i,1), dYarray(i,1)),3*dStep,RGB(255,255,0), , , ,f
Next

'' revert to screen coordinates
Window
'' remove the clipping area
View Screen
' ==============================

If Lcase$(fileName) = "<back>" Then
	fileName = ""
End If

' Show the results
Color RGB(255,255,255),RGB(0,0,128)
Locate 41,32 : Print "File: " &fileName
Locate 43,5 : Print "Correlation: ";dCorr
Locate 44,5 : Print "Std Dev X:   ";dStdX
Locate 45,5 : Print "Std Dev Y:   ";dStdY
Locate 46,5 : Print "Mean X:      ";dMeanX
Locate 47,5 : Print "Mean Y:      ";dMeanY
Locate 49,5 : Print "The regressed line is:"
Locate 50,5 : Print "Y = " &Str$(dSlope) &" * X " &zSign &" " &Str$(dInterceptABS)
Locate 52,5 : Print "Min X = ";dMinX
Locate 52,45 : Print "Min Y = ";dMinY
Locate 53,5 : Print "Max X = ";dMaxX
Locate 53,45 : Print "Max Y = ";dMaxY
Locate 54,5 : Print "Step Size = ";dStep
Locate 56,20 : Print "(S)ave ouput or press any key to continue. ";
iGkey = GetKey
If iGkey = 83 Then
	iGkey = 115
End If
If iGkey = 115 Then
	For k = 43 to 56
		Locate k,1 : Print Blnk
	Next
	Locate 43,3 : Print "The output file is Output_" &fileName
	fileNameOutput = "Output_" &fileName
	fileHandle = FreeFile() ' grab a free filehandle number
	Open  fileNameOutput For Output As #fileHandle
	Print #fileHandle, "File: " &fileName
	Print #fileHandle,
	Print #fileHandle, "Correlation: ";dCorr
	Print #fileHandle, "Std Dev X:   ";dStdX
	Print #fileHandle, "Std Dev Y:   ";dStdY
	Print #fileHandle, "Mean X:      ";dMeanX
	Print #fileHandle, "Mean Y:      ";dMeanY
	Print #fileHandle,
	Print #fileHandle, "The regressed line is:"
	Print #fileHandle, "Y = " &Str$(dSlope) &" * X " &zSign &" " &Str$(dInterceptABS)
	Close #fileHandle
	Locate 44,6 : Print "File saved successfully.  Press any key to continue. ";
	Sleep
	For k = 43 to 44
		Locate k,1 : Print Blnk
	Next
	Locate 43,5 : Print "Correlation: ";dCorr
	Locate 44,5 : Print "Std Dev X:   ";dStdX
	Locate 45,5 : Print "Std Dev Y:   ";dStdY
	Locate 46,5 : Print "Mean X:      ";dMeanX
	Locate 47,5 : Print "Mean Y:      ";dMeanY
	Locate 49,5 : Print "The regressed line is:"
	Locate 50,5 : Print "Y = " &Str$(dSlope) &" * X " &zSign &" " &Str$(dInterceptABS)
	Locate 52,5 : Print "Min X = ";dMinX
	Locate 52,45 : Print "Min Y = ";dMinY
	Locate 53,5 : Print "Max X = ";dMaxX
	Locate 53,45 : Print "Max Y = ";dMaxY
	Locate 54,5 : Print "Step Size = ";dStep
	Locate 56,25 : Print "Press any key to continue. ";
	Sleep
	Cls
End If
Cls
' -----------------------------------------------------------------------------
