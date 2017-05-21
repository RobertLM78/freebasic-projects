' -----------------------------------------------------------------------------
' Title: searchTitle.bas - translation unit for LibMasterFBG.bas
' Version: 0.1 - May 2017
' Author: Robert Lock - beannachtai@homtail.com
' License: GPL v3
' About: search for title - no outputs
' -----------------------------------------------------------------------------
' ==== Unit title and Input ====
Cls
Color RGB(0, 255, 255), RGB(0, 0, 0) 'Cyan on Black
Print "LibMasterFBG-0.1  -  Title Search"
Print "---------------------------------"
Color RGB(255, 255, 255), RGB(0, 0, 0) 'White on Black
Print
' Input title
Locate 4,1 : Input "Search for title: ",TITsrch
While TITsrch = ""
	Locate 4,1 : Input "Search for title: ",TITsrch
Wend
TITsrch = Trim$(TITsrch)
' Check to see if we want to go back to main menu
If	Lcase$(TITsrch) = "<back>" Then
	Cls
	Goto Menu: 'Since there's no 'Return' from a translation unit :(
End If
' ==============================

Color RGB(0, 255, 255), RGB(0, 0, 0) 'Cyan on Black
Locate 6,1 : Print "Rec: "
Color RGB(255, 255, 255), RGB(0, 0, 0) 'White on Black
' ==== Perform the search ====
For i = 1 to RecNum
	Locate 6,5 : Print i;
	Sleep 25
	If Instr(Lcase$(TIT(i,1)),Lcase$(TITsrch)) >= 1 Then
		Locate 8,10 : Print "Title:      "&TIT(i,1)
		Locate 10,10 : Print "Author 1:   "&AUT(i,1)
		Locate 12,10 : Print "Author 2:   "&AUT(i,2)
		Locate 14,10 : Print "Author 3:   "&AUT(i,3)
		Locate 16,10 : Print "Subject:    "&SUBJ(i,1)
		Locate 18,10 : Print "Notes:      "&NTS(i,1)
		Locate 22,5 : Print "Press any key to continue or 'Esc' to menu. ";
		getK = GetKey
		If getK = 27 Then 'Press 'Esc' to return to menu
			Cls
			Goto Menu:
		End If
		Locate 8,10 : Print Blnk
		Locate 10,10 : Print Blnk
		Locate 12,10 : Print Blnk
		Locate 14,10 : Print Blnk
		Locate 16,10 : Print Blnk
		Locate 18,10 : Print Blnk
		Locate 22,5 : Print Blnk
	End If
Next
Print
Locate 8,5 : Print"Finsihed searching.  Press any key to continue. ";
Sleep
Cls
' ============================
' -----------------------------------------------------------------------------
