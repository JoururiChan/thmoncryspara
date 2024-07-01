	db 100, 100, 100, 100, 100, 100 ; 600 BST
	;   hp  atk  def  spe  sat  sdf

	db PSYCHIC, PSYCHIC ; type
	db 45 ; catch rate
	db 64 ; base exp
	db ALWAYS_ITEM_2, LUM_BERRY ; held items
	dn GENDER_UNKNOWN, HATCH_UNKNOWN ; gender ratio, step cycles to hatch

if DEF(FAITHFUL)
	abilities_for MEW, SYNCHRONIZE, SYNCHRONIZE, SYNCHRONIZE
else
	abilities_for MEW, SYNCHRONIZE, SYNCHRONIZE, MAGIC_GUARD
endc
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups

	ev_yield 3 HP

	; tm/hm learnset
	tmhm DYNAMICPUNCH, SPIRIT_VOICE, CURSE, CALM_MIND, ROAR, TOXIC, HAIL, BULK_UP,  HIDDEN_POWER, SUNNY_DAY, HONE_TOOLS, ICE_BEAM, BLIZZARD, AEROBLAST, LIGHT_SCREEN, PROTECT, RAIN_DANCE, GIGA_DRAIN, SAFEGUARD, BULLDOZE, FLOWER_SHOOT, BRAVER, THUNDERBOLT, THUNDER, EARTHQUAKE, RETURN, DIG, PSYCHIC, SHADOW_BALL, ROCK_SMASH, DOUBLE_TEAM, REFLECT, FLASH_CANNON, METEOR_FALL, SLUDGE_BOMB, SANDSTORM, HELL_TOKAMAK, SWIFT, AERIAL_ACE, SUBSTITUTE, FACADE, FLAME_CHARGE, REST, ATTRACT, THIEF, STEEL_WING, ROCK_SLIDE, ENERGY_LIGHT, LEECH_LIFE, WHITE_BIRD, FOCUS_BLAST,  BLADE_FLASH, SCALD, ICHIGO_CROSS, KNIFE_THROW, DARK_PULSE, DRAGON_PULSE, DRAIN_PUNCH, WILL_O_WISP, ACROBATICS, WATER_PULSE, EXPLOSION, SHADOW_HIT, POISON_JAB, AVALANCHE, GUNGNIR, U_TURN, FLASH, STONE_EDGE, VOLT_SWITCH, THUNDER_WAVE, GYRO_BALL, SWORDS_DANCE, CUT, FLY, SURF, STRENGTH, WHIRLPOOL, WATERFALL, SPIDERS_NEST, AQUA_TAIL, BATON_PASS, BODY_SLAM, CHARM, COUNTER, DEFENSE_CURL, DOUBLE_EDGE, DREAM_EATER, EARTH_POWER, ENDURE, FIRE_PUNCH, HEADBUTT, VOICE_BIND, ICE_PUNCH, ICY_WIND, IRON_HEAD, KNOCK_OFF, PAY_DAY, ROLLOUT, SEED_BOMB, SEISMIC_TOSS, SKILL_SWAP, SLEEP_TALK, SUCKER_PUNCH, SWAGGER, THUNDERPUNCH, TRICK, TRICK_ROOM, ZAP_CANNON, LUNAR_BASH
	; end
