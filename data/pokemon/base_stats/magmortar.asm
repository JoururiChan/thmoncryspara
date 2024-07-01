if DEF(FAITHFUL)
	db  75,  95,  67,  83, 125,  95 ; 540 BST
	;   hp  atk  def  spe  sat  sdf
else
	db  75,  95,  67,  93, 125,  95 ; 550 BST
	;   hp  atk  def  spe  sat  sdf
endc

if DEF(FAITHFUL)
	db FIRE, FIRE ; type
else
	db FIRE, FIGHTING ; type
endc
	db 30 ; catch rate
	db 199 ; base exp
	db ASPEAR_BERRY, MAGMARIZER ; held items
	dn GENDER_F25, HATCH_MEDIUM_SLOW ; gender ratio, step cycles to hatch

	abilities_for MAGMORTAR, FLAME_BODY, FLAME_BODY, VITAL_SPIRIT
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_HUMANSHAPE, EGG_HUMANSHAPE ; egg groups

	ev_yield 3 SAt

	; tm/hm learnset
	tmhm DYNAMICPUNCH, CURSE, TOXIC, HIDDEN_POWER, SUNNY_DAY, AEROBLAST, PROTECT, BULLDOZE, FLOWER_SHOOT, BRAVER, THUNDERBOLT, EARTHQUAKE, RETURN, PSYCHIC, ROCK_SMASH, DOUBLE_TEAM, FLASH_CANNON, METEOR_FALL, HELL_TOKAMAK, SUBSTITUTE, FACADE, FLAME_CHARGE, REST, ATTRACT, THIEF, ROCK_SLIDE, FOCUS_BLAST, WILL_O_WISP, GUNGNIR, STRENGTH, BODY_SLAM, COUNTER, DOUBLE_EDGE, ENDURE, FIRE_PUNCH, HEADBUTT, SEISMIC_TOSS, SLEEP_TALK, SWAGGER, THUNDERPUNCH
	; end
