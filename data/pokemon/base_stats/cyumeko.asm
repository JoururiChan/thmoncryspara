	db  35, 70,  30,  70,  25,  30 ; 500 BST
	;   hp  atk  def  spe  sat  sdf

	db STEEL, STEEL ; type
	db 60 ; catch rate
	db 110 ; base exp
	db BLACK_SLUDGE, NUGGET ; held items
	dn GENDER_F50, HATCH_SLOWER ; gender ratio, step cycles to hatch

	abilities_for CYUMEKO, BATTLE_ARMOR, BATTLE_ARMOR, TECHNICIAN
	db GROWTH_FAST ; growth rate
	dn EGG_MINERAL, EGG_MONSTER ; egg groups

	ev_yield 1 Atk

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HIDDEN_POWER, ROAR, BULK_UP, PROTECT, HONE_TOOLS, TENSION_KICK, RETURN, DIG, EARTHQUAKE, ROCK_SMASH, DOUBLE_TEAM, REFLECT, SUBSTITUTE, FACADE, REST, ATTRACT, THIEF, SWIFT, AERIAL_ACE, FOCUS_BLAST, FLAME_CHARGE, ENERGY_LIGHT, BLADE_FLASH, DRAIN_PUNCH, SHADOW_HIT, POISON_JAB, ULTICHARGE, STONE_RISE, SWORDS_DANCE, CUT, STRENGTH, KNIFE_THROW, BATON_PASS, COUNTER, DOUBLE_EDGE, EARTH_POWER, ENDURE, FIRE_PUNCH, HEADBUTT, IRON_HEAD, KNOCK_OFF, STEEL_FIST, TREMORS, SEISMIC_TOSS, SLEEP_TALK, SWAGGER, SUCKER_PUNCH, THUNDERPUNCH, TRICK_ROOM
	; end
