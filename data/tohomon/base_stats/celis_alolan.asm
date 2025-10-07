if DEF(FAITHFUL)
	db  75,  71,  70,  77,  40,  80 ; 413 BST
	;   hp  atk  def  spe  sat  sdf
else
	db  85,  81,  70,  87,  40,  80 ; 443 BST
	;   hp  atk  def  spe  sat  sdf
endc

	db DARK, ILLUSION ; type
	db 90 ; catch rate
	db 116 ; base exp
	db NO_ITEM, PECHA_BERRY ; held items
	dn GENDER_F50, HATCH_FAST ; gender ratio, step cycles to hatch

	abilities_for CELIS, GLUTTONY, HUSTLE, ICE_WALL
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	ev_yield 2 Spe

	; tm/hm learnset
	tmhm POISON_CLAW, ROAR, TOXIC, BULK_UP, HIDDEN_POWER, SUNNY_DAY, ICE_BEAM, BLIZZARD, RAIN_DANCE,  RETURN, DIG, SHADOW_BALL, ROCK_SMASH, DOUBLE_TEAM, SLUDGE_BOMB, SWIFT, SUBSTITUTE, FACADE, REST, LUSTER_HEART, THIEF, DARK_PULSE, SHADOW_HIT, ULTICHARGE, CHARGE_OUT, SWORDS_DANCE, CUT, STRENGTH, BODY_SLAM, COUNTER, DEFENSE_CURL, DOUBLE_EDGE, ENDURE, HEADBUTT, ICY_WIND, SLEEP_TALK, SUCKER_PUNCH, SWAGGER, 
	; end
