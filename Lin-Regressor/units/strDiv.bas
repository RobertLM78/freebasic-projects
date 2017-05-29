' -----------------------------------------------------------------------------
' Title: strDiv.bas - translation unit for Lin-Regressor.bas
' Version: 0.1 - June 2017
' Author: Robert Lock - beannachtai@homtail.com
' License: GPL v3
' About: Outputs dXarray(),dYarray()
' -----------------------------------------------------------------------------
For i = 1 To NumDataPts
	' Look for first space
	For k = 1 to 40 ' 40=1/2*80
	If Mid$(sXYarray(i,1),k,1) = " " Then
		Delim(1,1) = k
		'Print Delim(1,1); ' DEBUG
		Exit For
	End If
	Next
	' Look for second space
	For k = (Delim(1,1) + 1) to Delim(1,1) + 40 ' 40=1/2*80
	If Mid$(sXYarray(i,1),k,1) = " " Then
		Delim(1,2) = k
		'Print Delim(1,2); ' DEBUG
		Exit For
	End If
	Next
	' Keep looking for spaces
	For k = (Delim(1,2) + 1) to Delim(1,2) + 40 ' 40=1/2*80
	If Mid$(sXYarray(i,1),k,1) <> " " Then
		Delim(1,3) = k
		'Print Delim(1,3); ' DEBUG
		Exit For
	End If
	Next
	' Look for last space
	For k = (Delim(1,3) + 1) to Delim(1,3) + 40 ' 40=1/2*80
	If Mid$(sXYarray(i,1),k,1) = " " Then
		Delim(1,4) = k
		'Print Delim(1,4) ' DEBUG
		Exit For
	End If
	Next
	'Print ' DEBUG
	' Assign the strings to arrays
	dXarray(i,1) = Val(Mid$(sXYarray(i,1),1,Delim(1,2)))
	'Print dXarray(i,1) ' DEBUG
	dYarray(i,1) = Val(Mid$(sXYarray(i,1),Delim(1,3),Delim(1,4)))
	'Print dYarray(i,1) ' DEBUG
Next
' -----------------------------------------------------------------------------
