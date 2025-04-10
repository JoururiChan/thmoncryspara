if DEF(FAITHFUL)
	db  45,  75,  37,  83,  70,  55 ; 365 BST
	;   hp  atk  def  spe  sat  sdf
else
	db  50,  75,  37,  83,  70,  55 ; 370 BST
	;   hp  atk  def  spe  sat  sdf
endc

	db FIRE, FLYING ; type
	db 45 ; catch rate
	db 117 ; base exp
	db ASPEAR_BERRY, LILYWHITEIZER ; held items
	dn GENDER_F25, HATCH_MEDIUM_SLOW ; gender ratio, step cycles to hatch

	abilities_for AUTSUHO, FLAME_BODY, FLAME_BODY, VITAL_SPIRIT
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups

	ev_yield 1 Spe

	; tm/hm learnset
	tmhm DYNAMICPUNCH, POISON_CLAW, TOXIC, HIDDEN_POWER, SUNNY_DAY, PROTECT,  RETURN, MANA_BURST, ROCK_SMASH, DOUBLE_TEAM, FLAME_SHOOT, HELLBLAZE, SUBSTITUTE, FACADE, FLAME_CHARGE, REST, LUSTER_HEART, THIEF, WILL_O_WISP, BODY_SLAM, COUNTER, DOUBLE_EDGE, ENDURE, FIRE_PUNCH, HEADBUTT, SEISMIC_TOSS, SLEEP_TALK, SWAGGER, THUNDERPUNCH
	; end
