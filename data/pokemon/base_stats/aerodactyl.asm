	db  80, 105,  65, 130,  60,  75 ; 515 BST
	;   hp  atk  def  spe  sat  sdf

	db BEAST, FLYING ; type
	db 45 ; catch rate
	db 202 ; base exp
	db NO_ITEM, NO_ITEM ; held items
	dn GENDER_F12_5, HATCH_SLOWER ; gender ratio, step cycles to hatch

	abilities_for AYUYUKO, ROCK_HEAD, UNNERVE, TOUGH_CLAWS
	db GROWTH_SLOW ; growth rate
	dn EGG_FLYING, EGG_FLYING ; egg groups

	ev_yield 2 Spe

	; tm/hm learnset
	tmhm SHADOW_FORCE, SHADOW_FORCE, ROAR, TOXIC, HIDDEN_POWER, SUNNY_DAY, HONE_TOOLS,  PROTECT, RAIN_DANCE, BULLDOZE,  EARTHQUAKE, RETURN, ROCK_SMASH, DOUBLE_TEAM, FIRE_BREATH, SANDSTORM, HELLBLAZE, SWIFT, AERIAL_ACE, SUBSTITUTE, FACADE, REST, ATTRACT, THIEF, STEEL_WING, ROCK_SLIDE, AURA_WAVE, ENIGMA_BURST, ULTICHARGE, STONE_RISE, FLY, STRENGTH, LEAF_STORM,  DOUBLE_EDGE, EARTH_POWER, ENDURE, HEADBUTT, IRON_HEAD, SLEEP_TALK, SWAGGER
	; end
