	db  55,  25,  65,  22,  65,  65 ; 288 BST
	;   hp  atk  def  spe  sat  sdf

	db PSYCHIC, ROCK ; type
	db 100 ; catch rate
	db 110 ; base exp
	db NO_ITEM, NO_ITEM ; held items
	dn GENDER_F50, HATCH_MEDIUM_FAST ; gender ratio, step cycles to hatch

	abilities_for CKIKURI, LEVITATE, LEVITATE, LEVITATE
	db GROWTH_FAST ; growth rate
	dn EGG_MINERAL, EGG_INDETERMINATE ; egg groups

	ev_yield 1 Def

	; tm/hm learnset
	tmhm SPIRIT_VOICE, CALM_MIND, TOXIC, HIDDEN_POWER, PROTECT, RAIN_DANCE, RETURN, PSYCHIC, REFLECT, FLASH_CANNON, SUBSTITUTE, FACADE, REST, ATTRACT, ENERGY_LIGHT, WILL_O_WISP, STONE_EDGE, FLASH, VOLT_SWITCH, THUNDER_WAVE, GYRO_BALL, AQUA_TAIL, BODY_SLAM, DOUBLE_EDGE, ENDURE, HEADBUTT, SEED_BOMB, SLEEP_TALK, SWAGGER
	; end
