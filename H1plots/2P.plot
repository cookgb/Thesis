makeplot
	data "H1P+.data"
	read Pp 1
	read Ep 2
	read Mp 3
	data "H1P-.data"
	read Pm 1
	read Em 2
	read Mm 3
	define n (dimen(Pp))
	set PoMp = Pp/Mp
	set PoMm = Pm/Mm
	set EoMp = Ep/Mp
	set EoMm = Em/Mm
	set ErestoMp = sqrt(EoMp*EoMp - PoMp*PoMp)
	set ErestoMm = sqrt(EoMm*EoMm - PoMm*PoMm)
	set EradoMp = ErestoMp - 1
	set EradoMm = ErestoMm - 1
	set Effp = int(1000*EradoMp/ErestoMp + 0.5)/10
	set Effm = int(1000*EradoMm/ErestoMm + 0.5)/10
	set Vp = int(1000*Pp/Ep + 0.5)/1000
	set Vm = int(1000*Pm/Em + 0.5)/1000
	limits 0 3.6 0 4.1
	erase
	expand 0.6
	box
	xlabel P/M
	ylabel Energy/M
	expand 0.55
	connect PoMm EoMm
	points PoMp EoMp
	points PoMm EoMm
	connect PoMm ErestoMm
	points PoMp ErestoMp
	points PoMm ErestoMm
	connect PoMm EradoMm
	points PoMp EradoMp
	points PoMm EradoMm
	expand 0.45
	do i=1,$n-1 {
		relocate PoMp[$i] EoMp[$i]
		define vel  Vp[$i]
		if($vel < 1) {
			putlabel 7 V = 0$vel
		} else {
			putlabel 7 V = $vel
		}
		relocate PoMm[$i] EoMm[$i]
		define vel  Vm[$i]
		if($vel < 1) {
			putlabel 7 V = 0$vel
		} else {
			putlabel 7 V = $vel
		}
	}
	do i=1,$n-1 {
		relocate PoMp[$i] EradoMp[$i]
		define eff Effp[$i]
		if($eff < 1) {
			putlabel 7 0$eff% 
		} else {
			putlabel 7 $eff%
		}
		relocate PoMm[$i] EradoMm[$i]
		define eff Effm[$i]
		if($eff < 1) {
			putlabel 7 0$eff% 
		} else {
			putlabel 7 $eff%
		}
	}
