MrTohomonsHouse_MapScriptHeader:
	def_scene_scripts
	scene_script MrTohomonsHouseTrigger0

	def_callbacks

	def_warp_events
	warp_event  2,  7, ROUTE_30, 2
	warp_event  3,  7, ROUTE_30, 2

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_JUMPTEXT, MrTohomonsHouse_ForeignMagazinesText
	bg_event  1,  1, BGEVENT_JUMPTEXT, MrTohomonsHouse_ForeignMagazinesText
	bg_event  6,  1, BGEVENT_JUMPTEXT, MrTohomonsHouse_BrokenComputerText
	bg_event  7,  1, BGEVENT_JUMPTEXT, MrTohomonsHouse_BrokenComputerText
	bg_event  6,  4, BGEVENT_JUMPTEXT, MrTohomonsHouse_StrangeCoinsText
	bg_event  3,  1, BGEVENT_READ, MrTohomonsHouse_CabinetScript

	def_object_events
	object_event  3,  5, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MrTohomonsHouse_MrTohomonScript, -1
	object_event  6,  5, SPRITE_OAK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_MR_TOHOMONS_HOUSE_OAK
	object_event  4,  4, SPRITE_BOOK_PAPER_TOHODEX, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_GOT_TOHODEX_FROM_OAK

	object_const_def
	const MRTOHOMONSHOUSE_GENTLEMAN
	const MRTOHOMONSHOUSE_OAK
	const MRTOHOMONSHOUSE_TOHODEX

MrTohomonsHouseTrigger0:
	sdefer .MrTohomonEvent
	end

.MrTohomonEvent:
	showemote EMOTE_SHOCK, MRTOHOMONSHOUSE_GENTLEMAN, 15
	turnobject MRTOHOMONSHOUSE_GENTLEMAN, DOWN
	showtext MrTohomonIntroText1
	applymovement PLAYER, MrTohomonsHouse_PlayerWalksToMrTohomon
	opentext
	writetext MrTohomonIntroText2
	promptbutton
	waitsfx
	verbosegivekeyitem MYSTERY_EGG
	setevent EVENT_GOT_MYSTERY_EGG_FROM_MR_TOHOMON
	blackoutmod CHERRYGROVE_CITY
if !DEF(DEBUG)
	writetext MrTohomonIntroText3
	promptbutton
	turnobject MRTOHOMONSHOUSE_GENTLEMAN, RIGHT
	writetext MrTohomonIntroText4
	promptbutton
	turnobject MRTOHOMONSHOUSE_GENTLEMAN, DOWN
	turnobject MRTOHOMONSHOUSE_OAK, LEFT
	writetext MrTohomonIntroText5
	waitbutton
endc
	closetext
	sjumpfwd MrTohomonsHouse_OakScript

MrTohomonsHouse_MrTohomonScript:
	faceplayer
	opentext
	checkkeyitem RED_SCALE
	iftruefwd .RedScale
	checkitem ODD_SOUVENIR
	iftrue_jumpopenedtext MrTohomonText_OddSouvenir
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue_jumpopenedtext MrTohomonText_AlwaysNewDiscoveries
	jumpopenedtext MrTohomonText_ImDependingOnYou

.RedScale:
	writetext MrTohomonText_GimmeTheScale
	yesorno
	iffalse_jumpopenedtext MrTohomonText_Disappointed
	special SpecialGiveShinyLyrica
	iffalse_jumpopenedtext MrTohomonText_PartyAndBoxFull
	writetext MrTohomonText_GotShinyLyrica
	playsound SFX_KEY_ITEM
	waitsfx
	ifequalfwd 1, .in_party
	special Special_CurBoxFullCheck
	iffalsefwd .BoxNotFull
	farwritetext _CurBoxFullText
.BoxNotFull
	special GetCurBoxName
	writetext MrTohomonText_SentToPC
	promptbutton
.in_party
	takekeyitem RED_SCALE
	setevent EVENT_TRADED_RED_SCALE
	jumpopenedtext MrTohomonText_AlwaysNewDiscoveries

