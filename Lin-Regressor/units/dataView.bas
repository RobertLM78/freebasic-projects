' -----------------------------------------------------------------------------
' Title: dataView.bas - translation unit for Lin-Regressor.bas
' Version: 0.1 - June 2017
' Author: Robert Lock - beannachtai@homtail.com
' License: GPL v3
' About: View data points
' -----------------------------------------------------------------------------
' ==== Unit title and Input ====
Cls
Color RGB(255,255,0),RGB(0,0,128)
Line (0,8)-(640,8)
Color RGB(255,255,255),RGB(0,0,128)
Locate 2,25 : Print "Lin-Regressor 0.1 - View Points"
Color RGB(255,255,0),RGB(0,0,128)
Locate 3,25 : Print "-------------------------------"
Color RGB(255,255,255),RGB(0,0,128)

Color RGB(255,255,0),RGB(0,0,128)
Line (0,904)-(640,904)
Locate 58,34 : Print Date$
Locate 59,35 : Print Time
Color RGB(255,255,255),RGB(0,0,128)
' ==============================
RowNum = 4
PageN = 0

' Begin printing screen pages (length 40 rows)
For i = 1 to NumDataPts
	RowNum += 1
	Locate RowNum,1 : Print Using "  X"&Str$(i)&" = ##############.#####                Y"&Str$(i)&" = ##############.#####";dXarray(i,1); dYarray(i,1);
' ==== All screen pages but the last one ====
	If RowNum = 54 Then                           ' Max Number of rows printed to screen
		PageN += 1    ' increment PageN
		RowNum = 4    ' reset RowNum
		Locate 55,4 : Print "Page: "&Str$(PageN)
		Locate 56,15 : Print "Press any key to continue or 'Esc' to menu."
		iGkey = GetKey
		For k = 4 to 56
			Locate k,1 : Print Blnk
		Next
		If iGkey = 27 Then 'Press 'Esc' to return to menu
			Cls
			Goto Menu:
		End If
' ===========================================
' ==== Last screen page ====
	ElseIf i = NumDataPts Then
		PageN += 1    ' increment PageN
		RowNum = 4    ' reset RowNum
		Locate 55,4 : Print "Page: "&Str$(PageN)
		Locate 56,15 : Print "No more data points. Press any key to continue. ";
		Sleep
		Cls
' ==========================
	End If
Next
' -----------------------------------------------------------------------------
