	db  30,  40,  25,  43,  55,  20 ; 265 BST
	;   hp  atk  def  spe  sat  sdf

	db WATER, WIND ; type
	db 125 ; catch rate
	db 115 ; base exp
	db NO_ITEM, SOFT_SAND ; held items
	dn GENDER_F50, HATCH_FAST ; gender ratio, step cycles to hatch

	abilities_for CCHIYURI, STATIC, SWIFT_SWIM, SWIFT_SWIM
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_WATER_1, EGG_GROUND ; egg groups

	ev_yield 1 Spe

	; tm/hm learnset
	tmhm DYNAMICPUNCH, ROAR, BULK_UP, HIDDEN_POWER, HONE_TOOLS, ICE_BEAM, BLIZZARD, TENSION_KICK, PROTECT, RAIN_DANCE, RETURN, SAFEGUARD, THUNDERBOLT, DIG, ROCK_SMASH, DOUBLE_TEAM, REFLECT, SUBSTITUTE, FACADE, SWIFT, REST, ATTRACT, SHADOW_HIT, SCALD, FOCUS_BLAST, DRAIN_PUNCH, ACROBATICS, WATER_PULSE, VOLT_SWITCH, THUNDER_WAVE, FLASH, SURF, STRENGTH, WHIRLPOOL, WATERFALL, BODY_SLAM, CHARM, COUNTER, DEFENSE_CURL, DOUBLE_EDGE, ENDURE, HEADBUTT, ICE_PUNCH, ICY_WIND, IRON_HEAD, KNOCK_OFF, STEEL_FIST, TREMORS, SEISMIC_TOSS, SLEEP_TALK, SUCKER_PUNCH, SWAGGER, THUNDERPUNCH, TRICK_ROOM, ZAP_CANNON
	; end