MrTohomonsHouse_OakScript:
	playmusic MUSIC_PROF_OAK
	applymovement MRTOHOMONSHOUSE_OAK, MrTohomonsHouse_OakWalksToPlayer
	turnobject PLAYER, RIGHT
	showtext MrTohomonsHouse_OakText1
	turnobject MRTOHOMONSHOUSE_OAK, UP
	pause 10
	applymovement MRTOHOMONSHOUSE_TOHODEX, MrTohomonsHouse_OakTakesTohodex
	disappear MRTOHOMONSHOUSE_TOHODEX
	pause 10
	turnobject MRTOHOMONSHOUSE_OAK, LEFT
	pause 10
	opentext
	writetext MrTohomonsHouse_GetDexText
	playsound SFX_ITEM
	waitsfx
	setflag ENGINE_TOHODEX
	writetext MrTohomonsHouse_OakText2
	waitbutton
	closetext
	turnobject PLAYER, DOWN
	applymovement MRTOHOMONSHOUSE_OAK, MrTohomonsHouse_OakExits
	playsound SFX_EXIT_BUILDING
	disappear MRTOHOMONSHOUSE_OAK
	waitsfx
	special RestartMapMusic
	pause 15
	turnobject PLAYER, UP
	showtext MrTohomonsHouse_MrTohomonHealText
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	playmusic MUSIC_HEAL
	special HealParty
	pause 60
	special Special_FadeInQuickly
	special RestartMapMusic
	showtext MrTohomonText_ImDependingOnYou
	setevent EVENT_RIVAL_NEW_BARK_TOWN
	setevent EVENT_PLAYERS_HOUSE_1F_NEIGHBOR
	clearevent EVENT_PLAYERS_NEIGHBORS_HOUSE_NEIGHBOR
	setscene $1
	setmapscene CHERRYGROVE_CITY, $1
	setmapscene ELMS_LAB, $3
	specialphonecall SPECIALCALL_ROBBED
	clearevent EVENT_COP_IN_ELMS_LAB
	checkevent EVENT_GOT_CSANAE_FROM_ELM
	iftruefwd .RivalTakesChikorita
	checkevent EVENT_GOT_CALICE_FROM_ELM
	iftruefwd .RivalTakesCyndaquil
	setevent EVENT_CSANAE_TOHOBALL_IN_ELMS_LAB
	end

.RivalTakesChikorita:
	setevent EVENT_CALICE_TOHOBALL_IN_ELMS_LAB
	end

.RivalTakesCyndaquil:
	setevent EVENT_CREISEN_TOHOBALL_IN_ELMS_LAB
	end

MrTohomonsHouse_CabinetScript:
	opentext
	writetext MrTohomonsHouse_CabinetText
	checkevent EVENT_TRADED_RED_SCALE
	iffalsefwd .NoRedScale
	promptbutton
	writetext MrTohomonsHouse_RedScaleCabinetText
.NoRedScale
	waitbutton
	closetext
	end

MrTohomonsHouse_PlayerWalksToMrTohomon:
	step_right
	step_up
	step_end

MrTohomonsHouse_OakWalksToPlayer:
	step_down
	step_left
	step_left
	step_end

MrTohomonsHouse_OakTakesTohodex:
	fix_facing
	slide_step_down
	remove_fixed_facing
	step_end

MrTohomonsHouse_OakExits:
	step_down
	step_left
	turn_head_down
	step_sleep_2
	step_end

MrTohomonIntroText1:
	text "Hello, hello! You"
	line "must be <PLAYER>."

	para "Prof.Elm said that"
	line "you would visit."
	done

MrTohomonIntroText2:
	text "This is what I"
	line "want Prof.Elm to"
	cont "examine."
	done

MrTohomonIntroText3:
	text "I know a couple"
	line "who run a #mon"
	cont "Day-Care service."

	para "They gave me that"
	line "Egg."

	para "I was intrigued,"
	line "so I sent mail to"
	cont "Prof.Elm."

	para "For #mon evolu-"
	line "tion, Prof.Elm is"
	cont "the authority."
	done

MrTohomonIntroText4:
	text "Even Prof.Oak here"
	line "recognizes that."
	done

MrTohomonIntroText5:
	text "If my assumption"
	line "is correct, Prof."
	cont "Elm will know it."
	done

