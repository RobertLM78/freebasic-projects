' -----------------------------------------------------------------------------
' Title: LibMasterFBC.bas - A port of the RBL classic program to FreeBASIC
' Version: 0.2 - June 2017
' Author: Robert Lock - beannachtai@homtail.com
' License: GPL v3
' About: Console version
' -----------------------------------------------------------------------------
' Define the console size, Windows-based systems
#ifdef __FB_WIN32__
	Const W = 125, H = 50
	Width W, H
#endif
' ==== Initializations ====
Dim As Byte bCONT = 1 ' CONTinue with program
Dim As String *4 sKey ' InKey$ variable
Dim As Short wKey     'GetKey variable
' -------------------------------------
Dim As zString Ptr zpCAT, zpCtmp     ' Data pointers - up to 65000 books (about 27 MBytes)
Dim As zString Ptr zpTIT, zpTtmp
Dim As zString Ptr zpAUT0, zpA0tmp
Dim As zString Ptr zpAUT1, zpA1tmp
Dim As zString Ptr zpAUT2, zpA2tmp
Dim As zString Ptr zpSUBJ, zpStmp
Dim As zString Ptr zpNTS, zpNtmp
zpCAT = Allocate(1) : *zpCAT = ""
zpAUT0 = Allocate(1) : *zpAUT0 = ""
zpAUT1 = Allocate(1) : *zpAUT1 = ""
zpAUT2 = Allocate(1) : *zpAUT2 = ""
zpSUBJ = Allocate(1) : *zpSUBJ = ""
zpNTS = Allocate(1) : *zpNTS = ""

Const As uByte bCATmax  = 205 ' max length of CAT string
Const As uByte bTITmax  = 110
Const As uByte bAUTmax  = 20
Const As uByte bSUBJmax = 5
Const As uByte bNTSmax  = 30

Dim As zString *bCATmax  zCAT
Dim As zString *bTITmax  zTIT
Dim As zString *bAUTmax  zAUT
Dim As zString *bSUBJmax zSUBJ
Dim As zString *bNTSmax  zNTS
' -------------------------------------
Dim As uShort wRecNum        ' No. records
Dim As uShort wRecNumMem     ' For memory allocation
' -------------------------------------
Dim As uShort i              ' For loop indexers
Dim As uShort k
' -------------------------------------
Dim As Short  wFileHandle    ' File load and save
Dim As String sFileName
' -------------------------------------
Dim As uByte  bDelim(1,6)    ' String divide routine
' -------------------------------------
Dim As uByte   bRowNum = 0   ' Title browser variables
Dim As uShort  wPageN
Dim As uShort  wRecMat(1,35) ' 35 rows per screen page - change accordingly (no more than 127)
Dim As Byte    bQuery        ' (may be negative)
' -------------------------------------
Dim As Long    lHowMuch      ' File update variables  (may be negative while still needing to be <= 65000, so Long)
Dim As String  sHowMuch
' -------------------------------------
Dim As Integer      n, P, M, SS, X, iSortDelim ' File sort variables
Dim As uShort       wColm = 16                 ' column number - GFX vers.
' -------------------------------------
Dim As Long   lDelRec        ' Delete record variables  (may be negative while still needing to be <= 65000, so Long)
Dim As String sDelRec
Dim As String sConfirmDel
' -------------------------------------
Dim As Zstring *90 zReadMeText ' Help/readme variable
' -------------------------------------
'#include once "./inc/dir.bi" ' Only if using the file attribute definitions
' =========================
' ==== Splash ====
#include "./units/splash.bas"
' ================


Cls ' Clear the screen before starting the loop
' ==== Start Main Program Loop ================================================
While bCONT <> 0

Menu:
' ==== Menu & Input ====
Print "LibMasterFBC-0.2"
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

sKey = InKey$
Sleep 20 ' Take a little nap waiting for input
While Asc(sKey) < 97 or Asc(sKey) > 97+12-1 '+12 menu items
	sKey = InKey$
	Sleep 20 ' Take a little nap waiting for input
Wend
' ======================

