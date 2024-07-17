	db 130,  65,  60,  65, 110,  95 ; 525 BST
	;   hp  atk  def  spe  sat  sdf

	db WATER, WATER ; type
	db 45 ; catch rate
	db 196 ; base exp
	db NO_ITEM, NO_ITEM ; held items
	dn GENDER_F12_5, HATCH_SLOWER ; gender ratio, step cycles to hatch

if DEF(FAITHFUL)
	abilities_for VAPOREON, WATER_ABSORB, WATER_ABSORB, HYDRATION
else
	abilities_for VAPOREON, WATER_ABSORB, DRIZZLE, HYDRATION
endc
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	ev_yield 2 HP

	; tm/hm learnset
	tmhm SPIRIT_VOICE, CALM_MIND, ROAR, TOXIC, HAIL, HIDDEN_POWER, SUNNY_DAY, ICE_BEAM, BLIZZARD, AEROBLAST, PROTECT, RAIN_DANCE, BRAVER, RETURN, DIG, SHADOW_BALL, ROCK_SMASH, DOUBLE_TEAM, SWIFT, SUBSTITUTE, FACADE, REST, ATTRACT, SCALD, WATER_PULSE, GUNGNIR, SURF, STRENGTH, WHIRLPOOL, WATERFALL, AQUA_TAIL, BATON_PASS, BODY_SLAM, CHARM, DOUBLE_EDGE, ENDURE, HEADBUTT, VOICE_BIND, ICY_WIND, PAY_DAY, SLEEP_TALK, SWAGGER
	; end
