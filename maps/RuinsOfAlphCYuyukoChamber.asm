RuinsOfAlphCYuyukoChamber_MapScriptHeader:
	def_scene_scripts
	scene_script RuinsofAlphCYuyukoChamberTrigger0

	def_callbacks
	callback MAPCALLBACK_TILES, RuinsofAlphCYuyukoChamberHiddenDoorsCallback

	def_warp_events
	warp_event  3,  9, RUINS_OF_ALPH_OUTSIDE, 2
	warp_event  4,  9, RUINS_OF_ALPH_OUTSIDE, 2
	warp_event  3,  3, RUINS_OF_ALPH_INNER_CHAMBER, 4
	warp_event  4,  3, RUINS_OF_ALPH_INNER_CHAMBER, 5
	warp_event  4,  0, RUINS_OF_ALPH_LUNASA_ITEM_ROOM, 1

	def_coord_events

	def_bg_events
	bg_event  2,  3, BGEVENT_JUMPTEXT, RuinsofAlphStatueText
	bg_event  5,  3, BGEVENT_JUMPTEXT, RuinsofAlphStatueText
	bg_event  3,  2, BGEVENT_UP, MapRuinsofAlphCYuyukoChamberSignpost2Script
	bg_event  4,  2, BGEVENT_UP, MapRuinsofAlphCYuyukoChamberSignpost3Script
	bg_event  3,  0, BGEVENT_UP, MapRuinsofAlphCYuyukoChamberSignpost4Script
	bg_event  4,  0, BGEVENT_UP, MapRuinsofAlphCYuyukoChamberSignpost5Script

	def_object_events
	object_event  5,  5, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, RuinsOfAlphCYuyukoChamberReceptionistText, EVENT_RUINS_OF_ALPH_CYUYUKO_CHAMBER_RECEPTIONIST
	object_event  3,  1, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphCYuyukoChamberScientistScript, -1

RuinsofAlphCYuyukoChamberTrigger0:
	checkevent EVENT_WALL_OPENED_IN_CYUYUKO_CHAMBER
	iffalsefwd .End
	sdefer RuinsofAlphCYuyukoChamberWallOpenScript
.End
	end

RuinsofAlphCYuyukoChamberHiddenDoorsCallback:
	checkevent EVENT_WALL_OPENED_IN_CYUYUKO_CHAMBER
	iftruefwd .WallOpen
	changeblock 4, 0, $24
.WallOpen:
	checkevent EVENT_SOLVED_LUNASA_PUZZLE
	iffalsefwd .FloorClosed
	endcallback

.FloorClosed:
	changeblock 2, 2, $1
	changeblock 4, 2, $2
	endcallback

RuinsofAlphCYuyukoChamberWallOpenScript:
	pause 30
	earthquake 30
	showemote EMOTE_SHOCK, PLAYER, 20
	pause 30
	playsound SFX_STRENGTH
	changeblock 4, 0, $25
	refreshmap
	earthquake 50
	setscene $1
	endtext

MapRuinsofAlphCYuyukoChamberSignpost2Script:
	reanchormap
	setval $0
	special Special_CNuePuzzle
	closetext
	iftruefwd .PuzzleComplete
	end

.PuzzleComplete:
	setevent EVENT_RUINS_OF_ALPH_INNER_CHAMBER_TOURISTS
	setevent EVENT_SOLVED_LUNASA_PUZZLE
	setflag ENGINE_UNLOCKED_CNUES_A_TO_J
	setevent EVENT_RUINS_OF_ALPH_CYUYUKO_CHAMBER_RECEPTIONIST
	setmapscene RUINS_OF_ALPH_INNER_CHAMBER, $1
	earthquake 30
	showemote EMOTE_SHOCK, PLAYER, 15
	changeblock 2, 2, $14
	changeblock 4, 2, $15
	refreshmap
	playsound SFX_STRENGTH
	earthquake 80
	applyonemovement PLAYER, skyfall_top
	playsound SFX_KINESIS
	waitsfx
	pause 20
	warpcheck
	end

RuinsOfAlphCYuyukoChamberScientistScript:
	readvar VAR_CNUECOUNT
	ifequalfwd NUM_CNUE, .AllCNueCaught
	checkevent EVENT_WALL_OPENED_IN_CYUYUKO_CHAMBER
	iftrue_jumptextfaceplayer RuinsOfAlphCYuyukoChamberScientistHoleText
	faceplayer
	opentext
	checkevent EVENT_SOLVED_LUNASA_PUZZLE
	iffalsefwd .PuzzleIncomplete
	writetext RuinsOfAlphCYuyukoChamberScientistTremorText
	promptbutton
.PuzzleIncomplete:
	writetext RuinsOfAlphCYuyukoChamberScientistCrypticText
	waitbutton
	closetext
	turnobject LAST_TALKED, UP
	end

.AllCNueCaught:
	jumptextfaceplayer RuinsOfAlphResearchCenterScientist1Text_GotAllCNue

MapRuinsofAlphCYuyukoChamberSignpost3Script:
	opentext
	cnuetypeface
	writetext RuinsOfAlphCYuyukoChamberDescriptionText
	waitbutton
	closetext
	restoretypeface
	special RefreshSprites
	end

MapRuinsofAlphCYuyukoChamberSignpost5Script:
	checkevent EVENT_WALL_OPENED_IN_CYUYUKO_CHAMBER
	iftrue_jumptext RuinsOfAlphAYuyukoChamberWallHoleText
MapRuinsofAlphCYuyukoChamberSignpost4Script:
	opentext
	checkevent EVENT_RUINS_OF_ALPH_OUTSIDE_TOURIST_YOUNGSTERS
	iftruefwd .unsolved
	writetext RuinsOfAlphChambersItsCNueText
	sjumpfwd .cnuewords
.unsolved
	writetext RuinsOfAlphAYuyukoChamberWallPatternLeftText
.cnuewords
	setval $0
	special Special_DisplayCNueWords
	endtext

RuinsOfAlphCYuyukoChamberReceptionistText:
	text "Welcome to this"
	line "chamber."

	para "There are sliding"
	line "panels that depict"

	para "a #mon drawn by"
	line "the ancients."

	para "Slide the panels"
	line "around to form the"
	cont "picture."

	para "To the right is a"
	line "description of the"
	cont "#mon."

	para "Scientists in the"
	line "back are examining"

	para "some newly found"
	line "patterns."
	done

RuinsOfAlphCYuyukoChamberScientistCrypticText:
	text "Recently, strange,"
	line "cryptic patterns"
	cont "have appeared."

	para "It's odd. They"
	line "weren't here a"
	cont "little while ago…"

	para "You should take a"
	line "look at the walls."
	done

RuinsOfAlphCYuyukoChamberScientistHoleText:
	text "Ah! Here's another"
	line "huge hole!"

	para "It's big enough to"
	line "go through!"
	done

RuinsOfAlphCYuyukoChamberScientistTremorText:
	text "That tremor was"
	line "pretty scary!"

	para "But I'm more"
	line "concerned about"
	cont "this wall here…"
	done

RuinsOfAlphCYuyukoChamberDescriptionText:
	text "A #mon that hid"
	line "on the sea floor."

	para "Eyes on its back"
	line "scanned the area."
	done
