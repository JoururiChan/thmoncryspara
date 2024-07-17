if DEF(FAITHFUL)
	db  75, 123,  67,  95,  95,  85 ; 540 BST
	;   hp  atk  def  spe  sat  sdf
else
	db  75, 123,  67, 105,  95,  85 ; 550 BST
	;   hp  atk  def  spe  sat  sdf
endc

if DEF(FAITHFUL)
	db ELECTRIC, ELECTRIC ; type
else
	db ELECTRIC, FIGHTING ; type
endc
	db 30 ; catch rate
	db 199 ; base exp
	db PERSIM_BERRY, ELECTIRIZER ; held items
	dn GENDER_F25, HATCH_MEDIUM_SLOW ; gender ratio, step cycles to hatch

	abilities_for ELECTIVIRE, MOTOR_DRIVE, MOTOR_DRIVE, VITAL_SPIRIT
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_HUMANSHAPE, EGG_HUMANSHAPE ; egg groups

	ev_yield 3 Atk

	; tm/hm learnset
	tmhm DYNAMICPUNCH, SPIRIT_VOICE, TOXIC, BULK_UP, HIDDEN_POWER,  LIGHT_SCREEN, PROTECT, RAIN_DANCE, BULLDOZE,  THUNDERBOLT, THUNDER, EARTHQUAKE, RETURN, DIG, PSYCHIC, ROCK_SMASH, DOUBLE_TEAM, METEOR_FALL, SWIFT, SUBSTITUTE, FACADE, REST, ATTRACT, THIEF, ROCK_SLIDE, FOCUS_BLAST, KNIFE_THROW, GUNGNIR, FLASH, VOLT_SWITCH, THUNDER_WAVE, STRENGTH, BODY_SLAM, COUNTER, DOUBLE_EDGE, ENDURE, FIRE_PUNCH, HEADBUTT, ICE_PUNCH, SEISMIC_TOSS, SLEEP_TALK, SWAGGER, THUNDERPUNCH, ZAP_CANNON
	; end
