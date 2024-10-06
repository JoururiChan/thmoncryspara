if DEF(FAITHFUL)
	db  60,  85,  50, 110,  95,  80 ; 480 BST
	;   hp  atk  def  spe  sat  sdf
else
	db  60,  95,  50, 121, 105,  85 ; 516 BST
	;   hp  atk  def  spe  sat  sdf
endc

	db WIND, REASON ; type
	db 75 ; catch rate
if DEF(FAITHFUL)
	db 122 ; base exp
else
	db 179 ; base exp
endc
	db ORAN_BERRY, LIGHT_BALL ; held items
	dn GENDER_F50, HATCH_FASTER ; gender ratio, step cycles to hatch

	abilities_for CSARIEL, STATIC, STATIC, MOTOR_DRIVE
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_FAIRY ; egg groups

	ev_yield 3 Spe

	; tm/hm learnset
	tmhm DYNAMICPUNCH, SHADOW_FORCE, CALM_MIND, TOXIC, HIDDEN_POWER,  LIGHT_SCREEN, PROTECT, RAIN_DANCE, SAFEGUARD,  THUNDERBOLT, THUNDER, RETURN, DIG, PSYCHIC, ROCK_SMASH, DOUBLE_TEAM, REFLECT, SWIFT, SUBSTITUTE, FACADE, REST, ATTRACT, THIEF, FOCUS_BLAST, KNIFE_THROW, ULTICHARGE, FLASH, VOLT_SWITCH, THUNDER_WAVE, SURF, STRENGTH, LEAF_STORM, BODY_SLAM, CHARM, COUNTER, DEFENSE_CURL, DOUBLE_EDGE, ENDURE, HEADBUTT, KNOCK_OFF, PAY_DAY, TREMORS, SEISMIC_TOSS, SLEEP_TALK, SWAGGER, THUNDERPUNCH, ZAP_CANNON
	; end
