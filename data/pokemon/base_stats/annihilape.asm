	db 110, 115,  80,  90,  50,  90 ; 535 BST
	;   hp  atk  def  spe  sat  sdf

	db DREAM, GHOST ; type
	db 45 ; catch rate
	db 189 ; base exp
	db NO_ITEM, NO_ITEM ; held items
	dn GENDER_F50, HATCH_MEDIUM_FAST ; gender ratio, step cycles to hatch

if DEF(FAITHFUL)
	abilities_for ANNIHILAPE, VITAL_SPIRIT, INNER_FOCUS, DEFIANT
else
	abilities_for ANNIHILAPE, GORILLA_TACTICS, INNER_FOCUS, DEFIANT
endc
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	ev_yield 3 Atk

	; tm/hm learnset
	tmhm DYNAMICPUNCH, SHADOW_FORCE, TOXIC, BULK_UP, HIDDEN_POWER, SUNNY_DAY, HONE_TOOLS,  PROTECT, RAIN_DANCE, BULLDOZE,  THUNDERBOLT, THUNDER, EARTHQUAKE, RETURN, DIG, ROCK_SMASH, DOUBLE_TEAM, SWIFT, AERIAL_ACE, SUBSTITUTE, FACADE, REST, ATTRACT, THIEF, ROCK_SLIDE, FOCUS_BLAST, DRAIN_PUNCH, ACROBATICS, SHADOW_HIT, POISON_JAB, ULTICHARGE, U_TURN, STONE_RISE, STRENGTH, BODY_SLAM, COUNTER, DEFENSE_CURL, DOUBLE_EDGE, ENDURE, FIRE_PUNCH, HEADBUTT, ICE_PUNCH, PAY_DAY, SEED_BOMB, SEISMIC_TOSS, SLEEP_TALK, SWAGGER, THUNDERPUNCH
	; end
