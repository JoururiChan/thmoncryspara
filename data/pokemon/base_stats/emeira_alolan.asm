	db  38,  41,  40,  65,  50,  65 ; 299 BST
	;   hp  atk  def  spe  sat  sdf

	db ICE, ICE ; type
	db 190 ; catch rate
	db 63 ; base exp
	db ALWAYS_ITEM_2, ASPEAR_BERRY ; held items
	dn GENDER_F75, HATCH_MEDIUM_FAST ; gender ratio, step cycles to hatch

	abilities_for EMEIRA_ALOLAN, SNOW_CLOAK, SNOW_CLOAK, SNOW_WARNING
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	ev_yield 1 Spe

	; tm/hm learnset
	tmhm SPIRIT_VOICE, ROAR, TOXIC, HAIL, HIDDEN_POWER, ICE_BEAM, BLIZZARD, PROTECT, RAIN_DANCE, SAFEGUARD, BRAVER, RETURN, DIG, SHADOW_BALL, DOUBLE_TEAM, SWIFT, SUBSTITUTE, FACADE, REST, ATTRACT, DARK_PULSE, SPIDERS_NEST, BATON_PASS, BODY_SLAM, CHARM, DOUBLE_EDGE, ENDURE, HEADBUTT, ICY_WIND, SLEEP_TALK, SWAGGER, 
	; end
