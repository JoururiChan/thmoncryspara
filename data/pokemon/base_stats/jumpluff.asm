if DEF(FAITHFUL)
	db  75,  55,  70, 110,  55,  95 ; 460 BST
	;   hp  atk  def  spe  sat  sdf
else
	db  95,  55,  70, 110,  55,  95 ; 480 BST
	;   hp  atk  def  spe  sat  sdf
endc

	db GRASS, FLYING ; type
	db 45 ; catch rate
	db 176 ; base exp
	db NO_ITEM, NO_ITEM ; held items
	dn GENDER_F50, HATCH_MEDIUM_FAST ; gender ratio, step cycles to hatch

	abilities_for JUMPLUFF, CHLOROPHYLL, LEAF_GUARD, INFILTRATOR
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_FAIRY, EGG_PLANT ; egg groups

	ev_yield 3 Spe

	; tm/hm learnset
	tmhm SPIRIT_VOICE, TOXIC, HIDDEN_POWER, SUNNY_DAY, RN, DOUBLE_TEAM, REFLECT, AERIAL_ACE, SUBSTITUTE, FACADE, REST, ATTRACT, ENERGY_LIGHT,  BLADE_FLASH, ACROBATICS, GUNGNIR, U_TURN, FLASH, SWORDS_DANCE, SPIDERS_NEST, BATON_PASS, CHARM, DEFENSE_CURL, DOUBLE_EDGE, ENDURE, HEADBUTT, PAY_DAY, SEED_BOMB, SLEEP_TALK, SWAGGER
	; end
