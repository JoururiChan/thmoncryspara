	db  37, 27,  34, 36,  52,  48 ; 450 BST
	;   hp  atk  def  spe  sat  sdf

	db ICE, ICE ; type
	db 105 ; catch rate
	db 121 ; base exp
	db NO_ITEM, LEEK ; held items
	dn GENDER_F50, HATCH_FAST ; gender ratio, step cycles to hatch

	abilities_for CMAI, INSOMNIA, ICE_BODY, WATER_VEIL
	db GROWTH_FAST ; growth rate
	dn EGG_MINERAL, EGG_FAIRY ; egg groups

	ev_yield 1 SAt

	; tm/hm learnset
	tmhm CURSE, TOXIC, HIDDEN_POWER, SUNNY_DAY, PROTECT, IRON_TAIL, RETURN, ROCK_SMASH, DOUBLE_TEAM, SWIFT, AERIAL_ACE, SUBSTITUTE, FACADE, REST, ATTRACT, THIEF, STEEL_WING, WHITE_BIRD, BLADE_FLASH, ACROBATICS, POISON_JAB, U_TURN, SWORDS_DANCE, CUT, FLY, SURF, STRENGTH, SAKUYA_WORLD, BATON_PASS, BODY_SLAM, DOUBLE_EDGE, ENDURE, HEADBUTT, KNOCK_OFF, SLEEP_TALK, SWAGGER
	; end
