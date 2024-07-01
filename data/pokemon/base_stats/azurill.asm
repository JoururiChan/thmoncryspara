	db  50,  20,  40,  20,  20,  40 ; 190 BST
	;   hp  atk  def  spe  sat  sdf

	db NORMAL, FAIRY ; type
	db 150 ; catch rate
	db 33 ; base exp
	db NO_ITEM, NO_ITEM ; held items
	dn GENDER_F75, HATCH_FASTER ; gender ratio, step cycles to hatch

	abilities_for AZURILL, THICK_FAT, HUGE_POWER, SAP_SIPPER
	db GROWTH_FAST ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups

	ev_yield 1 HP

	; tm/hm learnset
	tmhm CURSE, TOXIC, HAIL, HIDDEN_POWER, ICE_BEAM, BLIZZARD, LIGHT_SCREEN, PROTECT, RAIN_DANCE, BRAVER, RETURN, DOUBLE_TEAM, SWIFT, SUBSTITUTE, FACADE, REST, ATTRACT, SCALD, WATER_PULSE, SURF, WHIRLPOOL, WATERFALL, BODY_SLAM, CHARM, DEFENSE_CURL, DOUBLE_EDGE, ENDURE, HEADBUTT, VOICE_BIND, ICY_WIND, KNOCK_OFF, ROLLOUT, SLEEP_TALK, SWAGGER
	; end
