' -----------------------------------------------------------------------------
' Title: descentCalc.bas - translation unit for fgConvertFBG.bas
' Version: 0.1 - May 2017
' Author: Robert Lock - beannachtai@homtail.com
' License: GPL v3
' About: Calculate the descent distance
' -----------------------------------------------------------------------------
Locate 15,3 : Input "Descent Angle (3-15): ",sDcmlAng
dDcmlAng = Val(sDcmlAng)
While dDcmlAng < 3 or dDcmlAng > 15 or Len(sDcmlAng) = 0
	Locate 15,3 : Print "                                            "
	Locate 15,3 : Input "Descent Angle (3-15): ",sDcmlAng
	Locate 16,3 : Print "Out of range: 3 and 15 degrees."
	dDcmlAng = Val(sDcmlAng)
Wend
Locate 16,3 : Print "                                            "
Locate 16,3 : Input "Altitude (in feet): ",sAltitude
dAltitude = Val(sAltitude)
While dAltitude < 0.001 or dAltitude > 50000 or Len(sAltitude) = 0
	Locate 16,3 : Print "                                            "
	Locate 16,3 : Input "Altitude (in feet): ",sAltitude
	Locate 17,3 : Print "Out of range: Between 0 and 50000 feet."
	dAltitude = Val(sAltitude)
Wend
Locate 17,3 : Print "                                            "
Locate 17,3 : Input "Elevation (in feet): ",sElevation
dElevation = Val(sElevation)
While dElevation < 0.001 or dElevation > 50000 or Len(sElevation) = 0
	Locate 17,3 : Print "                                            "
	Locate 17,3 : Input "Elevation (in feet): ",sElevation
	Locate 18,3 : Print "Out of range: Between 0 and 50000 feet."
	dElevation = Val(sElevation)
Wend
While dElevation > dAltitude
	Locate 15,3 : Input "Descent Angle (3-15): ",sDcmlAng
	Locate 16,3 : Print "Elevation greater than altitude."
	dDcmlAng = Val(sDcmlAng)
	While dDcmlAng < 3 or dDcmlAng > 15 or Len(sDcmlAng) = 0
		Locate 15,3 : Print "                                            "
		Locate 15,3 : Input "Descent Angle (3-15): ",sDcmlAng
		Locate 16,3 : Print "Out of range: 3 and 15 degrees."
		dDcmlAng = Val(sDcmlAng)
	Wend
	Locate 16,3 : Input "Altitude (in feet): ",sAltitude
	dAltitude = Val(sAltitude)
	While dAltitude < 0.001 or dAltitude > 50000 or Len(sAltitude) = 0
		Locate 16,3 : Print "                                            "
		Locate 16,3 : Input "Altitude (in feet): ",sAltitude
		Locate 17,3 : Print "Out of range: Between 0 and 50000 feet."
		dAltitude = Val(sAltitude)
	Wend
	Locate 17,3 : Input "Elevation (in feet): ",sElevation
	dElevation = Val(sElevation)
	While dElevation < 0.001 or dElevation > 50000 or Len(sElevation) = 0
		Locate 17,3 : Print "                                            "
		Locate 17,3 : Input "Elevation (in feet): ",sElevation
		Locate 18,3 : Print "Out of range: Between 0 and 50000 feet."
		dElevation = Val(sElevation)
	Wend
Wend
dDistC = (dAltitude - dElevation)/tan(Pi/180*dDcmlAng)*1/5280
Locate 18,2 : Print "                                            "
Locate 18,2
Print Using "The descent should begin ###.# mi (###.# km) from destination. "; dDistC; miTkm*dDistC;
While Inkey$ <> "": Wend ' Flush the buffer
Sleep
Cls
' -----------------------------------------------------------------------------
