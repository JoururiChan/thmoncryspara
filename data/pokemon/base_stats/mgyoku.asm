	db  60,  88, 110,  65,  87, 110 ; 520 BST
	;   hp  atk  def  spe  sat  sdf

	db FAITH, EARTH ; type
	db 120 ; catch rate
	db 80 ; base exp
	db NO_ITEM, NO_ITEM ; held items
	dn GENDER_F50, HATCH_SLOW ; gender ratio, step cycles to hatch

	abilities_for MGYOKU, PRESSURE, PRESSURE, PRESSURE
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_HUMANSHAPE, EGG_HUMANSHAPE ; egg groups

	ev_yield 2 SDf, 1 Def

	; tm/hm learnset
 	tmhm SHADOW_FORCE, POWER_TRICK, CALM_MIND, TOXIC, HAIL, BULK_UP, HIDDEN_POWER, PAY_DAY, HONE_TOOLS, LIGHT_SCREEN, ICE_BEAM, PROTECT, SAFEGUARD, BLIZZARD, GIGA_DRAIN, SAFEGUARD, AVALANCHE, SEAL_NEEDLE, EARTHQUAKE, THUNDERBOLT, THUNDER, RETURN, PSYCHIC, SHADOW_BALL, DOUBLE_TEAM, REFLECT, FLASH_CANNON, SWIFT, SUBSTITUTE, FACADE, REST, ATTRACT, ENERGY_LIGHT, FOCUS_BLAST, ENERGY_BALL, GYRO_BALL, FLASH, COUNTER, DREAM_EATER, EARTH_POWER, BATON_PASS, DEFENSE_CURL, ENDURE, VOICE_BIND, ICY_WIND, SEISMIC_TOSS, SUCKER_PUNCH, SWAGGER, TREMORS, SKILL_SWAP, SLEEP_TALK, TRICK_ROOM
	; end
