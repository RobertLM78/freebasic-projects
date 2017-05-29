' -----------------------------------------------------------------------------
' Title: km2mi.bas - translation unit for fgConvertFBC.bas
' Version: 0.1 - May 2017
' Author: Robert Lock - beannachtai@homtail.com
' License: GPL v3
' About: Convert kilometers to miles
' -----------------------------------------------------------------------------
Print : Print
Input "Enter the distance in kilometers: ",sDist
dDistE = Val(sDist)
While dDistE < 0 or Len(sDist) = 0
	Print "Out of range: enter a postive distance."
	Input "Enter the distance in kilometers: ",sDist
	dDistE = Val(sDist)
Wend
dDistC = dDistE * kmTmi
Print
Print Using "#####.## kilometers is #####.## miles. ";dDistE;dDistC;
While Inkey$ <> "": Wend ' Flush the buffer
Sleep
Cls
' -----------------------------------------------------------------------------
