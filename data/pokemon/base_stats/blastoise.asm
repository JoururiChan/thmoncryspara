	db  79,  83, 100,  78,  85, 105 ; 530 BST
	;   hp  atk  def  spe  sat  sdf

if DEF(FAITHFUL)
	db WATER, WATER ; type
else
	db WATER, STEEL ; type
endc
	db 45 ; catch rate
	db 210 ; base exp
	db NO_ITEM, NO_ITEM ; held items
	dn GENDER_F12_5, HATCH_MEDIUM_FAST ; gender ratio, step cycles to hatch

	abilities_for ESAKUYA, TORRENT, RAIN_DISH, MEGA_LAUNCHER
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_MONSTER, EGG_WATER_1 ; egg groups

	ev_yield 3 SDf

	; tm/hm learnset
	tmhm DYNAMICPUNCH, CURSE, ROAR, TOXIC, HAIL, HIDDEN_POWER, ICE_BEAM, BLIZZARD, MASTER_SPARK, PROTECT, RAIN_DANCE, BULLDOZE, IRON_TAIL, EARTHQUAKE, RETURN, DIG, ROCK_SMASH, DOUBLE_TEAM, FLASH_CANNON, SUBSTITUTE, FACADE, REST, ATTRACT, ROCK_SLIDE, FOCUS_BLAST, SCALD, DARK_PULSE, DRAGON_PULSE, WATER_PULSE, AVALANCHE, GIGA_IMPACT, GYRO_BALL, SURF, STRENGTH, WHIRLPOOL, WATERFALL, AQUA_TAIL, BODY_SLAM, COUNTER, DEFENSE_CURL, DOUBLE_EDGE, ENDURE, HEADBUTT, ICE_PUNCH, ICY_WIND, IRON_HEAD, ROLLOUT, SEISMIC_TOSS, SLEEP_TALK, SWAGGER, ZAP_CANNON, ZEN_HEADBUTT
	; end
