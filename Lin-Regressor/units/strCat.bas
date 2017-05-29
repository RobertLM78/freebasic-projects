' -----------------------------------------------------------------------------
' Title: strCat.bas - translation unit for Lin-Regressor.bas
' Version: 0.1 - June 2017
' Author: Robert Lock - beannachtai@homtail.com
' License: GPL v3
' About: Outputs sXYarray()
' -----------------------------------------------------------------------------
For i = 1 to NumDataPts
	sXYarray(i,1) = " "&Str$(dXarray(i,1))&" "&Str$(dYarray(i,1))&" "
Next
' -----------------------------------------------------------------------------
