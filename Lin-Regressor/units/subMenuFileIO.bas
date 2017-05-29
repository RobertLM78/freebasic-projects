' -----------------------------------------------------------------------------
' Title: subMenuFileIO.bas - a sub menu unit for Lin-Regressor.bas
' Version: 0.1 - June 2017
' Author: Robert Lock - beannachtai@homtail.com
' License: GPL v3
' About:
' -----------------------------------------------------------------------------
CONT = 2
' Clear the screen
Cls
' ==== Start Sub Program Loop ================================================
While CONT <> 1
SubMenu:
' ==== Sub Menu & Input ====
Color RGB(255,255,0),RGB(0,0,128)
Line (0,8)-(640,8)
Color RGB(255,255,255),RGB(0,0,128)
Locate 2,22 : Print "Lin-Regressor 0.1 - Load/Save Points"
Color RGB(255,255,0),RGB(0,0,128)
Locate 3,22 : Print "------------------------------------"
Color RGB(255,255,255),RGB(0,0,128)
Locate 5,25 : Print "  [1] Load points"
Locate 7,25 : Print "  [2] Save points"
Locate 9,25 : Print "  [3] Back to main menu"
Locate 12,25 : Print "Press a menu item letter. ";

Color RGB(255,255,0),RGB(0,0,128)
Line (0,904)-(640,904)
Locate 58,34 : Print Date$
Locate 59,35 : Print Time
Color RGB(255,255,255),RGB(0,0,128)

sKey = InKey$
Sleep 20 ' Take a little nap waiting for input
While Asc(sKey) < 49 or Asc(sKey) > 49+2
	sKey = InKey$
	Sleep 20 ' Take a little nap waiting for input
Wend
' ======================

' ==== Selections ====
If Asc(sKey) = 49 Then
	'===============
	'  OPTION A    '
	'===============
	#include "./units/fileLoad.bas"
	#include "./units/strDiv.bas"
	While Inkey$ <> "": Wend ' Flush the buffer
	Cls
ElseIf Asc(sKey) = 50 Then
	'===============
	'  OPTION B    '
	'===============
	If sXYarray(1,1) = "" Then
		Locate 14,15 : Print "No data in memory. Press any key to continue. ";
		While Inkey$ <> "": Wend ' Flush the buffer
		Sleep
		Cls
	Else
		#include "./units/strCat.bas"   'Outputs sXYarray()
		#include "./units/fileSave.bas" 'No Outputs
		While Inkey$ <> "": Wend ' Flush the buffer
	End If
	While Inkey$ <> "": Wend ' Flush the buffer
	Cls
ElseIf	Asc(sKey) = 51 Then
	'===============
	'  OPTION C    '
	'===============
	CONT = 1
	While Inkey$ <> "": Wend ' Flush the buffer
	Cls
End If
' ====================
Wend
' -----------------------------------------------------------------------------
