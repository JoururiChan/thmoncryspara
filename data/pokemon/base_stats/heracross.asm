	db  80, 125,  75,  85,  40,  95 ; 500 BST
	;   hp  atk  def  spe  sat  sdf

	db BUG, DREAM ; type
	db 45 ; catch rate
	db 200 ; base exp
	db NO_ITEM, NO_ITEM ; held items
	dn GENDER_F50, HATCH_MEDIUM_SLOW ; gender ratio, step cycles to hatch

	abilities_for HERACROSS, MOXIE, GUTS, SKILL_LINK
	db GROWTH_SLOW ; growth rate
	dn EGG_BUG, EGG_BUG ; egg groups

	ev_yield 2 Atk

	; tm/hm learnset
	tmhm SHADOW_FORCE, TOXIC, BULK_UP, HIDDEN_POWER, SUNNY_DAY,  PROTECT, RAIN_DANCE, BULLDOZE, EARTHQUAKE, RETURN, DIG, ROCK_SMASH, DOUBLE_TEAM, AERIAL_ACE, SUBSTITUTE, FACADE, REST, ATTRACT, THIEF, ROCK_SLIDE, FOCUS_BLAST, BLADE_FLASH, SHADOW_HIT, ULTICHARGE, STONE_RISE, SWORDS_DANCE, CUT, STRENGTH, BODY_SLAM, COUNTER, DOUBLE_EDGE, ENDURE, HEADBUTT, KNOCK_OFF, SEISMIC_TOSS, SLEEP_TALK, SWAGGER
	; end
