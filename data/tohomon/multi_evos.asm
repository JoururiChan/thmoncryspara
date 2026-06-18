; Used for Lyra to describe multiple evolutions (see engine/phone/scripts/lyra.asm)

MACRO multi_evo
; mon, EVOLVE_* value
	if _NARG == 1
		dp \1, PLAIN_FORM
		db EVOLVE_\1
	elif _NARG == 2
		dp \1
		db \2
	else
		dp \1, \2
		db \3
	endc
ENDM

MultipleEvolutions:
	multi_evo KIKURI
	multi_evo CKANA
	multi_evo KURUMI
	multi_evo DLUIZE
	multi_evo CIRNO
	multi_evo HKOAKUMA
	multi_evo CMEILING
	multi_evo CHEN
	multi_evo TLYRICA
	multi_evo ASHOU
	multi_evo CTENSHI
	multi_evo HSATORI
	dw -1
