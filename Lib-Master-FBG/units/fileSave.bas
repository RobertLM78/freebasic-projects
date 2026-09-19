' -----------------------------------------------------------------------------
' Title: fileSave.bas - translation unit for LibMasterFBG.bas
' Version: 0.4 - Sept 2026
' Author: Robert Lock - beannachtai@homtail.com
' License: GPL v3
' About: No Outputs
' -----------------------------------------------------------------------------
' ==== Unit title and Input ====
Cls
Color rgbCyan, rgbBlack 'Cyan on Black
Print sLibMsterTitle &"  -  Save File"
Print "------------------------------"
Color rgbWhite, rgbBlack 'White on Black
'Print

If sFileName = "" Then
    Locate 43,3 : Print "  Current database:  No File loaded"
Else
    Locate 43,3 : Print "  Current database: " &sFileName
End If

Color rgbCyan, rgbBlack 'Cyan on Black
Locate 44,1 : Print clrLine
Locate 46,59 : Print Date
Locate 47,60 : Print Time
Color rgbWhite, rgbBlack 'White on Black

If sFileName <> "" Then
    sTempFileName = sFileName
End If

' Input file name
Locate 4,1 : Input "Enter a file name (type <back> to return to the menu): ",sFileName
While sFileName = ""
	Locate 4,1 : Input "Enter a file name (type <back> to return to the menu): ",sFileName
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

' ==== Save File ====
wFileHandle = FreeFile() ' grab a free filehandle number

Open sFileName For Output As #wFileHandle
For i = 1 to wRecNum
	Print #wFileHandle, zpCAT[(i-1)*bCATmax]
Next
    Close #wFileHandle
	Print "File saved successfully.  Press any key to continue. ";
    Locate 43,24 : Print "                                             "
    Locate 43,3 : Print "  Current database: " &sFileName
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
' ===================
' -----------------------------------------------------------------------------
