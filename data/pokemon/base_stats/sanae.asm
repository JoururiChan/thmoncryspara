	db  88,  52,  89,  55,  95,  90 ; 405 BST
	;   hp  atk  def  spe  sat  sdf

	db FAITH, WIND ; type
	db 100 ; catch rate
	db 145 ; base exp
	db NO_ITEM, NO_ITEM ; held items
	dn GENDER_F87_5, HATCH_FASTER ; gender ratio, step cycles to hatch

	abilities_for SANAE, SERENE_GRACE, NATURAL_CURE, SUPER_LUCK
	db GROWTH_FAST ; growth rate
	dn EGG_WATER_1, EGG_FAIRY ; egg groups

	ev_yield 2 SDf

	; tm/hm learnset
	tmhm CALM_MIND, TOXIC, HAIL, PAY_DAY, HIDDEN_POWER, HONE_TOOLS, ICE_BEAM, BLIZZARD, SUNNY_DAY, LIGHT_SCREEN, PROTECT, RAIN_DANCE, GIGA_DRAIN, RETURN, SAFEGUARD, FLOWER_SHOOT, SEAL_NEEDLE, THUNDERBOLT, THUNDER, DOUBLE_TEAM, FLASH_CANNON, ENERGY_LIGHT, FIRE_BREATH, SLUDGE_BOMB, SUBSTITUTE, SWIFT, FACADE, REST, ATTRACT, ENERGY_BALL, SCALD, ENIGMA_BURST, WILL_O_WISP, WATER_PULSE, FLASH, THUNDER_WAVE, SURF, WHIRLPOOL, WATERFALL, BATON_PASS, CHARM, COUNTER, DEFENSE_CURL, EARTH_POWER, ENDURE, ICY_WIND, SEISMIC_TOSS, SEED_BOMB, SLEEP_TALK, SWAGGER, DIZZY_PUNCH
	; end
