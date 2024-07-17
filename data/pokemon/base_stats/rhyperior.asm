if DEF(FAITHFUL)
	db 115, 140, 130,  40,  55,  55 ; 535 BST
	;   hp  atk  def  spe  sat  sdf
else
	db 120, 140, 130,  40,  55,  60 ; 545 BST
	;   hp  atk  def  spe  sat  sdf
endc

if DEF(FAITHFUL)
	db GROUND, ROCK ; type
else
	db STEEL, ROCK ; type
endc
	db 30 ; catch rate
	db 217 ; base exp
	db NO_ITEM, NO_ITEM ; held items
	dn GENDER_F50, HATCH_MEDIUM_FAST ; gender ratio, step cycles to hatch

	abilities_for RHYPERIOR, LIGHTNING_ROD, SOLID_ROCK, RECKLESS
	db GROWTH_SLOW ; growth rate
	dn EGG_MONSTER, EGG_GROUND ; egg groups

	ev_yield 3 Atk

	; tm/hm learnset
	tmhm DYNAMICPUNCH, SPIRIT_VOICE, ROAR, TOXIC, HIDDEN_POWER, SUNNY_DAY, ICE_BEAM, BLIZZARD, AEROBLAST, PROTECT, RAIN_DANCE, BULLDOZE, BRAVER, THUNDERBOLT, THUNDER, EARTHQUAKE, RETURN, DIG, ROCK_SMASH, DOUBLE_TEAM, FLASH_CANNON, METEOR_FALL, SANDSTORM, HELL_TOKAMAK, SUBSTITUTE, FACADE, REST, ATTRACT, THIEF, ROCK_SLIDE, FOCUS_BLAST, DRAGON_PULSE, SHADOW_HIT, POISON_JAB, AVALANCHE, GUNGNIR, STONE_EDGE, SWORDS_DANCE, CUT, SURF, STRENGTH, WHIRLPOOL, AQUA_TAIL, BODY_SLAM, COUNTER, DOUBLE_EDGE, EARTH_POWER, ENDURE, FIRE_PUNCH, HEADBUTT, ICE_PUNCH, ICY_WIND, IRON_HEAD, PAY_DAY, ROLLOUT, SEISMIC_TOSS, SLEEP_TALK, SWAGGER, THUNDERPUNCH, ZAP_CANNON
	; end
