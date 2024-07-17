if DEF(FAITHFUL)
	db  75,  85, 200,  30,  55,  65 ; 510 BST
	;   hp  atk  def  spe  sat  sdf
else
	db  75,  90, 200,  30,  55,  65 ; 515 BST
	;   hp  atk  def  spe  sat  sdf
endc

	db STEEL, GROUND ; type
	db 25 ; catch rate
	db 196 ; base exp
	db NO_ITEM, METAL_COAT ; held items
	dn GENDER_F50, HATCH_MEDIUM_SLOW ; gender ratio, step cycles to hatch

	abilities_for STEELIX, SHEER_FORCE, STURDY, SAND_FORCE
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_MINERAL, EGG_MINERAL ; egg groups

	ev_yield 2 Def

	; tm/hm learnset
	tmhm SPIRIT_VOICE, ROAR, TOXIC, HIDDEN_POWER, SUNNY_DAY,  PROTECT, BULLDOZE,  EARTHQUAKE, RETURN, DIG, ROCK_SMASH, DOUBLE_TEAM, FLASH_CANNON, SANDSTORM, SUBSTITUTE, FACADE, REST, ATTRACT, ROCK_SLIDE, DARK_PULSE, DRAGON_PULSE, EXPLOSION, GUNGNIR, STONE_EDGE, GYRO_BALL, CUT, STRENGTH, AQUA_TAIL, BODY_SLAM, DEFENSE_CURL, DOUBLE_EDGE, EARTH_POWER, ENDURE, HEADBUTT, IRON_HEAD, ROLLOUT, SLEEP_TALK, SWAGGER
	; end
