	db  55, 38,  38, 40, 50,  30 ; 555 BST
	;   hp  atk  def  spe  sat  sdf

	db DARK, DARK ; type
	db 190 ; catch rate
	db 56 ; base exp
	db NO_ITEM, ASPEAR_BERRY ; held items
	dn GENDER_F50, HATCH_SLOWER ; gender ratio, step cycles to hatch

	abilities_for CKURUMI, SYNCHRONIZE, SYNCHRONIZE, SYNCHRONIZE
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_MONSTER, EGG_FLYING ; egg groups

	ev_yield 1 SAt

	; tm/hm learnset
	tmhm CURSE, ROAR, TOXIC, HIDDEN_POWER, SUNNY_DAY, AEROBLAST, PROTECT, SAFEGUARD, BULLDOZE, FLOWER_SHOOT, BRAVER, RETURN, DIG, ROCK_SMASH, DOUBLE_TEAM, METEOR_FALL, HELL_TOKAMAK, SWIFT, AERIAL_ACE, SUBSTITUTE, FACADE, FLAME_CHARGE, REST, ATTRACT, THIEF, KNIFE_THROW, DRAGON_PULSE, WILL_O_WISP, GUNGNIR, STRENGTH, SPIDERS_NEST, BODY_SLAM, CHARM, DOUBLE_EDGE, ENDURE, HEADBUTT, VOICE_BIND, IRON_HEAD, SLEEP_TALK, SWAGGER
	; end
