makeplot
	define pw 8.5
	define ph 11
	define top 10.125
	define bottom 7.5
	define left 2.5
	define right 7
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
	set SoM2 = S/(M*M)
	set EoM = E/M
	set EradoM = EoM - sqrt(1 + 0.25*SoM2*SoM2)
	set Eff = int(1000*EradoM/EoM + 0.5)/10
	limits 0 1.7 0 1.5
	erase
	expand 0.6
	define length ($r - $l)
	axis 0 1.7 0.1 0.5 $l $b $length 1 0
	axis 0 1.7 0.1 0.5 $l $t $length 0 1
	angle 90
	define length ($t - $b)
	axis 0 1.5 0.1 0.5 $l $b $length 2 1
	limits 0 1.7 0 0.045
	axis 0 0.045 0.003 0.015 $r $b $length 2 0
	angle 0
	limits 0 1.7 0 1.5
	xlabel S/M^2
	ylabel Total Energy/M
	angle 90
	define ypos (0.5*($t + $b))
	define xpos ($r + 2300)
	relocate ($xpos $ypos)
	putlabel 5 Radiation Energy/M
	angle 0
	expand 0.45
	relocate 1 1.15
	putlabel 7 Total Energy
	relocate 0.9 0.15
	putlabel 3 Maximum Radiation Energy
	relocate 1 0.35
	putlabel 7 (Maximum Radiation Efficiency)
	set sSoM2 = 0,SoM2[$n-1],(SoM2[$n-1]/100) 
    spline SoM2 EoM sSoM2 sEoM
	connect sSoM2 sEoM
	points SoM2 EoM
	limits 0 1.7 0 0.045
    spline SoM2 EradoM sSoM2 sEradoM
	connect sSoM2 sEradoM
	points SoM2 EradoM
	expand 0.35
	do i=1,$n-1 {
		relocate SoM2[$i] EradoM[$i]
		define eff Eff[$i]
		if($eff < 1) {
			putlabel 7 0$eff% 
		} else {
			putlabel 7 $eff%
		}
	}
