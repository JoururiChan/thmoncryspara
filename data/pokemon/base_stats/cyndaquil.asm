	db  39,  52,  43,  65,  60,  50 ; 309 BST
	;   hp  atk  def  spe  sat  sdf

	db FIRE, FIRE ; type
	db 45 ; catch rate
	db 65 ; base exp
	db NO_ITEM, NO_ITEM ; held items
	dn GENDER_F12_5, HATCH_MEDIUM_FAST ; gender ratio, step cycles to hatch

if DEF(FAITHFUL)
	abilities_for CYNDAQUIL, BLAZE, BLAZE, FLASH_FIRE
else
	abilities_for CYNDAQUIL, BLAZE, FLAME_BODY, FLASH_FIRE
endc
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	ev_yield 1 Spe

	; tm/hm learnset
	tmhm CURSE, TOXIC, HIDDEN_POWER, SUNNY_DAY, PROTECT, IRON_TAIL, EARTHQUAKE, RETURN, DIG, DOUBLE_TEAM, METEOR_FALL, FIRE_BLAST, SWIFT, AERIAL_ACE, SUBSTITUTE, FACADE, FLAME_CHARGE, REST, ATTRACT, BLAZE_STAR, WILL_O_WISP, CUT, BODY_SLAM, DEFENSE_CURL, DOUBLE_EDGE, ENDURE, HEADBUTT, ROLLOUT, SLEEP_TALK, SWAGGER
	; end
