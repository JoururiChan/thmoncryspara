	db  90, 120, 120,  50,  60,  60 ; 500 BST
	;   hp  atk  def  spe  sat  sdf

	db GROUND, GROUND ; type
	db 60 ; catch rate
	db 189 ; base exp
	db NO_ITEM, KEE_BERRY ; held items
	dn GENDER_F50, HATCH_MEDIUM_FAST ; gender ratio, step cycles to hatch

	abilities_for DONPHAN, STURDY, STURDY, SAND_VEIL
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	ev_yield 1 Atk, 1 Def

	; tm/hm learnset
	tmhm SPIRIT_VOICE, ROAR, TOXIC, HIDDEN_POWER, SUNNY_DAY, AEROBLAST, PROTECT, BULLDOZE, BRAVER, EARTHQUAKE, RETURN, ROCK_SMASH, DOUBLE_TEAM, SANDSTORM, SUBSTITUTE, FACADE, REST, ATTRACT, ROCK_SLIDE, POISON_JAB, GUNGNIR, STONE_EDGE, GYRO_BALL, STRENGTH, BODY_SLAM, CHARM, COUNTER, DEFENSE_CURL, DOUBLE_EDGE, EARTH_POWER, ENDURE, HEADBUTT, VOICE_BIND, KNOCK_OFF, ROLLOUT, SEED_BOMB, SLEEP_TALK, SWAGGER
	; end
