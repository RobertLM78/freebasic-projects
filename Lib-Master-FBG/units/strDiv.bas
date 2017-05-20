' -----------------------------------------------------------------------------
' Title: strDiv.bas - translation unit for LibMasterFBG.bas
' Version: 0.1 - May 2017
' Author: Robert Lock - beannachtai@homtail.com
' License: GPL v3
' About: Outputs TIT(),AUT(),SUBJ(), NTS()
' -----------------------------------------------------------------------------
For i = 1 To RecNum
	' Look for first delimeter
	For k = 1 to 110 ' 110 = Max. Length of TIT()
	If Mid$(CAT(i,1),k,1) = ":" Then
		Delim(1,1) = k
		'Print Delim(1,1); ' DEBUG
		Exit For
	End If
	Next
	' Look for second delimeter
	For k = (Delim(1,1) + 1) to Delim(1,1) + 20 ' 20 = Max. Length of AUT()
	If Mid$(CAT(i,1),k,1) = ":" Then
		Delim(1,2) = k
		'Print Delim(1,2); ' DEBUG
		Exit For
	End If
	Next
	' Look for third delimeter
	For k = (Delim(1,2) + 1) to Delim(1,2) + 20
	If Mid$(CAT(i,1),k,1) = ":" Then
		Delim(1,3) = k
		'Print Delim(1,3); ' DEBUG
		Exit For
	End If
	Next
	' Look for fourth delimeter
	For k = (Delim(1,3) + 1) to Delim(1,3) + 20
	If Mid$(CAT(i,1),k,1) = ":" Then
		Delim(1,4) = k
		'Print Delim(1,4); ' DEBUG
		Exit For
	End If
	Next
	' Look for fifth delimeter
	For k = (Delim(1,4) + 1) to Delim(1,4) + 5
	If Mid$(CAT(i,1),k,1) = ":" Then
		Delim(1,5) = k
		'Print Delim(1,5); ' DEBUG
		Exit For
	End If
	Next
	' Look for sixth delimeter
	For k = (Delim(1,5) + 1) to Delim(1,5) + 30
	If Mid$(CAT(i,1),k,1) = ":" Then
		Delim(1,6) = k
		'Print Delim(1,6); ' DEBUG
		Exit For
	End If
	Next
	'Print ' DEBUG
	' Assign the strings to arrays
	TIT(i,1) = Mid$(CAT(i,1),1,Delim(1,1)-1)
	'Print TIT(i,1) ' DEBUG
	AUT(i,1) = Mid$(CAT(i,1),Delim(1,1)+1,Delim(1,2)-Delim(1,1)-1)
	'Print AUT(i,1) ' DEBUG
	AUT(i,2) = Mid$(CAT(i,1),Delim(1,2)+1,Delim(1,3)-Delim(1,2)-1)
	'Print AUT(i,2) ' DEBUG
	AUT(i,3) = Mid$(CAT(i,1),Delim(1,3)+1,Delim(1,4)-Delim(1,3)-1)
	'Print AUT(i,3) ' DEBUG
	SUBJ(i,1) = Mid$(CAT(i,1),Delim(1,4)+1,Delim(1,5)-Delim(1,4)-1)
	'Print SUBJ(i,1) ' DEBUG
	NTS(i,1) = Mid$(CAT(i,1),Delim(1,5)+1,Delim(1,6)-Delim(1,5)-1)
	'Print NTS(i,1) ' DEBUG
Next
' -----------------------------------------------------------------------------
