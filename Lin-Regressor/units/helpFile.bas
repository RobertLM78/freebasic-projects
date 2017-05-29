' -----------------------------------------------------------------------------
' Title: helpFile.bas - translation unit for Lin-Regressor.bas
' Version: 0.1 - May 2017
' Author: Robert Lock - beannachtai@homtail.com
' License: GPL v3
' About: No Outputs
' -----------------------------------------------------------------------------
' ==== Prep screen ====
Cls
Print
' =====================
RowNum = 0
' ==== Load and print readme file ====
fileNameRM = "readme"
fileHandle = FreeFile() ' grab a free filehandle number
Open fileNameRM For Input As #fileHandle
While Eof(fileHandle) = 0
	RowNum += 1
	Line Input #fileHandle, ReadMeText
	Print ReadMeText
	If RowNum = 59 Then
		RowNum = 0
		While Inkey$ <> "": Wend ' Flush the buffer
		Print "Press any key to continue. ";
		Sleep
		Cls
	End If
Wend
Close #fileHandle
Print
Print "Press any key to continue. ";
Sleep
Cls
' ====================================
' -----------------------------------------------------------------------------
