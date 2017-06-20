' -----------------------------------------------------------------------------
' Title: helpFile.bas - translation unit for LibMasterFBG.bas
' Version: 0.1 - May 2017
' Author: Robert Lock - beannachtai@homtail.com
' License: GPL v3
' About: No Outputs
' -----------------------------------------------------------------------------
' ==== Prep screen ====
Cls
Print
' =====================
bRowNum = 0
' ==== Load and print readme file ====
sFileName = "readme"
wFileHandle = FreeFile() ' grab a free filehandle number
Open sFileName For Input As #wFileHandle
While Eof(wFileHandle) = 0
	bRowNum += 1
	Line Input #wFileHandle, zReadMeText
	Print zReadMeText
	If bRowNum = 45 Then
		bRowNum = 0
		While Inkey$ <> "": Wend ' Flush the buffer
		Print "Press any key to continue. ";
		Sleep
		Cls
	End If
Wend
Close #wFileHandle
Print
Print "Press any key to continue. ";
Sleep
Cls
' ====================================
' -----------------------------------------------------------------------------