' ==== Selections ====
If Asc(sKey) = 97 Then
	'==============================
	'  OPTION A - Author Search   '
	'==============================
	If (*zpCat)[0] = 0 Then '(*zpCat)[0] = 0 is equivalent to Len(*zpCAT) = 0
		Print
		Print "No data in memory. Press any key to continue. ";
		While Inkey$ <> "": Wend ' Flush the buffer
		Sleep
		Cls
	Else
		#include "./units/searchAuthor.bas" 'No Outputs
		While Inkey$ <> "": Wend ' Flush the buffer
	End If
ElseIf Asc(sKey) = 98 Then
	'=============================
	'  OPTION B - Title Search   '
	'=============================
	If (*zpCat)[0] = 0 Then
		Print
		Print "No data in memory. Press any key to continue. ";
		While Inkey$ <> "": Wend ' Flush the buffer
		Sleep
		Cls
	Else
		#include "./units/searchTitle.bas" 'No Outputs
		While Inkey$ <> "": Wend ' Flush the buffer
	End If
ElseIf	Asc(sKey) = 99 Then
	'=============================
	'  OPTION C - Title Browse   '
	'=============================
	If (*zpCat)[0] = 0 Then
		Print
		Print "No data in memory. Press any key to continue. ";
		While Inkey$ <> "": Wend ' Flush the buffer
		Sleep
		Cls
	Else
		#include "./units/browseTitle.bas" 'No Outputs
		While Inkey$ <> "": Wend ' Flush the buffer
	End If
ElseIf	Asc(sKey) = 100 Then
	'===============================
	'  OPTION D - Subject Search   '
	'===============================
	If (*zpCat)[0] = 0 Then
		Print
		Print "No data in memory. Press any key to continue. ";
		While Inkey$ <> "": Wend ' Flush the buffer
		Sleep
		Cls
	Else
		#include "./units/searchSubject.bas" 'No Outputs
		While Inkey$ <> "": Wend ' Flush the buffer
	End If
ElseIf	Asc(sKey) = 101 Then
	'==============================
	'  OPTION E - Sort by Title   '
	'==============================
	If (*zpCat)[0] = 0 Then
		Print
		Print "No data in memory. Press any key to continue. ";
		While Inkey$ <> "": Wend ' Flush the buffer
		Sleep
		Cls
	Else
		#include "./units/fileSort.bas" 'No Outputs
		While Inkey$ <> "": Wend ' Flush the buffer
	End If
ElseIf	Asc(sKey) = 102 Then
	'================================
	'  OPTION F - Data Entry Mode   '
	'================================
	#include "./units/fileUpdate.bas" 'Outputs CAT(),RecNum
	#include "./units/strDiv.bas"   'Outputs TIT(),AUT(),SUBJ(),NTS()
	While Inkey$ <> "": Wend ' Flush the buffer
ElseIf	Asc(sKey) = 103 Then
	'================================
	'  OPTION G - Delete a Record   '
	'================================
	If (*zpCat)[0] = 0 Then
		Print
		Print "No data in memory. Press any key to continue. ";
		While Inkey$ <> "": Wend ' Flush the buffer
		Sleep
		Cls
	Else
		#include "./units/deleteRec.bas" 'Outputs CAT(),RecNUM
		While Inkey$ <> "": Wend ' Flush the buffer
	End If
ElseIf	Asc(sKey) = 104 Then
	'==========================
	'  OPTION H - Load File   '
	'==========================
	#include "./units/fileLoad.bas" 'Outputs CAT(),RecNum
	#include "./units/strDiv.bas"   'Outputs TIT(),AUT(),SUBJ(),NTS()
	While Inkey$ <> "": Wend ' Flush the buffer
ElseIf	Asc(sKey) = 105 Then
	'=========================
	'  OPTION I - Save File  '
	'=========================
	If (*zpCat)[0] = 0 Then
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
ElseIf	Asc(sKey) = 106 Then
	'============================
	'  OPTION J - Save & Quit   '
	'============================
	If (*zpCat)[0] = 0 Then
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
		bCONT = 0
	End If
ElseIf	Asc(sKey) = 107 Then
	'=====================
	'  OPTION K - Quit   '
	'=====================
	Cls
	Print "Quitting to shell..."
	bCONT = 0
ElseIf	Asc(sKey) = 108 Then
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
