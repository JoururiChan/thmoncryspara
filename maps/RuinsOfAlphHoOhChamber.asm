RuinsOfAlphHoOhChamber_MapScriptHeader:
	def_scene_scripts
	scene_script RuinsofAlphCIchirinChamberTrigger0

	def_callbacks
	callback MAPCALLBACK_TILES, RuinsOfAlphHoOhChamberHiddenDoorsCallback

	def_warp_events
	warp_event  3,  9, RUINS_OF_ALPH_OUTSIDE, 1
	warp_event  4,  9, RUINS_OF_ALPH_OUTSIDE, 1
	warp_event  3,  3, RUINS_OF_ALPH_INNER_CHAMBER, 2
	warp_event  4,  3, RUINS_OF_ALPH_INNER_CHAMBER, 3
	warp_event  4,  0, RUINS_OF_ALPH_CICHIRIN_ITEM_ROOM, 1

	def_coord_events

	def_bg_events
	bg_event  2,  3, BGEVENT_JUMPTEXT, RuinsofAlphStatueText
	bg_event  5,  3, BGEVENT_JUMPTEXT, RuinsofAlphStatueText
	bg_event  3,  2, BGEVENT_UP, MapRuinsofAlphCIchirinChamberSignpost2Script
	bg_event  4,  2, BGEVENT_UP, MapRuinsofAlphCIchirinChamberSignpost3Script
	bg_event  3,  0, BGEVENT_UP, MapRuinsofAlphCIchirinChamberSignpost4Script
	bg_event  4,  0, BGEVENT_UP, MapRuinsofAlphCIchirinChamberSignpost5Script

	def_object_events

RuinsofAlphCIchirinChamberTrigger0:
	special SpecialCIchirinChamber
	checkevent EVENT_WALL_OPENED_IN_CICHIRIN_CHAMBER
	iffalsefwd .End
	sdefer RuinsOfAlphHoOhChamberWallOpenScript
.End
	end

RuinsOfAlphHoOhChamberHiddenDoorsCallback:
	checkevent EVENT_WALL_OPENED_IN_CICHIRIN_CHAMBER
	iftruefwd .WallOpen
	changeblock 4, 0, $24
.WallOpen:
	checkevent EVENT_SOLVED_CICHIRIN_PUZZLE
	iffalsefwd .FloorClosed
	endcallback

.FloorClosed:
	changeblock 2, 2, $1
	changeblock 4, 2, $2
	endcallback

RuinsOfAlphHoOhChamberWallOpenScript:
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

MapRuinsofAlphCIchirinChamberSignpost2Script:
	reanchormap
	setval $3
	special Special_CNuePuzzle
	closetext
	iftruefwd .PuzzleComplete
	end

.PuzzleComplete:
	setevent EVENT_RUINS_OF_ALPH_INNER_CHAMBER_TOURISTS
	setevent EVENT_SOLVED_CICHIRIN_PUZZLE
	setflag ENGINE_UNLOCKED_CNUES_X_TO_QUESTION
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

MapRuinsofAlphCIchirinChamberSignpost3Script:
	opentext
	cnuetypeface
	writetext RuinsOfAlphHoOhChamberDescriptionText
	waitbutton
	closetext
	restoretypeface
	special RefreshSprites
	end

MapRuinsofAlphCIchirinChamberSignpost5Script:
	checkevent EVENT_WALL_OPENED_IN_CICHIRIN_CHAMBER
	iftrue_jumptext RuinsOfAlphAYuyukoChamberWallHoleText
MapRuinsofAlphCIchirinChamberSignpost4Script:
	opentext
	checkevent EVENT_RUINS_OF_ALPH_OUTSIDE_TOURIST_YOUNGSTERS
	iftruefwd .unsolved
	writetext RuinsOfAlphChambersItsCNueText
	sjumpfwd .cnuewords
.unsolved
	writetext RuinsOfAlphAYuyukoChamberWallPatternLeftText
.cnuewords
	setval $3
	special Special_DisplayCNueWords
	endtext

RuinsOfAlphHoOhChamberDescriptionText:
	text "A #mon that"
	line "flew gracefully on"

	para "rainbow-colored"
	line "wings."
	done
