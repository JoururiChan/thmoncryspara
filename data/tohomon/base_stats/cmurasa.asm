	db  95,  23,  48,  23,  23,  48 ; 260 BST
	;   hp  atk  def  spe  sat  sdf

	db REASON, REASON ; type
	db 125 ; catch rate
	db 44 ; base exp
	db NO_ITEM, NO_ITEM ; held items
	dn GENDER_F50, HATCH_MEDIUM_FAST ; gender ratio, step cycles to hatch

	abilities_for CMURASA, SHADOW_TAG, SHADOW_TAG, SHADOW_TAG
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups

	ev_yield 1 HP

	; tm/hm learnset
	tmhm SAFEGUARD, CHARM, COUNTER
	; end
