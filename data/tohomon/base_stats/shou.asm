	db  50,  80,  95,  10,  10,  45 ; 290 BST
	;   hp  atk  def  spe  sat  sdf

	db BEAST, BEAST ; type
	db 255 ; catch rate
	db 68 ; base exp
	db NO_ITEM, NO_ITEM ; held items
	dn GENDER_F50, HATCH_MEDIUM_FAST ; gender ratio, step cycles to hatch

	abilities_for SHOU, STURDY, ROCK_HEAD, RATTLED
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups

	ev_yield 1 Def

	; tm/hm learnset
	tmhm POISON_CLAW, CALM_MIND, TOXIC, HIDDEN_POWER, SUNNY_DAY, PROTECT, RETURN, DIG, ROCK_SMASH, DOUBLE_TEAM, SANDSTORM, SUBSTITUTE, FACADE, REST, LUSTER_HEART, THIEF, ROCK_SLIDE, EXPLOSION, COUNTER, DEFENSE_CURL, DOUBLE_EDGE, EARTH_POWER, ENDURE, HEADBUTT, TREMORS, SLEEP_TALK, SUCKER_PUNCH, SWAGGER
	; end
