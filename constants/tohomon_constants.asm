; tohomon ids
; indexes for (only species):
; - TohomonNames (see data/tohomon/names.asm)
; - TohomonCries (see data/tohomon/cries.asm)
; - AlphabeticalTohodexOrder (see data/tohomon/dex_order_alpha.asm)
; - NewTohodexOrder (see data/tohomon/dex_order_new.asm)
; - ValidTohomonLevels (see data/tohomon/valid_levels.asm)
; indexes for (species + non-cosmetic variants):
; - BaseData (see data/tohomon/base_stats.asm)
; - EvosAttacksPointers (see data/tohomon/evos_attacks_pointers.asm)
; - EggMovePointers (see data/tohomon/egg_move_pointers.asm)
; - EvolutionMoves (see data/tohomon/evolution_moves.asm)
; - TohomonBodyData (see data/tohomon/body_data.asm)
; - TohomonPalettes (see data/tohomon/palettes.asm)
; - TohodexDataPointerTable (see data/tohomon/dex_entry_pointers.asm)
; - FootprintPointers (see data/tohomon/footprint_pointers.asm)
; indexes for (species + all variants):
; - MiniIconPointers (see data/tohomon/mini_icon_pointers.asm)
; - OverworldMonIconColors (see data/tohomon/overworld_icon_pals.asm)
; - TohomonPicPointers (see data/tohomon/pic_pointers.asm)
; - TohomonPicSizes (see data/tohomon/pic_sizes.asm)
; - AnimationPointers (see gfx/tohomon/anim_pointers.asm)
; - AnimationIdlePointers (see gfx/tohomon/extra_pointers.asm)
; - BitmasksPointers (see gfx/tohomon/bitmask_pointers.asm)
; - FramesPointers (see gfx/tohomon/frame_pointers.asm)
	const_def 1
	const CREIMU  ; 01
	const REIMU    ; 02
	const TREIMU   ; 03
	const CMARISA ; 04
	const MARISA ; 05
	const AMARISA  ; 06
	const CSAKUYA   ; 07
	const SAKUYA  ; 08
	const HSAKUYA  ; 09
	const CGYOKU   ; 0a
	const MGYOKU    ; 0b
	const FGYOKU ; 0c
	const OGYOKU     ; 0d
	const CMAGAN     ; 0e
	const MAGAN   ; 0f
	const CMIMA  ; 11
	const MIMA    ; 12
	const CELIS   ; 14
	const ELIS    ; 15
	const CKIKURI      ; 17
	const KIKURI      ; 18
	const CSARIEL     ; 1a
	const SARIEL  ; 1c
	const CKONGARA  ; 1d
	const KONGARA   ; 1e
	const CRIKA  ; 20
	const RIKA   ; 21
	const ARIKA   ; 22
	const CMEIRA   ; 23
	const MEIRA   ; 24
	const CELLEN  ; 26
	const ELLEN ; 27
	const CKOTOHIME      ; 29
	const KOTOHIME     ; 2a
	const CKANA      ; 2c
	const KANA  ; 2d
	const CRIKAKO   ; 2f
	const RIKAKO    ; 30
	const CCHIYURI    ; 32
	const CHIYURI    ; 33
	const CYUMEMI    ; 35
	const YUMEMI    ; 36
	const CORANGE     ; 38
	const ORANGE   ; 39
	const CKURUMI   ; 3b
	const KURUMI    ; 3c
	const CELLY  ; 3e
	const ELLY       ; 3f
	const CYUKA   ; 41
	const YUKA     ; 42
	const AYUKA
	const CMUGETSU    ; 44
	const MUGETSU ; 45
	const CGENGETSU ; 47
	const GENGETSU  ; 48
	const CSARA    ; 4a
	const SARA   ; 4b
	const CLUIZE     ; 4d
	const LUIZE   ; 4e
	const DLUIZE   ; 4f
	const CALICE    ; 50
	const ALICE  ; 51
	const AALICE   ; 52
	const CMAI ; 53
	const MAI      ; 54
	const CYUKI       ; 56
	const YUKI    ; 57
	const CYUMEKO        ; 59
	const YUMEKO   ; 5a
	const CSHINKI     ; 5c
	const SHINKI    ; 5d
	const CRUMIA       ; 5f
	const RUMIA    ; 60
	const ARUMIA      ; 61
	const CDAICHAN     ; 62
	const DAICHAN    ; 63
	const DDAICHAN    ; 64
	const CCIRNO  ; 65
	const CIRNO  ; 66
	const SCIRNO  ; 67
	const CMEILING     ; 68
	const MEILING    ; 69
	const AMEILING  ; 6a
	const CKOAKUMA ; 6b
	const KOAKUMA  ; 6c
	const HKOAKUMA    ; 6d
	const CPATCHOULI    ; 6e
	const PATCHOULI    ; 6f
	const TPATCHOULI     ; 70
	const CREMILIA    ; 71
	const REMILIA    ; 72
	const SREMILIA ; 73
	const CFLANDRE     ; 74
	const FLANDRE     ; 75
	const AFLANDRE    ; 76
	const CLETTY    ; 77
	const LETTY     ; 78
	const DLETTY    ; 79
	const CCHEN   ; 7a
	const CHEN    ; 7b
	const HCHEN       ; 7c
	const CLILYWHITE ; 7d
	const LILYWHITE     ; 7e
	const DLILYWHITE     ; 7f
	const CLILYBLACK     ; 80
	const LILYBLACK   ; 81
	const SLILYBLACK   ; 82
	const CLYRICA     ; 83
	const LYRICA      ; 84
	const TLYRICA      ; 85
	const CMERLIN   ; 86
	const MERLIN    ; 87
	const SMERLIN    ; 88
	const CLUNASA    ; 89
	const LUNASA    ; 8a
	const ALUNASA    ; 8b
	const CYUYUKO     ; 8c
	const YUYUKO   ; 8d
	const AYUYUKO ; 8e
	const CRAN    ; 8f
	const RAN   ; 90
	const TRAN     ; 91
	const CYUKARI    ; 92
	const YUKARI    ; 93
	const TYUKARI  ; 94
	const CSUIKA  ; 95
	const SUIKA     ; 96
	const TSUIKA        ; 97
	const CYOUMU  ; 98
	const YOUMU    ; 99
	const SYOUMU   ; 9a
	const CREISEN  ; 9b
	const REISEN    ; 9c
	const TREISEN ; 9d
	const CSANAE   ; 9e
	const SANAE   ; 9f
	const DSANAE ; a0
	const CWRIGGLE    ; a1
	const WRIGGLE     ; a2
	const SWRIGGLE   ; a3
	const CMYSTIA    ; a4
	const MYSTIA     ; a5
	const TMYSTIA     ; a6
	const CKEINE   ; a7
	const KEINE    ; a8
	const AKEINE     ; a9
	const CTEI   ; aa
	const TEI    ; ab
	const TTEI      ; ac
	const CEIRIN     ; ad
	const EIRIN  ; ae
	const TEIRIN     ; af
	const CKAGUYA    ; b0
	const KAGUYA       ; b1
	const TKAGUYA       ; b2
	const CMOKOU     ; b3
	const MOKOU    ; b4
	const AMOKOU   ; b5
	const CAYA  ; b6
	const AYA     ; b7
	const SAYA  ; b8
	const CMEDICINE  ; b9
	const MEDICINE   ; ba
	const AMEDICINE     ; bb
	const CKOMACHI   ; bc
	const KOMACHI   ; bd
	const AKOMACHI      ; be
	const CEIKI    ; bf
	const EIKI   ; c0
	const AEIKI      ; c1
	const CSHIZUHA     ; c2
	const SHIZUHA   ; c3
	const SSHIZUHA     ; c4
	const CMINORIKO    ; c5
	const MINORIKO    ; c6
	const HMINORIKO   ; c7
	const CHINA ; c8
	const HINA      ; c9
	const AHINA  ; ca
	const CNITORI  ; cb
	const NITORI     ; cc
	const ANITORI ; cd
	const CMOMIJI  ; ce
	const MOMIJI     ; cf
	const CKANAKO    ; d0
	const KANAKO   ; d1
	const AKANAKO   ; d2
	const CSUWAKO   ; d3
	const SUWAKO     ; d4
	const DSUWAKO    ; d5
	const CIKU  ; d6
	const IKU    ; d7
	const AIKU  ; d8
	const CTENSHI   ; d9
	const TENSHI     ; da
	const STENSHI   ; db
	const CKISUME     ; dc
	const KISUME  ; dd
	const DKISUME    ; de
	const CYAMAME   ; df
	const YAMAME  ; e0
	const SYAMAME   ; e1
	const CPARSEE    ; e2
	const PARSEE   ; e3
	const DPARSEE   ; e4
	const CYUUGI   ; e5
	const YUUGI    ; e6
	const AYUUGI     ; e7
	const CSATORI    ; e8
	const SATORI   ; e9
	const HSATORI   ; ea
	const CRIN   ; eb
	const RIN    ; ec
	const HRIN  ; ed
	const CUTSUHO   ; ee
	const UTSUHO     ; ef
	const AUTSUHO      ; f0
	const CKOISHI    ; f1
	const KOISHI    ; f2
	const SKOISHI     ; f3
	const CNAZRIN      ; f4
	const NAZRIN    ; f5
	const HNAZRIN   ; f6
	const CKOGASA    ; f7
	const KOGASA  ; f8
	const TKOGASA      ; f9
	const CICHIRIN      ; fa
	const ICHIRIN     ; fb
	const AICHIRIN    ; fc
	const CMURASA     ; fd
	const MURASA    ; fe
	const EGG        ; ff
	const_skip       ; 100 is unused
	const AMURASA  ; 101
	const CSHOU  ; 102
	const SHOU     ; 103
	const ASHOU   ; 104
	const CBYAKUREN    ; 105
	const BYAKUREN   ; 106
	const TBYAKUREN    ; 107
	const CNUE
	const NUE  ; 109
	const SNUE ; 10a
	const CHATATE  ; 10b
	const HATATE  ; 10c
	const THATATE ; 10d
	const CSUNNY  ; 10e
	const SUNNY   ; 10f
	const ASUNNY    ; 110
	const CSTAR    ; 111
	const STAR    ; 112
	const AMOMIJI    ; 113
	const DSTAR  ; 114
	const CLUNA  ; 115
	const LUNA    ; 116
	const TLUNA ; 117
	const CKYOUKO    ; 118
	const KYOUKO ; 119
	const CYOSHIKA   ; 11a
	const YOSHIKA    ; 11b
	const CSEIGA    ; 11c
	const SEIGA   ; 11d
	const CTOJIKO   ; 11e
	const TOJIKO   ; 11f
	const CFUTO ; 120
	const MIKO  ; 121
	const FUTO   ; 122
	const CMIKO ; 123
	const CMAMIZOU ; X
	const MAMIZOU ; X
	const CKOKORO ; X
	const KOKORO ; X
	const CWAKASAGI ; X
	const WAKASAGI ; X
	const CSEKIBAKI ; X
	const SEKIBAKI ; X
	const CKAGEROU ; X
	const KAGEROU ; X
	const CBENBEN ; X
	const BENBEN ; X
	const CYATSUHA ; X
	const YATSUHA ; X
	const CSEIJA ; X
	const SEIJA ; X
	const CSUKUNA ; X
	const SUKUNA ; X
	const CRAIKO ; X
	const RAIKO ; X
	const CKASEN ; X
	const KASEN ; X
	const CSUMIREKO ; X
	const SUMIREKO ; X
