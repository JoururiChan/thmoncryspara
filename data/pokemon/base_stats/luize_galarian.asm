	db  65, 100,  70, 105,  80,  80 ; 500 BST
	;   hp  atk  def  spe  sat  sdf

	db REASON, HEART ; type
	db 60 ; catch rate
	db 192 ; base exp
	db NO_ITEM, MARANGABERRY ; held items
	dn GENDER_F50, HATCH_MEDIUM_FAST ; gender ratio, step cycles to hatch

	abilities_for LUIZE, RUN_AWAY, PASTEL_VEIL, ANTICIPATION
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	ev_yield 2 Spe

	; tm/hm learnset
	tmhm SHADOW_FORCE, CALM_MIND, TOXIC, HIDDEN_POWER,  PROTECT,  RETURN, PSYCHIC, DOUBLE_TEAM, REFLECT, SWIFT, SUBSTITUTE, FACADE, REST, ATTRACT, KNIFE_THROW, ULTICHARGE, SWORDS_DANCE, STRENGTH, LEAF_STORM, BATON_PASS, BODY_SLAM, CHARM, DOUBLE_EDGE, ENDURE, HEADBUTT, PAY_DAY, SLEEP_TALK, SWAGGER, TRICK_ROOM, 
	; end
