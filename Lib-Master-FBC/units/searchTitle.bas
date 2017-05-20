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
Input "Search for title: ",TITsrch
While TITsrch = ""
	Input "Search for title: ",TITsrch
Wend
' Check to see if we want to go back to main menu
If	Lcase$(TITsrch) = "<back>" Then
	Cls
	Goto Menu: 'Since there's no 'Return' from a translation unit :(
End If
' ==============================

' ==== Perform the search ====
For i = 1 to RecNum
	Print i;
	Sleep 25
	If Instr(Lcase$(TIT(i,1)),Lcase$(TITsrch)) >= 1 Then
		Print
		Print "Title:  "&TIT(i,1)
		Print "Author 1:   "&AUT(i,1)
		Print "Author 2:   "&AUT(i,2)
		Print "Author 3:   "&AUT(i,3)
		Print "Subject:    "&SUBJ(i,1)
		Print "Notes:      "&NTS(i,1)
		Print "Press any key to continue or 'Esc' to menu. ";
		getK = GetKey
		If getK = 27 Then 'Press 'Esc' to return to menu
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