DEF NUM_SPECIES EQU const_value - 1 ; 123
DEF NUM_TOHOMON EQU NUM_SPECIES - (2 * HIGH(NUM_SPECIES)) ; 121

DEF CANCEL EQU -1

; form values
; related to:
; - CosmeticSpeciesAndFormTable (see data/tohomon/variant_forms.asm)
; - ValidVariantRanges (see data/tohomon/valid_variants.asm)

MACRO ext_const_def
	if _NARG >= 1
		def ext_const_value = \1
	else
		def ext_const_value = 0
	endc
	if _NARG >= 2
		DEF \2 EQU ext_const_value
		redef ext_const_value += const_inc
	endc
ENDM

MACRO ext_const
	const_skip
	DEF \1 EQU ext_const_value
	redef ext_const_value += const_inc
ENDM

DEF NO_FORM EQU 0
DEF PLAIN_FORM EQU 1

DEF FIRST_COSMETIC_FORM_MON EQU const_value ; 124

; cnue
	ext_const_def 1, CNUE_A_FORM    ;     (01)
	ext_const CNUE_B_FORM           ; 124 (02)
	ext_const CNUE_C_FORM           ; 125 (03)
	ext_const CNUE_D_FORM           ; 126 (04)
	ext_const CNUE_E_FORM           ; 127 (05)
	ext_const CNUE_F_FORM           ; 128 (06)
	ext_const CNUE_G_FORM           ; 129 (07)
	ext_const CNUE_H_FORM           ; 12a (08)
	ext_const CNUE_I_FORM           ; 12b (09)
	ext_const CNUE_J_FORM           ; 12c (0a)
	ext_const CNUE_K_FORM           ; 12d (0b)
	ext_const CNUE_L_FORM           ; 12e (0c)
	ext_const CNUE_M_FORM           ; 12f (0d)
	ext_const CNUE_N_FORM           ; 130 (0e)
	ext_const CNUE_O_FORM           ; 131 (0f)
	ext_const CNUE_P_FORM           ; 132 (10)
	ext_const CNUE_Q_FORM           ; 133 (11)
	ext_const CNUE_R_FORM           ; 134 (12)
	ext_const CNUE_S_FORM           ; 135 (13)
	ext_const CNUE_T_FORM           ; 136 (14)
	ext_const CNUE_U_FORM           ; 137 (15)
	ext_const CNUE_V_FORM           ; 138 (16)
	ext_const CNUE_W_FORM           ; 139 (17)
	ext_const CNUE_X_FORM           ; 13a (18)
	ext_const CNUE_Y_FORM           ; 13b (19)
	ext_const CNUE_Z_FORM           ; 13c (1a)
	ext_const CNUE_EXCLAMATION_FORM ; 13d (1b)
	ext_const CNUE_QUESTION_FORM    ; 13e (1c)
