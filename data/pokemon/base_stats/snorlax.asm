	db 160, 110,  65,  30,  65, 110 ; 540 BST
	;   hp  atk  def  spe  sat  sdf

	db NORMAL, NORMAL ; type
	db 25 ; catch rate
	db 154 ; base exp
	db ALWAYS_ITEM_2, LEFTOVERS ; held items
	dn GENDER_F12_5, HATCH_SLOWEST ; gender ratio, step cycles to hatch

	abilities_for SNORLAX, IMMUNITY, THICK_FAT, GLUTTONY
	db GROWTH_SLOW ; growth rate
	dn EGG_MONSTER, EGG_MONSTER ; egg groups

	ev_yield 2 HP

	; tm/hm learnset
	tmhm DYNAMICPUNCH, SPIRIT_VOICE, CALM_MIND, TOXIC, HIDDEN_POWER, SUNNY_DAY, ICE_BEAM, BLIZZARD, AEROBLAST, PROTECT, RAIN_DANCE, BULLDOZE, FLOWER_SHOOT, THUNDERBOLT, THUNDER, EARTHQUAKE, RETURN, PSYCHIC, SHADOW_BALL, ROCK_SMASH, DOUBLE_TEAM, METEOR_FALL, SANDSTORM, HELL_TOKAMAK, SUBSTITUTE, FACADE, REST, ATTRACT, ROCK_SLIDE, FOCUS_BLAST, KNIFE_THROW, WATER_PULSE, GUNGNIR, SURF, STRENGTH, WHIRLPOOL, BODY_SLAM, CHARM, COUNTER, DEFENSE_CURL, DOUBLE_EDGE, ENDURE, FIRE_PUNCH, HEADBUTT, VOICE_BIND, ICE_PUNCH, ICY_WIND, IRON_HEAD, PAY_DAY, ROLLOUT, SEED_BOMB, SEISMIC_TOSS, SLEEP_TALK, SWAGGER, THUNDERPUNCH, ZAP_CANNON, 
	; end
