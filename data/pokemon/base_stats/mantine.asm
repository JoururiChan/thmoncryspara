	db  85,  40,  70,  70,  80, 140 ; 485 BST
	;   hp  atk  def  spe  sat  sdf

	db WATER, FLYING ; type
	db 25 ; catch rate
	db 168 ; base exp
	db NO_ITEM, NO_ITEM ; held items
	dn GENDER_F50, HATCH_MEDIUM_SLOW ; gender ratio, step cycles to hatch

	abilities_for MANTINE, SWIFT_SWIM, WATER_ABSORB, WATER_VEIL
	db GROWTH_SLOW ; growth rate
	dn EGG_WATER_1, EGG_WATER_1 ; egg groups

	ev_yield 2 SDf

	; tm/hm learnset
	tmhm SPIRIT_VOICE, TOXIC, HAIL, HIDDEN_POWER, ICE_BEAM, BLIZZARD,  PROTECT, RAIN_DANCE, BULLDOZE, EARTHQUAKE, RETURN, DOUBLE_TEAM, SWIFT, AERIAL_ACE, SUBSTITUTE, FACADE, REST, ATTRACT, ROCK_SLIDE, WHITE_BIRD, SCALD, ACROBATICS, WATER_PULSE, GUNGNIR, FLY, SURF, WHIRLPOOL, WATERFALL, SPIDERS_NEST, AQUA_TAIL, BODY_SLAM, DOUBLE_EDGE, ENDURE, HEADBUTT, ICY_WIND, IRON_HEAD, SEED_BOMB, SLEEP_TALK, SWAGGER
	; end
