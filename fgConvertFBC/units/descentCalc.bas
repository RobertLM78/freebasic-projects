' -----------------------------------------------------------------------------
' Title: descentCalc.bas - translation unit for fgConvertFBC.bas
' Version: 0.1 - May 2017
' Author: Robert Lock - beannachtai@homtail.com
' License: GPL v3
' About: Calculate the descent distance
' -----------------------------------------------------------------------------
Print : Print
Input "Descent Angle (3-15⁰): ",sDcmlAng
dDcmlAng = Val(sDcmlAng)
While dDcmlAng < 3 or dDcmlAng > 15 or Len(sDcmlAng) = 0
	Print "Out of range: 3 and 15 degrees."
	Input "Descent Angle (3-15⁰): ",sDcmlAng
	dDcmlAng = Val(sDcmlAng)
Wend
Input "Altitude (in feet): ",sAltitude
dAltitude = Val(sAltitude)
While dAltitude < 0 or dAltitude > 50000 or Len(sAltitude) = 0
	Print "Out of range: Between 0 and 50000 feet."
	Input "Altitude (in feet): ",sAltitude
	dAltitude = Val(sAltitude)
Wend
Input "Elevation (in feet): ",sElevation
dElevation = Val(sElevation)
While dElevation < 0 or dElevation > 50000 or Len(sElevation) = 0
	Print "Out of range: Between 0 and 50000 feet."
	Input "Elevation (in feet): ",sElevation
	dElevation = Val(sElevation)
Wend
While dElevation > dAltitude
	Print : Print
	Print "Elevation greater than altitude."
	Input "Descent Angle (3-15⁰): ",sDcmlAng
	dDcmlAng = Val(sDcmlAng)
	While dDcmlAng < 3 or dDcmlAng > 15 or Len(sDcmlAng) = 0
		Print "Out of range: 3 and 15 degrees."
		Input "Descent Angle (3-15⁰): ",sDcmlAng
		dDcmlAng = Val(sDcmlAng)
	Wend
	Input "Altitude (in feet): ",sAltitude
	dAltitude = Val(sAltitude)
	While dAltitude < 0 or dAltitude > 50000 or Len(sAltitude) = 0
		Print "Out of range: Between 0 and 50000 feet."
		Input "Altitude (in feet): ",sAltitude
		dAltitude = Val(sAltitude)
	Wend
	Input "Elevation (in feet): ",sElevation
	dElevation = Val(sElevation)
	While dElevation < 0 or dElevation > 50000 or Len(sElevation) = 0
		Print "Out of range: Between 0 and 50000 feet."
		Input "Elevation (in feet): ",sElevation
		dElevation = Val(sElevation)
	Wend
Wend
dDistC = (dAltitude - dElevation)/tan(Pi/180*dDcmlAng)*1/5280
Print Using "The descent should begin ###.# miles (###.# km) away from the destination. "; dDistC; miTkm*dDistC;
While Inkey$ <> "": Wend ' Flush the buffer
Sleep
Cls
' -----------------------------------------------------------------------------
