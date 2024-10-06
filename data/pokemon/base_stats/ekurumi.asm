	db  110,  70,  98, 88,  115,  75 ; 385 BST
	;   hp  atk  def  spe  sat  sdf

	db DARK, FLYING ; type
	db 190 ; catch rate
	db 140 ; base exp
	db NO_ITEM, ASPEAR_BERRY ; held items
	dn GENDER_F50, HATCH_SLOWER ; gender ratio, step cycles to hatch

	abilities_for EKURUMI, SYNCHRONIZE, SYNCHRONIZE, SYNCHRONIZE
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_MONSTER, EGG_FLYING ; egg groups

	ev_yield 2 SAt, 1 Spe

	; tm/hm learnset
	tmhm SHADOW_FORCE, POWER_TRICK, CALM_MIND, ROAR, TOXIC, BULK_UP, HIDDEN_POWER, PROTECT, SAFEGUARD, THUNDERBOLT, THUNDER, RETURN, DIG, ROCK_SMASH, PSYCHIC, SHADOW_BALL, DOUBLE_TEAM, FIRE_BREATH, HELLBLAZE, FLASH_CANNON, SLUDGE_BOMB, SWIFT, AERIAL_ACE, SUBSTITUTE, FACADE, REST, ATTRACT, THIEF, STEEL_WING, ENERGY_LIGHT, LEECH_LIFE, AURA_WAVE, FOCUS_BLAST, ENERGY_BALL, DARK_PULSE, WILL_O_WISP, ACROBATICS, EXPLOSION, SHADOW_HIT, U_TURN, GYRO_BALL, CUT, FLY, STRENGTH, LEAF_STORM, BATON_PASS, CHARM, COUNTER, DEFENSE_CURL, DREAM_EATER, ENDURE, VOICE_BIND, ICY_WIND, KNOCK_OFF, SLEEP_TALK, SUCKER_PUNCH, SWAGGER, TRICK, DIZZY_PUNCH
	; end
