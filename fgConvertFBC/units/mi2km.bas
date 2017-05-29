' -----------------------------------------------------------------------------
' Title: mi2km.bas - translation unit for fgConvertFBC.bas
' Version: 0.1 - May 2017
' Author: Robert Lock - beannachtai@homtail.com
' License: GPL v3
' About: Convert miles to kilometers
' -----------------------------------------------------------------------------
Print : Print
Input "Enter the distance in miles: ",sDist
dDistE = Val(sDist)
While dDistE < 0 or Len(sDist) = 0
	Print "Out of range: enter a postive distance."
	Input "Enter the distance in miles: ",sDist
	dDistE = Val(sDist)
Wend
dDistC = dDistE * miTkm
Print
Print Using "#####.## miles is #####.## kilometers. ";dDistE;dDistC;
While Inkey$ <> "": Wend ' Flush the buffer
Sleep
Cls
' -----------------------------------------------------------------------------
