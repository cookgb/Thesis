makeplot
	define pw 8.5
	define ph 11
	define top 10
	define bottom 7.25
	define left 2
	define right 7
	define t (int(32767*$top/$ph))
	define b (int(32767*$bottom/$ph))
	define l (int(32767*$left/$pw))
	define r (int(32767*$right/$pw))
	location $l $r $b $t
	data "H1P+.data"
	read P 1
	read E 2
	read M 3
	define n (dimen(P))
	set PoM = P/M
	set EoM = E/M
	set ErestoM = sqrt(EoM*EoM - PoM*PoM)
	set EradoM = ErestoM - 1
	set Eff = int(1000*EradoM/ErestoM + 0.5)/10
	set V = int(1000*P/E + 0.5)/1000
	limits 0 3.6 0 4.1
	erase
	expand 0.6
	box
	xlabel P/M
	ylabel Energy/M
	expand 0.45
	relocate 2 2.2
	putlabel 6 Total Energy
	relocate 1 1
	putlabel 3 Rest Energy
	relocate 2.05 0.25
	putlabel 3 Maximum Radiation Energy
	relocate 2 0.45
	putlabel 7 (Maximum Radiation Efficiency)
	relocate 1.3 2.2
	putlabel 7 (Velocity)
	set sPoM = 0,PoM[$n-1],(PoM[$n-1]/100)
	spline PoM EoM sPoM sEoM
	connect sPoM sEoM
	points PoM EoM
	spline PoM ErestoM sPoM sErestoM
	connect sPoM sErestoM
	points PoM ErestoM
	spline PoM EradoM sPoM sEradoM
	connect sPoM sEradoM
	points PoM EradoM
	expand 0.35
	do i=1,$n-1 {
		define rx (PoM[$i])
		define ry (EoM[$i])
		relocate $rx $ry
		define vel (V[$i])
		putlabel 7 V = $vel
	}
	do i=1,$n-1 {
		define rx (PoM[$i])
		define ry (EradoM[$i])
		relocate $rx $ry
		define eff (Eff[$i])
		putlabel 7 $eff%
	}
