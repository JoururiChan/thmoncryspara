	db  125,  47,  45,  71,  135, 140 ; 325 BST
	;   hp  atk  def  spe  sat  sdf

	db NATURE, HEART ; type
	db 251 ; catch rate
	db 130 ; base exp
	db NO_ITEM, NO_ITEM ; held items
	dn GENDER_F50, HATCH_FASTEST ; gender ratio, step cycles to hatch

	abilities_for DDAICHAN, SERENE_GRACE, SERENE_GRACE, NATURAL_CURE
	db GROWTH_FAST ; growth rate
	dn EGG_PLANT, EGG_FAIRY ; egg groups

	ev_yield 3 SDf

	; tm/hm learnset
	tmhm CALM_MIND, TOXIC, HIDDEN_POWER, PAY_DAY, ICE_BEAM, BLIZZARD, LIGHT_SCREEN, PROTECT, RAIN_DANCE, GIGA_DRAIN, RETURN, SAFEGUARD, FLOWER_SHOOT, SEAL_NEEDLE, THUNDERBOLT, DOUBLE_TEAM, PSYCHIC, SHADOW_BALL, FLASH_CANNON, SUBSTITUTE, FACADE, REST, SLUDGE_BOMB, SWIFT, ATTRACT, THIEF, SCALD, ENERGY_LIGHT, CRASH_CROSS, WATER_PULSE, WILD_CHARGE, WILL_O_WISP, U_TURN, FLASH, THUNDER_WAVE, GYRO_BALL, BATON_PASS, CHARM, DEFENSE_CURL, ENDURE, ICY_WIND, TREMORS, SLEEP_TALK, SWAGGER, DIZZY_PUNCH
	; end
