	db 100,  68,  50,  33, 105,  98 ; 468 BST
	;   hp  atk  def  spe  sat  sdf

	db PSYCHIC, FIGHTING ; type
	db 240 ; catch rate
	db 156 ; base exp
	db ALWAYS_ITEM_2, ASPEAR_BERRY ; held items
	dn GENDER_F75, HATCH_FASTEST ; gender ratio, step cycles to hatch

	abilities_for EELLEN, OWN_TEMPO, SPRING_CHARM, SPRING_CHARM
	db GROWTH_FAST ; growth rate
	dn EGG_FAIRY, EGG_HUMANSHAPE ; egg groups

	ev_yield 2 SAt, 1 HP

	; tm/hm learnset
	tmhm DYNAMICPUNCH, CALM_MIND, TOXIC, HAIL, HIDDEN_POWER, SUNNY_DAY, ICE_BEAM, BLIZZARD, LIGHT_SCREEN, PROTECT, RAIN_DANCE, SAFEGUARD, FLOWER_SHOOT, THUNDERBOLT, RETURN, PSYCHIC, ROCK_SMASH, SHADOW_BALL, DOUBLE_TEAM, REFLECT, FLASH_CANNON, METEOR_FALL, SWIFT, SUBSTITUTE, FACADE, REST, ATTRACT, ENERGY_LIGHT, FOCUS_BLAST, DRAIN_PUNCH, FLASH, DARK_PULSE, SPIDERS_NEST, BATON_PASS, BODY_SLAM, CHARM, DOUBLE_EDGE, DREAM_EATER, ENDURE, HEADBUTT, SLEEP_TALK, SWAGGER, LUNAR_BASH
	; end
