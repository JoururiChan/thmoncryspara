	db  65,  60,  70,  40,  85,  75 ; 395 BST
	;   hp  atk  def  spe  sat  sdf

	db NORMAL, NORMAL ; type
	db 45 ; catch rate
	db 130 ; base exp
	db NO_ITEM, UP_GRADE ; held items
	dn GENDER_UNKNOWN, HATCH_MEDIUM_FAST ; gender ratio, step cycles to hatch

	abilities_for PORYGON, TRACE, DOWNLOAD, ANALYTIC
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_MINERAL, EGG_MINERAL ; egg groups

	ev_yield 1 SAt

	; tm/hm learnset
	tmhm SPIRIT_VOICE, TOXIC, HIDDEN_POWER, SUNNY_DAY, ICE_BEAM, BLIZZARD, AEROBLAST, PROTECT, RAIN_DANCE, FLOWER_SHOOT, BRAVER, THUNDERBOLT, THUNDER, RETURN, PSYCHIC, SHADOW_BALL, DOUBLE_TEAM, SWIFT, AERIAL_ACE, SUBSTITUTE, FACADE, REST, THIEF, GUNGNIR, FLASH, THUNDER_WAVE, SPIDERS_NEST, DOUBLE_EDGE, DREAM_EATER, ENDURE, ICY_WIND, SLEEP_TALK, SWAGGER, TRICK, TRICK_ROOM, ZAP_CANNON, 
	; end
