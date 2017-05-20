' -----------------------------------------------------------------------------
' Title: browseTitle.bas - translation unit for LibMasterFBG.bas
' Version: 0.1 - May 2017
' Author: Robert Lock - beannachtai@homtail.com
' License: GPL v3
' About: search for title - no outputs
' -----------------------------------------------------------------------------
' ==== Unit title and Input ====
Cls
Color RGB(0, 255, 255), RGB(0, 0, 0) 'Cyan on Black
Print "LibMasterFBG-0.1  -  Title Browser"
Print "----------------------------------"
Color RGB(255, 255, 255), RGB(0, 0, 0) 'White on Black
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
	If RowNum = 35 Then                           ' Max Number of rows printed to screen
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
		While queryDisp < 0 or queryDisp > 35     ' Max Number of rows
			Print "Choose an item number within range."
			Input "Select Title (Enter NULL to continue): ",queryDisp
			If queryDisp = -1 Then ' Go back to Main Script
				Cls
				Goto Menu:
			ElseIf queryDisp = 0 Then
				Goto ContPltLP: ' WTF?!!!  No other choice because 0 made it through conditional at 49
			End If
		Wend
		If queryDisp >= 1 or queryDisp <= 35 Then ' Max Number of rows
			' Display title and name of function
			Cls
			Color RGB(0, 255, 255), RGB(0, 0, 0) 'Cyan on Black
			Print "LibMasterFBG-0.1  -  Title Browser"
			Print "----------------------------------"
			Locate 6,1 : Print "Rec: "
			Color RGB(255, 255, 255), RGB(0, 0, 0) 'White on Black
			Locate 6,5 : Print RecMat(1,queryDisp)
			Locate 8,10 : Print "Title:      "&TIT(RecMat(1,queryDisp),1)
			Locate 10,10 : Print "Author 1:   "&AUT(RecMat(1,queryDisp),1)
			Locate 12,10 : Print "Author 2:   "&AUT(RecMat(1,queryDisp),2)
			Locate 14,10 : Print "Author 3:   "&AUT(RecMat(1,queryDisp),3)
			Locate 16,10 : Print "Subject:    "&SUBJ(RecMat(1,queryDisp),1)
			Locate 18,10 : Print "Notes:      "&NTS(RecMat(1,queryDisp),1)
			Locate 22,5 : Print "Press any key to continue or 'Esc' to menu. ";
			getK = GetKey
			If getK = 27 Then 'Press 'Esc' to return to menu
				Cls
				Goto Menu:
			End If
			Cls
			Color RGB(0, 255, 255), RGB(0, 0, 0) 'Cyan on Black
			Print "LibMasterFBG-0.1  -  Title Browser"
			Print "----------------------------------"
			Color RGB(255, 255, 255), RGB(0, 0, 0) 'White on Black
			Print
		ElseIf queryDisp = 0 Then
			ContPltLP: ' ONE THE FUCK WAY OR ANOTHER IT WILL SKIP THE CONDITIONAL
			Cls
			Color RGB(0, 255, 255), RGB(0, 0, 0) 'Cyan on Black
			Print "LibMasterFBG-0.1  -  Title Browser"
			Print "----------------------------------"
			Color RGB(255, 255, 255), RGB(0, 0, 0) 'White on Black
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
		If queryDisp >= 1 or queryDisp <= RowNum Then ' Max Number of rows
			' Display title and name of function
			Cls
			Color RGB(0, 255, 255), RGB(0, 0, 0) 'Cyan on Black
			Print "LibMasterFBG-0.1  -  Title Browser"
			Print "----------------------------------"
			Locate 6,1 : Print "Rec: "
			Color RGB(255, 255, 255), RGB(0, 0, 0) 'White on Black
			Locate 6,5 : Print RecMat(1,queryDisp)
			Locate 8,10 : Print "Title:      "&TIT(RecMat(1,queryDisp),1)
			Locate 10,10 : Print "Author 1:   "&AUT(RecMat(1,queryDisp),1)
			Locate 12,10 : Print "Author 2:   "&AUT(RecMat(1,queryDisp),2)
			Locate 14,10 : Print "Author 3:   "&AUT(RecMat(1,queryDisp),3)
			Locate 16,10 : Print "Subject:    "&SUBJ(RecMat(1,queryDisp),1)
			Locate 18,10 : Print "Notes:      "&NTS(RecMat(1,queryDisp),1)
			Locate 22,5 : Print "Press any key to continue or 'Esc' to menu. ";
			getK = GetKey
			If getK = 27 Then 'Press 'Esc' to return to menu
				Cls
				Goto Menu:
			End If
			ContPLP: ' ONE THE FUCK WAY OR ANOTHER IT WILL SKIP THE CONDITIONAL
			Cls
			Color RGB(0, 255, 255), RGB(0, 0, 0) 'Cyan on Black
			Print "LibMasterFBG-0.1  -  Title Browser"
			Print "----------------------------------"
			Color RGB(255, 255, 255), RGB(0, 0, 0) 'White on Black
			Print
		'Else
			'Cls
			'Color RGB(0, 255, 255), RGB(0, 0, 0) 'Cyan on Black
			'Print "LibMasterFBG-0.1  -  Title Browser"
			'Print "----------------------------------"
			'Color RGB(255, 255, 255), RGB(0, 0, 0) 'White on Black
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
