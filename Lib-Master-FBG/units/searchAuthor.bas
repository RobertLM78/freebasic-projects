' -----------------------------------------------------------------------------
' Title: searchAuthor.bas - translation unit for LibMasterFBG.bas
' Version: 0.2 - June 2017
' Author: Robert Lock - beannachtai@homtail.com
' License: GPL v3
' About: search for author - no outputs
' -----------------------------------------------------------------------------
' ==== Unit title and Input ====
Cls
Color rgbCyan, rgbBlack 'Cyan on Black
Print "LibMasterFBG-0.2  -  Author Search"
Print "----------------------------------"
Color rgbWhite, rgbBlack 'White on Black
Print
' Input author
Locate 4,1 : Input "Search for author: ",zAUT
While zAUT = ""
	Locate 4,1 : Input "Search for author: ",zAUT
Wend
zAUT = Trim$(zAUT)
' Check to see if we want to go back to main menu
If	Lcase$(zAUT) = "<back>" Then
	Cls
	Goto Menu: 'Since there's no 'Return' from a translation unit :(
End If
' ==============================

Color rgbCyan, rgbBlack 'Cyan on Black
Locate 6,1 : Print "Rec: "
Color rgbWhite, rgbBlack 'White on Black
' ==== Perform the search ====
For i = 1 to wRecNum
	Locate 6,5 : Print i;
	Sleep 5
	'zpAUT0[(i-1)*bAUTmax] = zAUTsrch(1)
	'zpAUT1[(i-1)*bAUTmax] = zAUTsrch(2)
	'zpAUT0[(i-1)*bAUTmax] = zAUTsrch(3)
	If Instr(Lcase$(zpAUT0[(i-1)*bAUTmax]),Lcase$(zAUT)) >= 1 Then
		Locate 8,10 : Print "Title:      "&zpTIT[(i-1)*bTITmax]
		Locate 10,10 : Print "Author 1:   "&zpAUT0[(i-1)*bAUTmax]
		Locate 12,10 : Print "Author 2:   "&zpAUT1[(i-1)*bAUTmax]
		Locate 14,10 : Print "Author 3:   "&zpAUT2[(i-1)*bAUTmax]
		Locate 16,10 : Print "Subject:    "&zpSUBJ[(i-1)*bSUBJmax]
		Locate 18,10 : Print "Notes:      "&zpNTS[(i-1)*bNTSmax]
		Locate 22,5 : Print "Press any key to continue or 'Esc' to menu. ";
		wKey = GetKey
		If wKey = 27 Then 'Press 'Esc' to return to menu
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
	ElseIf Instr(Lcase$(zpAUT1[(i-1)*bAUTmax]),Lcase$(zAUT)) >= 1 Then
		Locate 8,10 : Print "Title:      "&zpTIT[(i-1)*bTITmax]
		Locate 10,10 : Print "Author 1:   "&zpAUT0[(i-1)*bAUTmax]
		Locate 12,10 : Print "Author 2:   "&zpAUT1[(i-1)*bAUTmax]
		Locate 14,10 : Print "Author 3:   "&zpAUT2[(i-1)*bAUTmax]
		Locate 16,10 : Print "Subject:    "&zpSUBJ[(i-1)*bSUBJmax]
		Locate 18,10 : Print "Notes:      "&zpNTS[(i-1)*bNTSmax]
		Locate 22,5 : Print "Press any key to continue or 'Esc' to menu. ";
		wKey = GetKey
		If wKey = 27 Then 'Press 'Esc' to return to menu
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
	ElseIf Instr(Lcase$(zpAUT2[(i-1)*bAUTmax]),Lcase$(zAUT)) >= 1 Then
		Locate 8,10 : Print "Title:      "&zpTIT[(i-1)*bTITmax]
		Locate 10,10 : Print "Author 1:   "&zpAUT0[(i-1)*bAUTmax]
		Locate 12,10 : Print "Author 2:   "&zpAUT1[(i-1)*bAUTmax]
		Locate 14,10 : Print "Author 3:   "&zpAUT2[(i-1)*bAUTmax]
		Locate 16,10 : Print "Subject:    "&zpSUBJ[(i-1)*bSUBJmax]
		Locate 18,10 : Print "Notes:      "&zpNTS[(i-1)*bNTSmax]
		Locate 22,5 : Print "Press any key to continue or 'Esc' to menu. ";
		wKey = GetKey
		If wKey = 27 Then 'Press 'Esc' to return to menu
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
