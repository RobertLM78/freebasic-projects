' -----------------------------------------------------------------------------
' Title: LibMasterFBC.bas - A port of the RBL classic program to FreeBASIC
' Version: 0.1 - May 2017
' Author: Robert Lock - beannachtai@homtail.com
' License: GPL v3
' About: FBC == FreeBASIC 'Console' version
' -----------------------------------------------------------------------------
' ==== Splash ====
#include "./units/splash.bas"
' ================

' ==== Initializations ====
Dim As Integer CONT = 1 ' CONTinue with program
Dim As String *4 inK ' InKey$ variable
Dim As Integer getK 'GetKey variable
' -------------------------------------
Dim Shared As Zstring *205 CAT(5000,1) ' Main data arrays - up to 5000 books
Dim Shared As Zstring *110 TIT(5000,1)
Dim Shared As Zstring *20 AUT(5000,3)
Dim Shared As Zstring *5 SUBJ(5000,1)
Dim Shared As Zstring *30 NTS(5000,1)
' -------------------------------------
Dim Shared As Integer RecNum ' No. records
' -------------------------------------
Dim As Integer i ' For loop indexers
Dim As Integer k
' -------------------------------------
Dim As Integer fileHandle ' File load and save
Dim As String fileName
' -------------------------------------
Dim As Integer Delim(1,6) ' String divide routine
' -------------------------------------
Dim As Zstring *20 AUTsrch ' Search variables
Dim As Zstring *110 TITsrch
Dim As Zstring *5 SUBJsrch
' -------------------------------------
Dim As Integer RowNum = 0' Title browser variables
Dim As Integer PageN
Dim As Integer RecMat(1,20) ' 20 rows per screen page - change accordingly
Dim As Integer queryDisp
' -------------------------------------
Dim As Integer iHowMuch ' File update variables
Dim As String sHowMuch
Dim As Zstring *110 TITtmp ' Also used in file sort
' -------------------------------------
Dim As Zstring *205 CATtmp ' File sort variables
Dim As Integer n,P,M,SS,X,sortDelim
' -------------------------------------
Dim As Integer iDelRec ' Delete record variables
Dim As String sDelRec
Dim As String confirmD
' -------------------------------------
Dim As Zstring *90 ReadMeText ' Help/readme variable
' -------------------------------------
'#include once "./inc/dir.bi" ' Only if using the file attribute definitions
' =========================
Cls ' Clear the screen before starting the loop
' ==== Start Main Program Loop ================================================
While CONT <> 0

Menu:
' ==== Menu & Input ====
Print "LibMasterFBC-0.1"
Print "----------------"
Print
Print "  [A] Author Search"
Print "  [B] Title Search"
Print "  [C] Title Browser"
Print "  [D] Subject Search"
Print "  [E] Sort by Title"
Print "  [F] Data Entry Mode"
Print "  [G] Delete a Record"
Print "  [H] Load File"
Print "  [I] Save File"
Print "  [J] Save & Quit"
Print "  [K] Quit"
Print "  [L] Help: display readme"
Print
Print "Press a menu item letter. ";

inK = InKey$
Sleep 20 ' Take a little nap waiting for input
While Asc(InK) < 97 or Asc(InK) > 97+12-1 '+12 menu items
	inK = InKey$
	Sleep 20 ' Take a little nap waiting for input
Wend
' ======================

' ==== Selections ====
If Asc(inK) = 97 Then
	'==============================
	'  OPTION A - Author Search   '
	'==============================
	If CAT(1,1) = "" Then
		Print
		Print "No data in memory. Press any key to continue. ";
		While Inkey$ <> "": Wend ' Flush the buffer
		Sleep
		Cls
	Else
		#include "./units/searchAuthor.bas" 'No Outputs
		While Inkey$ <> "": Wend ' Flush the buffer
	End If
ElseIf Asc(inK) = 98 Then
	'=============================
	'  OPTION B - Title Search   '
	'=============================
	If CAT(1,1) = "" Then
		Print
		Print "No data in memory. Press any key to continue. ";
		While Inkey$ <> "": Wend ' Flush the buffer
		Sleep
		Cls
	Else
		#include "./units/searchTitle.bas" 'No Outputs
		While Inkey$ <> "": Wend ' Flush the buffer
	End If
