if DEF(FAITHFUL)
	db  65,  80, 140,  70,  40,  70 ; 465 BST
	;   hp  atk  def  spe  sat  sdf
else
	db  85,  80, 140,  70,  40,  70 ; 485 BST
	;   hp  atk  def  spe  sat  sdf
endc

	db HEART, MIASMA ; type
	db 25 ; catch rate
	db 168 ; base exp
	db NO_ITEM, SHARP_BEAK ; held items
	dn GENDER_F50, HATCH_MEDIUM_SLOW ; gender ratio, step cycles to hatch

	abilities_for PARSEE, KEEN_EYE, STURDY, WEAK_ARMOR
	db GROWTH_SLOW ; growth rate
	dn EGG_FLYING, EGG_FLYING ; egg groups

	ev_yield 2 Def

	; tm/hm learnset
	tmhm POISON_CLAW, ROAR, TOXIC, HIDDEN_POWER, SUNNY_DAY, PROTECT, RETURN, ROCK_SMASH, DOUBLE_TEAM, STAR_CANNON, SANDSTORM, SWIFT, AERIAL_ACE, SUBSTITUTE, FACADE, REST, LUSTER_HEART, THIEF, STEEL_WING, ROCK_SLIDE, AURA_WAVE, CROSS_JAM, DARK_PULSE, FLASH, SWORDS_DANCE, CUT, FLY, LEAF_STORM, COUNTER, DOUBLE_EDGE, ENDURE, ICY_WIND, IRON_HEAD, SLEEP_TALK, SWAGGER
	; end
