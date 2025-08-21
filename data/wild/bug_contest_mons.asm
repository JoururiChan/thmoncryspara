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
	contest_mon 10, CLILYWHITE,      9, 18
	contest_mon  5, CLILYBLACK, 12, 15
	contest_mon  5, CLILYBLACK,   12, 15
	contest_mon 10, CDAICHAN,    10, 16
	contest_mon 10, CDAICHAN,      10, 17
	contest_mon  5, CMAI,   12, 15
	contest_mon  5, LILYWHITE,      13, 14
	contest_mon  5, DAICHAN,    13, 14
	contest_mon  5, CIRNO,     13, 14
ContestMonsEnd:
