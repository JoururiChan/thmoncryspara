	db  95,  140,  63,  120, 85, 96 ; 320 BST
	;   hp  atk  def  spe  sat  sdf

	db FIGHTING, DRAGON ; type
	db 160 ; catch rate
	db 220 ; base exp
	db NO_ITEM, THICK_CLUB ; held items
	dn GENDER_F50, HATCH_FASTEST ; gender ratio, step cycles to hatch

	abilities_for EMEILING, GATE_KEEPER, GATE_KEEPER, IRON_FIST
	db GROWTH_FAST ; growth rate
	dn EGG_HUMANSHAPE, EGG_DRAGON ; egg groups

	ev_yield 3 Atk

	; tm/hm learnset
	tmhm DYNAMICPUNCH, POWER_TRICK, CALM_MIND, TOXIC, ROAR, BULK_UP, HIDDEN_POWER, SUNNY_DAY, TENSION_KICK, PROTECT, BULLDOZE, EARTHQUAKE, RETURN, DIG, ROCK_SMASH, PSYCHIC, DOUBLE_TEAM, REFLECT, METEOR_FALL, SANDSTORM, SWIFT, AERIAL_ACE, SUBSTITUTE, FACADE, REST, ATTRACT, FLAME_CHARGE, ROCK_SLIDE, ENERGY_LIGHT, SHADOW_HIT, FOCUS_BLAST, DREAM_HEAVEN, BLAZE_STAR, DRAGON_PULSE, DRAIN_PUNCH, ACROBATICS, POISON_JAB, AVALANCHE, STONE_EDGE, GYRO_BALL, STRENGTH, WATERFALL, BATON_PASS, BODY_SLAM, COUNTER, DOUBLE_EDGE, EARTH_POWER, ENDURE, FIRE_PUNCH, HEADBUTT, ICE_PUNCH, ICY_WIND, IRON_HEAD, STEEL_FIST, SEISMIC_TOSS, SLEEP_TALK, SKILL_SWAP, SWAGGER, SUCKER_PUNCH, THUNDERPUNCH, TRICK_ROOM
	; end
