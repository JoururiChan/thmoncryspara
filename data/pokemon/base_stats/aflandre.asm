	db  46,  205,  21, 125, 205, 21 ; 295 BST
	;   hp  atk  def  spe  sat  sdf

	db DARK, FIRE ; type
	db 33 ; catch rate
	db 255 ; base exp
	db NO_ITEM, DRAGON_SCALE ; held items
	dn GENDER_F50, HATCH_FASTEST ; gender ratio, step cycles to hatch

	abilities_for AFLANDRE, HUSTLE, HUSTLE, RECKLESS
	db GROWTH_FAST ; growth rate
	dn EGG_MONSTER, EGG_FLYING ; egg groups

	ev_yield 3 SAt

	; tm/hm learnset
	tmhm DYNAMICPUNCH, SHADOW_FORCE, POWER_TRICK, TOXIC, ROAR, BULK_UP, HIDDEN_POWER, SUNNY_DAY, HONE_TOOLS, PROTECT, TENSION_KICK, LIGHT_SCREEN, RETURN, GIGA_DRAIN, DOUBLE_TEAM, FLASH_CANNON, FLOWER_SHOOT, SEAL_NEEDLE, THUNDERBOLT, THUNDER, EARTHQUAKE, DIG, ROCK_SMASH, REFLECT, FIRE_BREATH, HELLBLAZE, SWIFT, AERIAL_ACE, FLAME_CHARGE, SUBSTITUTE, FACADE, REST, ATTRACT, STEEL_WING, ENERGY_LIGHT, LEECH_LIFE, FOCUS_BLAST, BLADE_FLASH, CRASH_CROSS, WILD_CHARGE, DARK_PULSE, ENIGMA_BURST, DRAIN_PUNCH, WILL_O_WISP, ACROBATICS, EXPLOSION, SHADOW_HIT, POISON_JAB, ULTICHARGE, U_TURN, FLASH, STONE_RISE, VOLT_SWITCH, GYRO_BALL, SWORDS_DANCE, CUT, STRENGTH, LEAF_STORM, BODY_SLAM, CHARM, COUNTER, DOUBLE_EDGE, DEFENSE_CURL, DREAM_EATER, ENDURE, FIRE_PUNCH, HEADBUTT, VOICE_BIND, IRON_HEAD, KNOCK_OFF, STEEL_FIST, TREMORS, SEISMIC_TOSS, SKILL_SWAP, SLEEP_TALK, SUCKER_PUNCH, SWAGGER, THUNDERPUNCH, TRICK_ROOM, ZAP_CANNON, DIZZY_PUNCH
	; end
