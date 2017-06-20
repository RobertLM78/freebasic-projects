' -----------------------------------------------------------------------------
' Title: searchTitle.bas - translation unit for LibMasterFBC.bas
' Version: 0.1 - May 2017
' Author: Robert Lock - beannachtai@homtail.com
' License: GPL v3
' About: search for title - no outputs
' -----------------------------------------------------------------------------
' ==== Unit title and Input ====
Cls
Print "LibMasterFBC-0.1  -  Title Search"
Print "---------------------------------"
Print
' Input title
Input "Search for title: ",zTIT
While zTIT = ""
	Input "Search for title: ",zTIT
Wend
zTIT = Trim$(zTIT)
' Check to see if we want to go back to main menu
If	Lcase$(zTIT) = "<back>" Then
	Cls
	Goto Menu: 'Since there's no 'Return' from a translation unit :(
End If
' ==============================

' ==== Perform the search ====
For i = 1 to wRecNum
	Print i &" ";
	Sleep 5
	If Instr(Lcase$(zpTIT[(i-1)*bTITmax]),Lcase$(zTIT)) >= 1 Then
		Print
		Print "Title:  "&zpTIT[(i-1)*bTITmax]
		Print "Author 1:   "&zpAUT0[(i-1)*bAUTmax]
		Print "Author 2:   "&zpAUT1[(i-1)*bAUTmax]
		Print "Author 3:   "&zpAUT2[(i-1)*bAUTmax]
		Print "Subject:    "&zpSUBJ[(i-1)*bSUBJmax]
		Print "Notes:      "&zpNTS[(i-1)*bNTSmax]
		Print "Press any key to continue or 'Esc' to menu. ";
		wKey = GetKey
		If wKey = 27 Then 'Press 'Esc' to return to menu
			Cls
			Goto Menu:
		End If
		Print
	End If
Next
Print
Print"Finsihed searching.  Press any key to continue. ";
Sleep
Cls
' ============================
' -----------------------------------------------------------------------------
