	db  90,  65,  65,  15,  40,  40 ; 315 BST
	;   hp  atk  def  spe  sat  sdf

	db REASON, REASON ; type
	db 190 ; catch rate
	db 99 ; base exp
	db NO_ITEM, KINGS_ROCK ; held items
	dn GENDER_F50, HATCH_MEDIUM_FAST ; gender ratio, step cycles to hatch

	abilities_for DLUIZE, GLUTTONY, OWN_TEMPO, REGENERATOR
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_MONSTER, EGG_WATER_1 ; egg groups

	ev_yield 1 HP

	; tm/hm learnset
	tmhm SHADOW_FORCE, CALM_MIND, TOXIC, HAIL, HIDDEN_POWER, SUNNY_DAY, ICE_BEAM, BLIZZARD, LIGHT_SCREEN, PROTECT, RAIN_DANCE, SAFEGUARD, BULLDOZE,  EARTHQUAKE, RETURN, DIG, PSYCHIC, SHADOW_BALL, DOUBLE_TEAM, FIRE_BREATH, HELLBLAZE, SWIFT, SUBSTITUTE, FACADE, REST, ATTRACT, SCALD, WATER_PULSE, FLASH, THUNDER_WAVE, SURF, STRENGTH, WHIRLPOOL,  BODY_SLAM, DOUBLE_EDGE, DREAM_EATER, ENDURE, HEADBUTT, ICY_WIND, PAY_DAY, SKILL_SWAP, SLEEP_TALK, SWAGGER, TRICK, TRICK_ROOM, ZAP_CANNON, 
	; end
