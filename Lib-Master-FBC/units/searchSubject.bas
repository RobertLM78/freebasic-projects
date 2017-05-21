' -----------------------------------------------------------------------------
' Title: searchSubject.bas - translation unit for LibMasterFBC.bas
' Version: 0.1 - May 2017
' Author: Robert Lock - beannachtai@homtail.com
' License: GPL v3
' About: search for title - no outputs
' -----------------------------------------------------------------------------
' ==== Unit title and Input ====
Cls
Print "LibMasterFBC-0.1  -  Subject Search"
Print "-----------------------------------"
'Print : Print
'Print "Subjects are: "   ' Display your subjects here
'Print : Print

' Input subject
Input "Search for subject: ",SUBJsrch
While SUBJsrch = ""
	Input "Search for subject: ",SUBJsrch
Wend
SUBJsrch = Trim$(SUBJsrch)
' Check to see if we want to go back to main menu
If	Lcase$(SUBJsrch) = "<back>" Then
	Cls
	Goto Menu: 'Since there's no 'Return' from a translation unit :(
End If
' ==============================

' ==== Perform the search ====
For i = 1 to RecNum
	Print i;
	Sleep 25
	If Instr(Lcase$(SUBJ(i,1)),Lcase$(SUBJsrch)) >= 1 Then
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
