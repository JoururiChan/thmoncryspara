	db  80, 105,  65, 130,  60,  75 ; 515 BST
	;   hp  atk  def  spe  sat  sdf

	db ROCK, FLYING ; type
	db 45 ; catch rate
	db 202 ; base exp
	db NO_ITEM, NO_ITEM ; held items
	dn GENDER_F12_5, HATCH_SLOWER ; gender ratio, step cycles to hatch

	abilities_for AERODACTYL, ROCK_HEAD, UNNERVE, TOUGH_CLAWS
	db GROWTH_SLOW ; growth rate
	dn EGG_FLYING, EGG_FLYING ; egg groups

	ev_yield 2 Spe

	; tm/hm learnset
	tmhm SPIRIT_VOICE, SPIRIT_VOICE, ROAR, TOXIC, HIDDEN_POWER, SUNNY_DAY, HONE_TOOLS, AEROBLAST, PROTECT, RAIN_DANCE, BULLDOZE, BRAVER, EARTHQUAKE, RETURN, ROCK_SMASH, DOUBLE_TEAM, METEOR_FALL, SANDSTORM, HELL_TOKAMAK, SWIFT, AERIAL_ACE, SUBSTITUTE, FACADE, REST, ATTRACT, THIEF, STEEL_WING, ROCK_SLIDE, WHITE_BIRD, DRAGON_PULSE, GUNGNIR, STONE_EDGE, FLY, STRENGTH, SPIDERS_NEST, AQUA_TAIL, DOUBLE_EDGE, EARTH_POWER, ENDURE, HEADBUTT, IRON_HEAD, SLEEP_TALK, SWAGGER
	; end
