' -----------------------------------------------------------------------------
' Title: browseTitle.bas - translation unit for LibMasterFBC.bas
' Version: 0.1 - May 2017
' Author: Robert Lock - beannachtai@homtail.com
' License: GPL v3
' About: search for title - no outputs
' -----------------------------------------------------------------------------
' ==== Unit title and Input ====
Cls
Print "LibMasterFBC-0.1  -  Title Browser"
Print "----------------------------------"
Print
' ==============================
RowNum = 0
PageN = 0

' Begin printing screen pages (length 20 rows)
For i = 1 to RecNum
	Turd:
	RowNum += 1
	RecMat(1,RowNum) = i
	Print "["&Str$(RowNum)&"]"&"  "&TIT(i,1)
' ==== All screen pages but the last one ====
	If RowNum = 20 Then                           ' Max Number of rows printed to screen
		PageN += 1    ' increment PageN
		RowNum = 0    ' reset RowNum
		Print
		Print "Page: "&Str$(PageN)
		Print
		Print
		' Enter a number on the list
		 Input "Select Title (Enter NULL to continue): ",queryDisp
		If queryDisp = -1 Then ' Go back to Main Script
			Cls
			Goto Menu: 'Since there's no 'Return' from a translation unit :(
		ElseIf queryDisp = 0 Then
			Goto ContPltLP: ' WTF?!!!  No other choice because 0 made it through conditional at 49
		End If
		While queryDisp < 0 or queryDisp > 20     ' Max Number of rows
			Print "Choose an item number within range."
			Input "Select Title (Enter NULL to continue): ",queryDisp
			If queryDisp = -1 Then ' Go back to Main Script
				Cls
				Goto Menu:
			ElseIf queryDisp = 0 Then
				Goto ContPltLP: ' WTF?!!!  No other choice because 0 made it through conditional at 49
			End If
		Wend
		If queryDisp >= 1 or queryDisp <= 20 Then ' Max Number of rows
			' Display title and name of function
			Cls
			Print "LibMasterFBC-0.1  -  Title Browser"
			Print "----------------------------------"
			Print "Rec: ";RecMat(1,queryDisp)
			Print
			Print "Title:  "&TIT(RecMat(1,queryDisp),1)
			Print "Author 1:   "&AUT(RecMat(1,queryDisp),1)
			Print "Author 2:   "&AUT(RecMat(1,queryDisp),2)
			Print "Author 3:   "&AUT(RecMat(1,queryDisp),3)
			Print "Subject:    "&SUBJ(RecMat(1,queryDisp),1)
			Print "Notes:      "&NTS(RecMat(1,queryDisp),1)
			Print "Press any key to continue or 'Esc' to menu. ";
			getK = GetKey
			If getK = 27 Then 'Press 'Esc' to return to menu
				Cls
				Goto Menu:
			End If
			Cls
			Print "LibMasterFBC-0.1  -  Title Browser"
			Print "----------------------------------"
			Print
		ElseIf queryDisp = 0 Then
			ContPltLP: ' ONE THE FUCK WAY OR ANOTHER IT WILL SKIP THE CONDITIONAL
			Cls
			Print "LibMasterFBC-0.1  -  Title Browser"
			Print "----------------------------------"
			Print
		End If
' ===========================================

' ==== Last screen page ====
	ElseIf i = RecNum Then
		PageN += 1    ' increment PageN
		Print
		Print "Page: "&Str$(PageN)
		Print
		Print
		' Enter a number on the list
		 Input "Select Title (Enter NULL to continue): ",queryDisp
		If queryDisp = -1 Then ' Go back to Main Script
			Cls
			Goto Menu:
		ElseIf queryDisp = 0 Then
			Goto ContPLP: ' WTF?!!!  No other choice because 0 made it through conditional at 106
		End If
		While queryDisp < 0 or queryDisp > RowNum ' Max Number of rows
			Print "Choose an item number within range."
			Input "Select Title (Enter NULL to continue): ",queryDisp
			If queryDisp = -1 Then ' Go back to Main Script
				Cls
				Goto Menu:
			ElseIf queryDisp = 0 Then
				Goto ContPLP: ' WTF?!!!  No other choice because 0 made it through conditional at 106
			End If
		Wend
		If queryDisp >= 1 or queryDisp <= 20 Then ' Max Number of rows
			' Display title and name of function
			Cls
			Print "LibMasterFBC-0.1  -  Title Browser"
			Print "----------------------------------"
			Print "Rec: ";RecMat(1,queryDisp)
			Print
			Print "Title:  "&TIT(RecMat(1,queryDisp),1)
			Print "Author 1:   "&AUT(RecMat(1,queryDisp),1)
			Print "Author 2:   "&AUT(RecMat(1,queryDisp),2)
			Print "Author 3:   "&AUT(RecMat(1,queryDisp),3)
			Print "Subject:    "&SUBJ(RecMat(1,queryDisp),1)
			Print "Notes:      "&NTS(RecMat(1,queryDisp),1)
			Print "Press any key to continue or 'Esc' to menu. ";
			getK = GetKey
			If getK = 27 Then 'Press 'Esc' to return to menu
				Cls
				Goto Menu:
			End If
			ContPLP: ' ONE THE FUCK WAY OR ANOTHER IT WILL SKIP THE CONDITIONAL
			Cls
			Print "LibMasterFBC-0.1  -  Title Browser"
			Print "----------------------------------"
			Print
		'Else
			'Cls
			'Print "LibMasterFBC-0.1  -  Title Browser"
			'Print "----------------------------------"
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
