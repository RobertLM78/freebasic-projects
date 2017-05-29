' -----------------------------------------------------------------------------
' Title: splash.bas - generic splash
' Version: 0.1 - May 2017
' Author: Robert Lock - beannachtai@homtail.com
' License: GPL v3
' -----------------------------------------------------------------------------
Cls
Print : Print
Color RGB(255,255,0),RGB(0,0,128)
Print "   Lin-Regressor 0.1"
Print "Copyright (C) 2017  Robert Lock (RobertLM78) - beannachtai@hotmail.com"
Print
Color RGB(255,255,255),RGB(0,0,128)
Print " This program comes with ABSOLUTELY NO WARRANTY."
Print " This is free software, and you are welcome to redistribute it"
Print " under certain conditions."
Print
Print
Color RGB(255,255,0),RGB(0,0,128)
Print "  Lin-Regressor 0.1 - A simple linear regression calculator and plotter"
Print "  Copyright (C) 2017  Robert Lock (RobertLM78)"
Color RGB(255,255,255),RGB(0,0,128)
Print
Color RGB(255,255,0),RGB(0,0,128)
Print " Conditions:"
Color RGB(255,255,255),RGB(0,0,128)
Print "  This program is free software: you can redistribute it and/or modify"
Print "  it under the terms of the GNU General Public License as published by "
Print "  the Free Software Foundation, either version 3 of the License, or"
Print "  (at your option) any later version."
Print
Color RGB(255,255,0),RGB(0,0,128)
Print " Warranty:"
Color RGB(255,255,255),RGB(0,0,128)
Print "  This program is distributed in the hope that it will be useful,"
Print "  but WITHOUT ANY WARRANTY; without even the implied warranty of"
Print "  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the"
Print "  GNU General Public License for more details."
Print
Print
Color RGB(255,255,0),RGB(0,0,128)
Print "You should have received a copy of the GNU General Public License"
Print "along with this program.  If not, see <http://www.gnu.org/licenses/>."
Color RGB(255,255,255),RGB(0,0,128)
While Inkey$ <> "": Wend ' Flush the buffer
Locate 30,25 : Print "Press any key to continue. ";
Sleep
Cls
' -----------------------------------------------------------------------------
