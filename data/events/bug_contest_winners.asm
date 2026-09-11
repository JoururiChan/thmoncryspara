BugContestantPointers:
	table_width 2
	dw BugContestant_BugCatcherDon ; This reverts back to the player
	dw BugContestant_BugCatcherDon
	dw BugContestant_BugCatcherEd
	dw BugContestant_CooltrainerMNick
	dw BugContestant_TohofanMWilliam
	dw BugContestant_BugCatcherBenny
	dw BugContestant_CamperBarry
	dw BugContestant_PicnickerCindy
	dw BugContestant_BugCatcherJosh
	dw BugContestant_SchoolboyJohnny
	dw BugContestant_SchoolboyKipp
	assert_table_length NUM_BUG_CONTESTANTS + 1

MACRO contest_winner
; species, score
	dp \1
	dw \2
ENDM

BugContestant_BugCatcherDon:
	db BUG_CATCHER, DON
	contest_winner DSTAR,     300
	contest_winner CSUNNY    285
	contest_winner CLILYBLACK,   226

BugContestant_BugCatcherEd:
	db BUG_CATCHER, ED
	contest_winner CDAICHAN,      286
	contest_winner CLUNA, 251
	contest_winner CCIRNO,   237

BugContestant_CooltrainerMNick:
	db COOLTRAINERM, NICK
	contest_winner TLUNA,    357
	contest_winner CLUNA, 349
	contest_winner CLILYWHITE,     368

BugContestant_TohofanMWilliam:
	db TOHOFANM, WILLIAM
	contest_winner CCIRNO,   332
	contest_winner CLILYBLACK, 324
	contest_winner CLILYWHITE,    321

BugContestant_BugCatcherBenny:
	db BUG_CATCHER, BENNY
	contest_winner CDAICHAN, 318
	contest_winner CSTAR,     295
	contest_winner CLILYWHITE,   285

BugContestant_CamperBarry:
	db CAMPER, BARRY
	contest_winner ASUNNY,     366
	contest_winner CSTAR,    329
	contest_winner CDAICHAN,     314

BugContestant_PicnickerCindy:
	db PICNICKER, CINDY
	contest_winner CSUNNY, 341
	contest_winner CSTAR,    301
	contest_winner CLUNA,   264

BugContestant_BugCatcherJosh:
	db BUG_CATCHER, JOSH
	contest_winner CCHEN,    326
	contest_winner CMIMA, 292
	contest_winner CWRIGGLE,    282

BugContestant_SchoolboyJohnny:
	db SCHOOLBOY, JOHNNY
	contest_winner CLILYWHITE,     270
	contest_winner CLILYWHITE,     282
	contest_winner CGYOKU,   251

BugContestant_SchoolboyKipp:
	db SCHOOLBOY, KIPP
	contest_winner CRIKAKO,    267
	contest_winner CKANA,      254
	contest_winner CMAGAN,     259
