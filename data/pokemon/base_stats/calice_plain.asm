	db  60,  40,  60,  20, 40,  60 ; 500 BST
	;   hp  atk  def  spe  sat  sdf

	db STEEL, FIRE ; type
	db 160 ; catch rate
	db 121 ; base exp
	db NO_ITEM, KINGS_ROCK ; held items
	dn GENDER_F50, HATCH_SLOWEST ; gender ratio, step cycles to hatch

	abilities_for CALICE, MAGIC_BARRIER, MAGIC_BARRIER, MAGIC_BARRIER
	db GROWTH_SLOW ; growth rate
	dn EGG_FAIRY, EGG_MINERAL ; egg groups

	ev_yield 1 Def

	; tm/hm learnset
	tmhm DYNAMICPUNCH, CURSE, CALM_MIND, TOXIC, HAIL, HIDDEN_POWER, SUNNY_DAY, ICE_BEAM, BLIZZARD, AEROBLAST, LIGHT_SCREEN, PROTECT, RAIN_DANCE, SAFEGUARD, BULLDOZE, IRON_TAIL, EARTHQUAKE, RETURN, DIG, PSYCHIC, SHADOW_BALL, ROCK_SMASH, DOUBLE_TEAM, METEOR_FALL, HELL_TOKAMAK, SWIFT, AERIAL_ACE, SUBSTITUTE, FACADE, REST, ATTRACT, FOCUS_BLAST, SCALD, DRAIN_PUNCH, WATER_PULSE, AVALANCHE, GUNGNIR, FLASH, THUNDER_WAVE, SURF, STRENGTH, WHIRLPOOL, AQUA_TAIL, BODY_SLAM, COUNTER, DOUBLE_EDGE, DREAM_EATER, ENDURE, HEADBUTT, ICE_PUNCH, ICY_WIND, PAY_DAY, SEISMIC_TOSS, SKILL_SWAP, SLEEP_TALK, SWAGGER, TRICK, TRICK_ROOM, ZAP_CANNON, ZEN_HEADBUTT
	; end