ElseIf	Asc(inK) = 99 Then
	'=============================
	'  OPTION C - Title Browse   '
	'=============================
	If CAT(1,1) = "" Then
		Print
		Print "No data in memory. Press any key to continue. ";
		While Inkey$ <> "": Wend ' Flush the buffer
		Sleep
		Cls
	Else
		#include "./units/browseTitle.bas" 'No Outputs
		While Inkey$ <> "": Wend ' Flush the buffer
	End If
ElseIf	Asc(inK) = 100 Then
	'===============================
	'  OPTION D - Subject Search   '
	'===============================
	If CAT(1,1) = "" Then
		Print
		Print "No data in memory. Press any key to continue. ";
		While Inkey$ <> "": Wend ' Flush the buffer
		Sleep
		Cls
	Else
		#include "./units/searchSubject.bas" 'No Outputs
		While Inkey$ <> "": Wend ' Flush the buffer
	End If
ElseIf	Asc(inK) = 101 Then
	'==============================
	'  OPTION E - Sort by Title   '
	'==============================
	If CAT(1,1) = "" Then
		Print
		Print "No data in memory. Press any key to continue. ";
		While Inkey$ <> "": Wend ' Flush the buffer
		Sleep
		Cls
	Else
		#include "./units/fileSort.bas" 'No Outputs
		While Inkey$ <> "": Wend ' Flush the buffer
	End If
ElseIf	Asc(inK) = 102 Then
	'================================
	'  OPTION F - Data Entry Mode   '
	'================================
	#include "./units/fileUpdate.bas" 'Outputs CAT(),RecNum
	#include "./units/strDiv.bas"   'Outputs TIT(),AUT(),SUBJ(),NTS()
	While Inkey$ <> "": Wend ' Flush the buffer
ElseIf	Asc(inK) = 103 Then
	'================================
	'  OPTION G - Delete a Record   '
	'================================
	If CAT(1,1) = "" Then
		Print
		Print "No data in memory. Press any key to continue. ";
		While Inkey$ <> "": Wend ' Flush the buffer
		Sleep
		Cls
	Else
		#include "./units/deleteRec.bas" 'Outputs CAT(),RecNUM
		While Inkey$ <> "": Wend ' Flush the buffer
	End If
ElseIf	Asc(inK) = 104 Then
	'==========================
	'  OPTION H - Load File   '
	'==========================
	#include "./units/fileLoad.bas" 'Outputs CAT(),RecNum
	#include "./units/strDiv.bas"   'Outputs TIT(),AUT(),SUBJ(),NTS()
	While Inkey$ <> "": Wend ' Flush the buffer
ElseIf	Asc(inK) = 105 Then
	'=========================
	'  OPTION I - Save File  '
	'=========================
	If CAT(1,1) = "" Then
		Print
		Print "No data in memory. Press any key to continue. ";
		While Inkey$ <> "": Wend ' Flush the buffer
		Sleep
		Cls
	Else
		#include "./units/strCat.bas"   'Outputs CAT()
		#include "./units/fileSave.bas" 'No Outputs
		While Inkey$ <> "": Wend ' Flush the buffer
	End If
ElseIf	Asc(inK) = 106 Then
	'============================
	'  OPTION J - Save & Quit   '
	'============================
	If CAT(1,1) = "" Then
		Print
		Print "No data in memory. Press any key to continue. ";
		While Inkey$ <> "": Wend ' Flush the buffer
		Sleep
		Cls
	Else
		#include "./units/strCat.bas"   'Outputs CAT()
		#include "./units/fileSave.bas" 'No Outputs
		While Inkey$ <> "": Wend ' Flush the buffer
		Cls
		Print "Quitting to shell..."
		CONT = 0
	End If
ElseIf	Asc(inK) = 107 Then
	'=====================
	'  OPTION K - Quit   '
	'=====================
	Cls
	Print "Quitting to shell..."
	CONT = 0
ElseIf	Asc(inK) = 108 Then
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
