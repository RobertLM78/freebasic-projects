' -----------------------------------------------------------------------------
' Title: splash.bas - generic splash
' Version: 0.3 - June 2017
' Author: Robert Lock - beannachtai@homtail.com
' License: GPL v3
' -----------------------------------------------------------------------------
Cls
Print : Print
Color rgbCyan, rgbBlack 'Cyan on Black
Print "		LibMasterFBG-0.2; Copyright (C) 2017  Robert Lock (RobertLM78) - beannachtai@hotmail.com"
Color rgbWhite, rgbBlack 'White on Black
Print "		This program comes with ABSOLUTELY NO WARRANTY."
Print "		This is free software, and you are welcome to redistribute it"
Print "		under certain conditions.";
Print
Print
Color rgbCyan, rgbBlack 'Cyan on Black
Print "		Library Master FBG 0.2 - A port of the RBL classic program to FreeBASIC"
Print "		Copyright (C) 2017  Robert Lock (RobertLM78)"
Color rgbWhite, rgbBlack 'White on Black
Print
Color rgbCyan, rgbBlack 'Cyan on Black
Print "		Conditions:"
Color rgbWhite, rgbBlack 'White on Black
Print "		This program is free software: you can redistribute it and/or modify"
Print "		it under the terms of the GNU General Public License as published by "
Print "		the Free Software Foundation, either version 3 of the License, or"
Print "		(at your option) any later version."
Print
Color rgbCyan, rgbBlack 'Cyan on Black
Print "		Warranty:"
Color rgbWhite, rgbBlack 'White on Black
Print "		This program is distributed in the hope that it will be useful,"
Print "		but WITHOUT ANY WARRANTY; without even the implied warranty of"
Print "		MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the"
Print "		GNU General Public License for more details."
Print
Print
Color rgbCyan, rgbBlack 'Cyan on Black
Print "		You should have received a copy of the GNU General Public License"
Print "		along with this program.  If not, see <http://www.gnu.org/licenses/>."
Color rgbWhite, rgbBlack 'White on Black
Locate 40,50 : Print "Press any key to continue. ";
Sleep
While Inkey$ <> "": Wend ' Flush the buffer
Cls
' -----------------------------------------------------------------------------
