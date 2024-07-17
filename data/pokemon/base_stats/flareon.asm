	db  65, 130,  60,  65,  95, 110 ; 525 BST
	;   hp  atk  def  spe  sat  sdf

	db FIRE, FIRE ; type
	db 45 ; catch rate
	db 198 ; base exp
	db NO_ITEM, NO_ITEM ; held items
	dn GENDER_F12_5, HATCH_SLOWER ; gender ratio, step cycles to hatch

if DEF(FAITHFUL)
	abilities_for FLAREON, FLASH_FIRE, FLASH_FIRE, GUTS
else
	abilities_for FLAREON, FLASH_FIRE, DROUGHT, GUTS
endc
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	ev_yield 2 Atk

	; tm/hm learnset
	tmhm SPIRIT_VOICE, CALM_MIND, ROAR, TOXIC, HIDDEN_POWER, SUNNY_DAY,  PROTECT, RAIN_DANCE,  RETURN, DIG, SHADOW_BALL, ROCK_SMASH, DOUBLE_TEAM, METEOR_FALL, HELL_TOKAMAK, SWIFT, SUBSTITUTE, FACADE, FLAME_CHARGE, REST, ATTRACT, WILL_O_WISP, GUNGNIR, STRENGTH, BATON_PASS, BODY_SLAM, CHARM, DOUBLE_EDGE, ENDURE, HEADBUTT, VOICE_BIND, PAY_DAY, SLEEP_TALK, SWAGGER, ZAP_CANNON
	; end
