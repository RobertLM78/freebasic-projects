' -----------------------------------------------------------------------------
' Title: fileLoad.bas - translation unit for LibMasterFBC.bas
' Version: 0.4 - Sept 2026
' Author: Robert Lock - beannachtai@homtail.com
' License: GPL v3
' About: Outputs zpCAT[ ], wRecNum
' -----------------------------------------------------------------------------
' ==== Unit title and Input ====
Cls
Print sLibMsterTitle &"  -  Load File"
Print "------------------------------"
'Print

If sFileName = "" Then
    Locate 20,1 : Print "Current database:  No File loaded"
Else
    Locate 20,1 : Print "Current database: " &sFileName
End If

Locate 22,9 : Print Date$
Locate 23,10 : Print Time

If sFileName <> "" Then
    sTempFileName = sFileName
End If

' Input file name
'Locate ,,1  'Turn cursor on
Locate 4,1,1 : Input "Enter a file name (type <back> to return to the menu): ",sFileName
While sFileName = ""
	Locate 4,1,1 : Input "Enter a file name (type <back> to return to the menu): ",sFileName
Wend
' Then check to see if we want the default or to go back to main menu
If Lcase$(sFileName) = "<def>" Then
	sFileName = "catalog.dat"
ElseIf	Lcase$(sFileName) = "<back>" Then
    sFileName = sTempFileName : sTempFileName = ""
	Cls
	Goto Menu:
End If
' ==============================

' ==== Load File ====
wFileHandle = FreeFile() ' grab a free filehandle number

' Error and existence check
If Open(sFileName For Input As #wFileHandle) <> 0 Then ' DNE
    Print "File Not Found!  Press any key to return to the menu. ";
    sFileName = sTempFileName : sTempFileName = ""
	Sleep
	Cls
Else ' DE - set wRecNum and load file into memory
    Locate ,,0  'Turn cursor off
	' First determine how many records there are
	wRecNum = 0 ' Initialize record numbers
	While Eof(wFileHandle) = 0
		wRecNum += 1
		Line Input #wFileHandle, zCAT
	Wend
	zCAT = ""
	Close #wFileHandle

	' Next reallocate memory
	wRecNumMem = wRecNum
	#include "./units/allocate.bas"

	' Then load data to memory
	Open sFileName For Input As #wFileHandle
	wRecNum = 0 ' Reset record numbers
	While Eof(wFileHandle) = 0
		wRecNum += 1
		Line Input #wFileHandle, zpCAT[(wRecNum-1)*bCATmax], 205 'Line Input # for ptr now requires a max_length
	Wend
    Close #wFileHandle
	Print "File loaded successfully.  Press any key to continue. ";
    Locate 20,20 : Print "                                             "
    Locate 20,1 : Print "Current database: " &sFileName
    dTime = Timer()
    sKey = Lcase(Inkey$)
    While sKey = ""
        sKey = Lcase(Inkey$)
        If Abs(Timer()-dTime) > 1 Then
            updateTime()
            dTime = Timer()
        End If
        Sleep 20 ' Take a little nap waiting for input
    Wend
	'Sleep
	Cls
End If
' ===================
' -----------------------------------------------------------------------------
