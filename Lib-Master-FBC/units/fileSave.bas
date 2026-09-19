' -----------------------------------------------------------------------------
' Title: fileSave.bas - translation unit for LibMasterFBC.bas
' Version: 0.4 - Sept 2026
' Author: Robert Lock - beannachtai@homtail.com
' License: GPL v3
' About: No Outputs
' -----------------------------------------------------------------------------
' ==== Unit title and Input ====
Cls
Print sLibMsterTitle &"  -  Save File"
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

' ==== Save File ====
wFileHandle = FreeFile() ' grab a free filehandle number
    Locate ,,0  'Turn cursor off

Open sFileName For Output As #wFileHandle
For i = 1 to wRecNum
	Print #wFileHandle, zpCAT[(i-1)*bCATmax]
Next
    Close #wFileHandle
	Print "File saved successfully.  Press any key to continue. ";
    Locate 20,20 : Print "                                             "
    Locate 20,1 : Print "Current database: " &sFileName
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
