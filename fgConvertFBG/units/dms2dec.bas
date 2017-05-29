' -----------------------------------------------------------------------------
' Title: dms2dec.bas - translation unit for fgConvertFBG.bas
' Version: 0.1 - May 2017
' Author: Robert Lock - beannachtai@homtail.com
' License: GPL v3
' About: Convert DMS to decimal degrees
' -----------------------------------------------------------------------------
Locate 15,3 : Input "Angle degrees (0-180, no decimals): ",sDcmlAng
iDcmlAng = Fix(Val(sDcmlAng))
While iDcmlAng < 0.000001 or iDcmlAng > 180 or Len(sDcmlAng) = 0
	Locate 15,3 : Print "                                            "
	Locate 15,3 : Input "Angle degrees (0-180, no decimals): ",sDcmlAng
	Locate 16,3 : Print "Out of range: 0 and 180 degrees."
	iDcmlAng = Fix(Val(sDcmlAng))
Wend
Locate 16,3 : Print "                                            "
Locate 16,3 : Input "Angle minutes (0-59, no decimals): ",sMinutes
iMinutes = Fix(Val(sMinutes))
While iMinutes < 0.000001 or iMinutes > 59 or Len(sMinutes) = 0
	Locate 16,3 : Print "                                            "
	Locate 16,3 : Input "Angle minutes (0-59, no decimals): ",sMinutes
	Locate 17,3 : Print "Out of range: 0 and 59 minutes."
	iMinutes = Fix(Val(sMinutes))
Wend
Locate 17,3 : Print "                                            "
Locate 17,3 : Input "Angle minutes (0-<60, decimals okay): ",sSeconds
dSeconds = Val(sSeconds)
While dSeconds < 0.000001 or dSeconds >= 60 or Len(sSeconds) = 0
	Locate 17,3 : Print "                                            "
	Locate 17,3 : Input "Angle minutes (0-<60, decimals okay): ",sSeconds
	Locate 18,3 : Print "Out of range: 0 and <60 seconds."
	dSeconds = Val(sSeconds)
Wend
dMinutes = iMinutes/60
dSecondsOld = dSeconds
dSeconds = dSeconds/3600
dDcmlAng = iDcmlAng + dMinutes + dSeconds
Locate 18,2 : Print "                                            "
Locate 18,2
Print Using "###"&Chr$(248)&" ##' ##.#####"" DMS is ###.#####"&Chr$(248)&" decimal. ";iDcmlAng; iMinutes; dSecondsOld; dDcmlAng;
While Inkey$ <> "": Wend ' Flush the buffer
Sleep
Cls
' -----------------------------------------------------------------------------
