if DEF(FAITHFUL)
	db  65,  83,  57, 105,  95,  85 ; 490 BST
	;   hp  atk  def  spe  sat  sdf
else
	db  65,  88,  57, 105,  95,  85 ; 495 BST
	;   hp  atk  def  spe  sat  sdf
endc

	db ELECTRIC, ELECTRIC ; type
	db 45 ; catch rate
	db 156 ; base exp
	db PERSIM_BERRY, ELECTIRIZER ; held items
	dn GENDER_F25, HATCH_MEDIUM_SLOW ; gender ratio, step cycles to hatch

	abilities_for ELECTABUZZ, STATIC, STATIC, VITAL_SPIRIT
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_HUMANSHAPE, EGG_HUMANSHAPE ; egg groups

	ev_yield 2 Spe

	; tm/hm learnset
	tmhm DYNAMICPUNCH, SPIRIT_VOICE, TOXIC, BULK_UP, HIDDEN_POWER, AEROBLAST, LIGHT_SCREEN, PROTECT, RAIN_DANCE, BRAVER, THUNDERBOLT, THUNDER, RETURN, PSYCHIC, ROCK_SMASH, DOUBLE_TEAM, SWIFT, SUBSTITUTE, FACADE, REST, ATTRACT, THIEF, FOCUS_BLAST, KNIFE_THROW, GUNGNIR, FLASH, VOLT_SWITCH, THUNDER_WAVE, STRENGTH, BODY_SLAM, COUNTER, DOUBLE_EDGE, ENDURE, FIRE_PUNCH, HEADBUTT, ICE_PUNCH, SEISMIC_TOSS, SLEEP_TALK, SWAGGER, THUNDERPUNCH, ZAP_CANNON
	; end
