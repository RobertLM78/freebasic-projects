' -----------------------------------------------------------------------------
' Title: ft2m.bas - translation unit for fgConvertFBC.bas
' Version: 0.1 - May 2017
' Author: Robert Lock - beannachtai@homtail.com
' License: GPL v3
' About: Convert meters to feet
' -----------------------------------------------------------------------------
Print : Print
Input "Enter the altitude in feet: ",sDist
dDistE = Val(sDist)
While dDistE < 0 or Len(sDist) = 0
	Print "Out of range: enter a postive distance."
	Input "Enter the altitude in feet: ",sDist
	dDistE = Val(sDist)
Wend
dDistC = dDistE * ftTm
Print
Print Using "#####.## feet is #####.## meters. ";dDistE;dDistC;
While Inkey$ <> "": Wend ' Flush the buffer
Sleep
Cls
' -----------------------------------------------------------------------------
