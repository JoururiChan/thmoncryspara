	db  86,  98,  82, 105, 120, 105 ; 300 BST
	;   hp  atk  def  spe  sat  sdf

	db FAIRY, FLYING ; type
	db 50 ; catch rate
	db 190 ; base exp
	db ORAN_BERRY, LIGHT_BALL ; held items
	dn GENDER_F100, HATCH_SLOWEST ; gender ratio, step cycles to hatch

	abilities_for SARIEL, PRESSURE, PRESSURE, HAKUREI_MIKO
	db GROWTH_SLOW ; growth rate
	dn EGG_FAIRY, EGG_FLYING ; egg groups

	ev_yield 2 SAt

	; tm/hm learnset
	tmhm SPIRIT_VOICE, CALM_MIND, POWER_TRICK, ROAR, TOXIC, HAIL, PAY_DAY, HIDDEN_POWER, ICE_BEAM, BLIZZARD, LIGHT_SCREEN, PROTECT, SAFEGUARD, FLOWER_SHOOT, SEAL_NEEDLE, THUNDER, RETURN, PSYCHIC, DOUBLE_TEAM, REFLECT, FLASH_CANNON, METEOR_FALL, SWIFT, SUBSTITUTE, FACADE, REST, ATTRACT, LEECH_LIFE, FOCUS_BLAST, DREAM_HEAVEN, ICHIGO_CROSS, FLAME_CHARGE, STEEL_WING, GUNGNIR, FLASH, ENERGY_LIGHT, WHITE_BIRD, DARK_PULSE, AVALANCHE, WILL_O_WISP, ACROBATICS, FLY, STRENGTH, SPIDERS_NEST, CHARM, DREAM_EATER, EARTH_POWER, ENDURE, VOICE_BIND, KNOCK_OFF, ICE_PUNCH, ICY_WIND, SKILL_SWAP, SLEEP_TALK, SWAGGER, THUNDERPUNCH, LUNAR_BULLET
	; end
