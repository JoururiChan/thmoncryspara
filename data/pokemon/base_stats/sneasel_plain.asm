	db  55,  95,  55, 115,  35,  75 ; 430 BST
	;   hp  atk  def  spe  sat  sdf

	db DARK, ICE ; type
	db 60 ; catch rate
	db 132 ; base exp
	db GRIP_CLAW, RAZOR_CLAW ; held items
	dn GENDER_F50, HATCH_MEDIUM_FAST ; gender ratio, step cycles to hatch

	abilities_for SNEASEL, INNER_FOCUS, KEEN_EYE, PICKPOCKET
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	ev_yield 1 Spe

	; tm/hm learnset
	tmhm DYNAMICPUNCH, CURSE, CALM_MIND, TOXIC, HAIL, HIDDEN_POWER, SUNNY_DAY, HONE_TOOLS, ICE_BEAM, BLIZZARD, PROTECT, RAIN_DANCE, BRAVER, RETURN, DIG, SHADOW_BALL, ROCK_SMASH, DOUBLE_TEAM, REFLECT, SWIFT, AERIAL_ACE, SUBSTITUTE, FACADE, REST, ATTRACT, THIEF, BLADE_FLASH, ICHIGO_CROSS, DARK_PULSE, SHADOW_HIT, POISON_JAB, AVALANCHE, SWORDS_DANCE, CUT, SURF, STRENGTH, WHIRLPOOL, SPIDERS_NEST, COUNTER, DEFENSE_CURL, DOUBLE_EDGE, DREAM_EATER, ENDURE, HEADBUTT, ICE_PUNCH, ICY_WIND, KNOCK_OFF, SLEEP_TALK, SWAGGER
	; end
