	db  59,  63,  80,  58,  65,  80 ; 405 BST
	;   hp  atk  def  spe  sat  sdf

	db WATER, WATER ; type
	db 45 ; catch rate
	db 143 ; base exp
	db NO_ITEM, NO_ITEM ; held items
	dn GENDER_F12_5, HATCH_MEDIUM_FAST ; gender ratio, step cycles to hatch

	abilities_for SAKUYA, TORRENT, RAIN_DISH, SHELL_ARMOR
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_MONSTER, EGG_WATER_1 ; egg groups

	ev_yield 1 Def, 1 SDf

	; tm/hm learnset
	tmhm DYNAMICPUNCH, CURSE, TOXIC, HAIL, HIDDEN_POWER, ICE_BEAM, BLIZZARD, PROTECT, RAIN_DANCE, IRON_TAIL, RETURN, DIG, ROCK_SMASH, DOUBLE_TEAM, SUBSTITUTE, FACADE, REST, ATTRACT, SCALD, DRAGON_PULSE, WATER_PULSE, GYRO_BALL, SURF, STRENGTH, WHIRLPOOL, WATERFALL, AQUA_TAIL, BODY_SLAM, COUNTER, DEFENSE_CURL, DOUBLE_EDGE, ENDURE, HEADBUTT, ICE_PUNCH, ICY_WIND, ROLLOUT, SEISMIC_TOSS, SLEEP_TALK, SWAGGER, ZEN_HEADBUTT
	; end
