' -----------------------------------------------------------------------------
' Title: dec2dms.bas - translation unit for fgConvertFBG.bas
' Version: 0.1 - May 2017
' Author: Robert Lock - beannachtai@homtail.com
' License: GPL v3
' About: Calculate decimal angle to DMS value
' -----------------------------------------------------------------------------
Locate 15,3 : Input "Angle in decimal degrees (0-180): ",sDcmlAng
dDcmlAng = Val(sDcmlAng)
While dDcmlAng < 0.000001 or dDcmlAng > 180 or Len(sDcmlAng) = 0
	Locate 15,3 : Print "                                            "
	Locate 15,3 : Input "Angle in decimal degrees (0-180): ",sDcmlAng
	Locate 16,3 : Print "Out of range: 0 and 180 degrees."
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
Locate 16,2 : Print "                                            "
Locate 16,2
Print Using "###.#####"&Chr$(248)&" decimal is ###"&Chr$(248)&" ##' ##.#####"" DMS. ";dDcmlAng; iDcmlAng; iMinutes; dSeconds;
While Inkey$ <> "": Wend ' Flush the buffer
Sleep
Cls
' -----------------------------------------------------------------------------
