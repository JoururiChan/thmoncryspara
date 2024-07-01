if DEF(FAITHFUL)
	db  60,  80, 110,  45,  50,  80 ; 425 BST
	;   hp  atk  def  spe  sat  sdf
else
	db  60,  80, 110,  70,  50,  80 ; 450 BST
	;   hp  atk  def  spe  sat  sdf
endc

	db FIRE, GHOST ; type
	db 75 ; catch rate
if DEF(FAITHFUL)
	db 124 ; base exp
else
	db 140 ; base exp
endc
	db NO_ITEM, THICK_CLUB ; held items
	dn GENDER_F50, HATCH_MEDIUM_FAST ; gender ratio, step cycles to hatch

	abilities_for MEILING_ALOLAN, CURSED_BODY, LIGHTNING_ROD, ROCK_HEAD
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_MONSTER, EGG_MONSTER ; egg groups

	ev_yield 2 Def

	; tm/hm learnset
	tmhm DYNAMICPUNCH, CURSE, TOXIC, HIDDEN_POWER, SUNNY_DAY, ICE_BEAM, BLIZZARD, AEROBLAST, PROTECT, RAIN_DANCE, BULLDOZE, BRAVER, THUNDERBOLT, THUNDER, EARTHQUAKE, RETURN, DIG, SHADOW_BALL, ROCK_SMASH, DOUBLE_TEAM, METEOR_FALL, SANDSTORM, HELL_TOKAMAK, AERIAL_ACE, SUBSTITUTE, FACADE, FLAME_CHARGE, REST, ATTRACT, THIEF, ROCK_SLIDE, FOCUS_BLAST, BLADE_FLASH, DARK_PULSE, WILL_O_WISP, ACROBATICS, SHADOW_HIT, GUNGNIR, STONE_EDGE, SWORDS_DANCE, STRENGTH, BODY_SLAM, COUNTER, DOUBLE_EDGE, DREAM_EATER, EARTH_POWER, ENDURE, FIRE_PUNCH, HEADBUTT, ICE_PUNCH, ICY_WIND, IRON_HEAD, KNOCK_OFF, SEISMIC_TOSS, SLEEP_TALK, SWAGGER, THUNDERPUNCH
	; end
