	db  100,  60,  80,  77,  140,  110 ; 310 BST
	;   hp  atk  def  spe  sat  sdf

	db DARK, PSYCHIC ; type
	db 40 ; catch rate
	db 248 ; base exp
	db NO_ITEM, SPELL_TAG ; held items
	dn GENDER_F50, HATCH_SLOWEST ; gender ratio, step cycles to hatch

	abilities_for ESHINKI, SYNCHRONIZE, SCRAPPY, PRESSURE
	db GROWTH_SLOW ; growth rate
	dn EGG_FLYING, EGG_DRAGON ; egg groups

	ev_yield 3 SDf

	; tm/hm learnset
	tmhm DYNAMICPUNCH, CURSE, TOXIC, HIDDEN_POWER, SUNNY_DAY, AEROBLAST, PROTECT, RAIN_DANCE, GIGA_DRAIN, THUNDERBOLT, THUNDER, RETURN, PSYCHIC, SHADOW_BALL, ROCK_SMASH, DOUBLE_TEAM, SLUDGE_BOMB, SUBSTITUTE, FACADE, REST, ATTRACT, THIEF, ENERGY_LIGHT, LEECH_LIFE, FOCUS_BLAST,  DARK_PULSE, DRAIN_PUNCH, WILL_O_WISP, EXPLOSION, SHADOW_HIT, POISON_JAB, GUNGNIR, STRENGTH, BODY_SLAM, COUNTER, DOUBLE_EDGE, DREAM_EATER, ENDURE, FIRE_PUNCH, HEADBUTT, ICE_PUNCH, ICY_WIND, KNOCK_OFF, SEISMIC_TOSS, SKILL_SWAP, SLEEP_TALK, SUCKER_PUNCH, SWAGGER, THUNDERPUNCH, TRICK, TRICK_ROOM, ZAP_CANNON
	; end
