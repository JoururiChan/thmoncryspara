RuinsOfAlphSinjohChamber_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  5,  9, RUINS_OF_ALPH_OUTSIDE, 12
	warp_event  4,  9, RUINS_OF_ALPH_OUTSIDE, 12

	def_coord_events

	def_bg_events
	bg_event  5,  2, BGEVENT_UP, RuinsofAlphSinjohChamberSignpost
	bg_event  4,  3, BGEVENT_JUMPTEXT, RuinsofAlphStatueText
	bg_event  6,  3, BGEVENT_JUMPTEXT, RuinsofAlphStatueText

	def_object_events
	object_event  3,  1, SPRITE_WII, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_MYSTRI_CNUE_W
	object_event  7,  1, SPRITE_GAMECUBE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_MYSTRI_CNUE_A
	object_event  3,  5, SPRITE_GOLD_TROPHY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_MYSTRI_CNUE_R
	object_event  7,  5, SPRITE_SILVER_TROPHY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_MYSTRI_CNUE_P

	object_const_def
	const RUINSOFALPHSINJOHCHAMBER_CNUE_W
	const RUINSOFALPHSINJOHCHAMBER_CNUE_A
	const RUINSOFALPHSINJOHCHAMBER_CNUE_R
	const RUINSOFALPHSINJOHCHAMBER_CNUE_P

RuinsofAlphSinjohChamberSignpost:
	opentext
	cnuetypeface
	writetext RuinsofAlphSinjohChamberMystriText
	waitbutton
	closetext
	restoretypeface
	showtext RuinsofAlphSinjohChamberSurpriseText
	special Special_FadeOutMusic
	pause 30
	playsound SFX_INTRO_CNUE_3
	appear RUINSOFALPHSINJOHCHAMBER_CNUE_W
	turnobject RUINSOFALPHSINJOHCHAMBER_CNUE_W, LEFT
	waitsfx
	pause 7
	playsound SFX_INTRO_CNUE_2
	appear RUINSOFALPHSINJOHCHAMBER_CNUE_A
	turnobject RUINSOFALPHSINJOHCHAMBER_CNUE_A, LEFT
	waitsfx
	pause 7
	playsound SFX_INTRO_CNUE_1
	appear RUINSOFALPHSINJOHCHAMBER_CNUE_R
	turnobject RUINSOFALPHSINJOHCHAMBER_CNUE_R, LEFT
	waitsfx
	pause 7
	playsound SFX_INTRO_CNUE_2
	appear RUINSOFALPHSINJOHCHAMBER_CNUE_P
	turnobject RUINSOFALPHSINJOHCHAMBER_CNUE_P, LEFT
	waitsfx
	pause 7
	; Call assembly so the fourth sound will play
	callasm .PlayCNueSound3 ; playsound SFX_INTRO_CNUE_3
	turnobject RUINSOFALPHSINJOHCHAMBER_CNUE_W, UP
	pause 10
	callasm .PlayCNueSound2 ; playsound SFX_INTRO_CNUE_2
	turnobject RUINSOFALPHSINJOHCHAMBER_CNUE_A, UP
	pause 10
	callasm .PlayCNueSound1 ; playsound SFX_INTRO_CNUE_1
	turnobject RUINSOFALPHSINJOHCHAMBER_CNUE_R, UP
	pause 10
	callasm .PlayCNueSound2 ; playsound SFX_INTRO_CNUE_2
	turnobject RUINSOFALPHSINJOHCHAMBER_CNUE_P, UP
	waitsfx
	pause 30
	showemote EMOTE_SHOCK, PLAYER, 15
	playsound SFX_WARP_TO
	applymovement PLAYER, MovementData_WarpToSinjohRuins
	waitsfx
	special FadeOutPalettes
	disappear RUINSOFALPHSINJOHCHAMBER_CNUE_W
	disappear RUINSOFALPHSINJOHCHAMBER_CNUE_A
	disappear RUINSOFALPHSINJOHCHAMBER_CNUE_R
	disappear RUINSOFALPHSINJOHCHAMBER_CNUE_P
	checkevent EVENT_LISTENED_TO_CYNTHIA_INTRO
	iftruefwd .HeardIntro
	setmapscene MYSTRI_STAGE, $1
	setevent EVENT_MYSTRI_STAGE_CYNTHIA
	setevent EVENT_MYSTRI_STAGE_EGG
.HeardIntro
	warp MYSTRI_STAGE, 6, 15
	end

.PlayCNueSound1:
	call SFXChannelsOff
	ld de, SFX_INTRO_CNUE_1
	jmp PlaySFX

.PlayCNueSound2:
	call SFXChannelsOff
	ld de, SFX_INTRO_CNUE_2
	jmp PlaySFX

.PlayCNueSound3:
	call SFXChannelsOff
	ld de, SFX_INTRO_CNUE_3
	jmp PlaySFX

MovementData_WarpToSinjohRuins:
	step_dig 32
	hide_object
	step_end

RuinsofAlphSinjohChamberMystriText:
	text "The lead enters"
	line "the Mystri Stage"
	cont "at last."
	done

RuinsofAlphSinjohChamberSurpriseText: ; text > text
	text "…!"
	done
