' -----------------------------------------------------------------------------
' Title: allocate.bas - translation unit for LibMasterFBC.bas
' Version: 0.1 - June 2017
' Author: Robert Lock - beannachtai@homtail.com
' License: GPL v3
' About: Reassigns memory - checks for errors
' -----------------------------------------------------------------------------
zpCtmp  = ReAllocate(zpCAT, wRecNumMem * bCATmax)
zpTtmp  = ReAllocate(zpTIT, wRecNumMem * bTITmax)
zpA0tmp = ReAllocate(zpAUT0, wRecNumMem * bAUTmax)
zpA1tmp = ReAllocate(zpAUT1, wRecNumMem * bAUTmax)
zpA2tmp = ReAllocate(zpAUT2, wRecNumMem * bAUTmax)
zpStmp  = ReAllocate(zpSUBJ, wRecNumMem * bSUBJmax)
zpNtmp  = ReAllocate(zpNTS, wRecNumMem * bNTSmax)

If zpCtmp = 0 orElse zpTtmp = 0 orElse zpA0tmp = 0 orElse zpA1tmp = 0 _
orElse zpA2tmp = 0 orElse zpStmp = 0 orElse zpNtmp = 0 Then ' quit gracefully if there's an error
	Print "Error allocating memory... Press any key to quit."
	Sleep
	DeAllocate(zpCAT) : DeAllocate(zpTIT) : DeAllocate(zpAUT0) : DeAllocate(zpAUT1)
	DeAllocate(zpAUT2) : DeAllocate(zpSUBJ) : DeAllocate(zpNTS)
	System 0
Else
	zpCAT = zpCtmp
	zpTIT = zpTtmp
	zpAUT0 = zpA0tmp
	zpAUT1 = zpA1tmp
	zpAUT2 = zpA2tmp
	zpSUBJ = zpStmp
	zpNTS = zpNtmp
End If
' -----------------------------------------------------------------------------
