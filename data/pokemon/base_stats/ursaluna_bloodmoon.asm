	db 113,  70, 120,  52, 135,  65 ; 555 BST
	;   hp  atk  def  spe  sat  sdf

	db GROUND, NORMAL ; type
	db 20 ; catch rate
	db 239 ; base exp
	db ALWAYS_ITEM_2, LUM_BERRY ; held items
	dn GENDER_F0, HATCH_MEDIUM_FAST ; gender ratio, step cycles to hatch

	abilities_for URSALUNA_BLOODMOON, MINDS_EYE, MINDS_EYE, MINDS_EYE
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups

	ev_yield 3 SAt

	; tm/hm learnset
	tmhm DYNAMICPUNCH, POISON_CLAW, ROAR, TOXIC, BULK_UP, HIDDEN_POWER, SUNNY_DAY, HONE_TOOLS,  PROTECT, RAIN_DANCE, BULLDOZE, EARTHQUAKE, RETURN, DIG, ROCK_SMASH, DOUBLE_TEAM, SWIFT, AERIAL_ACE, SUBSTITUTE, FACADE, REST, LUSTER_HEART, THIEF, ROCK_SLIDE, FOCUS_BLAST, BLADE_FLASH, DRAIN_PUNCH, SHADOW_HIT, AVALANCHE, ULTICHARGE, STONE_HIT, SWORDS_DANCE, CUT, STRENGTH, BODY_SLAM, CHARM, COUNTER, DEFENSE_CURL, DOUBLE_EDGE, ENDURE, FIRE_PUNCH, HEADBUTT, VOICE_BIND, ICE_PUNCH, TREMORS, SEED_BOMB, SEISMIC_TOSS, SLEEP_TALK, SWAGGER, THUNDERPUNCH, ZAP_CANNON
	; end
