' -----------------------------------------------------------------------------
' Title: browseTitle.bas - translation unit for LibMasterFBG.bas
' Version: 0.2 - June 2017
' Author: Robert Lock - beannachtai@homtail.com
' License: GPL v3
' About: search for title - no outputs
' -----------------------------------------------------------------------------
' ==== Unit title and Input ====
Cls
Print "LibMasterFBG-0.2  -  Title Browser"
Print "----------------------------------"
Print
' ==============================
bRowNum = 0
wPageN = 0

' Begin printing screen pages (length 20 rows)
For i = 1 to wRecNum
	bRowNum += 1
	wRecMat(1,bRowNum) = i
	Print "["&Str$(bRowNum)&"]"&"  "&zpTIT[(i-1)*bTITmax]
' ==== All screen pages but the last one ====
	If bRowNum = 20 Then                           ' Max Number of rows printed to screen
		wPageN += 1    ' increment wPageN
		bRowNum = 0    ' reset bRowNum
		Print
		Print "Page: "&Str$(wPageN)
		Print
		Print
		' Enter a number on the list
		 Input "Select Title (Enter NULL to continue): ",bQuery
		If bQuery = -1 Then ' Go back to Main Script
			Cls
			Goto Menu: 'Since there's no 'Return' from a translation unit :(
		ElseIf bQuery = 0 Then
			Goto ContPltLP: ' WTF?!!!  No other choice because 0 made it through if at 50
		End If
		While bQuery < 0 or bQuery > 35     ' Max Number of rows
			Print "Choose an item number within range."
			Input "Select Title (Enter NULL to continue): ",bQuery
			If bQuery = -1 Then ' Go back to Main Script
				Cls
				Goto Menu:
			ElseIf bQuery = 0 Then
				Goto ContPltLP: ' WTF?!!!  No other choice because 0 made it through if at 50
			End If
		Wend
		If bQuery >= 1 or bQuery <= 20 Then ' Max Number of rows
			' Display title and name of function
			Cls
			Print "LibMasterFBG-0.2  -  Title Browser"
			Print "----------------------------------"
			Print "Rec: ";wRecMat(1,bQuery)
			Print
			Print "Title:      "&zpTIT[(wRecMat(1,bQuery)-1)*bTITmax]
			Print "Author 1:   "&zpAUT0[(wRecMat(1,bQuery)-1)*bAUTmax]
			Print "Author 2:   "&zpAUT1[(wRecMat(1,bQuery)-1)*bAUTmax]
			Print "Author 3:   "&zpAUT2[(wRecMat(1,bQuery)-1)*bAUTmax]
			Print "Subject:    "&zpSUBJ[(wRecMat(1,bQuery)-1)*bSUBJmax]
			Print "Notes:      "&zpNTS[(wRecMat(1,bQuery)-1)*bNTSmax]
			Print "Press any key to continue or 'Esc' to menu. ";
			wKey = GetKey
			If wKey = 27 Then 'Press 'Esc' to return to menu
				Cls
				Goto Menu:
			End If
			Cls
			Print "LibMasterFBG-0.2  -  Title Browser"
			Print "----------------------------------"
			Print
		ElseIf bQuery = 0 Then
			ContPltLP:
			Cls
			Print "LibMasterFBG-0.2  -  Title Browser"
			Print "----------------------------------"
			Print
		End If
' ===========================================

' ==== Last screen page ====
	ElseIf i = wRecNum Then
		wPageN += 1    ' increment wPageN
		Print
		Print "Page: "&Str$(wPageN)
		Print
		Print
		' Enter a number on the list
		 Input "Select Title (Enter NULL to continue): ",bQuery
		If bQuery = -1 Then ' Go back to Main Script
			Cls
			Goto Menu:
		ElseIf bQuery = 0 Then
			Goto ContPLP:
		End If
		While bQuery < 0 or bQuery > bRowNum ' Max Number of rows
			Print "Choose an item number within range."
			Input "Select Title (Enter NULL to continue): ",bQuery
			If bQuery = -1 Then ' Go back to Main Script
				Cls
				Goto Menu:
			ElseIf bQuery = 0 Then
				Goto ContPLP:
			End If
		Wend
		If bQuery >= 1 or bQuery <= bRowNum Then ' Max Number of rows
			' Display title and name of function
			Cls
			Print "LibMasterFBG-0.2  -  Title Browser"
			Print "----------------------------------"
			Print "Rec: ";wRecMat(1,bQuery)
			Print
			Print "Title:      "&zpTIT[(wRecMat(1,bQuery)-1)*bTITmax]
			Print "Author 1:   "&zpAUT0[(wRecMat(1,bQuery)-1)*bAUTmax]
			Print "Author 2:   "&zpAUT1[(wRecMat(1,bQuery)-1)*bAUTmax]
			Print "Author 3:   "&zpAUT2[(wRecMat(1,bQuery)-1)*bAUTmax]
			Print "Subject:    "&zpSUBJ[(wRecMat(1,bQuery)-1)*bSUBJmax]
			Print "Notes:      "&zpNTS[(wRecMat(1,bQuery)-1)*bNTSmax]
			Print "Press any key to continue or 'Esc' to menu. ";
			wKey = GetKey
			If wKey = 27 Then 'Press 'Esc' to return to menu
				Cls
				Goto Menu:
			End If
			ContPLP:
			Cls
			Print "LibMasterFBG-0.2  -  Title Browser"
			Print "----------------------------------"
			Print
		End If
' ==========================
	End If
Next
Print
Print "No more titles in catalog."
Print "Press any key to continue. ";
Sleep
Cls
' -----------------------------------------------------------------------------
