	db  55,  40,  40,  35,  65,  45 ; 280 BST
	;   hp  atk  def  spe  sat  sdf

	db WIND, WIND ; type
	db 235 ; catch rate
	db 59 ; base exp
	db NO_ITEM, NO_ITEM ; held items
	dn GENDER_F50, HATCH_MEDIUM_FAST ; gender ratio, step cycles to hatch

if DEF(FAITHFUL)
	abilities_for MAREEP, STATIC, STATIC, STATIC
else
	abilities_for MAREEP, STATIC, STATIC, MOTOR_DRIVE
endc
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_MONSTER, EGG_GROUND ; egg groups

	ev_yield 1 SAt

	; tm/hm learnset
	tmhm SHADOW_FORCE, TOXIC, HIDDEN_POWER, LIGHT_SCREEN, PROTECT, RAIN_DANCE, SAFEGUARD,  THUNDERBOLT, THUNDER, RETURN, DOUBLE_TEAM, SWIFT, SUBSTITUTE, FACADE, REST, ATTRACT, KNIFE_THROW, FLASH, THUNDER_WAVE, LEAF_STORM, BODY_SLAM, DEFENSE_CURL, DOUBLE_EDGE, ENDURE, HEADBUTT, SLEEP_TALK, SWAGGER, ZAP_CANNON
	; end
