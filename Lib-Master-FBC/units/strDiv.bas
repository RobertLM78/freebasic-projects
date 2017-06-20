' -----------------------------------------------------------------------------
' Title: strDiv.bas - translation unit for LibMasterFBG.bas
' Version: 0.2 - June 2017
' Author: Robert Lock - beannachtai@homtail.com
' License: GPL v3
' About: Outputs zpTIT[ ],zpAUT# [ ],zpSUBJ[ ],zpNTS[ ]
' -----------------------------------------------------------------------------
For i = 1 To wRecNum
	' Look for first delimeter
	For k = 1 to 110 ' 110 = Max. Length of TIT()
	If Mid$(zpCAT[(i-1)*bCATmax],k,1) = ":" Then
		bDelim(1,1) = k
		'Print bDelim(1,1); ' DEBUG
		Exit For
	End If
	Next
	' Look for second delimeter
	For k = (bDelim(1,1) + 1) to bDelim(1,1) + 20 ' 20 = Max. Length of AUT()
	If Mid$(zpCAT[(i-1)*bCATmax],k,1) = ":" Then
		bDelim(1,2) = k
		'Print bDelim(1,2); ' DEBUG
		Exit For
	End If
	Next
	' Look for third delimeter
	For k = (bDelim(1,2) + 1) to bDelim(1,2) + 20
	If Mid$(zpCAT[(i-1)*bCATmax],k,1) = ":" Then
		bDelim(1,3) = k
		'Print bDelim(1,3); ' DEBUG
		Exit For
	End If
	Next
	' Look for fourth delimeter
	For k = (bDelim(1,3) + 1) to bDelim(1,3) + 20
	If Mid$(zpCAT[(i-1)*bCATmax],k,1) = ":" Then
		bDelim(1,4) = k
		'Print bDelim(1,4); ' DEBUG
		Exit For
	End If
	Next
	' Look for fifth delimeter
	For k = (bDelim(1,4) + 1) to bDelim(1,4) + 5
	If Mid$(zpCAT[(i-1)*bCATmax],k,1) = ":" Then
		bDelim(1,5) = k
		'Print bDelim(1,5); ' DEBUG
		Exit For
	End If
	Next
	' Look for sixth delimeter
	For k = (bDelim(1,5) + 1) to bDelim(1,5) + 30
	If Mid$(zpCAT[(i-1)*bCATmax],k,1) = ":" Then
		bDelim(1,6) = k
		'Print bDelim(1,6); ' DEBUG
		Exit For
	End If
	Next
	'Print ' DEBUG
	' Assign the strings to arrays
	zpTIT[(i-1)*bTITmax] = Mid$(zpCAT[(i-1)*bCATmax],1,bDelim(1,1)-1)
	'Print zpTIT[(i-1)*bTITmax] ' DEBUG
	zpAUT0[(i-1)*bAUTmax] = Mid$(zpCAT[(i-1)*bCATmax],bDelim(1,1)+1,bDelim(1,2)-bDelim(1,1)-1)
	'Print zpAUT0[(i-1)*bAUTmax] ' DEBUG
	zpAUT1[(i-1)*bAUTmax] = Mid$(zpCAT[(i-1)*bCATmax],bDelim(1,2)+1,bDelim(1,3)-bDelim(1,2)-1)
	'Print zpAUT1[(i-1)*bAUTmax] ' DEBUG
	zpAUT2[(i-1)*bAUTmax] = Mid$(zpCAT[(i-1)*bCATmax],bDelim(1,3)+1,bDelim(1,4)-bDelim(1,3)-1)
	'Print zpAUT2[(i-1)*bAUTmax] ' DEBUG
	zpSUBJ[(i-1)*bSUBJmax] = Mid$(zpCAT[(i-1)*bCATmax],bDelim(1,4)+1,bDelim(1,5)-bDelim(1,4)-1)
	'Print zpSUBJ[(i-1)*bSUBJmax] ' DEBUG
	zpNTS[(i-1)*bNTSmax] = Mid$(zpCAT[(i-1)*bCATmax],bDelim(1,5)+1,bDelim(1,6)-bDelim(1,5)-1)
	'Print zpNTS[(i-1)*bNTSmax] ' DEBUG
	'Sleep '100 ' DEBUG
Next
' -----------------------------------------------------------------------------
