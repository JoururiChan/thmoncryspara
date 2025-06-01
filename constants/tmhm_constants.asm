; tm/hm/tutor ids
; indexes for:
; - TMHMMoves (see data/moves/tmhm_moves.asm)
	const_def

DEF __tmhm_value__ = 1

MACRO add_tmnum
	DEF \1_TMNUM EQU __tmhm_value__
	DEF __tmhm_value__ += 1
ENDM

MACRO add_tm
	if !DEF(TM01)
		DEF TM01 = const_value
	endc
	const TM_\1
	add_tmnum \1
ENDM

	add_tm DYNAMICPUNCH ; $00
	add_tm POISON_CLAW  ; $01
	add_tm POWER_TRICK        ; $02
	add_tm CALM_MIND    ; $03
	add_tm ROAR         ; $04
	add_tm TOXIC        ; $05
	add_tm HAIL         ; $06
	add_tm BULK_UP      ; $07
	add_tm PAY_DAY    ; $08
	add_tm HIDDEN_POWER ; $09
	add_tm SUNNY_DAY    ; $0a
	add_tm HONE_TOOLS   ; $0b
	add_tm ICE_BEAM     ; $0c
	add_tm BLIZZARD     ; $0d
	add_tm JUMP_KICK   ; $0e
	add_tm LIGHT_SCREEN ; $0f
	add_tm PROTECT      ; $10
	add_tm RAIN_DANCE   ; $11
	add_tm GIGA_DRAIN   ; $12
	add_tm SAFEGUARD    ; $13
	add_tm BULLDOZE     ; $14
	add_tm FLOWER_SHOOT   ; $15
	add_tm PAPER_THROW    ; $16
	add_tm THUNDERBOLT  ; $17
	add_tm THUNDER      ; $18
	add_tm EARTHQUAKE   ; $19
	add_tm RETURN       ; $1a
	add_tm DIG          ; $1b
	add_tm MANA_BURST      ; $1c
	add_tm SHADOW_BALL  ; $1d
	add_tm ROCK_SMASH   ; $1e
if !DEF(FAITHFUL)
DEF TM_BRICK_BREAK    EQU TM_ROCK_SMASH
DEF BRICK_BREAK_TMNUM EQU ROCK_SMASH_TMNUM
endc
	add_tm DOUBLE_TEAM  ; $1f
	add_tm REFLECT      ; $20
	add_tm STAR_CANNON ; $21
	add_tm FLAME_SHOOT ; $22
	add_tm SLUDGE_BOMB  ; $23
	add_tm SANDSTORM    ; $24
	add_tm HELLBLAZE   ; $25
	add_tm SWIFT        ; $26
	add_tm AERIAL_ACE   ; $27
	add_tm SUBSTITUTE   ; $28
	add_tm FACADE       ; $29
	add_tm FLAME_CHARGE ; $2a
	add_tm REST         ; $2b
	add_tm LUSTER_HEART      ; $2c
	add_tm THIEF        ; $2d
	add_tm STEEL_WING   ; $2e
	add_tm ROCK_SLIDE   ; $2f
	add_tm ENERGY_LIGHT ; $30
	add_tm LEECH_LIFE   ; $31
	add_tm AURA_WAVE        ; $32
	add_tm FOCUS_BLAST  ; $33
	add_tm ENERGY_BALL  ; $34
	add_tm BLADE_FLASH  ; $35
	add_tm SCALD        ; $36
	add_tm CROSS_EYE    ; $37
	add_tm WILD_CHARGE  ; $38
	add_tm DARK_PULSE   ; $39
	add_tm ECHO_RAVE ; $3a
	add_tm DRAIN_PUNCH  ; $3b
	add_tm WILL_O_WISP  ; $3c
	add_tm ACROBATICS   ; $3d
	add_tm WATER_PULSE  ; $3e
	add_tm EXPLOSION    ; $3f
	add_tm SHADOW_HIT  ; $40
	add_tm POISON_JAB   ; $41
	add_tm AVALANCHE    ; $42
	add_tm ULTICHARGE  ; $43
	add_tm CHARGE_OUT       ; $44
	add_tm FLASH        ; $45
	add_tm STONE_BREAK   ; $46
	add_tm VOLT_SWITCH  ; $47
	add_tm THUNDER_WAVE ; $48
	add_tm GYRO_BALL    ; $49
	add_tm SWORDS_DANCE ; $4a
DEF NUM_TMS = __tmhm_value__ - 1

MACRO add_hm
	if !DEF(HM01)
		DEF HM01 = const_value
	endc
	const HM_\1
	add_tmnum \1
ENDM

	add_hm CUT          ; $4b
	add_hm FLY          ; $4c
	add_hm SURF         ; $4d
	add_hm STRENGTH     ; $4e
	add_hm WHIRLPOOL    ; $4f
	add_hm WATERFALL    ; $50
DEF NUM_HMS = __tmhm_value__ - NUM_TMS - 1

MACRO add_mt
	if !DEF(MT01)
		DEF MT01 = const_value
	endc
	add_tmnum \1
ENDM

	add_mt LEAF_STORM      ; $51
	add_mt BLADE_THROW    ; $52
	add_mt BATON_PASS   ; $53
	add_mt BODY_SLAM    ; $54
	add_mt CHARM        ; $55
	add_mt COUNTER      ; $56
	add_mt DEFENSE_CURL ; $57
	add_mt DOUBLE_EDGE  ; $58
	add_mt DREAM_EATER  ; $59
	add_mt EARTH_POWER  ; $5a
	add_mt ENDURE       ; $5b
	add_mt FIRE_PUNCH   ; $5c
	add_mt HEADBUTT     ; $5d
	add_mt VOICE_BIND  ; $5e
	add_mt ICE_PUNCH    ; $5f
	add_mt ICY_WIND     ; $60
	add_mt IRON_HEAD    ; $61
	add_mt KNOCK_OFF    ; $62
	add_mt STEEL_FIST      ; $63
	add_mt TREMORS      ; $64
	add_mt SEED_BOMB    ; $65
	add_mt SEISMIC_TOSS ; $66
	add_mt SKILL_SWAP   ; $67
	add_mt SLEEP_TALK   ; $68
	add_mt SUCKER_PUNCH ; $69
	add_mt SWAGGER      ; $6a
	add_mt THUNDERPUNCH ; $6b
	add_mt TRICK        ; $6c
	add_mt TRICK_ROOM   ; $6d
	add_mt ZAP_CANNON   ; $6e
	add_mt DIZZY_PUNCH ; $6f
DEF NUM_TUTORS = __tmhm_value__ - NUM_TMS - NUM_HMS - 1

DEF NUM_TM_HM_TUTOR EQU NUM_TMS + NUM_HMS + NUM_TUTORS
