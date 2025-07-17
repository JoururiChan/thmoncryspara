MACRO cnue_set
	for i, 1, _NARG + 1
		db CNUE_\<i>_FORM
	endr
	db -1
ENDM

UnlockedCNueLetterSets:
; entries correspond to UNLOCKED_CNUES_* constants
	table_width 2
	dw .Set_A_J
	dw .Set_K_Q
	dw .Set_R_W
	dw .Set_X_Question
	assert_table_length NUM_UNLOCKED_CNUE_SETS

.Set_A_J:
	cnue_set A, B, C, D, E, F, G, H, I, J
.Set_K_Q:
	cnue_set K, L, M, N, O, P, Q
.Set_R_W:
	cnue_set R, S, T, U, V, W
.Set_X_Question:
	cnue_set X, Y, Z, EXCLAMATION, QUESTION
