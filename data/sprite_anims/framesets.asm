SpriteAnimFrameData:
; entries correspond to SPRITE_ANIM_FRAMESET_* constants (see constants/sprite_anim_constants.asm)
	table_width 2
	dw .Frameset_00
	dw .Frameset_PartyMon
	dw .Frameset_PartyMonWithMail
	dw .Frameset_PartyMonWithItem
	dw .Frameset_PartyMonFast
	dw .Frameset_PartyMonWithMailFast
	dw .Frameset_PartyMonWithItemFast
	dw .Frameset_TextEntryCursor
	dw .Frameset_TextEntryCursorBig
	dw .Frameset_TextEntryCursorBlue
	dw .Frameset_TextEntryCursorBlueBig
	dw .Frameset_GameFreakLogo
	dw .Frameset_SlotsESara
	dw .Frameset_SlotsCRemilia
	dw .Frameset_SlotsCRemilia2
	dw .Frameset_SlotsEgg
	dw .Frameset_RedWalk
	dw .Frameset_StillCursor
	dw .Frameset_TradeTohoBall
	dw .Frameset_TradeTohoBallWobble
	dw .Frameset_TradePoof
	dw .Frameset_TradeTubeBulge
	dw .Frameset_TrademonIcon
	dw .Frameset_TrademonBubble
	dw .Frameset_EvolutionBallOfLight
	dw .Frameset_RadioTuningKnob
	dw .Frameset_MagnetTrain
	dw .Frameset_Leaf
	dw .Frameset_CutTree
	dw .Frameset_EggCrack
	dw .Frameset_EggHatch1
	dw .Frameset_EggHatch2
	dw .Frameset_EggHatch3
	dw .Frameset_EggHatch4
	dw .Frameset_HeadbuttTree
	dw .Frameset_BlueWalk
	dw .Frameset_IntroNazrin
	dw .Frameset_IntroNazrin2
	dw .Frameset_IntroTTei
	dw .Frameset_IntroCShizuha
	dw .Frameset_IntroCNue1
	dw .Frameset_IntroCNue2
	dw .Frameset_IntroCNue3
	dw .Frameset_IntroCNue4
	dw .Frameset_IntroCNueF2
	dw .Frameset_IntroNazrinAway
	dw .Frameset_IntroCNueF
	dw .Frameset_IchirinLeft
	dw .Frameset_IchirinRight
	dw .Frameset_MaxStatSparkle
	dw .Frameset_HyperTrainedStat
	dw .Frameset_PcCursor
	dw .Frameset_PcCursorItem
	dw .Frameset_PcQuick
	dw .Frameset_PcMode
	dw .Frameset_PcMode2
	dw .Frameset_PcPack
	dw .Frameset_DexCursor
	dw .Frameset_DexCNueCursor
	dw .Frameset_DexDLuize
	dw .Frameset_TownMapFly
	dw .Frameset_GreenWalk
	dw .Frameset_FlyMon
	assert_table_length NUM_SPRITE_ANIM_FRAMESETS

.Frameset_00:
	oamframe SPRITE_ANIM_OAMSET_PARTY_MON_1, 32
	oamend

.Frameset_PartyMon:
	oamframe SPRITE_ANIM_OAMSET_PARTY_MON_1,  8
	oamframe SPRITE_ANIM_OAMSET_PARTY_MON_2,  8
	oamrestart

.Frameset_PartyMonWithMail:
	oamframe SPRITE_ANIM_OAMSET_PARTY_MON_WITH_MAIL_1,  8
	oamframe SPRITE_ANIM_OAMSET_PARTY_MON_WITH_MAIL_2,  8
	oamrestart

.Frameset_PartyMonWithItem:
	oamframe SPRITE_ANIM_OAMSET_PARTY_MON_WITH_ITEM_1,  8
	oamframe SPRITE_ANIM_OAMSET_PARTY_MON_WITH_ITEM_2,  8
	oamrestart

.Frameset_PartyMonFast:
	oamframe SPRITE_ANIM_OAMSET_PARTY_MON_1,  4
	oamframe SPRITE_ANIM_OAMSET_PARTY_MON_2,  4
	oamrestart

