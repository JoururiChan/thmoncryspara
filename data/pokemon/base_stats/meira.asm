	db  43, 100,  67, 100,  86,  40 ; 483 BST
	;   hp  atk  def  spe  sat  sdf

	db STEEL, FIGHTING ; type
	db 235 ; catch rate
	db 110 ; base exp
	db LEPPA_BERRY, MOON_STONE ; held items
	dn GENDER_F75, HATCH_FAST ; gender ratio, step cycles to hatch

	abilities_for MEIRA, INNER_FOCUS, INNER_FOCUS, STEADFAST
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_MINERAL ; egg groups

	ev_yield 2 Atk

	; tm/hm learnset
	tmhm DYNAMICPUNCH, CURSE, CALM_MIND, TOXIC, BULK_UP, HIDDEN_POWER, HONE_TOOLS, PROTECT, BULLDOZE, RETURN, DIG, PSYCHIC, ROCK_SMASH, DOUBLE_TEAM, REFLECT, SUBSTITUTE, FACADE, REST, AERIAL_ACE, SWIFT, ATTRACT, FLAME_CHARGE, THIEF, DRAIN_PUNCH, FOCUS_BLAST, BLADE_FLASH, ACROBATICS, SHADOW_HIT, POISON_JAB, GUNGNIR, U_TURN, STONE_EDGE, CUT, STRENGTH, BATON_PASS, BODY_SLAM, CHARM, COUNTER, DEFENSE_CURL, DOUBLE_EDGE, DREAM_EATER, ENDURE, FIRE_PUNCH, HEADBUTT, VOICE_BIND, ICE_PUNCH, ICY_WIND, KNOCK_OFF, ROLLOUT, SEISMIC_TOSS, SLEEP_TALK, SWAGGER, THUNDERPUNCH, TRICK, ZAP_CANNON, LUNAR_BASH
	; end
