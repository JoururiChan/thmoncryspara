	db  94,  118,  100,  86,  46,  31 ; 320 BST
	;   hp  atk  def  spe  sat  sdf

	db FAIRY, FIGHTING ; type
	db 201 ; catch rate
	db 101 ; base exp
	db NO_ITEM, NO_ITEM ; held items
	dn GENDER_F50, HATCH_MEDIUM_SLOW ; gender ratio, step cycles to hatch

	abilities_for EKOTOHIME, OWN_TEMPO, COLLECTOR, COLLECTOR
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_FAIRY, EGG_GROUND ; egg groups

	ev_yield 3 Def

	; tm/hm learnset
	tmhm DYNAMICPUNCH, TOXIC, BULK_UP, HIDDEN_POWER, PROTECT, SAFEGUARD, RETURN, FLOWER_SHOOT, DOUBLE_TEAM, BULLDOZE, SWIFT, DIG, SUBSTITUTE, FACADE, ROCK_SMASH, REST, ATTRACT, REFLECT, SANDSTORM, FLAME_CHARGE, ROCK_SLIDE, ACROBATICS, POISON_JAB, FOCUS_BLAST, SHADOW_HIT, AVALANCHE, STONE_EDGE, GYRO_BALL, STRENGTH, SPIDERS_NEST, DOUBLE_EDGE, ENDURE, SLEEP_TALK, SWAGGER, LUNAR_BASH
	; end
