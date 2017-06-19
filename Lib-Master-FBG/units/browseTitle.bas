' -----------------------------------------------------------------------------
' Title: browseTitle.bas - translation unit for LibMasterFBG.bas
' Version: 0.2 - June 2017
' Author: Robert Lock - beannachtai@homtail.com
' License: GPL v3
' About: search for title - no outputs
' -----------------------------------------------------------------------------
' ==== Unit title and Input ====
Cls
Color rgbCyan, rgbBlack 'Cyan on Black
Print "LibMasterFBG-0.2  -  Title Browser"
Print "----------------------------------"
Color rgbWhite, rgbBlack 'White on Black
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
	If bRowNum = 35 Then                           ' Max Number of rows printed to screen
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
		If bQuery >= 1 or bQuery <= 35 Then ' Max Number of rows
			' Display title and name of function
			Cls
			Color rgbCyan, rgbBlack 'Cyan on Black
			Print "LibMasterFBG-0.2  -  Title Browser"
			Print "----------------------------------"
			Locate 6,1 : Print "Rec: "
			Color rgbWhite, rgbBlack 'White on Black
			Locate 6,5 : Print wRecMat(1,bQuery)
			Locate 8,10 : Print "Title:      "&zpTIT[(wRecMat(1,bQuery)-1)*bTITmax]
			Locate 10,10 : Print "Author 1:   "&zpAUT0[(wRecMat(1,bQuery)-1)*bAUTmax]
			Locate 12,10 : Print "Author 2:   "&zpAUT1[(wRecMat(1,bQuery)-1)*bAUTmax]
			Locate 14,10 : Print "Author 3:   "&zpAUT2[(wRecMat(1,bQuery)-1)*bAUTmax]
			Locate 16,10 : Print "Subject:    "&zpSUBJ[(wRecMat(1,bQuery)-1)*bSUBJmax]
			Locate 18,10 : Print "Notes:      "&zpNTS[(wRecMat(1,bQuery)-1)*bNTSmax]
			Locate 22,5 : Print "Press any key to continue or 'Esc' to menu. ";
			wKey = GetKey
			If wKey = 27 Then 'Press 'Esc' to return to menu
				Cls
				Goto Menu:
			End If
			Cls
			Color rgbCyan, rgbBlack 'Cyan on Black
			Print "LibMasterFBG-0.2  -  Title Browser"
			Print "----------------------------------"
			Color rgbWhite, rgbBlack 'White on Black
			Print
		ElseIf bQuery = 0 Then
			ContPltLP:
			Cls
			Color rgbCyan, rgbBlack 'Cyan on Black
			Print "LibMasterFBG-0.2  -  Title Browser"
			Print "----------------------------------"
			Color rgbWhite, rgbBlack 'White on Black
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
			Color rgbCyan, rgbBlack 'Cyan on Black
			Print "LibMasterFBG-0.2  -  Title Browser"
			Print "----------------------------------"
			Locate 6,1 : Print "Rec: "
			Color rgbWhite, rgbBlack 'White on Black
			Locate 6,5 : Print wRecMat(1,bQuery)
			Locate 8,10 : Print "Title:      "&zpTIT[(wRecMat(1,bQuery)-1)*bTITmax]
			Locate 10,10 : Print "Author 1:   "&zpAUT0[(wRecMat(1,bQuery)-1)*bAUTmax]
			Locate 12,10 : Print "Author 2:   "&zpAUT1[(wRecMat(1,bQuery)-1)*bAUTmax]
			Locate 14,10 : Print "Author 3:   "&zpAUT2[(wRecMat(1,bQuery)-1)*bAUTmax]
			Locate 16,10 : Print "Subject:    "&zpSUBJ[(wRecMat(1,bQuery)-1)*bSUBJmax]
			Locate 18,10 : Print "Notes:      "&zpNTS[(wRecMat(1,bQuery)-1)*bNTSmax]
			Locate 22,5 : Print "Press any key to continue or 'Esc' to menu. ";
			wKey = GetKey
			If wKey = 27 Then 'Press 'Esc' to return to menu
				Cls
				Goto Menu:
			End If
			ContPLP:
			Cls
			Color rgbCyan, rgbBlack 'Cyan on Black
			Print "LibMasterFBG-0.2  -  Title Browser"
			Print "----------------------------------"
			Color rgbWhite, rgbBlack 'White on Black
			Print
		'Else
			'Cls
			'Color rgbCyan, rgbBlack 'Cyan on Black
			'Print "LibMasterFBG-0.2  -  Title Browser"
			'Print "----------------------------------"
			'Color rgbWhite, rgbBlack 'White on Black
			'Print
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
