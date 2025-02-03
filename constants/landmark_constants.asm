; Landmarks indexes (see data/maps/landmarks.asm)
	const_def
	const SPECIAL_MAP        ; 00
; Johto landmarks
	const NEW_BARK_TOWN      ; 01
	const ROUTE_29           ; 02
	const CHERRYGROVE_CITY   ; 03
	const CHERRYGROVE_BAY    ; 04
	const ROUTE_30           ; 05
	const ROUTE_31           ; 06
	const VIOLET_CITY        ; 07
	const AUTUMN_TOWER       ; 08
	const VIOLET_OUTSKIRTS   ; 09
	const RUINS_OF_ALPH      ; 0a
	const ROUTE_32           ; 0b
	const ROUTE_32_COAST     ; 0c
	const UNION_CAVE         ; 0d
	const ROUTE_33           ; 0e
	const AZALEA_TOWN        ; 0f
	const WAKASAGI_WELL      ; 10
	const ILEX_FOREST        ; 11
	const ROUTE_34           ; 12
	const ROUTE_34_COAST     ; 13
	const STORMY_BEACH       ; 14
	const MURKY_SWAMP        ; 15
	const GOLDENROD_CITY     ; 16
	const RADIO_TOWER        ; 17
	const GOLDENROD_HARBOR   ; 18
	const MAGNET_TUNNEL      ; 19
	const ROUTE_35           ; 1a
	const ROUTE_35_COAST     ; 1b
	const NATIONAL_PARK      ; 1c
	const ROUTE_36           ; 1d
	const ROUTE_37           ; 1e
	const ECRUTEAK_CITY      ; 1f
	const BELLCHIME_TRAIL    ; 20
	const TIN_TOWER          ; 21
	const BURNED_TOWER       ; 22
	const ROUTE_38           ; 23
	const ROUTE_39           ; 24
	const RUGGED_ROAD        ; 25
	const SNOWTOP_MOUNTAIN   ; 26
	const OLIVINE_CITY       ; 27
	const LIGHTHOUSE         ; 28
	const ROUTE_40           ; 29
	const BATTLE_TOWER       ; 2a
	const WHIRL_ISLANDS      ; 2b
	const ROUTE_41           ; 2c
	const CIANWOOD_CITY      ; 2d
	const CLIFF_EDGE_GATE    ; 2e
	const ROUTE_47           ; 2f
	const CLIFF_CAVE         ; 30
	const ROUTE_48           ; 31
	const YELLOW_FOREST      ; 32
	const QUIET_CAVE         ; 33
	const ROUTE_42           ; 34
	const MT_MORTAR          ; 35
	const MAHOGANY_TOWN      ; 36
	const ROUTE_43           ; 37
	const LAKE_OF_RAGE       ; 38
	const ROUTE_44           ; 39
	const ICE_PATH           ; 3a
	const BLACKTHORN_CITY    ; 3b
	const DRAGONS_DEN        ; 3c
	const ROUTE_45           ; 3d
	const DARK_CAVE          ; 3e
	const ROUTE_46           ; 3f
	const SILVER_CAVE        ; 40
	const FAST_SHIP          ; 41
	const SINJOH_RUINS       ; 42
	const MYSTRI_STAGE       ; 43
DEF KANTO_LANDMARK EQU const_value
	const PALLET_TOWN        ; 44
	const ROUTE_1            ; 45
	const VIRIDIAN_CITY      ; 46
	const ROUTE_2            ; 47
	const VIRIDIAN_FOREST    ; 48
	const PEWTER_CITY        ; 49
	const ROUTE_3            ; 4a
	const MT_MOON            ; 4b
	const ROUTE_4            ; 4c
	const CERULEAN_CITY      ; 4d
	const CERULEAN_CAVE      ; 4e
	const ROUTE_24           ; 4f
	const ROUTE_25           ; 50
	const CERULEAN_CAPE      ; 51
	const ROUTE_5            ; 52
	const UNDERGROUND        ; 53
	const ROUTE_6            ; 54
	const VERMILION_CITY     ; 55
	const CCHIYURIS_CAVE      ; 56
	const ROUTE_7            ; 57
	const ROUTE_8            ; 58
	const ROUTE_9            ; 59
	const ROUTE_10           ; 5a
	const ROCK_TUNNEL        ; 5b
	const POWER_PLANT        ; 5c
	const DIM_CAVE           ; 5d
	const LAVENDER_TOWN      ; 5e
	const LAV_RADIO_TOWER    ; 5f
	const SOUL_HOUSE         ; 60
	const CELADON_CITY       ; 61
	const CELADON_UNIVERSITY ; 62
	const SAFFRON_CITY       ; 63
	const ROUTE_11           ; 64
	const ROUTE_12           ; 65
	const ROUTE_13           ; 66
	const ROUTE_14           ; 67
	const ROUTE_15           ; 68
	const LUCKY_ISLAND       ; 69
	const ROUTE_16           ; 6a
	const ROUTE_17           ; 6b
	const ROUTE_18           ; 6c
	const FUCHSIA_CITY       ; 6d
	const SAFARI_ZONE        ; 6e
	const URAGA_CHANNEL      ; 6f
	const SCARY_CAVE         ; 70
	const ROUTE_19           ; 71
	const ROUTE_20           ; 72
	const SEAFOAM_ISLANDS    ; 73
	const CINNABAR_ISLAND    ; 74
	const TOHOMON_MANSION    ; 75
	const CINNABAR_VOLCANO   ; 76
	const ROUTE_21           ; 77
	const ROUTE_22           ; 78
	const ROUTE_27           ; 79
	const TOHJO_FALLS        ; 7a
	const ROUTE_26           ; 7b
	const TOHOMON_LEAGUE     ; 7c
	const ROUTE_23           ; 7d
	const VICTORY_ROAD       ; 7e
	const INDIGO_PLATEAU     ; 7f
	const ROUTE_28           ; 80
	const CINNABAR_LAB       ; 81
DEF SHAMOUTI_LANDMARK EQU const_value
	const SHAMOUTI_ISLAND    ; 82
	const BEAUTIFUL_BEACH    ; 83
	const ROCKY_BEACH        ; 84
	const NOISY_FOREST       ; 85
	const SHRINE_RUINS       ; 86
	const SHAMOUTI_TUNNEL    ; 87
	const WARM_BEACH         ; 88
	const SHAMOUTI_COAST     ; 89
	const FIRE_ISLAND        ; 8a
	const ICE_ISLAND         ; 8b
	const LIGHTNING_ISLAND   ; 8c
	const ROUTE_49           ; 8d
	const VALENCIA_ISLAND    ; 8e
	const NAVEL_ROCK         ; 8f
	const FARAWAY_ISLAND     ; 90
DEF NUM_LANDMARKS EQU const_value

; used in CaughtData
DEF LANDMARK_EVENT EQU $ff

; Regions
	const_def
	const JOHTO_REGION  ; 0
	const KANTO_REGION  ; 1
	const ORANGE_REGION ; 2
DEF NUM_REGIONS EQU const_value
