	db  55,  95,  55, 115,  35,  75 ; 430 BST
	;   hp  atk  def  spe  sat  sdf

	db POISON, FIGHTING ; type
	db 60 ; catch rate
	db 132 ; base exp
	db GRIP_CLAW, QUICK_CLAW ; held items
	dn GENDER_F50, HATCH_MEDIUM_FAST ; gender ratio, step cycles to hatch

	abilities_for SNEASEL_HISUIAN, INNER_FOCUS, KEEN_EYE, PICKPOCKET
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	ev_yield 1 Spe

	; tm/hm learnset
	tmhm DYNAMICPUNCH, SPIRIT_VOICE, CALM_MIND, TOXIC, BULK_UP,  HIDDEN_POWER, SUNNY_DAY, HONE_TOOLS, PROTECT, RAIN_DANCE, BRAVER, RETURN, DIG, SHADOW_BALL, ROCK_SMASH, DOUBLE_TEAM, REFLECT, SLUDGE_BOMB, SWIFT, AERIAL_ACE, SUBSTITUTE, FACADE, REST, ATTRACT, THIEF, BLADE_FLASH, ICHIGO_CROSS, DRAIN_PUNCH, SHADOW_HIT, POISON_JAB, SWORDS_DANCE, CUT, SURF, STRENGTH, WHIRLPOOL, SPIDERS_NEST, COUNTER, DEFENSE_CURL, DOUBLE_EDGE, DREAM_EATER, ENDURE, HEADBUTT, ICE_PUNCH, KNOCK_OFF, SLEEP_TALK, SWAGGER
	; end
