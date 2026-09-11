MACRO contest_mon
	db \1
	dp \2
	db \3, \4
ENDM

ContestMons:
	;            %, species,   min, max
	contest_mon 15, CCIRNO,    7, 18
	contest_mon 15, CCIRNO,      7, 18
	contest_mon 10, CLILYWHITE,     9, 18
	contest_mon 10, CLILYBLACK,      9, 18
	contest_mon  5, CDAICHAN, 12, 15
	contest_mon  5, CDAICHAN,   12, 15
	contest_mon 10, CSUNNY,    10, 16
	contest_mon 10, CSTAR,      10, 16
	contest_mon 10, CLUNA,     10, 16
	contest_mon  5, DSTAR,      13, 14
	contest_mon  5, TLUNA,    13, 14
	contest_mon  5, ASUNNY,     13, 14
ContestMonsEnd:
