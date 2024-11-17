MACRO body_data
	db \1 ; height
	dw \2 ; cost
	dn SHAPE_\3, BODY_COLOR_\4
ENDM

PokemonBodyData:
; entries correspond to constants/pokemon_constants.asm
	table_width BODY_DATA_SIZE, PokemonBodyData
	body_data   7,   30, WINGS,    RED    ; CREIMU
	body_data  10,  60, WINGS,    RED  ; REIMU
	body_data  20, 150, WINGS,    RED  ; TREIMU
	body_data   6,  30, BIPEDAL, YELLOW    ; CMARISA
	body_data  11,  60, BIPEDAL, YELLOW    ; MARISA
	body_data  17,  150, BIPEDAL, YELLOW    ; AMARISA
	body_data   5,   30, HEAD, GRAY   ; CSAKUYA
	body_data  10,  60, HEAD, GRAY   ; SAKUYA
	body_data  16,  150, HEAD, GRAY   ; HSAKUYA
	body_data   3,   10, HEAD, PURPLE  ; CGYOKU
	body_data   7,   90, BIPEDAL,   BLUE  ; MGYOKU
	body_data  11,  90, BIPEDAL,   RED  ; FGYOKU
	body_data   3,   90, HEAD,    PURPLE  ; OGYOKU
	body_data   6,  20, MULTIBODY,   YELLOW ; CMAGAN
	body_data  10,  50, MULTIBODY,   PURPLE ; MAGAN
	body_data  11,   50, HEAD_ARMS,        GREEN  ; CMIMA
	body_data  15,   110, HEAD_ARMS,        GREEN  ; MIMA
	body_data   7,   30, WINGS,    YELLOW  ; CELIS
	body_data   3,   70, WINGS,        YELLOW  ; ELIS
	body_data  20,   70, HEAD,   BROWN ; CKIKURI
	body_data  35,   120, HEAD_ARMS,   PURPLE ; KIKURI
	body_data   8,   100, WINGS, WHITE ; CSARIEL
	body_data   6,   200, WINGS, WHITE ; SARIEL
	body_data   4,   100, HEAD_ARMS,    RED   ; CKONGARA
	body_data   8,  200, HEAD_ARMS,    RED   ; KONGARA
	body_data   5,   20, HEAD_BASE,    RED ; CRIKA
	body_data   9,  90, BIPEDAL,    RED ; RIKA
	body_data  14,  180, MULTIBODY, PURPLE ; ARIKA
	body_data   6,   20, BIPEDAL, WHITE  ; CMEIRA
	body_data  13,   50, BIPEDAL, WHITE   ; MEIRA
	body_data  11,   40, BIPEDAL,    RED ; CELLEN
	body_data   5,   70, BIPEDAL,      RED   ; ELLEN
	body_data   8,   10, BIPEDAL,        PURPLE ; CKOTOHIME
	body_data  16,   45, BIPEDAL,        PURPLE ; KOTOHIME
	body_data   8,   50, HEAD_ARMS,      BLUE   ; CKANA
	body_data  12,   80, HEAD_ARMS,      BLUE    ; KANA
	body_data  10,   10, WINGS,    WHITE    ; CRIKAKO
	body_data  10,   30, WINGS,      WHITE ; RIKAKO
	body_data   2,    70, BIPEDAL,    BLUE  ; CCHIYURI
	body_data   7,   130, BIPEDAL,    BLUE  ; CHIYURI
	body_data  10,   100, MULTIBODY,    RED ; CYUMEMI
	body_data   8,   210, MULTIBODY, RED ; YUMEMI
	body_data   5,   20, QUADRUPED, YELLOW  ; CORANGE
	body_data  10,  90, QUADRUPED, YELLOW  ; ORANGE
	body_data  19,  40, WINGS,    PURPLE  ; CKURUMI
	body_data   6,  90, WINGS,    PURPLE   ; KURUMI
	body_data  13,   60, HEAD_ARMS,      GRAY   ; CELLY
	body_data   9,   90, HEAD_ARMS, GRAY  ; ELLY
	body_data  15,   140, HEAD_BASE,      GREEN  ; CYUKA
	body_data   8,   260, HEAD_BASE, GREEN   ; YUKA
	body_data  15,   450, HEAD_BASE,      GREEN   ; AYUKA
	body_data  16,  120, HEAD_LEGS,      BLUE  ; CMUGETSU
	body_data   7,   160, HEAD_LEGS,      BLUE  ; MUGETSU
	body_data  17,   125, WINGS,    PINK  ; CGENGETSU
	body_data   9,  170, WINGS,    PINK   ; GENGETSU
	body_data   4,   10, HEAD_ARMS,    RED  ; CSARA
	body_data  10,   40, BIPEDAL,      RED  ; SARA
	body_data  10,   20, HEAD_ARMS,    PURPLE ; CLUIZE
	body_data  17,   70, HEAD_ARMS,    PURPLE ; LUIZE
	body_data  12,   170, HEAD_ARMS,    BLUE   ; DLUIZE
	body_data  16,   30, MULTIBODY,    RED   ; CALICE
	body_data   3,   60, MULTIBODY,    BLUE   ; ALICE
	body_data  10,  150, MULTIBODY,    GREEN   ; AALICE
	body_data   8,   55, WINGS,        WHITE  ; CMAI
	body_data  14,   90, WINGS,        WHITE  ; MAI
	body_data  11,   55, BIPEDAL,       BLACK  ; CYUKI
	body_data  17,   90, BIPEDAL,         BLACK  ; YUKI
	body_data  12,   100, HEAD,         RED ; CYUMEKO
	body_data   3,   120, HEAD,         RED ; YUMEKO
	body_data  13,    130, MULTIWINGS,    RED ; CSHINKI
	body_data  16,    230, MULTIWINGS,    RED ; SHINKI
	body_data  88,   10, HEAD_BASE,    BLACK   ; CRUMIA
	body_data  10,   40, BIPEDAL,      BLACK ; RUMIA
	body_data  16,   90, BIPEDAL,      BLACK ; ARUMIA
	body_data   4,   30, WINGS,    GREEN    ; CDAICHAN
	body_data  13,   70, WINGS,    GREEN    ; DAICHAN
	body_data   5,   140, WINGS,      GREEN    ; DDAICHAN
	body_data  12,   100, WINGS,         BLUE    ; CCIRNO
	body_data   4,   160, WINGS,    BLUE   ; CIRNO
	body_data  20,   250, WINGS,    BLUE ; SCIRNO
	body_data   4,   100, BIPEDAL_TAIL, GREEN  ; CMEILING
	body_data  10,   150, BIPEDAL_TAIL, GREEN  ; MEILING
	body_data  15,   240, BIPEDAL_TAIL, GREEN  ; AMEILING
	body_data  14,   140, WINGS,      RED  ; CKOAKUMA
	body_data  12,   210, WINGS,      RED   ; KOAKUMA
	body_data   6,   270, WINGS,       RED ; HKOAKUMA
	body_data  12,   200, HEAD_BASE,    PURPLE ; CPATCHOULI
	body_data  10,   350, HEAD_BASE,    PURPLE   ; PATCHOULI
	body_data  19,   500, HEAD_BASE, PURPLE   ; TPATCHOULI
	body_data  11,   210, WINGS, PINK   ; CREMILIA
	body_data  10,   300, WINGS,    PINK   ; REMILIA
	body_data  22,   600, WINGS, PINK  ; SREMILIA
	body_data   4,  500, MULTIWINGS,    RED   ; CFLANDRE
	body_data  12,   800, MULTIWINGS,    RED   ; FLANDRE
	body_data   6,  1200, MULTIWINGS,         RED    ; AFLANDRE
	body_data  13,  20, MULTIBODY,         PURPLE    ; CLETTY
	body_data   8,  60, MULTIBODY,    PURPLE  ; LETTY
	body_data  11,  240, MULTIBODY,    PURPLE ; DLETTY
	body_data  13,  35, QUADRUPED,      RED   ; CCHEN
	body_data  15,  85, QUADRUPED,      RED  ; CHEN
	body_data  14,  260, QUADRUPED,      RED    ; HCHEN
	body_data  11,  90, WINGS, WHITE ; CLILYWHITE
	body_data  13,  200, WINGS, WHITE    ; LILYWHITE
	body_data  15,  250, WINGS, WHITE  ; DLILYWHITE
	body_data  14,  90, WINGS,   BLACK  ; CLILYBLACK
	body_data   9,  200, WINGS,  BLACK    ; LILYBLACK
	body_data  65, 250, WINGS,   BLACK   ; SLILYBLACK
	body_data  25, 100, MULTIBODY, RED   ; CLYRICA
	body_data   3,   230, MULTIBODY, RED ; LYRICA
	body_data   3,   230, MULTIBODY, RED  ; TLYRICA
	body_data  10, 100, MULTIBODY,  PINK   ; CMERLIN
	body_data   8,  230, MULTIBODY,  PINK ; MERLIN
	body_data   9,  230, MULTIBODY,  PINK    ; SMERLIN
	body_data   8,  100, MULTIBODY,  BLACK   ; CLUNASA
	body_data   4,  230, MULTIBODY,  BLACK   ; LUNASA
	body_data  10,  230, MULTIBODY,  BLACK   ; ALUNASA
	body_data   5,  190, HEAD_ARMS,  BLUE  ; CYUYUKO
	body_data  13,  400, MULTIBODY, BLUE  ; YUYUKO
	body_data  18,  400, MULTIBODY,  BLUE ; AYUYUKO
	body_data  21, 220, QUADRUPED,  BLUE  ; CRAN
	body_data  17,  500, QUADRUPED, BLUE   ; RAN
	body_data  16,  550, QUADRUPED,  BLUE ; TRAN
	body_data  20,  600, HEAD,     PURPLE ; CYUKARI
	body_data  18,  800, HEAD_ARMS,   PURPLE   ; YUKARI
	body_data  40,  900, QUADRUPED,   PURPLE   ; TYUKARI
	body_data  22, 200, BIPEDAL, PURPLE  ; CSUIKA
	body_data  20, 500, BIPEDAL, PURPLE ; SUIKA
	body_data   4,  500, BIPEDAL, PURPLE   ; TSUIKA
	body_data   9,  150, MULTIBODY,    GREEN  ; CYOUMU
	body_data  12,  350, MULTIBODY,    GREEN  ; YOUMU
	body_data  18, 400, MULTIBODY,    GREEN  ; SYOUMU
	body_data   5,  150, BIPEDAL,      PINK ; CREISEN
	body_data   9,  350, BIPEDAL,    PINK ; REISEN
	body_data  17,  380, BIPEDAL,    PINK ; TREISEN
	body_data   6,  150, BIPEDAL, BLUE   ; CSANAE
	body_data  11,  350, BIPEDAL, BLUE   ; SANAE
	body_data  23,  380, BIPEDAL, BLUE   ; DSANAE
	body_data   8,   60, QUADRUPED,    BROWN  ; SENTRET
	body_data  18,  325, QUADRUPED,    BROWN  ; FURRET
	body_data   7,  212, WINGS,        BROWN  ; HOOTHOOT
	body_data  16,  408, WINGS,        BROWN  ; NOCTOWL
	body_data  10,  108, WINGS,        RED    ; LEDYBA
	body_data  14,  356, WINGS,        RED    ; LEDIAN
	body_data   5,   85, INSECTOID,    GREEN  ; SPINARAK
	body_data  11,  335, INSECTOID,    RED    ; ARIADOS
	body_data  18,  750, MULTIWINGS,   PURPLE ; CROBAT
	body_data   5,  120, FINS,         BLUE   ; CHINCHOU
	body_data  12,  225, FINS,         BLUE   ; LANTURN
	body_data   3,   20, QUADRUPED,    YELLOW ; PICHU
	body_data   3,   30, BIPEDAL_TAIL, PINK   ; CLEFFA
	body_data   3,   10, BIPEDAL,      PINK   ; IGGLYBUFF
	body_data   3,   15, BIPEDAL,      WHITE  ; TOGEPI
	body_data   6,   32, BIPEDAL,      WHITE  ; TOGETIC
	body_data   2,   20, WINGS,        GREEN  ; NATU
	body_data  15,  150, WINGS,        GREEN  ; XATU
	body_data   6,   78, QUADRUPED,    WHITE  ; MAREEP
	body_data   8,  133, BIPEDAL_TAIL, PINK   ; FLAAFFY
	body_data  14,  615, BIPEDAL_TAIL, YELLOW ; AMPHAROS
	body_data   4,   58, BIPEDAL,      GREEN  ; BELLOSSOM
	body_data   4,   85, BIPEDAL_TAIL, BLUE   ; MARILL
	body_data   8,  285, BIPEDAL_TAIL, BLUE   ; AZUMARILL
	body_data  12,  380, BIPEDAL,      BROWN  ; SUDOWOODO
	body_data  11,  339, BIPEDAL,      GREEN  ; POLITOED
	body_data   4,    5, BIPEDAL_TAIL, PINK   ; HOPPIP
	body_data   6,   10, BIPEDAL_TAIL, GREEN  ; SKIPLOOM
	body_data   8,   30, BIPEDAL_TAIL, BLUE   ; JUMPLUFF
	body_data   8,  115, BIPEDAL_TAIL, PURPLE ; AIPOM
	body_data   3,   18, HEAD,         YELLOW ; SUNKERN
	body_data   8,   85, BIPEDAL,      YELLOW ; SUNFLORA
	body_data  12,  380, MULTIWINGS,   RED    ; YANMA
	body_data   4,   85, HEAD_LEGS,    BLUE   ; WOOPER
	body_data  14,  750, BIPEDAL_TAIL, BLUE   ; QUAGSIRE
	body_data   9,  265, QUADRUPED,    PURPLE ; ESPEON
	body_data  10,  270, QUADRUPED,    BLACK  ; UMBREON
	body_data   5,   21, WINGS,        BLACK  ; MURKROW
	body_data  20,  795, BIPEDAL_TAIL, PINK   ; SLOWKING
	body_data   7,   10, HEAD,         GRAY   ; MISDREAVUS
	body_data   5,   50, HEAD,         BLACK  ; UNOWN
	body_data  13,  285, HEAD_BASE,    BLUE   ; WOBBUFFET
	body_data  15,  415, QUADRUPED,    YELLOW ; GIRAFARIG
	body_data   6,   72, HEAD,         GRAY   ; PINECO
	body_data  12, 1258, HEAD,         PURPLE ; FORRETRESS
	body_data  15,  140, SERPENTINE,   YELLOW ; DUNSPARCE
	body_data  11,  648, WINGS,        PURPLE ; GLIGAR
	body_data  92, 4000, SERPENTINE,   GRAY   ; STEELIX
	body_data   6,   78, BIPEDAL,      PINK   ; SNUBBULL
	body_data  14,  487, BIPEDAL_TAIL, PURPLE ; GRANBULL
	body_data   5,   39, FINS,         GRAY   ; QWILFISH
	body_data  18, 1180, MULTIWINGS,   RED    ; SCIZOR
	body_data   6,  205, INSECTOID,    YELLOW ; SHUCKLE
	body_data  15,  540, BIPEDAL,      BLUE   ; HERACROSS
	body_data   9,  280, BIPEDAL_TAIL, BLACK  ; SNEASEL
	body_data   6,   88, BIPEDAL_TAIL, BROWN  ; TEDDIURSA
	body_data  18, 1258, BIPEDAL_TAIL, BROWN  ; URSARING
	body_data   7,  350, SERPENTINE,   RED    ; SLUGMA
	body_data   8,  550, SERPENTINE,   RED    ; MAGCARGO
	body_data   4,   65, QUADRUPED,    BROWN  ; SWINUB
	body_data  11,  558, QUADRUPED,    BROWN  ; PILOSWINE
	body_data   6,   50, INSECTOID,    PINK   ; CORSOLA
	body_data   6,  120, FINS,         GRAY   ; REMORAID
	body_data   9,  285, TENTACLES,    RED    ; OCTILLERY
	body_data   9,  160, WINGS,        RED    ; DELIBIRD
	body_data  21, 2200, WINGS,        PURPLE ; MANTINE
	body_data  17,  505, WINGS,        GRAY   ; SKARMORY
	body_data   6,  108, QUADRUPED,    BLACK  ; HOUNDOUR
	body_data  14,  350, QUADRUPED,    BLACK  ; HOUNDOOM
	body_data  18, 1520, HEAD_BASE,    BLUE   ; KINGDRA
	body_data   5,  335, QUADRUPED,    BLUE   ; PHANPY
	body_data  11, 1200, QUADRUPED,    GRAY   ; DONPHAN
	body_data   6,  325, HEAD_LEGS,    RED    ; CLUNASA2
	body_data  14,  712, QUADRUPED,    BROWN  ; STANTLER
	body_data  12,  580, BIPEDAL_TAIL, WHITE  ; SMEARGLE
	body_data   7,  210, BIPEDAL,      PURPLE ; TYROGUE
	body_data  14,  480, BIPEDAL_TAIL, BROWN  ; HITMONTOP
	body_data   4,   60, BIPEDAL,      PINK   ; SMOOCHUM
	body_data   6,  235, BIPEDAL,      YELLOW ; ELEKID
	body_data   7,  214, BIPEDAL_TAIL, RED    ; MAGBY
	body_data  12,  755, BIPEDAL_TAIL, PINK   ; MILTANK
	body_data  15,  468, BIPEDAL,      PINK   ; BLISSEY
	body_data  19, 1780, QUADRUPED,    YELLOW ; RAIKOU
	body_data  21, 1980, QUADRUPED,    BROWN  ; ENTEI
	body_data  20, 1870, QUADRUPED,    BLUE   ; SUICUNE
	body_data   6,  720, BIPEDAL_TAIL, GREEN  ; LARVITAR
	body_data  12, 1520, SERPENTINE,   GRAY   ; PUPITAR
	body_data  20, 2020, BIPEDAL_TAIL, GREEN  ; TYRANITAR
	body_data  52, 2160, WINGS,        WHITE  ; LUGIA
	body_data  38, 1990, WINGS,        RED    ; HO_OH
	body_data   6,   50, BIPEDAL,      GREEN  ; CELEBI
	body_data   2,   20, HEAD_LEGS,    BLUE   ; AZURILL
	body_data   6,  140, BIPEDAL_TAIL, BLUE   ; WYNAUT
	body_data  12,  203, BIPEDAL_TAIL, PURPLE ; AMBIPOM
	body_data   0,    0, HEAD,         RED    ; EGG
	body_data   0,    0, HEAD,         RED    ; $100
	body_data   9,   44, HEAD,         PURPLE ; MISMAGIUS
	body_data   9,  273, WINGS,        BLACK  ; HONCHKROW
	body_data   5,  150, HEAD_LEGS,    BROWN  ; BONSLY
	body_data   6,  130, BIPEDAL,      PINK   ; MIME_JR_
	body_data   6,  244, BIPEDAL,      PINK   ; HAPPINY
	body_data   6, 1050, BIPEDAL,      BLACK  ; MUNCHLAX
	body_data  10,  650, WINGS,        BLUE   ; MANTYKE
	body_data  11,  340, BIPEDAL_TAIL, BLACK  ; WEAVILE
	body_data  12, 1800, HEAD_ARMS,    GRAY   ; MAGNEZONE
	body_data  17, 1400, BIPEDAL,      PINK   ; LICKILICKY
	body_data  24, 2828, BIPEDAL_TAIL, GRAY   ; RHYPERIOR
	body_data  20, 1286, BIPEDAL,      BLUE   ; TANGROWTH
	body_data  18, 1386, BIPEDAL_TAIL, YELLOW ; ELECTIVIRE
	body_data  16,  680, BIPEDAL_TAIL, RED    ; MAGMORTAR
	body_data  15,  380, WINGS,        WHITE  ; TOGEKISS
	body_data  19,  515, MULTIWINGS,   GREEN  ; YANMEGA
	body_data  10,  255, QUADRUPED,    GREEN  ; LEAFEON
	body_data   8,  259, QUADRUPED,    BLUE   ; GLACEON
	body_data  20,  425, WINGS,        PURPLE ; GLISCOR
	body_data  25, 2910, QUADRUPED,    BROWN  ; MAMOSWINE
	body_data   9,  340, HEAD_ARMS,    RED    ; CLUNASA_Z
	body_data  10,  235, QUADRUPED,    PINK   ; SYLVEON
	body_data   8,  280, BIPEDAL_TAIL, BROWN  ; PERRSERKER
	body_data  10,    4, HEAD_ARMS,    WHITE  ; CURSOLA
	body_data   8, 1170, WINGS,        WHITE  ; SIRFETCH_D
	body_data  15,  582, BIPEDAL,      PURPLE ; MR__RIME
	body_data  18,  951, QUADRUPED,    GRAY   ; WYRDEER
	body_data  18,  890, MULTIWINGS,   BROWN  ; KLEAVOR
	body_data  24, 2900, BIPEDAL_TAIL, BROWN  ; URSALUNA
	body_data  13,  430, BIPEDAL_TAIL, GRAY   ; SNEASLER
	body_data  25,  605, FINS,         BLACK  ; OVERQWIL
	body_data  36,  392, SERPENTINE,   YELLOW ; DUDUNSPARCE
	body_data  32, 1600, QUADRUPED,    YELLOW ; FARIGIRAF
	body_data  18, 2230, QUADRUPED,    BROWN  ; CLODSIRE
	body_data  12,  560, BIPEDAL_TAIL, GRAY   ; ANNIHILAPE
	assert_table_length NUM_SPECIES

	body_data  65, 2350, SERPENTINE,   RED    ; SLILYBLACK (SLILYBLACK_RED_FORM)

	body_data  22, 1370, BIPEDAL_TAIL, GRAY   ; SUIKA (SUIKA_ARMORED_FORM)

	body_data  45,  474, SERPENTINE,   YELLOW ; DUDUNSPARCE (DUDUNSPARCE_THREE_SEGMENT_FORM)

	assert_table_length NUM_EXT_POKEMON
