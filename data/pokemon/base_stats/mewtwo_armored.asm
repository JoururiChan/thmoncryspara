if DEF(FAITHFUL)
	db 106, 110,  90, 130, 154,  90 ; 680 BST
	;   hp  atk  def  spe  sat  sdf
else
	db 106, 110, 100, 130, 134, 100 ; 680 BST
	;   hp  atk  def  spe  sat  sdf
endc

if DEF(FAITHFUL)
	db PSYCHIC, PSYCHIC ; type
else
	db PSYCHIC, STEEL ; type
endc
	db 3 ; catch rate
	db 220 ; base exp
	db ALWAYS_ITEM_2, PETAYA_BERRY ; held items
	dn GENDER_UNKNOWN, HATCH_UNKNOWN ; gender ratio, step cycles to hatch

	abilities_for MEWTWO, PRESSURE, INSOMNIA, UNNERVE
	; assumes identical abilities to non-armored
	db GROWTH_SLOW ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups

if DEF(FAITHFUL)
	ev_yield 3 SAt
else
	ev_yield 1 Def, 2 SAt, 1 SDf
endc

	; tm/hm learnset
	tmhm DYNAMICPUNCH, SPIRIT_VOICE, CALM_MIND, TOXIC, HAIL, BULK_UP, HIDDEN_POWER, SUNNY_DAY, ICE_BEAM, BLIZZARD,  LIGHT_SCREEN, PROTECT, RAIN_DANCE, SAFEGUARD, BULLDOZE, FLOWER_SHOOT, RBOLT, THUNDER, EARTHQUAKE, RETURN, PSYCHIC, SHADOW_BALL, ROCK_SMASH, DOUBLE_TEAM, REFLECT, METEOR_FALL, SANDSTORM, HELL_TOKAMAK, SWIFT, AERIAL_ACE, SUBSTITUTE, FACADE, REST, ROCK_SLIDE, FOCUS_BLAST,  DRAIN_PUNCH, WILL_O_WISP, WATER_PULSE, POISON_JAB, AVALANCHE, GUNGNIR, FLASH, STONE_EDGE, THUNDER_WAVE, STRENGTH, SPIDERS_NEST,  BODY_SLAM, COUNTER, DOUBLE_EDGE, DREAM_EATER, EARTH_POWER, ENDURE, FIRE_PUNCH, HEADBUTT, ICE_PUNCH, ICY_WIND, PAY_DAY, SEISMIC_TOSS, SKILL_SWAP, SLEEP_TALK, SWAGGER, THUNDERPUNCH, TRICK, TRICK_ROOM, ZAP_CANNON, 
	; end
