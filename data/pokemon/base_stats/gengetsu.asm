	db  85, 49,  45,  100, 110,  92 ; 510 BST
	;   hp  atk  def  spe  sat  sdf

	db DARK, FLYING ; type
	db 41 ; catch rate
	db 165 ; base exp
	db ALWAYS_ITEM_2, BIG_ROOT ; held items
	dn GENDER_F75, HATCH_SLOWEST ; gender ratio, step cycles to hatch

	abilities_for GENGETSU, IMMUNITY, IMMUNITY, PRESSURE
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_INDETERMINATE, EGG_FAIRY ; egg groups

	ev_yield 2 SAt

	; tm/hm learnset
	; tm/hm learnset
	tmhm SHADOW_FORCE, CALM_MIND, HIDDEN_POWER, ROAR, LIGHT_SCREEN, PROTECT, GIGA_DRAIN, RETURN, SAFEGUARD, SEAL_NEEDLE, THUNDER, DOUBLE_TEAM, PSYCHIC, SHADOW_BALL, REFLECT, FLASH_CANNON, HELLBLAZE, SWIFT, AERIAL_ACE, SUBSTITUTE, FACADE, REST, ATTRACT, THIEF, FOCUS_BLAST, ENERGY_LIGHT, LEECH_LIFE, ULTICHARGE, DARK_PULSE, WILL_O_WISP, ACROBATICS, U_TURN, EXPLOSION, FLASH, FLY, CHARM, DREAM_EATER, ENDURE, VOICE_BIND, KNOCK_OFF, SKILL_SWAP, SLEEP_TALK, SUCKER_PUNCH, SWAGGER, TRICK, TRICK_ROOM, DIZZY_PUNCH
	; end
