makeplot
	define pw 8.5
	define ph 11
	define top 8
	define bottom 4.5
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
	set ChristodoulouM2 = 1 + 0.25*SoM2*SoM2 
	set EpsE = SoM2/(EoM*EoM)
	set EpsCh = SoM2/ChristodoulouM2
	limits 0 1.7 0 1.7
	erase
	expand 0.6
	box
	xlabel S/M^2
	ylabel Kerr Parameter
	expand 0.55
	set sSoM2 = 0,SoM2[$n-1],(SoM2[$n-1]/100)  
    spline SoM2 EpsCh sSoM2 sEpsCh
	connect sSoM2 sEpsCh
	points SoM2 EpsCh
	relocate 1.05 0.85
	putlabel 7 \epsilon_\mu
    spline SoM2 EpsE sSoM2 sEpsE
	connect sSoM2 sEpsE
	points SoM2 EpsE
	relocate 1.4 0.9
	putlabel 3 S/E^2
    spline SoM2 SoM2 sSoM2 sSoM2
	connect sSoM2 sSoM2
	points SoM2 SoM2
	relocate SoM2[3] SoM2[3]
	putlabel 7 S/M^2
	ltype 1
	relocate 0 1
	draw 1.7 1
	ltype 0

