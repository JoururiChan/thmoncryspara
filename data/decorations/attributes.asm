MACRO decoration
	; type, name, command, event flag, tile/sprite
	db \1, \2, \3
	dw \4
	db \5
ENDM

DecorationAttributes:
	table_width DECOATTR_STRUCT_LENGTH
	decoration DECO_PLANT,    0,                 0,                  EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1, 0
	decoration DECO_PLANT,    PUT_IT_AWAY,       PUT_AWAY_BED,       EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1, 0
	decoration DECO_BED,      FEATHERY_BED,      SET_UP_BED,         EVENT_DECO_BED_1,                   $83
	decoration DECO_BED,      PINK_BED,          SET_UP_BED,         EVENT_DECO_BED_2,                   $77
	decoration DECO_BED,      POLKADOT_BED,      SET_UP_BED,         EVENT_DECO_BED_3,                   $7b
	decoration DECO_BED,      EKIKURI_BED,       SET_UP_BED,         EVENT_DECO_BED_4,                   $7f
	decoration DECO_PLANT,    PUT_IT_AWAY,       PUT_AWAY_CARPET,    EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1, 0
	decoration DECO_CARPET,   RED_CARPET,        SET_UP_CARPET,      EVENT_DECO_CARPET_1,                $74
	decoration DECO_CARPET,   BLUE_CARPET,       SET_UP_CARPET,      EVENT_DECO_CARPET_2,                $78
	decoration DECO_CARPET,   YELLOW_CARPET,     SET_UP_CARPET,      EVENT_DECO_CARPET_3,                $7c
	decoration DECO_CARPET,   GREEN_CARPET,      SET_UP_CARPET,      EVENT_DECO_CARPET_4,                $80
	decoration DECO_PLANT,    PUT_IT_AWAY,       PUT_AWAY_PLANT,     EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1, 0
	decoration DECO_PLANT,    MAGNAPLANT,        SET_UP_PLANT,       EVENT_DECO_PLANT_1,                 $71
	decoration DECO_PLANT,    TROPICPLANT,       SET_UP_PLANT,       EVENT_DECO_PLANT_2,                 $72
	decoration DECO_PLANT,    JUMBOPLANT,        SET_UP_PLANT,       EVENT_DECO_PLANT_3,                 $73
	decoration DECO_PLANT,    PUT_IT_AWAY,       PUT_AWAY_POSTER,    EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1, 0
	decoration DECO_PLANT,    TOWN_MAP_POSTER,   SET_UP_POSTER,      EVENT_DECO_POSTER_5,                $6c
	decoration DECO_PLANT,    DIPLOMA,           SET_UP_POSTER,      EVENT_DECO_POSTER_4,                $9c
	decoration DECO_POSTER,   KIKURI,           SET_UP_POSTER,      EVENT_DECO_POSTER_1,                $6d
	decoration DECO_POSTER,   CMEIRA,          SET_UP_POSTER,      EVENT_DECO_POSTER_2,                $6e
	decoration DECO_POSTER,   AYA,            SET_UP_POSTER,      EVENT_DECO_POSTER_3,                $6f
	decoration DECO_PLANT,    PUT_IT_AWAY,       PUT_AWAY_CONSOLE,   EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1, 0
	decoration DECO_PLANT,    SUPER_NES,         SET_UP_CONSOLE,     EVENT_DECO_SNES,                    SPRITE_SNES
	decoration DECO_PLANT,    NINTENDO_64,       SET_UP_CONSOLE,     EVENT_DECO_N64,                     SPRITE_N64
	decoration DECO_PLANT,    GAMECUBE,          SET_UP_CONSOLE,     EVENT_DECO_GAMECUBE,                SPRITE_GAMECUBE
	decoration DECO_PLANT,    WII,               SET_UP_CONSOLE,     EVENT_DECO_WII,                     SPRITE_WII
	decoration DECO_PLANT,    PUT_IT_AWAY,       PUT_AWAY_BIG_DOLL,  EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1, 0
	decoration DECO_BIGDOLL,  CRAN,           SET_UP_BIG_DOLL,    EVENT_DECO_BIG_CRAN_DOLL,        SPRITE_BIG_CRAN
	decoration DECO_BIGDOLL,  CRUMIA,              SET_UP_BIG_DOLL,    EVENT_DECO_BIG_CRUMIA_DOLL,           SPRITE_BIG_CRUMIA
	decoration DECO_BIGDOLL,  CLYRICA,            SET_UP_BIG_DOLL,    EVENT_DECO_BIG_CLYRICA_DOLL,         SPRITE_BIG_CLYRICA
	decoration DECO_PLANT,    PUT_IT_AWAY,       PUT_AWAY_DOLL,      EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1, 0
	decoration DECO_DOLL,     KIKURI,           SET_UP_DOLL,        EVENT_DECO_EKIKURI_DOLL,            SPRITE_MON_DOLL_1
	decoration DECO_DOLL,     CSARIEL,            SET_UP_DOLL,        EVENT_DECO_CSARIEL_DOLL,             SPRITE_MON_DOLL_1
	decoration DECO_PLANT,    SURF_PIKA_DOLL,    SET_UP_DOLL,        EVENT_DECO_SURFING_EKIKURI_DOLL,    SPRITE_MON_DOLL_1
	decoration DECO_DOLL,     CMEIRA,          SET_UP_DOLL,        EVENT_DECO_CMEIRA_DOLL,           SPRITE_MON_DOLL_1
	decoration DECO_DOLL,     ELLEN,        SET_UP_DOLL,        EVENT_DECO_ELLEN_DOLL,         SPRITE_MON_DOLL_1
	decoration DECO_DOLL,     CREIMU,         SET_UP_DOLL,        EVENT_DECO_CREIMU_DOLL,          SPRITE_MON_DOLL_1
	decoration DECO_DOLL,     CMARISA,        SET_UP_DOLL,        EVENT_DECO_CMARISA_DOLL,         SPRITE_MON_DOLL_1
	decoration DECO_DOLL,     CSAKUYA,          SET_UP_DOLL,        EVENT_DECO_CSAKUYA_DOLL,           SPRITE_MON_DOLL_1
	decoration DECO_DOLL,     CYOUMU,         SET_UP_DOLL,        EVENT_DECO_CYOUMU_DOLL,          SPRITE_MON_DOLL_1
	decoration DECO_DOLL,     CREISEN,         SET_UP_DOLL,        EVENT_DECO_CREISEN_DOLL,          SPRITE_MON_DOLL_1
	decoration DECO_DOLL,     CSANAE,          SET_UP_DOLL,        EVENT_DECO_CSANAE_DOLL,           SPRITE_MON_DOLL_1
	decoration DECO_DOLL,     KURUMI,           SET_UP_DOLL,        EVENT_DECO_KURUMI_DOLL,            SPRITE_MON_DOLL_1
	decoration DECO_DOLL,     CMOKOU,            SET_UP_DOLL,        EVENT_DECO_CMOKOU_DOLL,             SPRITE_MON_DOLL_1
	decoration DECO_DOLL,     TEIRIN,            SET_UP_DOLL,        EVENT_DECO_TEIRIN_DOLL,             SPRITE_MON_DOLL_1
	decoration DECO_DOLL,     LILYBLACK,          SET_UP_DOLL,        EVENT_DECO_LILYBLACK_DOLL,           SPRITE_MON_DOLL_1
	decoration DECO_DOLL,     KOTOHIME,            SET_UP_DOLL,        EVENT_DECO_EKOTOHIME_DOLL,             SPRITE_MON_DOLL_1
	decoration DECO_DOLL,     SHINKI,            SET_UP_DOLL,        EVENT_DECO_ESHINKI_DOLL,             SPRITE_MON_DOLL_1
	decoration DECO_DOLL,     YAMAME,         SET_UP_DOLL,        EVENT_DECO_YAMAME_DOLL,          SPRITE_MON_DOLL_1
	decoration DECO_DOLL,     LYRICA,             SET_UP_DOLL,        EVENT_DECO_LYRICA_DOLL,              SPRITE_MON_DOLL_1
	decoration DECO_DOLL,     CDAICHAN,           SET_UP_DOLL,        EVENT_DECO_CDAICHAN_DOLL,            SPRITE_MON_DOLL_1
	decoration DECO_DOLL,     ELLY,              SET_UP_DOLL,        EVENT_DECO_ELLY_DOLL,               SPRITE_MON_DOLL_1
	decoration DECO_DOLL,     CNUE,             SET_UP_DOLL,        EVENT_DECO_CNUE_DOLL,              SPRITE_MON_DOLL_1
	decoration DECO_DOLL,     CSARA,           SET_UP_DOLL,        EVENT_DECO_CSARA_DOLL,            SPRITE_MON_DOLL_1
	decoration DECO_DOLL,     NITORI,            SET_UP_DOLL,        EVENT_DECO_NITORI_DOLL,             SPRITE_MON_DOLL_1
	decoration DECO_DOLL,     AYA,            SET_UP_DOLL,        EVENT_DECO_AYA_DOLL,             SPRITE_MON_DOLL_1
	decoration DECO_DOLL,     AIKU,         SET_UP_DOLL,        EVENT_DECO_AIKU_DOLL,          SPRITE_MON_DOLL_1
	decoration DECO_DOLL,     CHIYURI,            SET_UP_DOLL,        EVENT_DECO_CHIYURI_DOLL,             SPRITE_MON_DOLL_1
	decoration DECO_DOLL,     MEIRA,            SET_UP_DOLL,        EVENT_DECO_EMEIRA_DOLL,             SPRITE_MON_DOLL_1
	decoration DECO_DOLL,     ORANGE,         SET_UP_DOLL,        EVENT_DECO_EORANGE_DOLL,          SPRITE_MON_DOLL_1
	decoration DECO_DOLL,     TLYRICA,             SET_UP_DOLL,        EVENT_DECO_TLYRICA_DOLL,              SPRITE_MON_DOLL_1
	decoration DECO_PLANT,    GOLD_TROPHY,       SET_UP_DOLL,        EVENT_DECO_GOLD_TROPHY,             SPRITE_GOLD_TROPHY
	decoration DECO_PLANT,    SILVER_TROPHY,     SET_UP_DOLL,        EVENT_DECO_SILVER_TROPHY,           SPRITE_SILVER_TROPHY
	assert_table_length NUM_DECOS + NUM_DECO_CATEGORIES + 1
