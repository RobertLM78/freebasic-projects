' beautyofmath.bas

Dim As Integer bN,a,m,R
Dim As Zstring *10 sBn

m = 8
bN = 1

For a = 1 to 9
	R = bN * m + a
	Print Using "######### x # + # = #########";bN;m;a;R
	sBn = Str$(bN)&Str$(a+1)
	bN = Val(sBn)
Next

Sleep
End
