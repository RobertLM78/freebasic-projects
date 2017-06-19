' -----------------------------------------------------------------------------
' Title: fileUpdate.bas - translation unit for LibMasterFBG.bas
' Version: 0.2 - June 2017
' Author: Robert Lock - beannachtai@homtail.com
' License: GPL v3
' About: Outputs CAT(),RecNUM
' -----------------------------------------------------------------------------
' ==== Unit title and Input ====
Cls
Color rgbCyan, rgbBlack 'Cyan on Black
Print "LibMasterFBG-0.2  -  Data Entry Mode"
Print "------------------------------------"
Color rgbWhite, rgbBlack 'White on Black
Print
' Input number of records
Input "How many records to enter?: ",sHowMuch
lHowMuch = Val(sHowMuch)
If lHowMuch = -1 Then
	Cls
	Goto Menu:
End If
While sHowMuch = "" or lHowMuch < 1
	Print "Enter a positive integer. "
	Input "How many records to enter?: ",sHowMuch
	lHowMuch = Val(sHowMuch)
	If lHowMuch = -1 Then
		Cls
		Goto Menu:
	End If
Wend

' Reallocate memory
wRecNumMem = wRecNum + lHowMuch
#include "./units/allocate.bas"

' Start inputting data
For i = wRecNum + 1 to wRecNum + lHowMuch
	Color rgbCyan, rgbBlack 'Cyan on Black
	Print Str$(i-wRecNum)&":[Rec: "&Str$(i)&"]"
	Color rgbWhite, rgbBlack 'White on Black

	' Enter title
	Input "Enter a title(110 char):  ",zTIT
	zTIT = Trim$(zTIT)
	While zTIT = ""
		Input "Enter a title(110 char):  ",zTIT
		zTIT = Trim$(zTIT)
	Wend
	' Check if the title is there already
	For k = 1 to wRecNum
		If Instr(Lcase$(zpTIT[(k-1)*bTITmax]),Lcase$(zTIT)) = 1 Then
			Print "Title already entered!!  Press any key to return to menu. ";
			Sleep
			Cls
			Goto Menu:
		End If
	Next
	zpTIT[(i-1)*bTITmax] = zTIT

	' Enter authors
	Input "Enter Author(Singly, up to 3,(20 char)): ",zAUT
	zAUT = Trim$(zAUT)
	If zAUT = "" Then
		zAUT = " "
	End If
	zpAUT0[(i-1)*bAUTmax] = zAUT
	Input "Enter Author(Singly, up to 3,(20 char)): ",zAUT
	zAUT = Trim$(zAUT)
	If zAUT = "" Then
		zAUT = " "
	End If
	zpAUT1[(i-1)*bAUTmax] = zAUT
	Input "Enter Author(Singly, up to 3,(20 char)): ",zAUT
	zAUT = Trim$(zAUT)
	If zAUT = "" Then
		zAUT = " "
	End If
	zpAUT2[(i-1)*bAUTmax] = zAUT

	' Enter subject
	Input "Enter a subject:   ",zSUBJ
	zSUBJ = Ucase$(Trim$(zSUBJ))
	If zSUBJ = "" Then
		zSUBJ = "NOSUB"
	End If
	zpSUBJ[(i-1)*bSUBJmax] = zSUBJ

	' Enter notes
	Input "Enter notes:    ",zNTS
	zNTS = Trim$(zNTS)
	If zNTS = "" Then
		zNTS = " "
	End If
	zpNTS[(i-1)*bNTSmax] = zNTS

	Print
Next

' Update wRecNum
wRecNum = wRecNum + lHowMuch
' Update zpCAT[]
#include "./units/strCat.bas"

' Finished updating
Print "Catalog updated. Press any key to save. ";
Sleep
Print : Print
While Inkey$ <> "": Wend ' Flush the buffer
' ==============================

' Input file name
Input "Enter a file name (type <DEF> for default file name): ",sFileName
While sFileName = ""
	Input "Enter a file name (type <DEF> for default file name): ",sFileName
Wend
' Then check to see if we want the default
If Lcase$(sFileName) = "<def>" Then
	sFileName = "catalog.dat"
End If

' ==== Append File ====
wFileHandle = FreeFile() ' grab a free filehandle number

Open sFileName For Append As #wFileHandle
For i = wRecNum - lHowMuch + 1 to wRecNum
	Print #wFileHandle, zpCAT[(i-1)*bCATmax]
Next
    Close #wFileHandle
	Print "File saved successfully.  Press any key to continue. ";
	Sleep
	Cls
' =====================
' -----------------------------------------------------------------------------
