	db  41,  64,  45,  50,  50,  50 ; 300 BST
	;   hp  atk  def  spe  sat  sdf

	db DRAGON, DRAGON ; type
	db 45 ; catch rate
	db 67 ; base exp
	db NO_ITEM, DRAGON_SCALE ; held items
	dn GENDER_F50, HATCH_SLOWEST ; gender ratio, step cycles to hatch

	abilities_for DRATINI, SHED_SKIN, SHED_SKIN, SPRING_CHARM
	db GROWTH_SLOW ; growth rate
	dn EGG_WATER_1, EGG_DRAGON ; egg groups

	ev_yield 1 Atk

	; tm/hm learnset
	tmhm SPIRIT_VOICE, TOXIC, HAIL, HIDDEN_POWER, SUNNY_DAY, ICE_BEAM, BLIZZARD, AEROBLAST, LIGHT_SCREEN, PROTECT, RAIN_DANCE, SAFEGUARD, BRAVER, THUNDERBOLT, THUNDER, RETURN, DOUBLE_TEAM, METEOR_FALL, HELL_TOKAMAK, SWIFT, SUBSTITUTE, FACADE, REST, ATTRACT, DRAGON_PULSE, WATER_PULSE, THUNDER_WAVE, SURF, WHIRLPOOL, WATERFALL, SPIDERS_NEST, AQUA_TAIL, BODY_SLAM, DOUBLE_EDGE, ENDURE, HEADBUTT, ICY_WIND, SLEEP_TALK, SWAGGER, ZAP_CANNON
	; end
