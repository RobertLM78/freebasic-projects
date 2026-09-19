' -----------------------------------------------------------------------------
' Title: searchSubject.bas - translation unit for LibMasterFBC.bas
' Version: 0.3 - Sept 2026
' Author: Robert Lock - beannachtai@homtail.com
' License: GPL v3
' About: search for title - no outputs
' -----------------------------------------------------------------------------
' ==== Unit title and Input ====
Cls
Print sLibMsterTitle &"  -  Subject Search"
Print "-----------------------------------"
'Print : Print
'Print "Subjects are: "   ' Display your subjects here
'Print : Print

' Input subject
Locate ,,1  'Turn cursor on
Input "Search for subject (type <back> to return to the menu): ",zSUBJ
While zSUBJ = ""
	Input "Search for subject (type <back> to return to the menu): ",zSUBJ
Wend
zSUBJ = Trim$(zSUBJ)
' Check to see if we want to go back to main menu
If	Lcase$(zSUBJ) = "<bac" Then 'Remember this effectively only 4 characters long
	Cls
	Goto Menu:
End If
' ==============================

' ==== Perform the search ====
For i = 1 to wRecNum
	Print i &" ";
	If Instr(Lcase$(zpSUBJ[(i-1)*bSUBJmax]),Lcase$(zSUBJ)) >= 1 Then
		Print
		Print "Title:      "&zpTIT[(i-1)*bTITmax]
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
Locate ,,0  'Turn cursor off
' ============================
' -----------------------------------------------------------------------------
