DarkCaveVioletEntrance_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  3, 15, ROUTE_31, 3
	warp_event 17,  1, DARK_CAVE_BLACKTHORN_ENTRANCE, 2
	warp_event 35, 33, ROUTE_46, 3

	def_coord_events
	coord_event  6,  2, 0, DarkCaveVioletEntranceFalknerTrigger

	def_bg_events
	bg_event 26,  3, BGEVENT_ITEM + ELIXIR, EVENT_DARK_CAVE_VIOLET_ENTRANCE_HIDDEN_ELIXIR

	def_object_events
	tohomon_event 10, 2, CTENSHI, SPRITEMOVEDATA_TOHOMON, -1, -1, PAL_NPC_BROWN, ClearText, EVENT_DARK_CAVE_SEIJA
	object_event  9,  2, SPRITE_EMIMA_SIDE, SPRITEMOVEDATA_TOHOMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_DARK_CAVE_CRIKAKO
	object_event  8,  2, SPRITE_FALKNER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_DARK_CAVE_FALKNER
	itemball_event  6,  8, POTION, 1, EVENT_DARK_CAVE_VIOLET_ENTRANCE_POTION
	smashrock_event 16, 14
	smashrock_event 27, 6
	smashrock_event  7, 14
	smashrock_event 36, 31
	itemball_event 36, 22, DUSK_STONE, 1, EVENT_DARK_CAVE_VIOLET_ENTRANCE_DUSK_STONE
	itemball_event 35,  9, HYPER_POTION, 1, EVENT_DARK_CAVE_VIOLET_ENTRANCE_HYPER_POTION
	itemball_event 30, 28, DIRE_HIT, 1, EVENT_DARK_CAVE_VIOLET_ENTRANCE_DIRE_HIT

	object_const_def
	const DARKCAVEVIOLETENTRANCE_CTENSHI
	const DARKCAVEVIOLETENTRANCE_CUTSUHO
	const DARKCAVEVIOLETENTRANCE_FALKNER

DarkCaveVioletEntranceFalknerTrigger:
	waitsfx
	checkdarkness
	iftruefwd .Darkness
	scall .BeatCTenshi
	showemote EMOTE_SHOCK, DARKCAVEVIOLETENTRANCE_FALKNER, 15
	opentext
	writetext DarkCaveVioletEntranceFalknerIntroText
.Finish:
	writetext DarkCaveVioletEntranceFalknerExplanationText
	waitbutton
	closetext
	follow PLAYER, DARKCAVEVIOLETENTRANCE_FALKNER
	applymovement PLAYER, DarkCaveVioletEntranceMovementData_PlayerStepAside
	stopfollow
	turnobject PLAYER, DOWN
	applymovement DARKCAVEVIOLETENTRANCE_FALKNER, DarkCaveVioletEntranceMovementData_FalknerLeave
	disappear DARKCAVEVIOLETENTRANCE_FALKNER
	pause 15
	clearevent EVENT_VIOLET_GYM_FALKNER
	setmapscene VIOLET_GYM, $1
	setscene $1
	end

.Darkness:
	checkevent EVENT_GOT_TM70_FLASH
	iftruefwd .ProgressAnyway
	showtext DarkCaveVioletEntranceFalknerDarknessText
	applyonemovement PLAYER, step_left
	end

.ProgressAnyway:
	showtext DarkCaveVioletEntranceFalknerProgressAnywayText
	scall .BeatCTenshi
	opentext
	writetext DarkCaveVioletEntranceFalknerDarkIntroText
	sjump .Finish

.BeatCTenshi:
	special SaveMusic
	playmusic MUSIC_JOHTO_TRAINER_BATTLE
	pause 40
	opentext
	writetext DarkCaveVioletEntranceFalknerAttackText
	pause 30
	closetext
	cry CUTSUHO
	waitsfx
	playsound SFX_TACKLE
	applymovement DARKCAVEVIOLETENTRANCE_CUTSUHO, DarkCaveVioletEntranceMovementData_CMimaAttack
	waitsfx
	pause 30
	cry CTENSHI
	pause 30
	disappear DARKCAVEVIOLETENTRANCE_CTENSHI
	pause 15
	special RestoreMusic
	opentext
	writetext DarkCaveVioletEntranceFalknerReturnText
	pause 30
	closetext
	disappear DARKCAVEVIOLETENTRANCE_CUTSUHO
	pause 20
	applyonemovement DARKCAVEVIOLETENTRANCE_FALKNER, step_left
	end

DarkCaveVioletEntranceMovementData_CMimaAttack:
	run_step_right
	run_step_left
	step_end

DarkCaveVioletEntranceMovementData_PlayerStepAside:
	step_left
	step_left
	step_left
	step_end

DarkCaveVioletEntranceMovementData_FalknerLeave:
	step_down
	step_left
	step_down
	step_down
	step_down
	step_down
	step_end

DarkCaveVioletEntranceFalknerAttackText:
	text "Falkner: Use Aer-"
	line "ial Ace, CUtsuho!"
	done

DarkCaveVioletEntranceFalknerReturnText:
	text "Good job,"
	line "CUtsuho."
	done

DarkCaveVioletEntranceFalknerIntroText:
	text "Oh! You must be"
	line "a trainer."
	prompt

DarkCaveVioletEntranceFalknerDarkIntroText:
	text "You must be brave"
	line "to come here in"
	cont "pitch darkness."
	prompt

DarkCaveVioletEntranceFalknerExplanationText:
	text "I'm Falkner, the"
	line "Violet #mon"
	cont "Gym Leader."

	para "I don't explore"
	line "caves for fun,"

	para "but that CTenshi"
	line "was attacking"

	para "trainers too weak"
	line "to defend them-"
	cont "selves."

	para "As a Gym Leader,"
	line "it's my job to"

	para "handle this sort"
	line "of situation."

	para "So you're here to"
	line "earn a badge?"

	para "Then meet me at"
	line "the Violet Gym."
	done

DarkCaveVioletEntranceFalknerDarknessText:
	text "Falkner: Is"
	line "someone there?"

	para "Don't come any"
	line "closer!"

	para "It's too dark, you"
	line "could get hurt."
	done

DarkCaveVioletEntranceFalknerProgressAnywayText:
	text "Falkner: Is"
	line "someone there?"

	para "It's reckless to"
	line "explore Dark Cave"
	cont "without any light!"

	para "I'm in the middle"
	line "of a battle, so"
	cont "stay back!"
	done
