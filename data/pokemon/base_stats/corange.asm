	db  25,  70,  43,  54,  27,  30 ; 305 BST
	;   hp  atk  def  spe  sat  sdf

	db FIGHTING, FIGHTING ; type
	db 235 ; catch rate
	db 48 ; base exp
	db NO_ITEM, KEE_BERRY ; held items
	dn GENDER_F50, HATCH_FASTEST ; gender ratio, step cycles to hatch

	abilities_for CORANGE, HUGE_POWER, HUGE_POWER, IMMUNITY
	db GROWTH_FAST ; growth rate
	dn EGG_GROUND, EGG_HUMANSHAPE ; egg groups

	ev_yield 1 Atk

	; tm/hm learnset
	tmhm DYNAMICPUNCH, CURSE, TOXIC, BULK_UP, HIDDEN_POWER, SUNNY_DAY, HONE_TOOLS, PROTECT, RAIN_DANCE, BULLDOZE, BRAVER, THUNDERBOLT, THUNDER, EARTHQUAKE, RETURN, DIG, ROCK_SMASH, DOUBLE_TEAM, SWIFT, AERIAL_ACE, SUBSTITUTE, FACADE, REST, ATTRACT, THIEF, ROCK_SLIDE, FOCUS_BLAST, ACROBATICS, POISON_JAB, U_TURN, STRENGTH, BODY_SLAM, COUNTER, DEFENSE_CURL, DOUBLE_EDGE, ENDURE, FIRE_PUNCH, HEADBUTT, ICE_PUNCH, PAY_DAY, SEED_BOMB, SEISMIC_TOSS, SLEEP_TALK, SWAGGER, THUNDERPUNCH
	; end