.Frameset_PartyMonWithMailFast:
	oamframe SPRITE_ANIM_OAMSET_PARTY_MON_WITH_MAIL_1,  4
	oamframe SPRITE_ANIM_OAMSET_PARTY_MON_WITH_MAIL_2,  4
	oamrestart

.Frameset_PartyMonWithItemFast:
	oamframe SPRITE_ANIM_OAMSET_PARTY_MON_WITH_ITEM_1,  4
	oamframe SPRITE_ANIM_OAMSET_PARTY_MON_WITH_ITEM_2,  4
	oamrestart

.Frameset_RedWalk:
	oamframe SPRITE_ANIM_OAMSET_RED_WALK_1,  8
	oamframe SPRITE_ANIM_OAMSET_RED_WALK_2,  8
	oamframe SPRITE_ANIM_OAMSET_RED_WALK_1,  8
	oamframe SPRITE_ANIM_OAMSET_RED_WALK_2,  8, OAM_X_FLIP
	oamrestart

.Frameset_BlueWalk:
	oamframe SPRITE_ANIM_OAMSET_BLUE_WALK_1,  8
	oamframe SPRITE_ANIM_OAMSET_BLUE_WALK_2,  8
	oamframe SPRITE_ANIM_OAMSET_BLUE_WALK_1,  8
	oamframe SPRITE_ANIM_OAMSET_BLUE_WALK_2,  8, OAM_X_FLIP
	oamrestart

.Frameset_GreenWalk:
	oamframe SPRITE_ANIM_OAMSET_GREEN_WALK_1,  8
	oamframe SPRITE_ANIM_OAMSET_GREEN_WALK_2,  8
	oamframe SPRITE_ANIM_OAMSET_GREEN_WALK_1,  8
	oamframe SPRITE_ANIM_OAMSET_GREEN_WALK_2,  8, OAM_X_FLIP
	oamrestart

.Frameset_TextEntryCursor:
	oamframe SPRITE_ANIM_OAMSET_TEXT_ENTRY_CURSOR,  1
	dorepeat  1
	oamrestart

.Frameset_TextEntryCursorBig:
	oamframe SPRITE_ANIM_OAMSET_TEXT_ENTRY_CURSOR_BIG,  1
	dorepeat  1
	oamrestart

.Frameset_TextEntryCursorBlue:
	oamframe SPRITE_ANIM_OAMSET_TEXT_ENTRY_CURSOR_BLUE,  1
	dorepeat  1
	oamrestart

.Frameset_TextEntryCursorBlueBig:
	oamframe SPRITE_ANIM_OAMSET_TEXT_ENTRY_CURSOR_BLUE_BIG,  1
	dorepeat  1
	oamrestart

.Frameset_GameFreakLogo:
	oamframe SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_1, 12
	oamframe SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_2,  1
	oamframe SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_3,  1
	oamframe SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_2,  4
	oamframe SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_1, 12
	oamframe SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_2, 12
	oamframe SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_3,  4
	oamframe SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_4, 32
	oamframe SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_5,  3
	oamframe SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_6,  3
	oamframe SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_7,  4
	oamframe SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_8,  4
	oamframe SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_9,  4
	oamframe SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_10, 10
	oamframe SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_11,  7
	oamend

.Frameset_SlotsESara:
	oamframe SPRITE_ANIM_OAMSET_SLOTS_ESARA_1,  7
	oamframe SPRITE_ANIM_OAMSET_SLOTS_ESARA_2,  7
	oamframe SPRITE_ANIM_OAMSET_SLOTS_ESARA_1,  7, OAM_Y_FLIP
	oamframe SPRITE_ANIM_OAMSET_SLOTS_ESARA_2,  7, OAM_X_FLIP
	oamrestart

.Frameset_SlotsCRemilia:
	oamframe SPRITE_ANIM_OAMSET_SLOTS_CREMILIA_1,  7
	oamframe SPRITE_ANIM_OAMSET_SLOTS_CREMILIA_2,  7
	oamframe SPRITE_ANIM_OAMSET_SLOTS_CREMILIA_1,  7
	oamframe SPRITE_ANIM_OAMSET_SLOTS_CREMILIA_3,  7
	oamrestart

