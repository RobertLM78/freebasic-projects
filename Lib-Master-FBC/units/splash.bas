' -----------------------------------------------------------------------------
' Title: splash.bas - generic console splash
' Version: 0.1 - May 2017
' Author: Robert Lock - beannachtai@homtail.com
' License: GPL v3
' -----------------------------------------------------------------------------
Cls
Print "LibMasterFBC-0.2; Copyright (C) 2017  Robert Lock (RobertLM78) - beannachtai@hotmail.com"
Print "This program comes with ABSOLUTELY NO WARRANTY; for details press 'w'."
Print "This is free software, and you are welcome to redistribute it"
Print "under certain conditions; press `c' for details.  Otherwise press any key. ";

wKey = GetKey

If wKey = 99 Then
	'#######################
    '# OPTION C Conditions #
	'#######################
	Print
	Print
	Print "Library Master FBC 0.2 - A port of the RBL classic program to FreeBASIC"
	Print "Copyright (C) 2017  Robert Lock (RobertLM78)"
	Print
	Print
	Print "This program is free software: you can redistribute it and/or modify"
	Print "it under the terms of the GNU General Public License as published by "
	Print "the Free Software Foundation, either version 3 of the License, or"
	Print "(at your option) any later version."
	Print
	Print
	Print "Press 'w' for warranty or any key to continue. ";
	wKey = GetKey
	If wKey = 119 Then
		'######################
		'# OPTION W Warranty  #
		'######################
		Print
		Print
		Print "This program is distributed in the hope that it will be useful,"
		Print "but WITHOUT ANY WARRANTY; without even the implied warranty of"
		Print "MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the"
		Print "GNU General Public License for more details."
		Print
		Print
		Print "You should have received a copy of the GNU General Public License"
		Print "along with this program.  If not, see <http://www.gnu.org/licenses/>."
		Print
		Print
		Print "Press any key to continue. ";
		wKey = GetKey
	End If
ElseIf wKey = 119 Then
	'######################
	'# OPTION W Warranty  #
	'######################
	Print
	Print
	Print "This program is distributed in the hope that it will be useful,"
	Print "but WITHOUT ANY WARRANTY; without even the implied warranty of"
	Print "MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the"
	Print "GNU General Public License for more details."
	Print
	Print
	Print "You should have received a copy of the GNU General Public License"
	Print "along with this program.  If not, see <http://www.gnu.org/licenses/>."
	Print
	Print
	Print "Press 'c' for conditions or any key to continue. ";
	wKey = GetKey
	If wKey = 99 Then
		'#######################
 	   '# OPTION C Conditions #
		'#######################
		Print
		Print
		Print "Library Master FBC 0.2 - A port of the RBL classic program to FreeBASIC"
		Print "Copyright (C) 2017  Robert Lock (RobertLM78)"
		Print
		Print
		Print "This program is free software: you can redistribute it and/or modify"
		Print "it under the terms of the GNU General Public License as published by "
		Print "the Free Software Foundation, either version 3 of the License, or"
		Print "(at your option) any later version."
		Print
		Print
		Print "Press any key to continue. ";
		wKey = GetKey
	End If
End If
' -----------------------------------------------------------------------------
