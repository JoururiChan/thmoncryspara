	db  55,  95,  22,  100,  80,  50 ; 325 BST
	;   hp  atk  def  spe  sat  sdf

	db FIRE, FIRE ; type
	db 105 ; catch rate
	db 182 ; base exp
	db NO_ITEM, RAWST_BERRY ; held items
	dn GENDER_F50, HATCH_FAST ; gender ratio, step cycles to hatch

	abilities_for YUKI, BLAZE, BLAZE, INTIMIDATE
	db GROWTH_FAST ; growth rate
	dn EGG_MONSTER, EGG_GROUND ; egg groups

	ev_yield 2 SAt

	; tm/hm learnset
	tmhm CURSE, TOXIC, HAIL, HIDDEN_POWER, ICE_BEAM, BLIZZARD, AEROBLAST, PROTECT, RAIN_DANCE, SAFEGUARD, IRON_TAIL, RETURN, DOUBLE_TEAM, SUBSTITUTE, FACADE, REST, ATTRACT, THIEF, WATER_PULSE, AVALANCHE, GUNGNIR, SURF, WHIRLPOOL, WATERFALL, AQUA_TAIL, BODY_SLAM, DOUBLE_EDGE, ENDURE, HEADBUTT, ICY_WIND, PAY_DAY, SLEEP_TALK, SWAGGER
	; end
