' -----------------------------------------------------------------------------
' Title: m2ft.bas - translation unit for fgConvertFBC.bas
' Version: 0.1 - May 2017
' Author: Robert Lock - beannachtai@homtail.com
' License: GPL v3
' About: Convert feet to meters
' -----------------------------------------------------------------------------
Print : Print
Input "Enter the altitude in meters: ",sDist
dDistE = Val(sDist)
While dDistE < 0 or Len(sDist) = 0
	Print "Out of range: enter a postive distance."
	Input "Enter the altitude in meters: ",sDist
	dDistE = Val(sDist)
Wend
dDistC = dDistE * mTft
Print
Print Using "#####.## meters is #####.## feet. ";dDistE;dDistC;
While Inkey$ <> "": Wend ' Flush the buffer
Sleep
Cls
' -----------------------------------------------------------------------------
