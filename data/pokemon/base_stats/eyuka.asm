	db  80,  150,  110, 25, 150,  110 ; 500 BST
	;   hp  atk  def  spe  sat  sdf

	db GRASS, POISON ; type
	db 51 ; catch rate
	db 240 ; base exp
	db NO_ITEM, TWISTEDSPOON ; held items
	dn GENDER_F75, HATCH_SLOWEST ; gender ratio, step cycles to hatch

	abilities_for EYUKA, OVERGROW, OVERGROW, PRESSURE
	db GROWTH_SLOW ; growth rate
	dn EGG_PLANT, EGG_GROUND ; egg groups

	ev_yield 2 SAt, 1 Atk

	; tm/hm learnset
	tmhm DYNAMICPUNCH, CURSE, TOXIC, BULK_UP, HIDDEN_POWER, SUNNY_DAY, LIGHT_SCREEN, PROTECT, RAIN_DANCE, BULLDOZE, EARTHQUAKE, RETURN, DIG, ROCK_SMASH, DOUBLE_TEAM, METEOR_FALL, HELL_TOKAMAK, SUBSTITUTE, FACADE, REST, ATTRACT, THIEF, ROCK_SLIDE, FOCUS_BLAST, BLADE_FLASH, POISON_JAB, STRENGTH, BODY_SLAM, COUNTER, DOUBLE_EDGE, ENDURE, FIRE_PUNCH, HEADBUTT, ICE_PUNCH, KNOCK_OFF, SEISMIC_TOSS, SLEEP_TALK, SWAGGER, THUNDERPUNCH
	; end
