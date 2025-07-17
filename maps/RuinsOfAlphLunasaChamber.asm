RuinsOfAlphLunasaChamber_MapScriptHeader:
	def_scene_scripts
	scene_script RuinsofAlphLunasaChamberTrigger0

	def_callbacks
	callback MAPCALLBACK_TILES, RuinsofAlphLunasaChamberHiddenDoorsCallback

	def_warp_events
	warp_event  3,  9, RUINS_OF_ALPH_OUTSIDE, 3
	warp_event  4,  9, RUINS_OF_ALPH_OUTSIDE, 3
	warp_event  3,  3, RUINS_OF_ALPH_INNER_CHAMBER, 6
	warp_event  4,  3, RUINS_OF_ALPH_INNER_CHAMBER, 7
	warp_event  4,  0, RUINS_OF_ALPH_LUNASA_ITEM_ROOM, 1

	def_coord_events

	def_bg_events
	bg_event  2,  3, BGEVENT_JUMPTEXT, RuinsofAlphStatueText
	bg_event  5,  3, BGEVENT_JUMPTEXT, RuinsofAlphStatueText
	bg_event  3,  2, BGEVENT_UP, MapRuinsofAlphLunasaChamberSignpost2Script
	bg_event  4,  2, BGEVENT_UP, MapRuinsofAlphLunasaChamberSignpost3Script
	bg_event  3,  0, BGEVENT_UP, MapRuinsofAlphLunasaChamberSignpost4Script
	bg_event  4,  0, BGEVENT_UP, MapRuinsofAlphLunasaChamberSignpost5Script

	def_object_events

RuinsofAlphLunasaChamberTrigger0:
	special SpecialLunasaChamber
	checkevent EVENT_WALL_OPENED_IN_LUNASA_CHAMBER
	iffalsefwd .End
	sdefer RuinsOfAlphLunasaChamberWallOpenScript
.End
	end

RuinsofAlphLunasaChamberHiddenDoorsCallback:
	checkevent EVENT_WALL_OPENED_IN_LUNASA_CHAMBER
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

RuinsOfAlphLunasaChamberWallOpenScript:
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

MapRuinsofAlphLunasaChamberSignpost2Script:
	reanchormap
	setval $1
	special Special_CNuePuzzle
	closetext
	iftruefwd .PuzzleComplete
	end

.PuzzleComplete:
	setevent EVENT_RUINS_OF_ALPH_INNER_CHAMBER_TOURISTS
	setevent EVENT_SOLVED_CYUYUKO_PUZZLE
	setflag ENGINE_UNLOCKED_CNUES_K_TO_Q
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

MapRuinsofAlphLunasaChamberSignpost3Script:
	opentext
	cnuetypeface
	writetext RuinsOfAlphLunasaChamberDescriptionText
	waitbutton
	closetext
	restoretypeface
	special RefreshSprites
	end

MapRuinsofAlphLunasaChamberSignpost5Script:
	checkevent EVENT_WALL_OPENED_IN_LUNASA_CHAMBER
	iftrue_jumptext RuinsOfAlphAYuyukoChamberWallHoleText
MapRuinsofAlphLunasaChamberSignpost4Script:
	opentext
	checkevent EVENT_RUINS_OF_ALPH_OUTSIDE_TOURIST_YOUNGSTERS
	iftruefwd .unsolved
	writetext RuinsOfAlphChambersItsCNueText
	sjumpfwd .cnuewords
.unsolved
	writetext RuinsOfAlphAYuyukoChamberWallPatternLeftText
.cnuewords
	setval $2
	special Special_DisplayCNueWords
	endtext

RuinsOfAlphLunasaChamberDescriptionText:
	text "This #mon"
	line "drifted in the"

	para "sea by twisting"
	line "its ten tentacles."
	done
