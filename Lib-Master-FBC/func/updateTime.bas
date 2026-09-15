' -----------------------------------------------------------------------------
' Title: updateTime.bas - function for LibMasterFBC.bas
' Version: 0.1 - Sept 2026
' Author: Robert Lock - beannachtai@homtail.com
' License: GPL v3
' About: updates the time on the main screen
' -----------------------------------------------------------------------------
Function updateTime() As String
    Locate 19,9 : Print Date$
    Locate 20,10 : Print Time
    Return ""
End Function
' -----------------------------------------------------------------------------