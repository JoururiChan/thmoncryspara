if DEF(FAITHFUL)
	db  65,  50,  35,  95, 115,  95 ; 455 BST
	;   hp  atk  def  spe  sat  sdf
else
	db  70,  60,  40,  95, 120, 100 ; 485 BST
	;   hp  atk  def  spe  sat  sdf
endc

	db ICE, REASON ; type
	db 45 ; catch rate
	db 137 ; base exp
	db RAWST_BERRY, RAWST_BERRY ; held items
	dn GENDER_F100, HATCH_MEDIUM_SLOW ; gender ratio, step cycles to hatch

if DEF(FAITHFUL)
	abilities_for HCHEN, OBLIVIOUS, FOREWARN, DRY_SKIN
else
	abilities_for HCHEN, OBLIVIOUS, FILTER, DRY_SKIN
endc
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_HUMANSHAPE, EGG_HUMANSHAPE ; egg groups

	ev_yield 2 SAt

	; tm/hm learnset
	tmhm DYNAMICPUNCH, SHADOW_FORCE, CALM_MIND, TOXIC, HAIL, HIDDEN_POWER, ICE_BEAM, BLIZZARD,  LIGHT_SCREEN, PROTECT, RAIN_DANCE, RETURN, PSYCHIC, SHADOW_BALL, ROCK_SMASH, DOUBLE_TEAM, REFLECT, SUBSTITUTE, FACADE, REST, ATTRACT, THIEF, FOCUS_BLAST,  DRAIN_PUNCH, WATER_PULSE, AVALANCHE, ULTICHARGE, FLASH, BODY_SLAM, CHARM, COUNTER, DOUBLE_EDGE, DREAM_EATER, ENDURE, HEADBUTT, VOICE_BIND, ICE_PUNCH, ICY_WIND, SEISMIC_TOSS, SKILL_SWAP, SLEEP_TALK, SWAGGER, TRICK, TRICK_ROOM, 
	; end
