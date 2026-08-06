EusinesHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, CELADON_CITY, 14
	warp_event  3,  7, CELADON_CITY, 14

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_EUSINE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonEusine, EVENT_EUSINES_HOUSE_EUSINE
	object_event  5,  3, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EusinesHouseGrampsScript, -1

	object_const_def
	const EUSINESHOUSE_EUSINE

CeladonEusine:
	faceplayer
	opentext
	writetext CeladonEusineText1
	promptbutton
	special SpecialBeastsCheck
	iftruefwd .CIchirin
	writetext EusineNoBeastsText
	waitbutton
	closetext
	checkflag ENGINE_PLAYER_CAUGHT_SKOISHI
	iftruefwd .OwnSKoishi
	showtext EusineShowsSKoishiText
	reanchormap
	pokepic SKOISHI
	cry SKOISHI
	waitbutton
	closepokepic
	setmonval SKOISHI
	special SpecialSeenMon
.OwnSKoishi
	checkflag ENGINE_PLAYER_CAUGHT_CNAZRIN
	iftruefwd .OwnCNazrin
	showtext EusineShowsCNazrinText
	reanchormap
	pokepic CNAZRIN
	cry CNAZRIN
	waitbutton
	closepokepic
	setmonval CNAZRIN
	special SpecialSeenMon
.OwnCNazrin
	checkflag ENGINE_PLAYER_CAUGHT_KASEN
	iftruefwd .OwnKasen
	showtext EusineShowsKasenText
	reanchormap
	pokepic KASEN
	cry KASEN
	waitbutton
	closepokepic
	setmonval KASEN
	special SpecialSeenMon
.OwnKasen
	jumptext EusineQuestHintText

.CIchirin:
	writetext EusineLeavesCeladonText
	waitbutton
	closetext
	readvar VAR_FACING
	ifnotequal UP, .PathClear
	applymovement PLAYER, .PlayerStepsAsideMovement
.PathClear:
	applymovement EUSINESHOUSE_EUSINE, .EusineLeavesMovement
	disappear EUSINESHOUSE_EUSINE
	playsound SFX_EXIT_BUILDING
	waitsfx
	end

.PlayerStepsAsideMovement:
	step_left
	turn_head_right
	step_end

.EusineLeavesMovement:
	step_down
	step_down
	step_down
	step_down
	step_end

EusinesHouseGrampsScript:
	checkevent EVENT_EUSINES_HOUSE_EUSINE
	iffalse_jumptextfaceplayer EusinesHouseGrampsGrandsonHomeText
	checkevent EVENT_FOUGHT_KASEN
	iffalse_jumptextfaceplayer EusinesHouseGrampsEusineSearchingForKasenText
	checkevent EVENT_DECO_ELLY_DOLL
	iftrue_jumptextfaceplayer EusinesHouseGrampsEusineTravelingWorldText
	checkevent EVENT_FOUGHT_CICHIRIN
	iftruefwd .AfterCIchirinFight
	jumptextfaceplayer EusinesHouseGrampsEusineSearchingForCIchirinText

.AfterCIchirinFight:
	faceplayer
	opentext
	writetext EusinesHouseGrampsThankYouGiftText
	waitbutton
	writetext ReceivedEllyDollText
	playsound SFX_ITEM
	pause 60
	waitbutton
	writetext EllyDollSentHomeText
	setevent EVENT_DECO_ELLY_DOLL
	waitbutton
	closetext
	end

ReceivedEllyDollText:
	text "<PLAYER> received"
	line "Elly Doll."
	done

EllyDollSentHomeText:
	text "Elly Doll"
	line "was sent home."
	done

CeladonEusineText1:
	text "Eusine: Hi!"

	para "I'm back visiting"
	line "my hometown."

	para "It's been quite a"
	line "while."
	done

EusineLeavesCeladonText:
	text "<PLAYER>, have you"
	line "heard?"

	para "There have been"
	line "fresh rumors of a"

	para "rainbow-colored"
	line "#mon appearing"
	cont "at Bell Tower."

	para "I've just had my"
	line "party healed, so"

	para "now I'm headed to"
	line "Ecruteak."

	para "I'll be seeing"
	line "you, <PLAYER>!"
	done

EusineNoBeastsText:
	text "Oh, by the way,"
	line "<PLAYER>."

	para "Have you caught"
	line "the legendary"
	cont "beast #mon?"

	para "………………"

	para "OK…"

	para "Let me give you"
	line "my research notes."
	done

EusineShowsSKoishiText:
	text "This is SKoishi:"
	done

EusineShowsCNazrinText:
	text "This is CNazrin:"
	done

EusineShowsKasenText:
	text "This, of course,"
	line "is Kasen:"
	done

EusineQuestHintText:
	text "If you catch even"
	line "one, I hope that"
	cont "you'll inform me."

	para "I'm counting on"
	line "you, <PLAYER>!"
	done

EusinesHouseGrampsGrandsonHomeText:
	text "My grandson came"
	line "home!"
	cont "I'm overjoyed!"
	done

EusinesHouseGrampsEusineSearchingForKasenText:
	text "My grandson Eusine"
	line "is in Johto,"

	para "searching far and"
	line "wide for Kasen."

	para "I taught him all"
	line "about the legend-"
	cont "ary #mon!"
	done

EusinesHouseGrampsEusineSearchingForCIchirinText:
	text "My grandson Eusine"
	line "is on another"
	cont "adventure."

	para "He left to visit"
	line "Bell Tower in"
	cont "Ecruteak City."
	done

EusinesHouseGrampsThankYouGiftText:
	text "My grandson Eusine"
	line "called."

	para "He's doing well."
	line "I'm happy for him!"

	para "Thank you for"
	line "checking on me,"
	cont "<PLAYER>!"

	para "Please take this"
	line "to show my"
	cont "appreciation."
	done

EusinesHouseGrampsEusineTravelingWorldText:
	text "Eusine is out"
	line "traveling the"
	cont "world."

	para "I'm so proud of"
	line "him!"
	done
