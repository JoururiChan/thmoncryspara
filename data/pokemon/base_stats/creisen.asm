	db  50,  49,  52,  59,  88,  88 ; 309 BST
	;   hp  atk  def  spe  sat  sdf

	db PSYCHIC, PSYCHIC ; type
	db 100 ; catch rate
	db 100 ; base exp
	db NO_ITEM, NO_ITEM ; held items
	dn GENDER_F87_5, HATCH_SLOW ; gender ratio, step cycles to hatch

	abilities_for CREISEN, RUN_AWAY, RUN_AWAY, SNIPER
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_MONSTER, EGG_MINERAL ; egg groups

	ev_yield 1 Spe

	; tm/hm learnset
	tmhm SPIRIT_VOICE, POWER_TRICK, CALM_MIND, TOXIC, HIDDEN_POWER, LIGHT_SCREEN, PROTECT, RETURN, SAFEGUARD, SEAL_NEEDLE, THUNDERBOLT, DOUBLE_TEAM, SWIFT, PSYCHIC, SHADOW_BALL, REFLECT, FLASH_CANNON, SLUDGE_BOMB, SUBSTITUTE, FACADE, THIEF, ENERGY_LIGHT, LEECH_LIFE, FOCUS_BLAST, DARK_PULSE, WILL_O_WISP, EXPLOSION, SHADOW_HIT, U_TURN, FLASH, GYRO_BALL, THUNDER_WAVE, REST, ATTRACT, SPIDERS_NEST, BATON_PASS, CHARM, COUNTER, DEFENSE_CURL, DREAM_EATER, ENDURE, VOICE_BIND, HEADBUTT, KNOCK_OFF, SKILL_SWAP, SLEEP_TALK, SUCKER_PUNCH, SWAGGER, TRICK, TRICK_ROOM, ZAP_CANNON, LUNAR_BULLET
	; end
