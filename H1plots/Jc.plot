makeplot
	define pw 8.5
	define ph 11
	define top  10.0  #8.625
	define bottom 7.25  #5.875
	define left 2
	define right 6.75
	define t (int(32767*$top/$ph))
	define b (int(32767*$bottom/$ph))
	define l (int(32767*$left/$pw))
	define r (int(32767*$right/$pw))
	location $l $r $b $t
	data "H1J.data"
	read S 1
	read E 2
	read M 3
	define n (dimen(S))
	set Mc = sqrt(M*M + 0.25*S*S/(M*M))
	set SoM2 = S/(Mc*Mc)
	set EoM = E/Mc
	set EradoM = EoM - 1
	set Eff = int(1000*EradoM/EoM + 0.5)/10
	limits 0 1.05 0 1.1
	erase
	expand 0.6
	define length ($r - $l)
	axis 0 1.05 0.1 0.5 $l $b $length 1 0
	axis 0 1.05 0.1 0.5 $l $t $length 0 1
	angle 90
	define length ($t - $b)
	axis 0 1.1 0.1 0.5 $l $b $length 2 1
	limits 0 1.05 0 0.044
	axis 0 0.044 0.004 0.02 $r $b $length 2 0
	angle 0
	limits 0 1.05 0 1.1
	xlabel S/M^2
	ylabel Total Energy/M
	angle 90
	define ypos (0.5*($t + $b))
	define xpos ($r + 2300)
	relocate ($xpos $ypos)
	putlabel 5 Radiation Energy/M
	angle 0
	expand 0.45  ### was 0.55
	relocate 0.8 0.98
	putlabel 1 Total Energy
	relocate 1.01 0.15
	putlabel 1 Maximum
	relocate 1.01 0.1
	putlabel 1 Radiation Energy
	relocate 0.8 0.23
	putlabel 7 (Maximum Radiation Efficiency)
	set sSoM2 = 0,SoM2[$n-1],(SoM2[$n-1]/100) 
	spline SoM2 EoM sSoM2 sEoM
	connect sSoM2 sEoM
	points SoM2 EoM
	limits 0 1.05 0 0.044
	spline SoM2 EradoM sSoM2 sEradoM
	connect sSoM2 sEradoM
	points SoM2 EradoM
	expand 0.35 ### was 0.45
	do i=1,$n-1 {
		define rx (SoM2[$i])
		define ry (EradoM[$i])
		relocate $rx $ry
		define eff (Eff[$i])
		putlabel 7 $eff%
	}
