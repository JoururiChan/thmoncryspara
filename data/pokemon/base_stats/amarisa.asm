	db  80, 35,  35,  90, 165, 90 ; 510 BST
	;   hp  atk  def  spe  sat  sdf

	db WIND, MIASMA ; type
	db 100 ; catch rate
	db 210 ; base exp
	db NO_ITEM, NO_ITEM ; held items
	dn GENDER_F87_5, HATCH_FASTER ; gender ratio, step cycles to hatch

	abilities_for AMARISA, SPEED_BOOST, SPEED_BOOST, BLAZE
	db GROWTH_SLOW ; growth rate
	dn EGG_INDETERMINATE, EGG_MINERAL ; egg groups

	ev_yield 3 SAt

	; tm/hm learnset
	tmhm POWER_TRICK, TOXIC, CALM_MIND, HIDDEN_POWER, BULK_UP, SUNNY_DAY, HONE_TOOLS, PROTECT, LIGHT_SCREEN, RAIN_DANCE, SAFEGUARD, THUNDERBOLT, THUNDER, RETURN, PSYCHIC, SHADOW_BALL, DOUBLE_TEAM, FIRE_BREATH, SLUDGE_BOMB, SWIFT, AERIAL_ACE, SUBSTITUTE, FACADE, FLAME_CHARGE, REST, ATTRACT, THIEF, ENERGY_LIGHT, FOCUS_BLAST, WILD_CHARGE, VOLT_SWITCH, THUNDER_WAVE, GYRO_BALL, ENIGMA_BURST, WILL_O_WISP, FLY, FLASH, STRENGTH, WATERFALL, BATON_PASS, BODY_SLAM, COUNTER, DEFENSE_CURL, DOUBLE_EDGE, DREAM_EATER, FIRE_PUNCH, ENDURE, FIRE_PUNCH, HEADBUTT, SEED_BOMB, SKILL_SWAP, SLEEP_TALK, SUCKER_PUNCH, SWAGGER, THUNDERPUNCH, TRICK, TRICK_ROOM, ZAP_CANNON
	; end
