	db  55,  40,  85,  40,  80, 105 ; 405 BST
	;   hp  atk  def  spe  sat  sdf

	db FAIRY, FLYING ; type
	db 75 ; catch rate
	db 114 ; base exp
	db NO_ITEM, NO_ITEM ; held items
	dn GENDER_F12_5, HATCH_FASTER ; gender ratio, step cycles to hatch

	abilities_for TOGETIC, HUSTLE, SERENE_GRACE, SUPER_LUCK
	db GROWTH_FAST ; growth rate
	dn EGG_FLYING, EGG_FAIRY ; egg groups

	ev_yield 2 SDf

	; tm/hm learnset
	tmhm SPIRIT_VOICE, TOXIC, HIDDEN_POWER, SUNNY_DAY, AEROBLAST, LIGHT_SCREEN, PROTECT, RAIN_DANCE, SAFEGUARD, FLOWER_SHOOT, RETURN, PSYCHIC, SHADOW_BALL, ROCK_SMASH, DOUBLE_TEAM, REFLECT, METEOR_FALL, HELL_TOKAMAK, SWIFT, AERIAL_ACE, SUBSTITUTE, FACADE, REST, ATTRACT, STEEL_WING, ENERGY_LIGHT, WHITE_BIRD, DRAIN_PUNCH, WATER_PULSE, GUNGNIR, FLASH, THUNDER_WAVE, FLY, BATON_PASS, BODY_SLAM, CHARM, COUNTER, DEFENSE_CURL, DOUBLE_EDGE, DREAM_EATER, ENDURE, HEADBUTT, VOICE_BIND, ROLLOUT, SEISMIC_TOSS, SLEEP_TALK, SWAGGER, TRICK, ZAP_CANNON, 
	; end
