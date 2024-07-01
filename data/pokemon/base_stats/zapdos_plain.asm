	db  90,  90,  85, 100, 125,  90 ; 580 BST
	;   hp  atk  def  spe  sat  sdf

	db ELECTRIC, FLYING ; type
	db 3 ; catch rate
	db 216 ; base exp
	db ALWAYS_ITEM_2, LUM_BERRY ; held items
	dn GENDER_UNKNOWN, HATCH_UNKNOWN ; gender ratio, step cycles to hatch

if DEF(FAITHFUL)
	abilities_for ZAPDOS, PRESSURE, PRESSURE, STATIC
else
	abilities_for ZAPDOS, PRESSURE, DRIZZLE, STATIC
endc
	db GROWTH_SLOW ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups

	ev_yield 3 SAt

	; tm/hm learnset
	tmhm CURSE, ROAR, TOXIC, HIDDEN_POWER, SUNNY_DAY, AEROBLAST, LIGHT_SCREEN, PROTECT, RAIN_DANCE, THUNDERBOLT, THUNDER, RETURN, ROCK_SMASH, DOUBLE_TEAM, SANDSTORM, SWIFT, AERIAL_ACE, SUBSTITUTE, FACADE, REST, STEEL_WING, WHITE_BIRD, KNIFE_THROW, GUNGNIR, U_TURN, FLASH, VOLT_SWITCH, THUNDER_WAVE, FLY, SPIDERS_NEST, BATON_PASS, DOUBLE_EDGE, ENDURE, SLEEP_TALK, SWAGGER, ZAP_CANNON
	; end
