RuinsOfAlphOmanyteChamber_MapScriptHeader:
	def_scene_scripts
	scene_script RuinsofAlphOmanyteChamberTrigger0

	def_callbacks
	callback MAPCALLBACK_TILES, RuinsofAlphOmanyteChamberHiddenDoorsCallback

	def_warp_events
	warp_event  3,  9, RUINS_OF_ALPH_OUTSIDE, 2
	warp_event  4,  9, RUINS_OF_ALPH_OUTSIDE, 2
	warp_event  3,  3, RUINS_OF_ALPH_INNER_CHAMBER, 4
	warp_event  4,  3, RUINS_OF_ALPH_INNER_CHAMBER, 5
	warp_event  4,  0, RUINS_OF_ALPH_CYUYUKO_ITEM_ROOM, 1

	def_coord_events

	def_bg_events
	bg_event  2,  3, BGEVENT_JUMPTEXT, RuinsofAlphStatueText
	bg_event  5,  3, BGEVENT_JUMPTEXT, RuinsofAlphStatueText
	bg_event  3,  2, BGEVENT_UP, MapRuinsofAlphOmanyteChamberSignpost2Script
	bg_event  4,  2, BGEVENT_UP, MapRuinsofAlphOmanyteChamberSignpost3Script
	bg_event  3,  0, BGEVENT_UP, MapRuinsofAlphOmanyteChamberSignpost4Script
	bg_event  4,  0, BGEVENT_UP, MapRuinsofAlphOmanyteChamberSignpost5Script

	def_object_events
	object_event  5,  5, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, RuinsOfAlphOmanyteChamberReceptionistText, EVENT_RUINS_OF_ALPH_CYUYUKO_CHAMBER_RECEPTIONIST
	object_event  3,  1, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphOmanyteChamberScientistScript, -1

RuinsofAlphOmanyteChamberTrigger0:
	checkevent EVENT_WALL_OPENED_IN_CYUYUKO_CHAMBER
	iffalsefwd .End
	sdefer RuinsofAlphOmanyteChamberWallOpenScript
.End
	end

RuinsofAlphOmanyteChamberHiddenDoorsCallback:
	checkevent EVENT_WALL_OPENED_IN_CYUYUKO_CHAMBER
	iftruefwd .WallOpen
	changeblock 4, 0, $24
.WallOpen:
	checkevent EVENT_SOLVED_CYUYUKO_PUZZLE
	iffalsefwd .FloorClosed
	endcallback

.FloorClosed:
	changeblock 2, 2, $1
	changeblock 4, 2, $2
	endcallback

RuinsofAlphOmanyteChamberWallOpenScript:
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

MapRuinsofAlphOmanyteChamberSignpost2Script:
	reanchormap
	setval $0
	special Special_HinaPuzzle
	closetext
	iftruefwd .PuzzleComplete
	end

.PuzzleComplete:
	setevent EVENT_RUINS_OF_ALPH_INNER_CHAMBER_TOURISTS
	setevent EVENT_SOLVED_CYUYUKO_PUZZLE
	setflag ENGINE_UNLOCKED_HINAS_A_TO_J
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

RuinsOfAlphOmanyteChamberScientistScript:
	readvar VAR_HINACOUNT
	ifequalfwd NUM_HINA, .AllHinaCaught
	checkevent EVENT_WALL_OPENED_IN_CYUYUKO_CHAMBER
	iftrue_jumptextfaceplayer RuinsOfAlphOmanyteChamberScientistHoleText
	faceplayer
	opentext
	checkevent EVENT_SOLVED_CYUYUKO_PUZZLE
	iffalsefwd .PuzzleIncomplete
	writetext RuinsOfAlphOmanyteChamberScientistTremorText
	promptbutton
.PuzzleIncomplete:
	writetext RuinsOfAlphOmanyteChamberScientistCrypticText
	waitbutton
	closetext
	turnobject LAST_TALKED, UP
	end

.AllHinaCaught:
	jumptextfaceplayer RuinsOfAlphResearchCenterScientist1Text_GotAllHina

MapRuinsofAlphOmanyteChamberSignpost3Script:
	opentext
	hinatypeface
	writetext RuinsOfAlphOmanyteChamberDescriptionText
	waitbutton
	closetext
	restoretypeface
	special RefreshSprites
	end

MapRuinsofAlphOmanyteChamberSignpost5Script:
	checkevent EVENT_WALL_OPENED_IN_CYUYUKO_CHAMBER
	iftrue_jumptext RuinsOfAlphAerodactylChamberWallHoleText
MapRuinsofAlphOmanyteChamberSignpost4Script:
	opentext
	checkevent EVENT_RUINS_OF_ALPH_OUTSIDE_TOURIST_YOUNGSTERS
	iftruefwd .unsolved
	writetext RuinsOfAlphChambersItsHinaText
	sjumpfwd .hinawords
.unsolved
	writetext RuinsOfAlphAerodactylChamberWallPatternLeftText
.hinawords
	setval $0
	special Special_DisplayHinaWords
	endtext

RuinsOfAlphOmanyteChamberReceptionistText:
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

RuinsOfAlphOmanyteChamberScientistCrypticText:
	text "Recently, strange,"
	line "cryptic patterns"
	cont "have appeared."

	para "It's odd. They"
	line "weren't here a"
	cont "little while ago…"

	para "You should take a"
	line "look at the walls."
	done

RuinsOfAlphOmanyteChamberScientistHoleText:
	text "Ah! Here's another"
	line "huge hole!"

	para "It's big enough to"
	line "go through!"
	done

RuinsOfAlphOmanyteChamberScientistTremorText:
	text "That tremor was"
	line "pretty scary!"

	para "But I'm more"
	line "concerned about"
	cont "this wall here…"
	done

RuinsOfAlphOmanyteChamberDescriptionText:
	text "A #mon that hid"
	line "on the sea floor."

	para "Eyes on its back"
	line "scanned the area."
	done