.Frameset_SlotsCRemilia2:
	oamframe SPRITE_ANIM_OAMSET_SLOTS_CREMILIA_1,  7
	oamframe SPRITE_ANIM_OAMSET_SLOTS_CREMILIA_4,  7
	oamframe SPRITE_ANIM_OAMSET_SLOTS_CREMILIA_5,  7
	oamframe SPRITE_ANIM_OAMSET_SLOTS_CREMILIA_4,  7
	oamframe SPRITE_ANIM_OAMSET_SLOTS_CREMILIA_1,  7
	oamend

.Frameset_SlotsEgg:
	oamframe SPRITE_ANIM_OAMSET_SLOTS_EGG, 20
	oamend

.Frameset_StillCursor:
	oamframe SPRITE_ANIM_OAMSET_STILL_CURSOR, 32
	oamend

.Frameset_TradeTohoBall:
	oamframe SPRITE_ANIM_OAMSET_TRADE_TOHO_BALL_1, 32
	oamend

.Frameset_TradeTohoBallWobble:
	oamframe SPRITE_ANIM_OAMSET_TRADE_TOHO_BALL_1,  3
	oamframe SPRITE_ANIM_OAMSET_TRADE_TOHO_BALL_2,  3
	oamframe SPRITE_ANIM_OAMSET_TRADE_TOHO_BALL_1,  3
	oamframe SPRITE_ANIM_OAMSET_TRADE_TOHO_BALL_2,  3, OAM_X_FLIP
	oamrestart

.Frameset_TradePoof:
	oamframe SPRITE_ANIM_OAMSET_TRADE_POOF_1,  4
	oamframe SPRITE_ANIM_OAMSET_TRADE_POOF_2,  4
	oamframe SPRITE_ANIM_OAMSET_TRADE_POOF_3,  4
	oamdelete

.Frameset_TradeTubeBulge:
	oamframe SPRITE_ANIM_OAMSET_TRADE_TUBE_BULGE_1,  3
	oamframe SPRITE_ANIM_OAMSET_TRADE_TUBE_BULGE_2,  3
	oamrestart

.Frameset_TrademonIcon:
	oamframe SPRITE_ANIM_OAMSET_TRADEMON_ICON_1,  7
	oamframe SPRITE_ANIM_OAMSET_TRADEMON_ICON_2,  7
	oamrestart

.Frameset_TrademonBubble:
	oamframe SPRITE_ANIM_OAMSET_TRADEMON_BUBBLE, 32
	oamend

.Frameset_EvolutionBallOfLight:
	oamframe SPRITE_ANIM_OAMSET_EVOLUTION_BALL_OF_LIGHT_2,  2
	oamframe SPRITE_ANIM_OAMSET_EVOLUTION_BALL_OF_LIGHT_1,  2
	oamframe SPRITE_ANIM_OAMSET_EVOLUTION_BALL_OF_LIGHT_2,  2
	oamend

.Frameset_RadioTuningKnob:
	oamframe SPRITE_ANIM_OAMSET_RADIO_TUNING_KNOB, 32
	oamend

.Frameset_MagnetTrain:
	oamframe SPRITE_ANIM_OAMSET_MAGNET_TRAIN_1,  8
	oamframe SPRITE_ANIM_OAMSET_MAGNET_TRAIN_2,  8
	oamframe SPRITE_ANIM_OAMSET_MAGNET_TRAIN_1,  8
	oamframe SPRITE_ANIM_OAMSET_MAGNET_TRAIN_2,  8, OAM_X_FLIP
	oamrestart

.Frameset_Leaf:
	oamframe SPRITE_ANIM_OAMSET_LEAF, 32
	oamend

.Frameset_CutTree:
	oamframe SPRITE_ANIM_OAMSET_TREE_1,  2
	oamframe SPRITE_ANIM_OAMSET_CUT_TREE_2, 16
	dorepeat  1
	oamframe SPRITE_ANIM_OAMSET_CUT_TREE_3,  1
	dorepeat  1
	oamframe SPRITE_ANIM_OAMSET_CUT_TREE_4,  1
	oamdelete

