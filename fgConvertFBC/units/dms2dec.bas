' -----------------------------------------------------------------------------
' Title: dms2dec.bas - translation unit for fgConvertFBC.bas
' Version: 0.1 - May 2017
' Author: Robert Lock - beannachtai@homtail.com
' License: GPL v3
' About: Convert DMS to decimal degrees
' -----------------------------------------------------------------------------
Print : Print
Input "Angle degrees (0-180⁰, no decimals): ",sDcmlAng
iDcmlAng = Fix(Val(sDcmlAng))
While iDcmlAng < 0 or iDcmlAng > 180 or Len(sDcmlAng) = 0
	Print "Out of range: 0 and 180 degrees, please."
	Input "Angle degrees (0-180⁰, no decimals): ",sDcmlAng
	iDcmlAng = Fix(Val(sDcmlAng))
Wend
Input "Angle minutes (0-59, no decimals): ",sMinutes
iMinutes = Fix(Val(sMinutes))
While iMinutes < 0 or iMinutes > 59 or Len(sMinutes) = 0
	Print "Out of range: 0 and 59 minutes, please."
	Input "Angle minutes (0-59, no decimals): ",sMinutes
	iMinutes = Fix(Val(sMinutes))
Wend
Input "Angle minutes (0-<60, decimals okay): ",sSeconds
dSeconds = Val(sSeconds)
While dSeconds < 0 or dSeconds >= 60 or Len(sSeconds) = 0
	Input "Angle minutes (0-<60, decimals okay): ",sSeconds
	dSeconds = Val(sSeconds)
Wend
dMinutes = iMinutes/60
dSecondsOld = dSeconds
dSeconds = dSeconds/3600
dDcmlAng = iDcmlAng + dMinutes + dSeconds
Print
Print Using "###⁰ ##' ##.#####"" DMS is ###.#####⁰ decimal. ";iDcmlAng; iMinutes; dSecondsOld; dDcmlAng;
While Inkey$ <> "": Wend ' Flush the buffer
Sleep
Cls
' -----------------------------------------------------------------------------
