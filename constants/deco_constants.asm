; decoration attributes
rsreset
DEF DECOATTR_TYPE       rb
DEF DECOATTR_NAME       rb
DEF DECOATTR_ACTION     rb
DEF DECOATTR_EVENT_FLAG rw
DEF DECOATTR_SPRITE     rb
DEF DECOATTR_STRUCT_LENGTH EQU _RS

; decoration types
	const_def 1
	const DECO_PLANT
	const DECO_BED
	const DECO_CARPET
	const DECO_POSTER
	const DECO_DOLL
	const DECO_BIGDOLL
DEF NUM_DECO_TYPES EQU const_value - 1

; DecorationNames indexes (see data/decorations/names.asm)
	const_def
	const CANCEL_DECO
	const PUT_IT_AWAY
	const MAGNAPLANT
	const TROPICPLANT
	const JUMBOPLANT
	const TOWN_MAP_POSTER
	const DIPLOMA
	const SUPER_NES
	const NINTENDO_64
	const GAMECUBE
	const WII
	const GOLD_TROPHY
	const SILVER_TROPHY
	const SURF_PIKA_DOLL
	const _BED
	const _CARPET
	const _POSTER
	const _DOLL
	const BIG_
	const FEATHERY_BED
	const EKIKURI_BED
	const PINK_BED
	const POLKADOT_BED
	const RED_CARPET
	const BLUE_CARPET
	const YELLOW_CARPET
	const GREEN_CARPET
DEF NUM_DECO_NAMES EQU const_value

; DoDecorationAction2.DecoActions indexes (see engine/overworld/decorations.asm)
	const_def 1
	const SET_UP_BED
	const PUT_AWAY_BED
	const SET_UP_CARPET
	const PUT_AWAY_CARPET
	const SET_UP_PLANT
	const PUT_AWAY_PLANT
	const SET_UP_POSTER
	const PUT_AWAY_POSTER
	const SET_UP_CONSOLE
	const PUT_AWAY_CONSOLE
	const SET_UP_BIG_DOLL
	const PUT_AWAY_BIG_DOLL
	const SET_UP_DOLL
	const PUT_AWAY_DOLL
DEF NUM_DECO_ACTIONS EQU const_value - 1

DEF __deco_value__ = 0

MACRO deco
	const DECO_\1
	DEF DECOFLAG_\1 EQU __deco_value__
	DEF __deco_value__ += 1
ENDM

; decorations:
; - DecorationAttributes (see data/decorations/attributes.asm)
; - DecorationIDs (see data/decorations/decorations.asm)
	const_def 1
; FindOwnedBeds.beds values (see engine/overworld/decorations.asm)
	const BEDS
	deco  FEATHERY_BED
	deco  PINK_BED
	deco  POLKADOT_BED
	deco  EKIKURI_BED
; FindOwnedCarpets.carpets values (see engine/overworld/decorations.asm)
	const CARPETS
	deco  RED_CARPET
	deco  BLUE_CARPET
	deco  YELLOW_CARPET
	deco  GREEN_CARPET
; FindOwnedPlants.plants values (see engine/overworld/decorations.asm)
	const PLANTS
	deco  MAGNAPLANT
	deco  TROPICPLANT
	deco  JUMBOPLANT
; FindOwnedPosters.posters values (see engine/overworld/decorations.asm)
	const POSTERS
	deco  TOWN_MAP
	deco  DIPLOMA
	deco  EKIKURI_POSTER
	deco  CMEIRA_POSTER
	deco  AYA_POSTER
; FindOwnedConsoles.consoles values (see engine/overworld/decorations.asm)
	const CONSOLES
	deco  SNES
	deco  N64
	deco  GAMECUBE
	deco  WII
; FindOwnedBigDolls.big_dolls values (see engine/overworld/decorations.asm)
	const BIG_DOLLS
	deco  BIG_CRAN_DOLL
	deco  BIG_CRUMIA_DOLL
	deco  BIG_CLYRICA_DOLL
; FindOwnedOrnaments.ornaments values (see engine/overworld/decorations.asm)
	const DOLLS
	deco  EKIKURI_DOLL
	deco  CSARIEL_DOLL
	deco  SURF_EKIKURI_DOLL
	deco  CMEIRA_DOLL
	deco  ELLEN_DOLL
	deco  CREIMU_DOLL
	deco  CMARISA_DOLL
	deco  CSAKUYA_DOLL
	deco  CYOUMU_DOLL
	deco  CREISEN_DOLL
	deco  CSANAE_DOLL
	deco  KURUMI_DOLL
	deco  CMOKOU_DOLL
	deco  TEIRIN_DOLL
	deco  LILYBLACK_DOLL
	deco  EKOTOHIME_DOLL
	deco  ESHINKI_DOLL
	deco  YAMAME_DOLL
	deco  LYRICA_DOLL
	deco  CDAICHAN_DOLL
	deco  ELLY_DOLL
	deco  CNUE_DOLL
	deco  CSARA_DOLL
	deco  NITORI_DOLL
	deco  AYA_DOLL
	deco  AIKU_DOLL
	deco  CHIYURI_DOLL
	deco  EMEIRA_DOLL
	deco  EORANGE_DOLL
	deco  TLYRICA_DOLL
DEF NUM_NON_TROPHY_DECOS EQU __deco_value__
	deco  GOLD_TROPHY_DOLL
	deco  SILVER_TROPHY_DOLL
DEF NUM_DECOS EQU __deco_value__
DEF NUM_DECO_CATEGORIES EQU const_value - 1 - NUM_DECOS
