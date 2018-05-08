' Title: sIkInputFn.bas - Inkey$ Input Function
' Version: 0.5 - May 2018
' Author: Robert Lock - beannachtai@hotmail.com
' License: GPL v3
' Function sIkInputFn(Prompt,Length) - returns a final entered string
' ==============================================================================
#include "fbgfx.bi" 'This is for processing the special keyboard keys like HOME
Function sIkInputFn(sPrompt As String = "", iLen As Integer = 16) As String

Dim As String  sInput
Dim As Integer iInput
Dim As String  sFinput
Dim As Integer iPosit
Dim As Integer iArrowCnt
Dim As Integer iUpCnt
Dim As String  sHome_Path
Dim As String  sHstFile = ".GematriaFBC_hist"
Dim As uLong   lHstFileHandle
Dim As Integer iHstLen
'=============  Get $HOME path for history file  =============
#ifdef __FB_LINUX__
	sHome_Path = Environ("HOME") & "/"
#endif
#ifdef __FB_WIN32__
	sHome_Path = Environ("HOMEDRIVE") & Environ("HOMEPATH") & "\"
#endif
If sHome_Path <> "" Then
	sHstFile = sHome_Path & sHstFile
End If
'=============================================================

Print sPrompt;
Do
	sInput = Inkey$
	If Len(sInput) Then
		iInput = sInput[0]
		If iInput = 255 Then iInput = -sInput[1]
		Select Case iInput
			Case -fb.SC_HOME   'HOME
				Locate ,Len(sPrompt) + 1,1
				iArrowCnt = -iPosit
			Case -fb.SC_END    'END
				Locate ,iPosit + Len(sPrompt) + 1,1
				iArrowCnt = 0
			Case -fb.SC_DELETE 'DELETE
				If iArrowCnt = 0 or iArrowCnt = -iPosit Then
					Locate ,,1
				ElseIf iArrowCnt < 0 Then
					sFinput = Left$(sFinput,Len(sFinput)+iArrowCnt) + Right$(sFinput,-iArrowCnt - 1)
					iPosit -=1
					iArrowCnt +=1
					Locate ,Pos - 1,1
					Print Right$(sFinput,-iArrowCnt + 1) &" ";
					Locate ,Pos - (-iArrowCnt) - 1
				End If
			Case -fb.SC_UP     'UP arrow
				iUpCnt += 1
				iHstLen = 0
				lHstFileHandle = FreeFile()
				If Open(sHstFile For Input As #lHstFileHandle) <> 0 Then
					lHstFileHandle = FreeFile()
					Open sHstFile for Output As #lHstFileHandle
					Print #lHstFileHandle, "entry 1"
					Close #lHstFileHandle
				Else
					While Eof(lHstFileHandle) = 0
						iHstLen += 1
						Line Input #lHstFileHandle, sFinput
					Wend
					Close #lHstFileHandle
					If iUpCnt > iHstLen Then         'If to the first entry
						Locate ,Len(sPrompt) + 1,1          'set cursor to default
						Open sHstFile For Input As #lHstFileHandle
						Line Input #lHstFileHandle, sFinput 'load up the first entry
						Close #lHstFileHandle
						iArrowCnt = -Len(sFinput)           'and set arrow count
						iPosit = Len(sFinput)
						iUpCnt = iHstLen  '===== STOP incrementing once it's to the top ====
					ElseIf iUpCnt <= iHstLen Then
						Open sHstFile For Input As #lHstFileHandle
						Locate ,Len(sPrompt) + 1 : Print String$(loword(width()) - 4," ");
						Locate ,Len(sPrompt) + 1,1
						iHstLen += 1 '====== add one extra  ======
						For i As Integer = 1 to (iHstLen - iUpCnt)
							Line Input #lHstFileHandle, sFinput
						Next
						Close #lHstFileHandle
						Print sFinput;
						iPosit = Len(sFinput)
						iArrowCnt = 0
					End If
				End If
			Case -fb.SC_DOWN   'DOWN arrow
				If iUpCnt = 0 Then
					Locate ,,1
				Else
					iUpCnt -= 1
					iHstLen = 0
					lHstFileHandle = FreeFile()
					If Open(sHstFile For Input As #lHstFileHandle) <> 0 Then
						Print "Error with filesytem.  Quitting to shell..."
						System 0
					Else
						While Eof(lHstFileHandle) = 0
							iHstLen += 1
							Line Input #lHstFileHandle, sFinput
						Wend
						Close #lHstFileHandle
						If iUpCnt > iHstLen Then
							Locate ,Len(sPrompt) + 1,1
						Else
							Open sHstFile For Input As #lHstFileHandle
							Locate ,Len(sPrompt) + 1 : Print String$(loword(width()) - 4," ");
							Locate ,Len(sPrompt) + 1,1
							iHstLen += 1 '====== add one extra  ======
							For i As Integer = 1 to (iHstLen - iUpCnt)
								Line Input #lHstFileHandle, sFinput
							Next
							Close #lHstFileHandle
							Print sFinput;
							iPosit = Len(sFinput)
							iArrowCnt = 0
						End If
					End If
				End If
			Case -fb.SC_LEFT   'LEFT arrow
				If iArrowCnt = -1*Len(sFinput) Then ' Is the cursor to the beginning of entry?
					Locate ,,1
				Else                                ' Else keep moving left
					Locate ,Pos - 1,1
					iArrowCnt -= 1
				End If
			Case -fb.SC_RIGHT  'RIGHT arrow
				If iArrowCnt < 0 Then     ' Allow the cursor right if it's been moved left
					Locate ,Pos + 1,1
					iArrowCnt += 1
				ElseIf iArrowCnt = 0 Then ' Is the cursor back to where it started?
					Locate ,,1
				End If
			Case 27            'ESC - Erases entire entry, repositions the cursor, and resets counters
				Locate ,Len(sPrompt) + 1 : Print String$(Len(sFinput)," ");
				Locate ,Len(sPrompt) + 1,1
				sFinput = ""
				iArrowCnt = 0
				iPosit = 0
			Case 8             'BACKSPACE
				If iPosit > 0 and iArrowCnt = 0 Then ' Something has been typed and cursor hasn't been adjusted
            		sFinput = Left$(sFinput,Len(sFinput)-1)
					iPosit -=1
					Locate ,Pos - 1,1
					Print " ";
					Locate ,Pos - 1
				ElseIf iPosit > 0 and iArrowCnt < 0 and iPosit <> -iArrowCnt Then ' Something has been typed
					sFinput = Left$(sFinput,Len(sFinput)+iArrowCnt - 1) + Right$(sFinput,-iArrowCnt)
					iPosit -=1                                                    ' and cursor has been adjusted
					Locate ,Pos - 1,1
					Print Right$(sFinput,-iArrowCnt) &" ";
					Locate ,Pos - (-iArrowCnt) - 1
				ElseIf iArrowCnt < 0 and iPosit = -iArrowCnt Then ' Check for prompt (lefthand)
					Locate ,,1
				ElseIf iPosit = 0 Then ' Nothing has been typed, so nothing to delete
					Locate ,Pos,1
				End If
			Case 32 to 122     'ASCII set minus last 4 symbols
				If iPosit = iLen Then
					Locate ,Pos,0 ' Turn off cursor when the end is reached
				ElseIf iArrowCnt < 0 Then ' The cursor has been adjusted with arrows
					sFinput = Left$(sFinput,Len(sFinput)+iArrowCnt) + sInput + Right$(sFinput,-iArrowCnt)
					Print sInput + Right$(sFinput,-iArrowCnt);
					Locate ,Pos + iArrowCnt
                    iPosit +=1
				Else                      ' Else The cursor hasn't been adjusted with arrows
					Print sInput;
					sFinput += sInput
					iPosit +=1
				End If
			Case 13            'ENTER
				If Len(sFinput) <> 0 and Mid$(sFinput,1,1) <> " " Then
					lHstFileHandle = FreeFile()
					Open sHstFile For Append As #lHstFileHandle
						Print #lHstFileHandle, sFinput
					Close #lHstFileHandle
					iUpCnt = 0
					Print
					Exit Do
				Else
					Locate ,,1
				End If
		End Select
		Else
			Sleep 1,1
		End If
Loop
Return sFinput
End Function
'Uncomment for testing (no other lines need mofification)
'Dim As String sTest : sTest = sIkInputFn(":> ", 50) : Print sTest

