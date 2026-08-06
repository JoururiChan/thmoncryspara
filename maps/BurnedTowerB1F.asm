BurnedTowerB1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, BurnedTowerB1FLadderCallback

	def_warp_events
	warp_event 10,  9, BURNED_TOWER_1F, 3 ; hole
	warp_event  7, 15, BURNED_TOWER_1F, 4

	def_coord_events
	coord_event 10,  6, 0, ReleaseTheBeasts

	def_bg_events

	def_object_events
	tohomon_event  7,  3, SUIKA, SPRITEMOVEDATA_TOHOMON, -1, -1, PAL_NPC_BROWN, ClearText, EVENT_BURNED_TOWER_B1F_BEASTS_1
	tohomon_event 12,  3, YUUGI, SPRITEMOVEDATA_TOHOMON, -1, -1, PAL_NPC_RED, ClearText, EVENT_BURNED_TOWER_B1F_BEASTS_1
	tohomon_event 10,  4, KONGARA, SPRITEMOVEDATA_TOHOMON, -1, -1, PAL_NPC_BLUE, ClearText, EVENT_BURNED_TOWER_B1F_BEASTS_1
	tohomon_event  7,  3, SUIKA, SPRITEMOVEDATA_STILL, -1, -1, PAL_NPC_WHITE, ClearText, EVENT_BURNED_TOWER_B1F_BEASTS_2
	tohomon_event 12,  3, YUUGI, SPRITEMOVEDATA_STILL, -1, -1, PAL_NPC_WHITE, ClearText, EVENT_BURNED_TOWER_B1F_BEASTS_2
	tohomon_event 10,  4, KONGARA, SPRITEMOVEDATA_STILL, -1, -1, PAL_NPC_WHITE, ClearText, EVENT_BURNED_TOWER_B1F_BEASTS_2
	object_event 10, 12, SPRITE_EUSINE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BurnedTowerB1FEusine, EVENT_EUSINE_IN_BURNED_TOWER
	strengthboulder_event 17, 8
	tmhmball_event 16,  4, TM_FLAME_CHARGE, EVENT_BURNED_TOWER_B1F_TM_FLAME_CHARGE

	object_const_def
	const BURNEDTOWERB1F_SKOISHI1
	const BURNEDTOWERB1F_CNAZRIN1
	const BURNEDTOWERB1F_KASEN1
	const BURNEDTOWERB1F_SKOISHI2
	const BURNEDTOWERB1F_CNAZRIN2
	const BURNEDTOWERB1F_KASEN2
	const BURNEDTOWERB1F_EUSINE

BurnedTowerB1FLadderCallback:
	checkevent EVENT_RELEASED_THE_BEASTS
	iftruefwd .NoChange
	changeblock 6, 14, $2
.NoChange:
	endcallback

