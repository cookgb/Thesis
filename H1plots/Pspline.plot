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
	define dp (PoMp[$n-1]/100)
	define end (PoMp[$n-1])
	set PoM = 0,PoMp[$n-1],(PoMp[$n-1]/100)
	spline PoMp EoMp PoM sEoMp
	spline PoMm EoMm PoM sEoMm
	do i=0,100 {
		set dE = 100*(sEoMp - sEoMm)/sEoMm
	}
	limits 0 3.6 0 4.1
	erase
	expand 0.6
	box
	xlabel P/M
	ylabel Energy/M
	connect PoM sEoMp
	points PoMp EoMp
