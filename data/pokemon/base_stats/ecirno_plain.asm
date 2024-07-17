	db  100,  120,  35,  105,  89,  73 ; 490 BST
	;   hp  atk  def  spe  sat  sdf

	db ICE, FLYING ; type
	db 150 ; catch rate
	db 200 ; base exp
	db NO_ITEM, NO_ITEM ; held items
	dn GENDER_F50, HATCH_FASTEST ; gender ratio, step cycles to hatch

	abilities_for ECIRNO, WATER_VEIL, SPEED_BOOST, GUTS
	db GROWTH_FAST ; growth rate
	dn EGG_MINERAL, EGG_WATER_3 ; egg groups

	ev_yield 3 HP

	; tm/hm learnset
	tmhm ROAR, HAIL, HIDDEN_POWER, ICE_BEAM, BLIZZARD, TENSION_KICK, PROTECT, RAIN_DANCE, SAFEGUARD, RETURN, DOUBLE_TEAM, FLASH_CANNON, REFLECT, SWIFT, AERIAL_ACE, SUBSTITUTE, FACADE, REST, THIEF, BLADE_FLASH, SCALD, DRAIN_PUNCH, ACROBATICS, SHADOW_HIT, AVALANCHE, U_TURN, GYRO_BALL, FLY, SURF, WHIRLPOOL, WATERFALL, KNIFE_THROW, BODY_SLAM, CHARM, COUNTER, DEFENSE_CURL, DOUBLE_EDGE, ENDURE, HEADBUTT, VOICE_BIND, ICE_PUNCH, ICY_WIND, IRON_HEAD, KNOCK_OFF, STEEL_FIST, ROLLOUT, SEISMIC_TOSS, SLEEP_TALK, SUCKER_PUNCH, SWAGGER
	; end
