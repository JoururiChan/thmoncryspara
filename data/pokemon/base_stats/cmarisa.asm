	db  50,  30,  40,  65,  70,  60 ; 309 BST
	;   hp  atk  def  spe  sat  sdf

	db ELECTRIC, ELECTRIC ; type
	db 100 ; catch rate
	db 90 ; base exp
	db NO_ITEM, NO_ITEM ; held items
	dn GENDER_F12_5, HATCH_MEDIUM_FAST ; gender ratio, step cycles to hatch

	abilities_for CMARISA, BLAZE, SOLAR_POWER, FLAME_BODY
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_MONSTER, EGG_DRAGON ; egg groups

	ev_yield 1 Spe

	; tm/hm learnset
	tmhm DYNAMICPUNCH, DRAGON_CLAW, CURSE, TOXIC, HIDDEN_POWER, SUNNY_DAY, HONE_TOOLS, PROTECT, IRON_TAIL, RETURN, DIG, ROCK_SMASH, DOUBLE_TEAM, METEOR_FALL, FIRE_BLAST, SWIFT, AERIAL_ACE, SUBSTITUTE, FACADE, FLAME_CHARGE, REST, ATTRACT, ROCK_SLIDE, DRAGON_PULSE, WILL_O_WISP, SHADOW_CLAW, SWORDS_DANCE, CUT, STRENGTH, BODY_SLAM, COUNTER, DEFENSE_CURL, DOUBLE_EDGE, ENDURE, FIRE_PUNCH, HEADBUTT, SEISMIC_TOSS, SLEEP_TALK, SWAGGER, THUNDERPUNCH
	; end
