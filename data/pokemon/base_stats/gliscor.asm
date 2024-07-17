	db  75,  95, 125,  95,  45,  75 ; 510 BST
	;   hp  atk  def  spe  sat  sdf

	db GROUND, FLYING ; type
	db 30 ; catch rate
	db 192 ; base exp
	db NO_ITEM, NO_ITEM ; held items
	dn GENDER_F50, HATCH_MEDIUM_FAST ; gender ratio, step cycles to hatch

	abilities_for GLISCOR, HYPER_CUTTER, SAND_VEIL, POISON_HEAL
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_BUG, EGG_BUG ; egg groups

	ev_yield 2 Def

	; tm/hm learnset
	tmhm SPIRIT_VOICE, TOXIC, HIDDEN_POWER, SUNNY_DAY, HONE_TOOLS,  PROTECT, RAIN_DANCE, BULLDOZE, UAKE, RETURN, DIG, ROCK_SMASH, DOUBLE_TEAM, SLUDGE_BOMB, SANDSTORM, SWIFT, AERIAL_ACE, SUBSTITUTE, FACADE, REST, ATTRACT, THIEF, STEEL_WING, ROCK_SLIDE, WHITE_BIRD, BLADE_FLASH, ICHIGO_CROSS, DARK_PULSE, ACROBATICS, POISON_JAB, GUNGNIR, U_TURN, STONE_EDGE, SWORDS_DANCE, CUT, FLY, STRENGTH, SPIDERS_NEST,  BATON_PASS, COUNTER, DOUBLE_EDGE, DREAM_EATER, EARTH_POWER, ENDURE, HEADBUTT, KNOCK_OFF, SLEEP_TALK, SWAGGER
	; end