ReleaseTheBeasts:
	playmusic MUSIC_NONE
	pause 30
	appear BURNEDTOWERB1F_SKOISHI1
	turnobject PLAYER, UP
	pause 5
	disappear BURNEDTOWERB1F_SKOISHI2
	pause 15
	cry CNUE
	appear BURNEDTOWERB1F_CNAZRIN1
	turnobject PLAYER, UP
	pause 5
	disappear BURNEDTOWERB1F_CNAZRIN2
	pause 15
	cry NUE
	appear BURNEDTOWERB1F_KASEN1
	turnobject PLAYER, UP
	pause 5
	disappear BURNEDTOWERB1F_KASEN2
	pause 15
	cry SNUE
	pause 15
	playsound SFX_WARP_FROM
	turnobject PLAYER, LEFT
	applymovement BURNEDTOWERB1F_SKOISHI1, BurnedTowerSKoishiMovement
	disappear BURNEDTOWERB1F_SKOISHI1
	waitsfx
	playsound SFX_WARP_FROM
	turnobject PLAYER, RIGHT
	applymovement BURNEDTOWERB1F_CNAZRIN1, BurnedTowerCNazrinMovement
	disappear BURNEDTOWERB1F_CNAZRIN1
	waitsfx
	pause 15
	playsound SFX_WARP_FROM
	turnobject PLAYER, UP
	applymovement BURNEDTOWERB1F_KASEN1, BurnedTowerKasenMovement1
	playsound SFX_WARP_FROM
	turnobject PLAYER, DOWN
	applymovement BURNEDTOWERB1F_KASEN1, BurnedTowerKasenMovement2
	turnobject PLAYER, UP
	pause 20
	cry SNUE
	pause 30
	playsound SFX_WARP_FROM
	applymovement BURNEDTOWERB1F_KASEN1, BurnedTowerKasenMovement3
	turnobject PLAYER, DOWN
	disappear BURNEDTOWERB1F_KASEN1
	waitsfx
	special RestartMapMusic
	setscene $1
	setevent EVENT_RELEASED_THE_BEASTS
	special InitRoamMons
	setmapscene ECRUTEAK_GYM, $1
	setmapscene CIANWOOD_CITY, $1
	clearevent EVENT_SAW_KASEN_AT_CIANWOOD_CITY
	setevent EVENT_ECRUTEAK_GYM_GRAMPS
	clearevent EVENT_ECRUTEAK_CITY_GRAMPS
	setevent EVENT_BURNED_TOWER_MORTY
	setevent EVENT_BURNED_TOWER_1F_EUSINE
	appear BURNEDTOWERB1F_EUSINE
	reanchormap
	changeblock 6, 14, $1b
	refreshmap
	closetext
	setscene $1
	end

BurnedTowerB1FEusine:
	showtextfaceplayer BurnedTowerB1FEusineText
	readvar VAR_FACING
	ifequalfwd $1, .Movement
	applymovement BURNEDTOWERB1F_EUSINE, BurnedTowerB1FEusineMovement1
	sjumpfwd .Finish

.Movement:
	applymovement BURNEDTOWERB1F_EUSINE, BurnedTowerB1FEusineMovement2
.Finish:
	disappear BURNEDTOWERB1F_EUSINE
	playsound SFX_EXIT_BUILDING
	waitsfx
	end

BurnedTowerSKoishiMovement:
	fix_facing
	fast_jump_step_down
	fast_jump_step_left
	step_end

BurnedTowerCNazrinMovement:
	fix_facing
	fast_jump_step_right
	fast_jump_step_down
	fast_jump_step_right
	step_end

BurnedTowerKasenMovement1:
	fix_facing
	fast_jump_step_right
	fast_jump_step_down
	fast_jump_step_down
	fast_jump_step_left
	step_end

BurnedTowerKasenMovement2:
	fix_facing
	fast_jump_step_left
	fast_jump_step_up
	run_step_up
	fast_jump_step_right
	step_end

BurnedTowerKasenMovement3:
	fix_facing
	run_step_up
	fast_jump_step_right
	fast_jump_step_down
	fast_jump_step_down
	fast_jump_step_down
	fast_jump_step_down
	step_end

BurnedTowerB1FEusineMovement2:
	step_left
	step_left
	step_down
	step_down
	step_left
	step_down
	step_end

BurnedTowerB1FEusineMovement1:
	step_down
	step_left
	step_left
	step_left
	step_down
	step_down
	step_end

BurnedTowerB1FEusineText:
	text "Eusine: I dug a"
	line "hole here, too…"

	para "I was shocked!"

	para "Kasen raced by"
	line "like a blur, right"

	para "in front of my"
	line "eyes!"

	para "For ten years I"
	line "chased Kasen,"

	para "and I finally got"
	line "to see it."

	para "I'm all choked up!"

	para "<PLAYER>, I owe"
	line "this all to you!"

	para "Thank you!"

	para "I heard that the"
	line "legendary #mon"

	para "of Ecruteak test"
	line "chosen humans by"

	para "allowing them to"
	line "get close."

	para "I'm going to track"
	line "Kasen."

	para "<PLAYER>, let's"
	line "meet again!"

	para "Farewell!"
	done