.Frameset_EggCrack:
	oamframe SPRITE_ANIM_OAMSET_EGG_CRACK, 32
	oamend

.Frameset_EggHatch1:
	oamframe SPRITE_ANIM_OAMSET_EGG_HATCH, 32
	oamend

.Frameset_EggHatch2:
	oamframe SPRITE_ANIM_OAMSET_EGG_HATCH, 32, OAM_X_FLIP
	oamend

.Frameset_EggHatch3:
	oamframe SPRITE_ANIM_OAMSET_EGG_HATCH, 32, OAM_Y_FLIP
	oamend

.Frameset_EggHatch4:
	oamframe SPRITE_ANIM_OAMSET_EGG_HATCH, 32, OAM_X_FLIP, OAM_Y_FLIP
	oamend

.Frameset_HeadbuttTree:
	oamframe SPRITE_ANIM_OAMSET_TREE_1,  2
	oamframe SPRITE_ANIM_OAMSET_HEADBUTT_TREE_2,  2
	oamframe SPRITE_ANIM_OAMSET_TREE_1,  2
	oamframe SPRITE_ANIM_OAMSET_HEADBUTT_TREE_3,  2
	oamrestart

.Frameset_IntroNazrin:
	oamframe SPRITE_ANIM_OAMSET_INTRO_NAZRIN_1,  3
	oamframe SPRITE_ANIM_OAMSET_INTRO_NAZRIN_2,  3
	oamframe SPRITE_ANIM_OAMSET_INTRO_NAZRIN_3,  3
	oamframe SPRITE_ANIM_OAMSET_INTRO_NAZRIN_4,  3
	oamrestart

.Frameset_IntroNazrin2:
	oamframe SPRITE_ANIM_OAMSET_INTRO_NAZRIN_4,  3
	oamframe SPRITE_ANIM_OAMSET_INTRO_NAZRIN_1,  7
	oamend

.Frameset_IntroTTei:
	oamframe SPRITE_ANIM_OAMSET_INTRO_TTEI_1, 32
	oamframe SPRITE_ANIM_OAMSET_INTRO_TTEI_2,  7
	oamframe SPRITE_ANIM_OAMSET_INTRO_TTEI_3,  7
	oamend

.Frameset_IntroCShizuha:
	oamframe SPRITE_ANIM_OAMSET_INTRO_CSHIZUHA,  3
	oamend

.Frameset_IntroCNue1:
	oamframe SPRITE_ANIM_OAMSET_INTRO_CNUE_1,  3
	oamframe SPRITE_ANIM_OAMSET_INTRO_CNUE_2,  3
	oamframe SPRITE_ANIM_OAMSET_INTRO_CNUE_3,  7
	oamdelete

.Frameset_IntroCNue2:
	oamframe SPRITE_ANIM_OAMSET_INTRO_CNUE_1,  3, OAM_X_FLIP
	oamframe SPRITE_ANIM_OAMSET_INTRO_CNUE_2,  3, OAM_X_FLIP
	oamframe SPRITE_ANIM_OAMSET_INTRO_CNUE_3,  7, OAM_X_FLIP
	oamdelete

.Frameset_IntroCNue3:
	oamframe SPRITE_ANIM_OAMSET_INTRO_CNUE_1,  3, OAM_Y_FLIP
	oamframe SPRITE_ANIM_OAMSET_INTRO_CNUE_2,  3, OAM_Y_FLIP
	oamframe SPRITE_ANIM_OAMSET_INTRO_CNUE_3,  7, OAM_Y_FLIP
	oamdelete

.Frameset_IntroCNue4:
	oamframe SPRITE_ANIM_OAMSET_INTRO_CNUE_1,  3, OAM_X_FLIP, OAM_Y_FLIP
	oamframe SPRITE_ANIM_OAMSET_INTRO_CNUE_2,  3, OAM_X_FLIP, OAM_Y_FLIP
	oamframe SPRITE_ANIM_OAMSET_INTRO_CNUE_3,  7, OAM_X_FLIP, OAM_Y_FLIP
	oamdelete

