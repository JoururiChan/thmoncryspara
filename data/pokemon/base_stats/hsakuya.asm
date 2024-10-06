	db  35, 150, 60, 145, 65, 50 ; 505 BST
	;   hp  atk  def  spe  sat  sdf

	db STEEL, DARK ; type
	db 100 ; catch rate
	db 190 ; base exp
	db NO_ITEM, NO_ITEM ; held items
	dn GENDER_F87_5, HATCH_FASTEST ; gender ratio, step cycles to hatch

	abilities_for HSAKUYA, CONCENTRATE, CONCENTRATE, BATTLE_ARMOR
	db GROWTH_FAST ; growth rate
	dn EGG_GROUND, EGG_MINERAL ; egg groups

	ev_yield 2 Atk, 1 Spe

	; tm/hm learnset
	tmhm DYNAMICPUNCH, POWER_TRICK, CALM_MIND, TOXIC, HAIL, BULK_UP, HIDDEN_POWER, ICE_BEAM, BLIZZARD, TENSION_KICK, LIGHT_SCREEN, PROTECT, RETURN, DIG, HONE_TOOLS, FLASH_CANNON, ROCK_SMASH, DOUBLE_TEAM, SUBSTITUTE, FACADE, REST, ATTRACT, SWIFT, AERIAL_ACE, ROCK_SLIDE, BLADE_FLASH, CRASH_CROSS, WILD_CHARGE, DRAIN_PUNCH, ACROBATICS, SHADOW_HIT, AVALANCHE, U_TURN, GYRO_BALL, VOLT_SWITCH, SWORDS_DANCE, FLASH, CUT, STRENGTH, KNIFE_THROW, BATON_PASS, COUNTER, DEFENSE_CURL, DOUBLE_EDGE, ENDURE, HEADBUTT, ICE_PUNCH, ICY_WIND, IRON_HEAD, KNOCK_OFF, STEEL_FIST, SEISMIC_TOSS, SKILL_SWAP, SLEEP_TALK, SWAGGER, SUCKER_PUNCH, THUNDERPUNCH, TRICK_ROOM, DIZZY_PUNCH
	; end
