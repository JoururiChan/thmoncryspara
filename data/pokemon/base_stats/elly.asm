	db  45,  90, 43,  40, 85,  40 ; 310 BST
	;   hp  atk  def  spe  sat  sdf

	db STEEL, FIGHTING ; type
	db 135 ; catch rate
	db 97 ; base exp
	db NO_ITEM, KINGS_ROCK ; held items
	dn GENDER_F50, HATCH_FASTER ; gender ratio, step cycles to hatch

	abilities_for ELLY, SUCTION_CUPS, SUCTION_CUPS, SUCTION_CUPS
	db GROWTH_FAST ; growth rate
	dn EGG_FAIRY, EGG_GROUND ; egg groups

	ev_yield 2 Atk

	; tm/hm learnset
	tmhm DYNAMICPUNCH, CURSE, CALM_MIND, TOXIC, HIDDEN_POWER, SUNNY_DAY, LIGHT_SCREEN, PROTECT, RAIN_DANCE, SAFEGUARD, IRON_TAIL, RETURN, PSYCHIC, SHADOW_BALL, DOUBLE_TEAM, REFLECT, SUBSTITUTE, FACADE, REST, ATTRACT, THIEF, ENERGY_LIGHT,  DRAIN_PUNCH, FLASH, THUNDER_WAVE, BODY_SLAM, COUNTER, DOUBLE_EDGE, DREAM_EATER, ENDURE, FIRE_PUNCH, HEADBUTT, ICE_PUNCH, KNOCK_OFF, SEISMIC_TOSS, SKILL_SWAP, SLEEP_TALK, SWAGGER, THUNDERPUNCH, TRICK, TRICK_ROOM, ZAP_CANNON, ZEN_HEADBUTT
	; end
