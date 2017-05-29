' -----------------------------------------------------------------------------
' Title: dec2dms.bas - translation unit for fgConvertFBC.bas
' Version: 0.1 - May 2017
' Author: Robert Lock - beannachtai@homtail.com
' License: GPL v3
' About: Calculate decimal angle to DMS value
' -----------------------------------------------------------------------------
Print : Print
Input "Angle in decimal degrees (0-180⁰): ",sDcmlAng
dDcmlAng = Val(sDcmlAng)
While dDcmlAng < 1 or dDcmlAng > 180 or Len(sDcmlAng) = 0
	Print "Out of range: 0 and 180 degrees, please."
	Input "Angle in decimal degrees (0-180⁰): ",sDcmlAng
	dDcmlAng = Val(sDcmlAng)
Wend
' Get the whole part of the angle
iDcmlAng = Fix(dDcmlAng)
dAngBal = dDcmlAng - iDcmlAng
' Calculate the minutes
dMinutes = dAngBal * 60
iMinutes = Fix(dMinutes)
' Calculate the seconds
dMinutes = dMinutes - iMinutes
dSeconds = dMinutes * 60
' Print the results
Print
Print Using "###.#####⁰ decimal is ###⁰ ##' ##.#####"" DMS. ";dDcmlAng; iDcmlAng; iMinutes; dSeconds;
While Inkey$ <> "": Wend ' Flush the buffer
Sleep
Cls
' -----------------------------------------------------------------------------
