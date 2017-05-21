' -----------------------------------------------------------------------------
' Title: searchAuthor.bas - translation unit for LibMasterFBC.bas
' Version: 0.1 - May 2017
' Author: Robert Lock - beannachtai@homtail.com
' License: GPL v3
' About: search for author - no outputs
' -----------------------------------------------------------------------------
' ==== Unit title and Input ====
Cls
Print "LibMasterFBC-0.1  -  Author Search"
Print "----------------------------------"
Print
' Input author
Input "Search for author: ",AUTsrch
While AUTsrch = ""
	Input "Search for author: ",AUTsrch
Wend
AUTsrch = Trim$(AUTsrch)
' Check to see if we want to go back to main menu
If	Lcase$(AUTsrch) = "<back>" Then
	Cls
	Goto Menu: 'Since there's no 'Return' from a translation unit :(
End If
' ==============================

' ==== Perform the search ====
For i = 1 to RecNum
	Print i;
	Sleep 25
	For k = 1 to 3
	If Instr(Lcase$(AUT(i,k)),Lcase$(AUTsrch)) >= 1 Then
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
Next
Print
Print"Finsihed searching.  Press any key to continue. ";
Sleep
Cls
' ============================
' -----------------------------------------------------------------------------
