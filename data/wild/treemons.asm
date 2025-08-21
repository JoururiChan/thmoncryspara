TreeMons:
; entries correspond to TREEMON_SET_* constants
	table_width 2
	dw TreeMonSet_City
	dw TreeMonSet_Canyon
	dw TreeMonSet_Town
	dw TreeMonSet_Route
	dw TreeMonSet_Kanto
	dw TreeMonSet_Lake
	dw TreeMonSet_Forest
	dw TreeMonSet_Apricorns
	dw TreeMonSet_NoisyForest
	dw TreeMonSet_Rock
	assert_table_length NUM_TREEMON_SETS
	dw TreeMonSet_City ; unused

; Two tables each (normal, rare).

MACRO tree_mon
; %, species, level
	db \1
	if _NARG == 4
		dp \2, \3
		shift
	else
		dp \2
	endc
	db \3
ENDM

TreeMonSet_City:
TreeMonSet_Canyon:
	tree_mon 80, CDAICHAN,    10
	tree_mon 20, CSUIKA,      10
	db -1
	; rare
	tree_mon 50, CMEILING,    10
	tree_mon 30, CKAGUYA,  10
	tree_mon 20, CMOKOU,      10
	db -1

TreeMonSet_Town:
	tree_mon 65, CYAMAME,    10
	tree_mon 15, CYUKA,      10
	tree_mon 20, CKAGUYA,      10
	db -1
	; rare
	tree_mon 60, CORANGE,    10
	tree_mon 30, CMEILING,  10
	tree_mon 10, CORANGE,     10
	db -1

TreeMonSet_Route:
	tree_mon 50, CWRIGGLE,   10
	tree_mon 15, CMYSTIA,   10
	tree_mon 15, CYUKA,     10
	tree_mon 20, CPATCHOULI,  10
	db -1
	; rare
	tree_mon 40, CKEINE,    10
	tree_mon 40, CYUKA,     10
	tree_mon 20, CYUKARI,  10
	db -1

TreeMonSet_Kanto:
	tree_mon 65, SWRIGGLE,   10
	tree_mon 15, CKIKURI,      10
	tree_mon 20, CIRNO,  10
	db -1
	; rare
	tree_mon 40, MINORIKO,    10
	tree_mon 40, NITORI,     10
	tree_mon 20, CIRNO,  10
	db -1

TreeMonSet_Lake:
	tree_mon 65, CPATCHOULI,   10
	tree_mon 15, CKAGUYA,    10
	tree_mon 20, CKEINE,  10
	db -1
	; rare
	tree_mon 50, CMEILING,   10
	tree_mon 30, CORANGE,     10
	tree_mon 20, CMYSTIA,  10
	db -1

TreeMonSet_Forest:
	tree_mon 50, CWRIGGLE,   10
	tree_mon 30, CMYSTIA,     10
	tree_mon 10, CSUIKA,    10
	tree_mon  5, CKAGUYA, 10
	tree_mon  5, CDAICHAN,   10
	db -1
	; rare
	tree_mon 60, CWRIGGLE,   10
	tree_mon 15, CYAMAME,    10
	tree_mon 15, CYUKA,     10
	tree_mon  5, CMOKOU,    10
	tree_mon  5, CYUKARI,     10
	db -1

TreeMonSet_Apricorns:
	tree_mon 50, CDAICHAN,               10
	tree_mon 20, CWRIGGLE,                 10
	tree_mon 20, CMEDICINE,                 10
	tree_mon 10, CKEINE, 10
	db -1
	; rare
	tree_mon 40, CYUKA,               10
	tree_mon 20, CPATCHOULI,          10
	tree_mon 20, CKAGUYA,             10
	tree_mon 20, CMOKOU,                10
	db -1

TreeMonSet_NoisyForest:
	tree_mon 60, NITORI,                  LEVEL_FROM_BADGES - 3
	tree_mon  5, ANITORI,              LEVEL_FROM_BADGES + 2
	tree_mon 35, CCIRNO, LEVEL_FROM_BADGES + 0
	db -1
	; rare
	tree_mon 60, CCIRNO, LEVEL_FROM_BADGES + 0
	tree_mon 30, NITORI,                  LEVEL_FROM_BADGES - 2
	tree_mon 10, ANITORI,              LEVEL_FROM_BADGES + 3
	db -1

TreeMonSet_Rock:
	tree_mon 70, CDAICHAN,     15
	tree_mon 25, CSARA,    15
	tree_mon  5, DSUWAKO,    15
	db -1
