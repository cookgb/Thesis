makeplot
	define pw 8.5
	define ph 11
	define top 8.75
	define bottom 6.25
	define left 2.5
	define right 6.75
	define t (int(32767*$top/$ph))
	define b (int(32767*$bottom/$ph))
	define l (int(32767*$left/$pw))
	define r (int(32767*$right/$pw))
	location $l $r $b $t
	data "P+10AH.data"
	read theta 1
	read h 2
	limits 0 3.141592654 -0.4 0.4
	erase
	expand 0.6
	box
	xlabel \theta
	ylabel h(\theta)
	expand 0.55
	connect theta h
	points theta h
