' -----------------------------------------------------------------------------
' Title: Lin-Regressor.bas - a linear regression calcuator and plotter
' Version: 0.1 - June 2017
' Author: Robert Lock - beannachtai@homtail.com
' License: GPL v3
' About:
' -----------------------------------------------------------------------------
' ==== Initializations ====
Dim As String Blnk =_
!"                                        "_
!"                                        "
Dim As Integer CONT = 1 ' CONTinue with program
Dim As String *4 sKey ' Inkey$ variable
Dim As Integer iGkey 'GetKey variable
' -------------------------------------
Dim As Zstring *80 sXYarray(5000,1)
Dim As Double dXarray(5000,1)
Dim As Double dYarray(5000,1)
Dim As Integer NumDataPts = 0 ' No. data points
' -------------------------------------
Dim As Integer i ' For loop indexers
Dim As Integer k
' -------------------------------------
Dim As Integer fileHandle ' File load and save
Dim As String fileName
Dim As String fileNameOutput
' -------------------------------------
Dim As Integer Delim(1,4) ' String divide routine
' -------------------------------------
Dim As Zstring *80 ReadMeText ' Help/readme variable
Dim As String fileNameRM
' -------------------------------------
Dim As Integer RowNum = 0 ' Display data
Dim As Integer PageN
' -------------------------------------
Dim As Integer iHowMuch ' Input points variables
Dim As String sHowMuch
' -------------------------------------
Dim As Integer iDelPnt ' Delete point variables
Dim As String sDelPnt
Dim As String confirmD
' -------------------------------------
Dim As Double dSumX, dSumY ' Calculate and plot variables
Dim As Double dMeanX, dMeanY
Dim As Double dSX, dSY
Dim As Double dStdX, dStdY
Dim As Double dCorr
Dim As Double dSlope, dIntercept, dInterceptABS
Dim As Zstring *2 zSign
Dim As Ubyte bCheckCalc = 0
Dim As Double dMinX, dMinY ' Plot window
Dim As Double dMaxX, dMaxY
Dim As Double dStep, dX, dY
' -------------------------------------
' Screen and window attributes
ScreenRes 640,960,32
Width 640\8, 960\16 ' 8x16 characters, 80columnsx60rows
' Set background color to blue
Color RGB(0,0,128),RGB(0,0,128)
Line (0,0)-(639,959), ,bf
WindowTitle "Lin-Regressor 0.1"

' ==== Splash ====
#include "./units/splash.bas"
While Inkey$ <> "": Wend ' Flush the buffer
' ================
' Clear the screen before starting
Cls
' ==== Start Main Program Loop ================================================
While CONT <> 0
Menu:
' ==== Menu & Input ====
Color RGB(255,255,0),RGB(0,0,128) ' Yellow on med. blue
Line (0,8)-(640,8)
Color RGB(255,255,255),RGB(0,0,128)
Locate 2,32 : Print "Lin-Regressor 0.1"
Color RGB(255,255,0),RGB(0,0,128)
Locate 3,32 : Print "-----------------"

Color RGB(255,255,255),RGB(0,0,128)
Locate 5,25 : Print "  [1] Load/Save data points"
Locate 7,25 : Print "  [2] Enter data points"
Locate 9,25 : Print "  [3] View data points"
Locate 11,25 : Print "  [4] Delete point"
Locate 13,25 : Print "  [5] Calculate & plot regression"
Locate 15,25 : Print "  [6] Quit"
Locate 17,25 : Print "  [7] Help: display readme"
Locate 20,25 : Print "Press a menu item letter. ";

Color RGB(255,255,0),RGB(0,0,128)
Line (0,904)-(640,904)
Locate 58,34 : Print Date$
Locate 59,35 : Print Time
Color RGB(255,255,255),RGB(0,0,128)

sKey = InKey$
Sleep 20 ' Take a little nap waiting for input
While Asc(sKey) < 49 or Asc(sKey) > 49+6 and CONT <> 0
	sKey = InKey$
	Sleep 20 ' Take a little nap waiting for input
    If Len(sKey)=0 Then
        Sleep 20 ' Take a little nap waiting for input
    ElseIf sKey = chr$(255)+"k" Then ' If the 'X' was clicked
        CONT = 0                    ' quit the program
    End If
Wend
' ======================

' ==== Selections ====
If Asc(sKey) = 49 Then
	'======================================
	'  OPTION 1 - Load/Save data points   '
	'======================================
	#include "./units/subMenuFileIO.bas"
	While Inkey$ <> "": Wend ' Flush the buffer
ElseIf Asc(sKey) = 50 Then
	'==================================
	'  OPTION 2 - Enter data points   '
	'==================================
	#include "./units/dataEntry.bas"
	While Inkey$ <> "": Wend ' Flush the buffer
	Cls
ElseIf	Asc(sKey) = 51 Then
	'=================================
	'  OPTION 3 - View data points   '
	'=================================
	If sXYarray(1,1) = "" Then
		Locate 22,15 : Print "No data in memory. Press any key to continue. ";
		While Inkey$ <> "": Wend ' Flush the buffer
		Sleep
		Cls
	Else
		#include "./units/dataView.bas"
		While Inkey$ <> "": Wend ' Flush the buffer
	End If
	While Inkey$ <> "": Wend ' Flush the buffer
	Cls
ElseIf	Asc(sKey) = 52 Then
	'=============================
	'  OPTION 4 - Delete point   '
	'=============================
	If sXYarray(1,1) = "" Then
		Locate 22,15 : Print "No data in memory. Press any key to continue. ";
		While Inkey$ <> "": Wend ' Flush the buffer
		Sleep
		Cls
	Else
		#include "./units/dataDelete.bas"
		While Inkey$ <> "": Wend ' Flush the buffer
	End If
	While Inkey$ <> "": Wend ' Flush the buffer
	Cls
ElseIf	Asc(sKey) = 53 Then
	'============================================
	'  OPTION 5 - Calculate & plot regression   '
	'============================================
		If sXYarray(1,1) = "" Then
		Locate 22,15 : Print "No data in memory. Press any key to continue. ";
		While Inkey$ <> "": Wend ' Flush the buffer
		Sleep
		Cls
	Else
		#include "./units/calcNplot.bas"
		While Inkey$ <> "": Wend ' Flush the buffer
	End If
	While Inkey$ <> "": Wend ' Flush the buffer
	Cls
ElseIf	Asc(sKey) = 54 Then
	'======================
	'  OPTION 6 - Quit    '
	'======================
	Cls
	CONT = 0 ' Signal quit
ElseIf	Asc(sKey) = 55 Then
	'====================================
	'  OPTION L - Help: display readme  '
	'====================================
	#include "./units/helpFile.bas" 'No Outputs
	While Inkey$ <> "": Wend ' Flush the buffer
	Cls
End If
' ====================
Wend
' ==== End Main Program Loop ==================================================
Print
End
' -----------------------------------------------------------------------------
