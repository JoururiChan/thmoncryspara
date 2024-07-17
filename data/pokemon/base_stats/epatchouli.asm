	db  110,  48,  25,  36,  168, 140 ; 490 BST
	;   hp  atk  def  spe  sat  sdf

	db PSYCHIC, PSYCHIC ; type
	db 110 ; catch rate
	db 242 ; base exp
	db NO_ITEM, SMOKE_BALL ; held items
	dn GENDER_F50, HATCH_SLOWER ; gender ratio, step cycles to hatch

	abilities_for EPATCHOULI, TRACE, ADAPTABILITY, BATTLE_ARMOR
	db GROWTH_SLOW ; growth rate
	dn EGG_INDETERMINATE, EGG_MINERAL ; egg groups

	ev_yield 3 SAt

	; tm/hm learnset
	tmhm POWER_TRICK, CALM_MIND, TOXIC, HAIL, HIDDEN_POWER, PAY_DAY, SUNNY_DAY, ICE_BEAM, BLIZZARD, LIGHT_SCREEN, PROTECT, RAIN_DANCE, SAFEGUARD, THUNDERBOLT, THUNDER, FLOWER_SHOOT, SEAL_NEEDLE, EARTHQUAKE, RETURN, PSYCHIC, SHADOW_BALL, ROCK_SMASH, DOUBLE_TEAM, REFLECT, SLUDGE_BOMB, SUBSTITUTE, FACADE, REST, ATTRACT, ENERGY_LIGHT, LEECH_LIFE, FOCUS_BLAST, DREAM_HEAVEN, SCALD, DARK_PULSE, DRAGON_PULSE, WILL_O_WISP, WATAER_PULSE, EXPLOSION, FLASH, STONE_EDGE, VOLT_SWITCH, THUNDER_WAVE, GYRO_BALL, SURF, WHIRLPOOL, WATERFALL, SPIDERS_NEST, BATON_PASS, CHARM, DEFENSE_CURL, DREAM_EATER, EARTH_POWER, ENDURE, ICY_WIND, SEED_BOMB, SKILL_SWAP, SLEEP_TALK, SWAGGER, TRICK, TRICK_ROOM, ZAP_CANNON, LUNAR_BULLET
	; end