	db  95,  65,  65,  60, 110, 130 ; 525 BST
	;   hp  atk  def  spe  sat  sdf

	db HEART, HEART ; type
	db 45 ; catch rate
	db 196 ; base exp
	db NO_ITEM, PINK_BOW ; held items
	dn GENDER_F12_5, HATCH_SLOWER ; gender ratio, step cycles to hatch

if DEF(FAITHFUL)
	abilities_for LUNA, CUTE_CHARM, CUTE_CHARM, PIXILATE
else
	abilities_for LUNA, CUTE_CHARM, SERENE_GRACE, PIXILATE
endc
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	ev_yield 2 SDf

	; tm/hm learnset
	tmhm POISON_CLAW, CALM_MIND, TOXIC, HIDDEN_POWER, SUNNY_DAY,  LIGHT_SCREEN, PROTECT, RAIN_DANCE, SAFEGUARD, DIG, SHADOW_BALL, DOUBLE_TEAM, REFLECT, SWIFT, SUBSTITUTE, FACADE, REST, LUSTER_HEART, ENERGY_LIGHT, FLASH, CUT, DOUBLE_EDGE, ENDURE, VOICE_BIND, PAY_DAY, SKILL_SWAP, SLEEP_TALK, SWAGGER
	; end