DEF NUM_CNUE EQU ext_const_value - 1

; kikuri
	ext_const_def 1, KIKURI_JOHTO_FORM ; (1)
	ext_const KIKURI_KANTO_FORM    ; 13f (2)
	ext_const KIKURI_KOGA_FORM     ; 140 (3)
	ext_const KIKURI_AGATHA_FORM   ; 141 (4)
	ext_const KIKURI_ARIANA_FORM   ; 142 (5)
DEF NUM_KIKURI EQU ext_const_value - 1


; ttei
	ext_const_def 2
	ext_const TTEI_SPIKY_EARED_FORM ; 148 (2)


DEF NUM_COSMETIC_FORMS EQU const_value - FIRST_COSMETIC_FORM_MON ; 38

DEF FIRST_VARIANT_FORM_MON EQU const_value ; 15c

; slilyblack
	ext_const_def 2
	ext_const SLILYBLACK_RED_FORM ; 15c (15)

; suika
	ext_const_def 2
	ext_const SUIKA_ARMORED_FORM ; 15d (2)

; placethm
	ext_const_def 1, CFUTO_TWO_SEGMENT_FORM ;     (1)
	ext_const CFUTO_THREE_SEGMENT_FORM      ; 15e (2)

DEF NUM_VARIANT_FORMS EQU const_value - FIRST_VARIANT_FORM_MON ; 2d

; these constants include EGG and a dummy entry as species
DEF NUM_UNIQUE_TOHOMON EQU const_value - 1 ; 189
DEF NUM_EXT_TOHOMON EQU NUM_UNIQUE_TOHOMON - NUM_COSMETIC_FORMS ; 150
