' -----------------------------------------------------------------------------
' Title: strCat.bas - translation unit for LibMasterFBG.bas
' Version: 0.1 - May 2017
' Author: Robert Lock - beannachtai@homtail.com
' License: GPL v3
' About: Outputs CAT()
' -----------------------------------------------------------------------------
For i = 1 to RecNum
	CAT(i,1) = TIT(i,1)&":"&AUT(i,1)&":"&AUT(i,2)&":"&AUT(i,3)&":"&SUBJ(i,1)&":"&NTS(i,1)&":;"&Str$(i)
Next
' -----------------------------------------------------------------------------
