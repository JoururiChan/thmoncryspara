	db  92,  38,  60,  64, 120,  94 ; 510 BST
	;   hp  atk  def  spe  sat  sdf

	db GHOST, DARK ; type
	db 55 ; catch rate
	db 197 ; base exp
	db NO_ITEM, NO_ITEM ; held items
	dn GENDER_F100, HATCH_SLOWEST ; gender ratio, step cycles to hatch

	abilities_for MIMA, PRESSURE, PRESSURE, SCRAPPY
	db GROWTH_SLOW ; growth rate
	dn EGG_INDETERMINATE, EGG_FLYING ; egg groups

	ev_yield 2 SAt

	; tm/hm learnset
	tmhm SPIRIT_VOICE, POWER_TRICK, CALM_MIND, TOXIC, HIDDEN_POWER, HONE_TOOLS, LIGHT_SCREEN, RAIN_DANCE, GIGA_DRAIN, SAFEGUARD, FLOWER_SHOOT, SEAL_NEEDLE, THUNDERBOLT, THUNDER, PROTECT, PSYCHIC, SHADOW_BALL, REFLECT, METEOR_FALL, RETURN, DOUBLE_TEAM, HELL_TOKAMAK, SWIFT, FLAME_CHARGE, SUBSTITUTE, REST, ATTRACT, THIEF, ENERGY_LIGHT, FOCUS_BLAST, BLAZE_STAR, FLASH, DARK_PULSE, DRAGON_PULSE, WILL_O_WISP, GUNGNIR, VOLT_SWITCH, THUNDER_WAVE, SPIDERS_NEST, FLY, WATERFALL, BATON_PASS, SPIDERS_NEST, CHARM, COUNTER, DREAM_EATER, ENDURE, FIRE_PUNCH, VOICE_BIND, ICY_WIND, KNOCK_OFF, STEEL_FIST, SKILL_SWAP, SLEEP_TALK, SUCKER_PUNCH, TRICK, TRICK_ROOM, SWAGGER, ZAP_CANNON
	; end
