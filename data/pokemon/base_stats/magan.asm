	db  63,  42,  52,  58,  95,  90 ; 455 BST
	;   hp  atk  def  spe  sat  sdf

	db DARK, POISON ; type
	db 100 ; catch rate
	db 90 ; base exp
	db SHED_SHELL, POISON_BARB ; held items
	dn GENDER_F50, HATCH_SLOWEST ; gender ratio, step cycles to hatch

	abilities_for MAGAN, KEEN_EYE, KEEN_EYE, PRESSURE
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_INDETERMINATE, EGG_INDETERMINATE ; egg groups

	ev_yield 1 HP, 1 SDf

	; tm/hm learnset
	tmhm SPIRIT_VOICE, POWER_TRICK, CALM_MIND, ROAR, TOXIC, HIDDEN_POWER, LIGHT_SCREEN, PROTECT, SAFEGUARD, GIGA_DRAIN, THUNDERBOLT, THUNDER, EARTHQUAKE, RETURN, PSYCHIC, SHADOW_BALL, DOUBLE_TEAM, REFLECT, FLASH_CANNON, SLUDGE_BOMB, HELL_TOKAMAK, SUBSTITUTE, FACADE, FLAME_CHARGE, REST, ENERGY_LIGHT, THIEF, ENERGY_LIGHT, DARK_PULSE, FOCUS_BLAST, WILL_O_WISP, THUNDER_WAVE, FLASH, BATON_PASS, DREAM_EATER, EARTH_POWER, SKILL_SWAP, SLEEP_TALK, SWAGGER, TRICK, TRICK_ROOM, ZAP_CANNON
	; end
