PewterMuseumOfScience2F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  7,  7, PEWTER_MUSEUM_OF_SCIENCE_1F, 5

	def_coord_events

	def_bg_events
	bg_event  3,  6, BGEVENT_READ, Museum2FMoonStoneSignpostScript
	bg_event 11,  2, BGEVENT_JUMPTEXT, Museum2FSpaceShuttleSignpostText
	bg_event  0,  1, BGEVENT_READ, TohomonJournalStevenScript
	bg_event  1,  1, BGEVENT_READ, TohomonJournalStevenScript
	bg_event  4,  1, BGEVENT_READ, TohomonJournalCynthiaScript
	bg_event  5,  1, BGEVENT_READ, TohomonJournalCynthiaScript

	def_object_events
	object_event  7,  5, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_COMMAND, jumptextfaceplayer, Museum2FScientistText, -1
	object_event  1,  7, SPRITE_CHILD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, Museum2FChildText, -1
	object_event  2,  7, SPRITE_TOHOFAN_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, Museum2FTeacherText, -1
	object_event  2,  1, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, Museum2FLassText, -1
	object_event 12,  5, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Museum2FTohofanMScript, -1

Museum2FTohofanMScript:
	faceplayer
	opentext
	checkevent EVENT_LISTENED_TO_SEISMIC_TOSS_INTRO
	iftruefwd Museum2FTutorSeismicTossScript
	checkunits
	iftruefwd .metric
	writetext Museum2FTohofanMImperialText
	sjumpfwd .ok
.metric
	writetext Museum2FTohofanMMetricText
.ok
	waitbutton
	setevent EVENT_LISTENED_TO_SEISMIC_TOSS_INTRO
Museum2FTutorSeismicTossScript:
	writetext Text_Museum2FTutorSeismicToss
	waitbutton
	checkitem SILVER_LEAF
	iffalsefwd .NoSilverLeaf
	writetext Text_Museum2FTutorQuestion
	yesorno
	iffalsefwd .TutorRefused
	setval SEISMIC_TOSS
	writetext ClearText
	special Special_MoveTutor
	ifequalfwd $0, .TeachMove
.TutorRefused
	jumpopenedtext Text_Museum2FTutorRefused

.NoSilverLeaf
	jumpopenedtext Text_Museum2FTutorNoSilverLeaf

.TeachMove
	takeitem SILVER_LEAF
	jumpopenedtext Text_Museum2FTutorTaught

Museum2FMoonStoneSignpostScript:
	reanchormap
	trainerpic METEORITE
	waitbutton
	closepokepic
	jumptext Museum2FMoonStoneSignpostText

Museum2FScientistText:
	text "Meteorites struck"
	line "Mt.Moon near"
	cont "Pewter City."

	para "We have one"
	line "on display."

	para "It seems to emit"
	line "strange energy…"
	done


Museum2FLassText:
	text "#mon revived"
	line "from fossils are"

	para "all part Beast-"
	line "type."

	para "Were they always"
	line "that way, or is it"

	para "a result of the"
	line "fossilization"
	cont "process?"
	done

Museum2FTohofanMImperialText:
	text "This space shuttle"
	line "used to fly 160"

	para "miles above the"
	line "earth, defying"
	cont "gravity!"

	para "You know what else"
	line "can defy gravity?"

	para "Seismic Toss,"
	line "of course!"
	done

Museum2FChildText:
	text "Stuff and rocks"
	line "and rocks and"

	para "stuff. Can we go"
	line "already?"
	done

Museum2FTeacherText:
	text "Sigh… My son isn't"
	line "enjoying the mu-"

	para "seum as much as I"
	line "hoped he would."

	para "Kids, huh?"
	done

Museum2FTohofanMMetricText:
	text "This space shuttle"
	line "used to fly 250"

	para "kilometers above"
	line "the earth, defy-"
	cont "ing gravity!"

	para "You know what else"
	line "can defy gravity?"

	para "Seismic Toss,"
	line "of course!"
	done

Text_Museum2FTutorSeismicToss:
	text "I can teach your"
	line "#mon to use"

	para "Seismic Toss for"
	line "one Silver Leaf."
	done

Text_Museum2FTutorNoSilverLeaf:
	text "You don't have a"
	line "Silver Leaf!"
	done

Text_Museum2FTutorQuestion:
	text "Should I teach"
	line "your #mon"
	cont "Seismic Toss?"
	done

Text_Museum2FTutorRefused:
	text "If you say so."
	done

Text_Museum2FTutorTaught:
	text "Now your #mon"
	line "knows how to use"
	cont "Seismic Toss!"
	done

Museum2FMoonStoneSignpostText:
	text "Meteorite that"
	line "fell on Mt.Moon."
	cont "(Moon Stone)"
	done

Museum2FSpaceShuttleSignpostText:
	text "Space Shuttle"
	done

TohomonJournalStevenScript:
	setflag ENGINE_READ_STEVEN_JOURNAL
	jumpthistext

	text "#mon Journal"

	para "Special Feature:"
	line "Rock Hound Steven!"

	para "Steven Stone is"
	line "said to assist"
	cont "Devon Corp, which"

	para "is run by his fa-"
	line "ther Joseph Stone,"

	para "by hunting down"
	line "rare minerals and"
	cont "even fossils."
	done

TohomonJournalCynthiaScript: ; TODO: move to Goldenrod Museum
	setflag ENGINE_READ_CYNTHIA_JOURNAL
	jumpthistext

	text "#mon Journal"

	para "Special Feature:"
	line "Researcher"
	cont "Cynthia!"

	para "Cynthia is said to"
	line "have learned many"

	para "legends and myths"
	line "from her grand-"
	cont "mother in Sinnoh."
	done