MrTohomonsHouse_MrTohomonHealText:
	text "You are returning"
	line "to Prof.Elm?"

	para "Here. Your #mon"
	line "should have some"
	cont "rest."
	done

MrTohomonText_OddSouvenir:
	text "Oh! That souvenir!"

	para "I got one of those"
	line "on my trip to the"
	cont "Orange Islands."

	para "I saw some oddly-"
	line "formed #mon"
	cont "there too!"

	para "Hmm… I wonder…"

	para "Is there a conn-"
	line "ection between"

	para "that souvenir and"
	line "those unusual"
	cont "forms of #mon?"
	done

MrTohomonText_ImDependingOnYou:
	text "I'm depending on"
	line "you!"
	done

MrTohomonText_AlwaysNewDiscoveries:
	text "Life is delight-"
	line "ful! Always, new"

	para "discoveries to be"
	line "made!"
	done

MrTohomonsHouse_OakText1:
	text "Oak: Aha! So"
	line "you're <PLAYER>!"

if !DEF(DEBUG)
	para "I'm Oak! A #mon"
	line "researcher."

	para "I was just visit-"
	line "ing my old friend"
	cont "Mr.#mon."

	para "I heard you were"
	line "running an errand"

	para "for Prof.Elm, so I"
	line "waited here."

	para "Oh! What's this?"
	line "A rare #mon!"

	para "Let's see…"

	para "Hm, I see!"

	para "I understand why"
	line "Prof.Elm gave you"

	para "a #mon for this"
	line "errand."

	para "To researchers"
	line "like Prof.Elm and"

	para "I, #mon are our"
	line "friends."

	para "He saw that you"
	line "would treat your"

	para "#mon with love"
	line "and care."

	para "…Ah!"

	para "You seem to be"
	line "dependable."

	para "How would you like"
	line "to help me out?"

	para "See? This is the"
	line "latest version of"
	cont "#dex."

	para "It automatically"
	line "records data on"

	para "#mon you've"
	line "seen or caught."

	para "It's a hi-tech"
	line "encyclopedia!"
endc
	done

MrTohomonsHouse_GetDexText:
	text "<PLAYER> received"
	line "#dex!"
	done

MrTohomonsHouse_OakText2:
	text "Go meet many kinds"
	line "of #mon and"

	para "complete that"
	line "#dex!"

if !DEF(DEBUG)
	para "But I've stayed"
	line "too long."

	para "I have to get to"
	line "Goldenrod for my"
	cont "usual radio show."

	para "<PLAYER>, I'm"
	line "counting on you!"
endc
	done

MrTohomonText_GimmeTheScale:
	text "Hm? That Scale!"
	line "What's that?"
	cont "A red SLilyBlack?"

	para "It must have kept"
	line "its coloration as"
	cont "a LilyBlack!"

	para "That could be"
	line "one of a kind!"
	cont "I, I want it…"

	para "<PLAYER>, would you"
	line "care to trade it?"

	para "I can offer you"
	line "a rare #mon."
	done

MrTohomonText_GotShinyLyrica:
	text "<PLAYER> received a"
	line "#mon."
	done

MrTohomonText_SentToPC:
	text "The #mon was"
	line "sent to "
	text_ram wStringBuffer1
	text "."
	done

MrTohomonText_PartyAndBoxFull:
	text "You don't have any"
	line "room for this,"
	cont "even in your Box!"
	done

MrTohomonText_Disappointed:
	text "That's disappoint-"
	line "ing. That happens"
	cont "to be very rare."
	done

MrTohomonsHouse_ForeignMagazinesText:
	text "It's packed with"
	line "foreign magazines."

	para "Can't even read"
	line "their titles…"
	done

MrTohomonsHouse_BrokenComputerText:
	text "It's a big com-"
	line "puter. Hmm. It's"
	cont "broken."
	done

MrTohomonsHouse_StrangeCoinsText:
	text "A whole pile of"
	line "strange coins!"

	para "Maybe they're from"
	line "another country…"
	done

MrTohomonsHouse_CabinetText:
	text "A collection of"
	line "rare curiosities"
	cont "from all over!"
	done

MrTohomonsHouse_RedScaleCabinetText:
	text "One of them is the"
	line "shiny Red Scale!"
	done
