	db  50,  85,  55,  90,  65,  65 ; 410 BST
	;   hp  atk  def  spe  sat  sdf

	db REASON, REASON ; type
	db 190 ; catch rate
	db 152 ; base exp
	db NO_ITEM, MARANGABERRY ; held items
	dn GENDER_F50, HATCH_MEDIUM_FAST ; gender ratio, step cycles to hatch

	abilities_for CLUIZE, RUN_AWAY, POISON_GUARD, ANTICIPATION
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	ev_yield 1 Spe

	; tm/hm learnset
	tmhm POISON_CLAW, CALM_MIND, TOXIC, HIDDEN_POWER, PROTECT,  RETURN, MANA_BURST, DOUBLE_TEAM, REFLECT, SWIFT, SUBSTITUTE, FACADE, REST, LUSTER_HEART, BLADE_THROW, STRENGTH, LEAF_STORM, BODY_SLAM, CHARM, DOUBLE_EDGE, ENDURE, HEADBUTT, PAY_DAY, SLEEP_TALK, SWAGGER, 
	; end
