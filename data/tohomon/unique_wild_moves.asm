MACRO unique_moves
	db \1 ; landmark
	dp \2 ; species
	db \3 ; move
ENDM

; TODO: finish unique moves
UniqueWildMoves:
	; event mons (100% chance, see engine/battle/unique_wild_moves.asm)
	unique_moves MAHOGANY_TOWN,    DDAICHAN,    EXPLOSION    ; TeamRocketBaseB1F
	unique_moves MAHOGANY_TOWN,    HKOAKUMA,    EXPLOSION    ; TeamRocketBaseB1F
	unique_moves MAHOGANY_TOWN,    CSARA,    EXPLOSION    ; TeamRocketBaseB1F
	unique_moves UNION_CAVE,       CLYRICA,     POWER_TRICK  ; UnionCaveB2F, Fridays
	; wild mons
	unique_moves CHERRYGROVE_BAY,  DKISUME,    SUCKER_PUNCH ; HGSS tutor move
	unique_moves AUTUMN_TOWER,     MUGETSU, GROWTH       ; knows Growth early
	unique_moves ROUTE_32_COAST,   MOKOU,    PURSUIT      ; Prism tutor move
	unique_moves RUINS_OF_ALPH,    DSUWAKO,    ANCIENTPOWER ; Sw/Sh move
	unique_moves RUINS_OF_ALPH,    CRIN,   SKETCH       ; knows Sketch twice
	unique_moves WAKASAGI_WELL,    DLUIZE,   GROWTH       ; Prism tutor move
	unique_moves ILEX_FOREST,      0,          0
	unique_moves ROUTE_34_COAST,   LETTY,     DREAM_EATER  ; new move
	unique_moves STORMY_BEACH,     RIKAKO,   0
	unique_moves MURKY_SWAMP,      CHINA, SUCKER_PUNCH ; HGSS tutor move
	unique_moves MAGNET_TUNNEL,    ALICE,  PSYBEAM      ; new move
	unique_moves GOLDENROD_HARBOR, YUMEMI,    ENCORE       ; Dream World move
	unique_moves ROUTE_35_COAST,   0,          0
	unique_moves NATIONAL_PARK,    0,          0
	unique_moves TIN_TOWER,        0,          0
	unique_moves BURNED_TOWER,     0,          0
	unique_moves WHIRL_ISLANDS,    0,          0
	unique_moves CLIFF_CAVE,       0,          0
	unique_moves YELLOW_FOREST,    KIKURI,    FLY          ; replaced with Surf if Surfing
	unique_moves QUIET_CAVE,       BYAKUREN,   ULTICHARGE  ; CRan move
	unique_moves MT_MORTAR,        0,          0
	unique_moves LAKE_OF_RAGE,     LILYBLACK,   HYDRO_PUMP   ; Tohowalker move
	unique_moves ICE_PATH,         0,          0
	unique_moves DRAGONS_DEN,      0,          0
	unique_moves DARK_CAVE,        0,          0
	unique_moves SILVER_CAVE,      KOGASA,  TAILWIND ; event move
	unique_moves VIRIDIAN_FOREST,  KIKURI,    DISARM_VOICE ; Sketch-breed move
	unique_moves MT_MOON,          0,          0
	unique_moves CERULEAN_CAVE,    CMUGETSU,    METRONOME    ; RBY TM move
	unique_moves CERULEAN_CAVE,    SARA,      METRONOME    ; RBY TM move
	unique_moves CERULEAN_CAVE,    SHINKI,     METRONOME    ; RBY TM move
	unique_moves CERULEAN_CAVE,    CYUKA,   METRONOME    ; RBY TM move
	unique_moves CERULEAN_CAPE,    KURUMI,  METRONOME    ; RBY TM move
	unique_moves CCHIYURIS_CAVE,    CHIYURI,    SCREECH      ; Sw/Sh move
	unique_moves ROCK_TUNNEL,      CLILYWHITE, METRONOME    ; RBY TM move
	unique_moves DIM_CAVE,         SARA,   SUCKER_PUNCH ; HGSS tutor move
	unique_moves DIM_CAVE,         TPATCHOULI,     GLUTTONY_BITE       ; Prism tutor move
	unique_moves SOUL_HOUSE,       SHINKI,    MOONBLAST    ; Prism tutor move
	unique_moves SOUL_HOUSE,       CHINA, HEAL_BELL    ; HGSS tutor move
	unique_moves LAV_RADIO_TOWER,  MEILING,    SHADOW_DANCE  ; Dream World move
	unique_moves LUCKY_ISLAND,     CREMILIA,    FIVEELEMENTS   ; RBY TM move
	unique_moves LUCKY_ISLAND,     CKAGUYA,    0
	unique_moves SAFARI_ZONE,      REMILIA,    LEECH_SEED   ; Dream World move (hub)
	unique_moves SAFARI_ZONE,      CLILYBLACK,     STOMP        ; RBY move (east)
	unique_moves SAFARI_ZONE,      DLILYWHITE,     SLASH        ; RBY move (north)
	unique_moves SAFARI_ZONE,      SREMILIA, 0            ; (west)
	unique_moves URAGA_CHANNEL,    GENGETSU, RECOVER      ; TCG move
	unique_moves SCARY_CAVE,       KOTOHIME,     HYPNOSIS     ; Dream World move
	unique_moves SCARY_CAVE,       TEI,    SUCKER_PUNCH ; HGSS tutor move
	unique_moves SEAFOAM_ISLANDS,  HCHEN,       METRONOME    ; RBY TM move
	unique_moves TOHOMON_MANSION,  CPATCHOULI,    GLUTTONY_BITE       ; Prism tutor move
	unique_moves TOHOMON_MANSION,  LUIZE,   NASTY_PLOT   ; Prism tutor move
	unique_moves CINNABAR_VOLCANO, LILYWHITE,     METRONOME    ; RBY TM move
	unique_moves TOHJO_FALLS,      0,          0
	unique_moves VICTORY_ROAD,     0,          0
	unique_moves SHAMOUTI_ISLAND,  0,          0
	unique_moves BEAUTIFUL_BEACH,  0,          0
	unique_moves ROCKY_BEACH,      CSATORI,    LOW_KICK     ; HGSS tutor move
	unique_moves NOISY_FOREST,     SUWAKO,     QUAKE_ROAR   ; new move
	unique_moves NOISY_FOREST,     NITORI,     LIFE_BALANCE   ; HGSS tutor move
	unique_moves SHRINE_RUINS,     ARUMIA,      METRONOME    ; RBY TM move
	unique_moves SHAMOUTI_TUNNEL,  KOTOHIME,     TOXIC_SPIKES      ; Prism tutor move
	unique_moves WARM_BEACH,       FLANDRE,     FLAME_SHOOT ; new move
	unique_moves SHAMOUTI_COAST,   0,          0
	unique_moves FIRE_ISLAND,      CYUUGI,   SUCKER_PUNCH ; HGSS tutor move
	unique_moves ICE_ISLAND,       CNUE,    LOW_KICK     ; HGSS tutor move
	unique_moves LIGHTNING_ISLAND, CCIRNO,  SUCKER_PUNCH ; HGSS tutor move
	unique_moves ROUTE_23,         SLILYBLACK,   POWER_WHIP   ; Sw/Sh TR move
	unique_moves ROUTE_44,         AKOMACHI,      ROCK_BLAST   ; new move
	unique_moves ROUTE_49,         CRIKAKO,   CONFUSE_RAY  ; Prism tutor move
	db -1