.Frameset_IntroCNueF2:
	oamframe SPRITE_ANIM_OAMSET_INTRO_CNUE_F_2_1,  3
	oamframe SPRITE_ANIM_OAMSET_INTRO_CNUE_F_2_2,  3
	oamframe SPRITE_ANIM_OAMSET_INTRO_CNUE_F_2_3,  3
	oamframe SPRITE_ANIM_OAMSET_INTRO_CNUE_F_2_4,  7
	oamframe SPRITE_ANIM_OAMSET_INTRO_CNUE_F_2_5,  7
	oamend

.Frameset_IntroNazrinAway:
	oamframe SPRITE_ANIM_OAMSET_INTRO_NAZRIN_AWAY,  3
	oamend

.Frameset_IntroCNueF:
	dorepeat 0
	oamend

.Frameset_IchirinLeft:
	oamframe SPRITE_ANIM_OAMSET_ICHIRIN_1,  8
	oamframe SPRITE_ANIM_OAMSET_ICHIRIN_2,  8
	oamend

.Frameset_IchirinRight:
	oamframe SPRITE_ANIM_OAMSET_ICHIRIN_1,  8, OAM_X_FLIP
	oamframe SPRITE_ANIM_OAMSET_ICHIRIN_2,  8, OAM_X_FLIP
	oamend

.Frameset_MaxStatSparkle:
	oamframe SPRITE_ANIM_OAMSET_MAX_STAT_SPARKLE, 32
	oamrestart

.Frameset_HyperTrainedStat:
	oamframe SPRITE_ANIM_OAMSET_HYPER_TRAINED_STAT, 32
	oamrestart

.Frameset_PcCursor:
	oamframe SPRITE_ANIM_OAMSET_PC_CURSOR, 32
	oamrestart

.Frameset_PcCursorItem:
	; Conditionally switched to when dealing with items
	oamframe SPRITE_ANIM_OAMSET_PC_CURSOR_ITEM, 32
	oamrestart

.Frameset_PcQuick:
	oamframe SPRITE_ANIM_OAMSET_PC_QUICK, 8
	oamdelete

.Frameset_PcMode:
	oamframe SPRITE_ANIM_OAMSET_PC_MODE, 32
	oamrestart

.Frameset_PcMode2:
	oamframe SPRITE_ANIM_OAMSET_PC_MODE2, 32
	oamrestart

.Frameset_PcPack:
	oamframe SPRITE_ANIM_OAMSET_PC_PACK, 32
	oamrestart

.Frameset_DexCursor:
	oamframe SPRITE_ANIM_OAMSET_DEX_CURSOR, 32
	oamrestart

.Frameset_DexCNueCursor:
	oamframe SPRITE_ANIM_OAMSET_DEX_CNUE_CURSOR, 32
	oamrestart

.Frameset_DexDLuize:
	oamframe SPRITE_ANIM_OAMSET_DEX_DLUIZE_1, 3
	oamframe SPRITE_ANIM_OAMSET_DEX_DLUIZE_2, 3
	oamframe SPRITE_ANIM_OAMSET_DEX_DLUIZE_3, 3
	oamframe SPRITE_ANIM_OAMSET_DEX_DLUIZE_4, 3
	oamframe SPRITE_ANIM_OAMSET_DEX_DLUIZE_5, 3
	oamrestart

.Frameset_TownMapFly:
	oamframe SPRITE_ANIM_OAMSET_TOWN_MAP_FLY, 32
	oamrestart

.Frameset_FlyMon:
	oamframe SPRITE_ANIM_OAMSET_FLY_MON_1,  8
	oamframe SPRITE_ANIM_OAMSET_FLY_MON_2,  8
	oamframe SPRITE_ANIM_OAMSET_FLY_MON_1,  8
	oamframe SPRITE_ANIM_OAMSET_FLY_MON_3,  8, OAM_X_FLIP
	oamrestart
