	db 130, 140, 105,  50,  45,  80 ; 550 BST
	;   hp  atk  def  spe  sat  sdf

	db EARTH, ILLUSION ; type
	db 30 ; catch rate
	db 229 ; base exp
	db ALWAYS_ITEM_2, SITRUS_BERRY ; held items
	dn GENDER_F50, HATCH_MEDIUM_FAST ; gender ratio, step cycles to hatch

	abilities_for URSALUNA, GUTS, BULLETPROOF, UNNERVE
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	ev_yield 3 Atk

	; tm/hm learnset
	tmhm DYNAMICPUNCH, SHADOW_FORCE, ROAR, TOXIC, BULK_UP, HIDDEN_POWER, SUNNY_DAY, HONE_TOOLS,  PROTECT, RAIN_DANCE, BULLDOZE, EARTHQUAKE, RETURN, DIG, ROCK_SMASH, DOUBLE_TEAM, SWIFT, AERIAL_ACE, SUBSTITUTE, FACADE, REST, ATTRACT, THIEF, ROCK_SLIDE, FOCUS_BLAST, BLADE_FLASH, DRAIN_PUNCH, SHADOW_HIT, AVALANCHE, ULTICHARGE, STONE_RISE, SWORDS_DANCE, CUT, STRENGTH, BODY_SLAM, CHARM, COUNTER, DEFENSE_CURL, DOUBLE_EDGE, ENDURE, FIRE_PUNCH, HEADBUTT, VOICE_BIND, ICE_PUNCH, TREMORS, SEED_BOMB, SEISMIC_TOSS, SLEEP_TALK, SWAGGER, THUNDERPUNCH, ZAP_CANNON
	; end
