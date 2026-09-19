' -----------------------------------------------------------------------------
' Title: searchSubject.bas - translation unit for LibMasterFBG.bas
' Version: 0.3 - Sept 2026
' Author: Robert Lock - beannachtai@homtail.com
' License: GPL v3
' About: search for title - no outputs
' -----------------------------------------------------------------------------
' ==== Unit title and Input ====
Cls
Color rgbCyan, rgbBlack 'Cyan on Black
Print sLibMsterTitle &"  -  Subject Search"
Print "-----------------------------------"
'Locate 7,1 : Print "Subjects are: "   ' Display your subjects here
'Locate 8,5 : Print "ART" : Locate 8,30 : Print "FICtion" : Locate 8,55 : Print "General Non-Fiction" : Locate 8,80 : Print "IREland"
'Locate 9,5 : Print "MUSic" : Locate 9,30 : Print "REFerence" : Locate 9,55 : Print "SCoTland" : Locate 9,80 : Print "TeXT"

Color rgbWhite, rgbBlack 'White on Black
'Locate 11,5 : Print "Press any key to begin"
'While Inkey$ <> "": Wend ' Flush the buffer
'Sleep

' Clear up the screen
'Locate 7,1 : Print Blnk
'Locate 8,1 : Print Blnk
'Locate 9,1 : Print Blnk
'Locate 11,1 : Print Blnk

' Input subject
Locate 4,1 : Input "Search for subject (type <back> to return to the menu): ",zSUBJ
While zSUBJ = ""
	Locate 4,1 : Input "Search for subject (type <back> to return to the menu): ",zSUBJ
Wend
zSUBJ = Trim$(zSUBJ)
' Check to see if we want to go back to main menu
If	Lcase$(zSUBJ) = "<bac" Then 'Remember this effectively only 4 characters long
	Cls
	Goto Menu:
End If
' ==============================

Color rgbCyan, rgbBlack 'Cyan on Black
Locate 6,1 : Print "Rec: "
Color rgbWhite, rgbBlack 'White on Black
' ==== Perform the search ====
For i = 1 to wRecNum
	Locate 6,5 : Print i;
	If Instr(Lcase$(zpSUBJ[(i-1)*bSUBJmax]),Lcase$(zSUBJ)) >= 1 Then
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
