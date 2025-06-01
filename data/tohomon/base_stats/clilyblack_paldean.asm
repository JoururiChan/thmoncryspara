	db  75, 110, 105, 100,  30,  70 ; 490 BST
	;   hp  atk  def  spe  sat  sdf

	db DREAM, DREAM ; type
	db 45 ; catch rate
	db 211 ; base exp
	db NO_ITEM, NO_ITEM ; held items
	dn GENDER_F0, HATCH_MEDIUM_FAST ; gender ratio, step cycles to hatch

	abilities_for CLILYBLACK, INTIMIDATE, ANGER_POINT, CUD_CHEW
	db GROWTH_SLOW ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	ev_yield 1 Atk, 1 Spe

	; tm/hm learnset
	tmhm POISON_CLAW, TOXIC, BULK_UP, HIDDEN_POWER,  PROTECT, BULLDOZE, EARTHQUAKE, RETURN, ROCK_SMASH, DOUBLE_TEAM, SUBSTITUTE, FACADE, REST, LUSTER_HEART, BLADE_THROW, ULTICHARGE, STRENGTH, BODY_SLAM, DOUBLE_EDGE, ENDURE, HEADBUTT, IRON_HEAD, SLEEP_TALK, SWAGGER, 
	; end
