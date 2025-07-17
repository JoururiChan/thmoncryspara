if DEF(FAITHFUL)
	db 100, 125,  52,  71, 105,  52 ; 505 BST
	;   hp  atk  def  spe  sat  sdf
else
	db 105, 125,  52,  71, 105,  52 ; 510 BST
	;   hp  atk  def  spe  sat  sdf
endc

	db DARK, FLYING ; type
	db 30 ; catch rate
	db 187 ; base exp
	db NO_ITEM, NO_ITEM ; held items
	dn GENDER_F50, HATCH_MEDIUM_FAST ; gender ratio, step cycles to hatch

	abilities_for CSHOU, INSOMNIA, SUPER_LUCK, MOXIE
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_FLYING, EGG_FLYING ; egg groups

	ev_yield 2 Atk

	; tm/hm learnset
	tmhm POISON_CLAW, CALM_MIND, TOXIC, HIDDEN_POWER, SUNNY_DAY,  PROTECT, RAIN_DANCE, RETURN, MANA_BURST, SHADOW_BALL, DOUBLE_TEAM, SWIFT, AERIAL_ACE, SUBSTITUTE, FACADE, REST, LUSTER_HEART, THIEF, STEEL_WING, AURA_WAVE, DARK_PULSE, ULTICHARGE, THUNDER_WAVE, FLY, DOUBLE_EDGE, DREAM_EATER, ENDURE, ICY_WIND, SLEEP_TALK, SUCKER_PUNCH, SWAGGER
	; end
