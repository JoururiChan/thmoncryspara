; Data tables that vary for forms list normal species data up to 255 (EGG),
; then continue with entries for these species+form combinations.

CosmeticSpeciesAndFormTable:
	table_width 2
	dp CNUE,      CNUE_B_FORM
	dp CNUE,      CNUE_C_FORM
	dp CNUE,      CNUE_D_FORM
	dp CNUE,      CNUE_E_FORM
	dp CNUE,      CNUE_F_FORM
	dp CNUE,      CNUE_G_FORM
	dp CNUE,      CNUE_H_FORM
	dp CNUE,      CNUE_I_FORM
	dp CNUE,      CNUE_J_FORM
	dp CNUE,      CNUE_K_FORM
	dp CNUE,      CNUE_L_FORM
	dp CNUE,      CNUE_M_FORM
	dp CNUE,      CNUE_N_FORM
	dp CNUE,      CNUE_O_FORM
	dp CNUE,      CNUE_P_FORM
	dp CNUE,      CNUE_Q_FORM
	dp CNUE,      CNUE_R_FORM
	dp CNUE,      CNUE_S_FORM
	dp CNUE,      CNUE_T_FORM
	dp CNUE,      CNUE_U_FORM
	dp CNUE,      CNUE_V_FORM
	dp CNUE,      CNUE_W_FORM
	dp CNUE,      CNUE_X_FORM
	dp CNUE,      CNUE_Y_FORM
	dp CNUE,      CNUE_Z_FORM
	dp CNUE,      CNUE_EXCLAMATION_FORM
	dp CNUE,      CNUE_QUESTION_FORM
	dp KIKURI,      KIKURI_KANTO_FORM
	dp KIKURI,      KIKURI_KOGA_FORM
	dp KIKURI,      KIKURI_AGATHA_FORM
	dp KIKURI,      KIKURI_ARIANA_FORM
	dp TTEI,      TTEI_SPIKY_EARED_FORM
	assert_table_length NUM_COSMETIC_FORMS
	; fallthrough

VariantSpeciesAndFormTable:
	table_width 2
	dp SLILYBLACK,   SLILYBLACK_RED_FORM
	dp SUIKA,     SUIKA_ARMORED_FORM
	dp CFUTO, CFUTO_THREE_SEGMENT_FORM
	assert_table_length NUM_VARIANT_FORMS

	db 0 ; end
