	db  25,  20,  15,  90, 105,  55 ; 310 BST
	;   hp  atk  def  spe  sat  sdf

	db PSYCHIC, PSYCHIC ; type
	db 200 ; catch rate
	db 73 ; base exp
	db NO_ITEM, TWISTEDSPOON ; held items
	dn GENDER_F25, HATCH_MEDIUM_FAST ; gender ratio, step cycles to hatch

	abilities_for ABRA, SYNCHRONIZE, MAGIC_GUARD, TRACE
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_HUMANSHAPE, EGG_HUMANSHAPE ; egg groups

	ev_yield 1 SAt

	; tm/hm learnset
	tmhm DYNAMICPUNCH, CURSE, CALM_MIND, TOXIC, HIDDEN_POWER, SUNNY_DAY, LIGHT_SCREEN, PROTECT, RAIN_DANCE, SAFEGUARD, IRON_TAIL, RETURN, PSYCHIC, SHADOW_BALL, DOUBLE_TEAM, REFLECT, SUBSTITUTE, FACADE, REST, ATTRACT, THIEF, ENERGY_LIGHT, DREAM_HEAVEN, DRAIN_PUNCH, FLASH, THUNDER_WAVE, BODY_SLAM, COUNTER, DOUBLE_EDGE, DREAM_EATER, ENDURE, FIRE_PUNCH, HEADBUTT, ICE_PUNCH, KNOCK_OFF, SEISMIC_TOSS, SKILL_SWAP, SLEEP_TALK, SWAGGER, THUNDERPUNCH, TRICK, TRICK_ROOM, ZAP_CANNON, ZEN_HEADBUTT
	; end
