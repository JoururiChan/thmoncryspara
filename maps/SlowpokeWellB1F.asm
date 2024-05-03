ELuizeWellB1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 17, 15, ELUIZE_WELL_ENTRANCE, 2
	warp_event  7, 11, ELUIZE_WELL_B2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  2, SPRITE_PROTON, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerProton2, EVENT_ELUIZE_WELL_ROCKETS
	object_event 15,  7, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerGruntM29, EVENT_ELUIZE_WELL_ROCKETS
	object_event  5,  6, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerGruntM2, EVENT_ELUIZE_WELL_ROCKETS
	object_event 10,  4, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerGruntF1, EVENT_ELUIZE_WELL_ROCKETS
	object_event  0, 17, SPRITE_KURT, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_COMMAND, end, NULL, EVENT_ELUIZE_WELL_KURT
	object_event  7,  4, SPRITE_ELUIZETAIL, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ELuizeWellB1FELuizeWithMailScript, EVENT_ELUIZE_WELL_ELUIZES
	object_event  6,  2, SPRITE_ELUIZETAIL, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ELuizeWellB1FTaillessELuizeScript, EVENT_ELUIZE_WELL_ELUIZES
	strengthboulder_event  3, 2
	itemball_event 10,  3, SUPER_POTION, 1, EVENT_ELUIZE_WELL_B1F_SUPER_POTION

	object_const_def
	const ELUIZEWELLB1F_PROTON
	const ELUIZEWELLB1F_ROCKET1
	const ELUIZEWELLB1F_ROCKET2
	const ELUIZEWELLB1F_ROCKET_GIRL
	const ELUIZEWELLB1F_KURT

GenericTrainerGruntM29:
	generictrainer GRUNTM, 29, EVENT_BEAT_ROCKET_GRUNTM_29, GruntM29SeenText, GruntM29BeatenText

	text "Sure, we've been"
	line "hacking the tails"

	para "off ELuize and"
	line "selling them."

	para "Everything we do"
	line "is for profit."

	para "That's right!"
	line "We're Team Rocket,"

	para "and we'll do any-"
	line "thing for money!"
	done

TrainerProton2:
	trainer PROTON, PROTON2, EVENT_BEAT_PROTON_2, Proton2SeenText, Proton2BeatenText, 0, Proton2Script

Proton2Script:
	showtext TrainerProton2WhenTalkText
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	disappear ELUIZEWELLB1F_PROTON
	disappear ELUIZEWELLB1F_ROCKET1
	disappear ELUIZEWELLB1F_ROCKET2
	disappear ELUIZEWELLB1F_ROCKET_GIRL
	pause 15
	special Special_FadeInQuickly
	disappear ELUIZEWELLB1F_KURT
	moveobject ELUIZEWELLB1F_KURT, 11, 6
	appear ELUIZEWELLB1F_KURT
	applymovement ELUIZEWELLB1F_KURT, KurtELuizeWellVictoryMovementData
	turnobject PLAYER, RIGHT
	showtext KurtLeaveELuizeWellText
	setevent EVENT_CLEARED_ELUIZE_WELL
	setmapscene ILEX_FOREST, $2
	clearevent EVENT_ILEX_FOREST_APPRENTICE
	clearevent EVENT_ILEX_FOREST_FARFETCHD
	setevent EVENT_CHARCOAL_KILN_CMAI
	setevent EVENT_CHARCOAL_KILN_APPRENTICE
	setevent EVENT_ELUIZE_WELL_ELUIZES
	setevent EVENT_ELUIZE_WELL_KURT
	clearevent EVENT_AZALEA_TOWN_ELUIZES
	clearevent EVENT_KURTS_HOUSE_ELUIZE
	clearevent EVENT_KURTS_HOUSE_KURT_1
	special FadeOutPalettes
	special HealParty
	pause 15
	warp KURTS_HOUSE, 3, 3
	end

GenericTrainerGruntM2:
	generictrainer GRUNTM, 2, EVENT_BEAT_ROCKET_GRUNTM_2, GruntM2SeenText, GruntM2BeatenText

	text "We need the money,"
	line "but selling Slow-"
	cont "pokeTails?"

	para "It's tough being a"
	line "Rocket Grunt!"
	done

GenericTrainerGruntF1:
	generictrainer GRUNTF, 1, EVENT_BEAT_ROCKET_GRUNTF_1, GruntF1SeenText, GruntF1BeatenText

	text "ELuizeTails"
	line "grow back fast!"

	para "What's wrong with"
	line "selling them?"
	done

ELuizeWellB1FELuizeWithMailScript:
	faceplayer
	opentext
	cry ELUIZE
	writetext ELuizeWellB1FELuizeWithMailText
	yesorno
	iftrue_jumpopenedtext ELuizeWellB1FELuizeMailText
	endtext

ELuizeWellB1FTaillessELuizeScript:
	showcrytext ELuizeWellB1FTaillessELuizeText, ELUIZE
	end

KurtELuizeWellVictoryMovementData:
	step_left
	step_left
	step_left
	step_left
	step_up
	step_sleep_8
	step_sleep_8
	step_sleep_8
	step_left
	step_up
	step_up
	step_sleep_8
	step_sleep_8
	step_sleep_8
	turn_head_left
	step_end

KurtLeaveELuizeWellText:
	text "Kurt: Way to go,"
	line "<PLAYER>!"

	para "Team Rocket has"
	line "taken off."

	para "My back's better"
	line "too. Let's get out"
	cont "of here."
	done

GruntM29SeenText:
	text "Darn! I was stand-"
	line "ing guard up top"

	para "when some old coot"
	line "yelled at me."

	para "He startled me so"
	line "much that I fell"
	cont "down here."

	para "I think I'll vent"
	line "my anger by taking"
	cont "it out on you!"
	done

GruntM29BeatenText:
	text "Arrgh! This is NOT"
	line "my day!"
	done

Proton2SeenText:
	text "What do you want?"

	para "I'm known as the"
	line "scariest and"

	para "cruelest guy in"
	line "Team Rocket…"

	para "If you interrupt"
	line "our work, don't"
	cont "expect any mercy!"
	done

Proton2BeatenText:
	text "You did OK today,"
	line "but wait till next"
	cont "time!"
	done

TrainerProton2WhenTalkText:
	text "Yeah, Team Rocket"
	line "was broken up"
	cont "three years ago."

	para "But we continued"
	line "our activities"
	cont "underground."

	para "Now you can have"
	line "fun watching us"
	cont "stir up trouble!"
	done

GruntM2SeenText:
	text "Quit taking Slow-"
	line "pokeTails?"

	para "If we obeyed you,"
	line "Team Rocket's rep"
	cont "would be ruined!"
	done

GruntM2BeatenText:
	text "Just…"
	line "Too strong…"
	done

GruntF1SeenText:
	text "Stop taking Tails?"

	para "Yeah, just try to"
	line "defeat all of us!"
	done

GruntF1BeatenText:
	text "You rotten brat!"
	done

ELuizeWellB1FELuizeWithMailText:
	text "A ELuize with"
	line "its tail cut off…"

	para "Huh? It has Mail."
	line "Read it?"
	done

ELuizeWellB1FELuizeMailText:
	text "<PLAYER> read the"
	line "Mail."

	para "Be good and look"
	line "after the house"

	para "with Grandpa and"
	line "ELuize."

	para "Love, Dad"
	done

ELuizeWellB1FTaillessELuizeText:
	text "A ELuize with"
	line "its tail cut off…"
	done
