' -----------------------------------------------------------------------------
' Title: strCat.bas - translation unit for LibMasterFBG.bas
' Version: 0.2 - June 2017
' Author: Robert Lock - beannachtai@homtail.com
' License: GPL v3
' About: Outputs zpCAT[ ]
' -----------------------------------------------------------------------------
For i = 1 to wRecNum
	zpCAT[(i-1)*bCATmax] =_
	zpTIT[(i-1)*bTITmax]&":" _
	&zpAUT0[(i-1)*bAUTmax]&":"&zpAUT1[(i-1)*bAUTmax]&":"&zpAUT2[(i-1)*bAUTmax]&":" _
	&zpSUBJ[(i-1)*bSUBJmax]&":" _
	&zpNTS[(i-1)*bNTSmax]&":;"&Str$(i)
Next
' -----------------------------------------------------------------------------
