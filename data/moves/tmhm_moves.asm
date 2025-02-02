TMHMMoves:
; entries correspond to *_TMNUM constants (see constants/item_constants.asm)
	table_width 1
	db DYNAMICPUNCH ; TM01 (Chuck)
	db POISON_CLAW  ; TM02 (Route 27)
	db POWER_TRICK        ; TM03 (Celadon Mansion)
	db CALM_MIND    ; TM04 (Celadon Dept. Store)
	db ROAR         ; TM05 (Route 32)
	db TOXIC        ; TM06 (Celadon Game Corner)
	db HAIL         ; TM07 (Celadon Dept. Store)
	db BULK_UP      ; TM08 (Celadon Dept. Store)
	db PAY_DAY    ; TM09 (Route 11)
	db HIDDEN_POWER ; TM10 (Lake of Rage)
	db SUNNY_DAY    ; TM11 (Celadon Dept. Store)
	db HONE_TOOLS   ; TM12 (Route 35)
	db ICE_BEAM     ; TM13 (Goldenrod Game Corner)
	db BLIZZARD     ; TM14 (Goldenrod Dept. Store)
	db JUMP_KICK   ; TM15 (Goldenrod Dept. Store)
	db LIGHT_SCREEN ; TM16 (Goldenrod Dept. Store)
	db PROTECT      ; TM17 (Goldenrod Dept. Store)
	db RAIN_DANCE   ; TM18 (Celadon Dept. Store)
	db GIGA_DRAIN   ; TM19 (Erika)
	db SAFEGUARD    ; TM20 (Celadon Dept. Store)
	db BULLDOZE     ; TM21 (Route 39)
	db FLOWER_SHOOT   ; TM22 (Goldenrod Dept. Store)
	db SEAL_NEEDLE    ; TM23 (Jasmine)
	db THUNDERBOLT  ; TM24 (Goldenrod Game Corner)
	db THUNDER      ; TM25 (Goldenrod Dept. Store)
	db EARTHQUAKE   ; TM26 (Victory Road)
	db RETURN       ; TM27 (Goldenrod Dept. Store)
	db DIG          ; TM28 (National Park)
	db MANA_BURST    ; TM29 (Sabrina)
	db SHADOW_BALL  ; TM30 (Morty)
	db ROCK_SMASH   ; TM31 (Route 36)
	db DOUBLE_TEAM  ; TM32 (Celadon Game Corner)
	db REFLECT      ; TM33 (Goldenrod Dept. Store)
	db STAR_CANNON ; TM34 (Route 9)
	db FLAME_SHOOT ; TM35 (Goldenrod Game Corner)
	db SLUDGE_BOMB  ; TM36 (Route 43)
	db SANDSTORM    ; TM37 (Celadon Dept. Store)
	db HELLBLAZE   ; TM38 (Goldenrod Dept. Store)
	db SWIFT        ; TM39 (Union Cave)
	db AERIAL_ACE   ; TM40 (Mount Mortar)
	db SUBSTITUTE   ; TM41 (Lake of Rage)
	db FACADE       ; TM42 (Dim Cave)
	db FLAME_CHARGE ; TM43 (Burned Tower)
	db REST         ; TM44 (Dim Cave)
	db LUSTER_HEART      ; TM45 (Whitney)
	db THIEF        ; TM46 (Team Rocket Base)
	db STEEL_WING   ; TM47 (Route 28)
	db ROCK_SLIDE   ; TM48 (Brock)
	db ENERGY_LIGHT ; TM49 (Bellchime Trail)
	db LEECH_LIFE   ; TM50 (Yellow Forest)
	db AURA_WAVE        ; TM51 (Falkner)
	db FOCUS_BLAST  ; TM52 (Quiet Cave)
	db ENERGY_BALL  ; TM53 (Olivine Lighthouse)
	db BLADE_FLASH  ; TM54 (Ilex Forest Gate)
	db SCALD        ; TM55 (Route 19)
	db CROSS_JAM    ; TM56 (Underground Warehouse)
	db WILD_CHARGE  ; TM57 (Lt. Surge)
	db DARK_PULSE   ; TM58 (Dark Cave)
	db VOICE_BURST ; TM59 (Clair)
	db DRAIN_PUNCH  ; TM60 (Noisy Forest)
	db WILL_O_WISP  ; TM61 (Blaine)
	db ACROBATICS   ; TM62 (Route 39 Farmhouse)
	db WATER_PULSE  ; TM63 (Misty)
	db EXPLOSION    ; TM64 (Underground)
	db SHADOW_HIT  ; TM65 (Lavender Soul House)
	db POISON_JAB   ; TM66 (Janine)
	db AVALANCHE    ; TM67 (Pryce)
	db ULTICHARGE  ; TM68 (Celadon Game Corner)
	db CHARGE_OUT       ; TM69 (Bugsy)
	db FLASH        ; TM70 (Autumn Tower)
	db STONE_HIT   ; TM71 (Blue)
	db VOLT_SWITCH  ; TM72 (Route 10)
	db THUNDER_WAVE ; TM73 (Rock Tunnel)
	db GYRO_BALL    ; TM74 (Magnet Tunnel)
	db SWORDS_DANCE ; TM75 (Celadon Dept. Store)
	assert_table_length NUM_TMS
	db CUT          ; HM01 (Ilex Forest)
	db FLY          ; HM02 (Cianwood City)
	db SURF         ; HM03 (Ecruteak City)
	db STRENGTH     ; HM04 (Cianwood City)
	db WHIRLPOOL    ; HM05 (Route 42)
	db WATERFALL    ; HM06 (Ice Path)
	assert_table_length NUM_TMS + NUM_HMS
	db LEAF_STORM      ; MT01 (TODO)
	db KNIFE_THROW    ; MT02 (Route 4)
	db BATON_PASS   ; MT03 (Goldenrod Museum)
	db BODY_SLAM    ; MT04 (Warm Beach)
	db CHARM        ; MT05 (TODO)
	db COUNTER      ; MT06 (Celadon Dept. Store)
	db DEFENSE_CURL ; MT07 (Mount Mortar)
	db DOUBLE_EDGE  ; MT08 (Safari Zone)
	db DREAM_EATER  ; MT09 (Viridian City)
	db EARTH_POWER  ; MT10 (Cherrygrove Bay)
	db ENDURE       ; MT11 (Warm Beach)
	db FIRE_PUNCH   ; MT12 (Goldenrod City)
	db HEADBUTT     ; MT13 (Ilex Forest)
	db VOICE_BIND  ; MT14 (Goldenrod Harbor)
	db ICE_PUNCH    ; MT15 (Goldenrod City)
	db ICY_WIND     ; MT16 (Ice Path)
	db IRON_HEAD    ; MT17 (Route 4)
	db KNOCK_OFF    ; MT18 (Route 40)
	db STEEL_FIST      ; MT20 (Goldenrod Game Corner)
	db TREMORS      ; MT19 (Route 46)
	db SEED_BOMB    ; MT21 (Yellow Forest)
	db SEISMIC_TOSS ; MT22 (Pewter City)
	db SKILL_SWAP   ; MT23 (Route 27)
	db SLEEP_TALK   ; MT24 (Route 31)
	db SUCKER_PUNCH ; MT25 (Scary Cave)
	db SWAGGER      ; MT26 (Celadon City)
	db THUNDERPUNCH ; MT27 (Goldenrod City)
	db TRICK        ; MT28 (Battle Tower)
	db TRICK_ROOM   ; MT29 (TODO)
	db ZAP_CANNON   ; MT30 (Power Plant)
	db DIZZY_PUNCH ; MT31 (Saffron City)
	assert_table_length NUM_TM_HM_TUTOR
; TODO: LeafStorm, Baton Pass, Charm, Trick Room
	db 0 ; end
