' -----------------------------------------------------------------------------
' Title: fgConvertFBG.bas - FlightGear pilot conversions; Console version
' Version: 0.1 - May 2017
' Author: Robert Lock - beannachtai@homtail.com
' License: GPL v3
' About: Convert altitudes and distances between SI and BS - Also calculate the
'        descent distance for a given angle of descent.
' -----------------------------------------------------------------------------
' ==== Initializations ====
Dim As Ubyte CONT = 1 ' CONTinue with program
Dim As String *4 inK ' Keyboard input
' mi2km, km2mi, ft2m, m2ft -----------
Static As Double miTkm = 201168/125000
Static As Double kmTmi = 125000/201168
Static As Double ftTm = 1143/3750
Static As Double mTft = 3750/1143
Dim As String sDist
Dim As Double dDistE,dDistC  '(dDistC descentCalc)
' dec2dms & dms2dec ----------------------------------------
Dim As String sDcmlAng,sMinutes,sSeconds                     '(sDcmlAng descentCalc)
Dim As Double dDcmlAng,dAngBal,dMinutes,dSeconds,dSecondsOld '(dDcmlAng descentCalc)
Dim As Integer iDcmlAng,iMinutes
' descentCalc --------------------
Static As Double Pi = 4 * atn(1)
Dim As String sAltitude,sElevation
Dim As Double dAltitude,dElevation
' ====  Screen Attributes  ====
' Mode 15	400x300	 50x37	8x8	256K colors to 256 attributes or direct color
Screen 16,32
WindowTitle "fgConvertFBG"
' =============================
' Clear the screen
Cls
' =========================

' ==== Start Main Program Loop ================================================
While CONT <> 0

' ==== Menu & Input ====
Color RGB(0,255,255), RGB(0,0,0) 'Cyan on Black
Locate 1,32-Len("fgConvertFBG-0.1")/2
Print "fgConvertFBG-0.1"
Color RGB(255,0,0), RGB(0,0,0) 'Red on Black
Locate 2,1 : Print "----------------------------------------------------------------"
Color RGB(255,255,255), RGB(0,0,0) 'White on Black

Locate 4,20 : Print "[1] Altitude: m to ft"
Locate 5,20 : Print "[2] Altitude: ft to m"
Locate 6,20 : Print "[3] Distance: km to mi"
Locate 7,20 : Print "[4] Distance: mi to km"
Locate 8,20 : Print "[5] Angle: dms to dec"
Locate 9,20 : Print "[6] Angle: dec to dms"
Locate 10,20 : Print "[7] Descent calculator"
Locate 11,20 : Print "[8] Quit" : Print
Color RGB(0,255,255), RGB(0,0,0) 'Cyan on Black
Locate 13,32-Len("Press a menu item letter. ")/2
Print "Press a menu item letter. ";
Color RGB(255,255,255), RGB(0,0,0) 'White on Black

inK = InKey$
Sleep 20 ' Take a little nap waiting for input
While Asc(InK) < 49 or Asc(InK) > 49+7 and CONT <> 0
    inK = InKey$
    Sleep 20 ' Take a little nap waiting for input
    If Len(inK)=0 Then
        Sleep 20 ' Take a little nap waiting for input
    ElseIf inK = chr$(255)+"k" Then ' If the 'X' was clicked
        CONT = 0                    ' quit the program
    End If
Wend
' ======================

' ==== Selections ====
If Asc(inK) = 49 Then
	'===================================
	'  OPTION 1 - Altitude: m to ft    '
	'===================================
	#include "./units/m2ft.bas"
	While Inkey$ <> "": Wend ' Flush the buffer
	Cls
ElseIf Asc(inK) = 50 Then
	'===================================
	'  OPTION 2 - Altitude: ft to m    '
	'===================================
	#include "./units/ft2m.bas"
	While Inkey$ <> "": Wend ' Flush the buffer
	Cls
ElseIf	Asc(inK) = 51 Then
	'====================================
	'  OPTION 3 - Distance: km to mi    '
	'====================================
	#include "./units/km2mi.bas"
	While Inkey$ <> "": Wend ' Flush the buffer
	Cls
ElseIf	Asc(inK) = 52 Then
	'====================================
	'  OPTION 4 - Distance: mi to km    '
	'====================================
	#include "./units/mi2km.bas"
	While Inkey$ <> "": Wend ' Flush the buffer
	Cls
ElseIf	Asc(inK) = 53 Then
	'===================================
	'  OPTION 5 - Angle: dms to dec    '
	'===================================
	#include "./units/dms2dec.bas"
	While Inkey$ <> "": Wend ' Flush the buffer
	Cls
ElseIf	Asc(inK) = 54 Then
	'===================================
	'  OPTION 6 - Angle: dec to dms    '
	'===================================
	#include "./units/dec2dms.bas"
	While Inkey$ <> "": Wend ' Flush the buffer
	Cls
ElseIf	Asc(inK) = 55 Then
	'====================================
	'  OPTION 7 - Descent calculator    '
	'====================================
	#include "./units/descentCalc.bas"
	While Inkey$ <> "": Wend ' Flush the buffer
	Cls
ElseIf Asc(inK) = 56 Then
	'======================
	'  OPTION 8 - Quit    '
	'======================
	Cls
	Print "Returning to shell..."
	CONT = 0
End If
' ====================
Wend
' ==== End Main Program Loop ==================================================
End
' -----------------------------------------------------------------------------
