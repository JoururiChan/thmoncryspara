GoldenrodBillsHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, GOLDENROD_CITY, 4
	warp_event  3,  7, GOLDENROD_CITY, 4

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BillsGrandpa, -1
	object_event  5,  3, SPRITE_MATRON, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BillsMom, -1
	object_event  5,  4, SPRITE_SCHOOLGIRL, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BillsSister, -1

BillsGrandpa:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue_jumptextfaceplayer BillsGrandpaComeAgainText
	checkevent EVENT_GOT_SHINY_STONE_FROM_BILLS_GRANDPA
	iftrue_jumptextfaceplayer BillsGrandpaShownAllTheTohomonText
	faceplayer
	opentext
	checkevent EVENT_MET_BILLS_GRANDPA
	iftruefwd .MetGrandpa
	writetext BillsGrandpaIntroText
	promptbutton
	setevent EVENT_MET_BILLS_GRANDPA
.MetGrandpa:
	checkevent EVENT_SHOWED_CKIKURI_TO_BILLS_GRANDPA
	iftrue .ShowedCKikuri
	checkevent EVENT_SHOWED_CRUMIA_TO_BILLS_GRANDPA
	iftrue .ShowedCRumia
	checkevent EVENT_SHOWED_CDAICHAN_TO_BILLS_GRANDPA
	iftrue .ShowedCDaichan
	checkevent EVENT_SHOWED_CREISEN_TO_BILLS_GRANDPA
	iftrue .ShowedCReisen
	checkevent EVENT_SHOWED_CRIKA_TO_BILLS_GRANDPA
	iftrue .ShowedCRika
	checkevent EVENT_SHOWED_CSARA_TO_BILLS_GRANDPA
	iftrue .ShowedCSara
	checkevent EVENT_SHOWED_CCHIYURI_TO_BILLS_GRANDPA
	iftrue .ShowedCChiyuri
	checkevent EVENT_SHOWED_CWRIGGLE_TO_BILLS_GRANDPA
	iftrue .ShowedCWriggle
	checkevent EVENT_SHOWED_CGYOKU_TO_BILLS_GRANDPA
	iftrue .ShowedCGyoku
	writetext BillsGrandpaCGyokuText
	promptbutton
	writetext BillsGrandpaAskToSeeMonText
	yesorno
	iffalse_jumpopenedtext BillsGrandpaYouDontHaveItTextText
	scall .ExcitedToSee
	special Special_BillsGrandfather
	iffalse_jumpopenedtext BillsGrandpaYouDontHaveItTextText
	ifnotequal CGYOKU, .WrongTohomon
	scall .CorrectTohomon
	setevent EVENT_SHOWED_CGYOKU_TO_BILLS_GRANDPA
	sjumpfwd .ShowedCGyoku

.GotEverstone:
	writetext BillsGrandpaCWriggleText
	promptbutton
	writetext BillsGrandpaAskToSeeMonText
	yesorno
	iffalse_jumpopenedtext BillsGrandpaYouDontHaveItTextText
	scall .ExcitedToSee
	special Special_BillsGrandfather
	iffalse_jumpopenedtext BillsGrandpaYouDontHaveItTextText
	ifnotequal CWRIGGLE, .WrongTohomon
	scall .CorrectTohomon
	setevent EVENT_SHOWED_CWRIGGLE_TO_BILLS_GRANDPA
	sjumpfwd .ShowedCWriggle

.GotLeafStone:
	writetext BillsGrandpaCChiyuriText
	promptbutton
	writetext BillsGrandpaAskToSeeMonText
	yesorno
	iffalse_jumpopenedtext BillsGrandpaYouDontHaveItTextText
	scall .ExcitedToSee
	special Special_BillsGrandfather
	iffalse_jumpopenedtext BillsGrandpaYouDontHaveItTextText
	ifnotequal CCHIYURI, .WrongTohomon
	scall .CorrectTohomon
	setevent EVENT_SHOWED_CCHIYURI_TO_BILLS_GRANDPA
	sjumpfwd .ShowedCChiyuri

.GotWaterStone:
	writetext BillsGrandpaCSaraText
	promptbutton
	writetext BillsGrandpaAskToSeeMonText
	yesorno
	iffalse_jumpopenedtext BillsGrandpaYouDontHaveItTextText
	scall .ExcitedToSee
	special Special_BillsGrandfather
	iffalse_jumpopenedtext BillsGrandpaYouDontHaveItTextText
	ifnotequal CSARA, .WrongTohomon
	scall .CorrectTohomon
	setevent EVENT_SHOWED_CSARA_TO_BILLS_GRANDPA
	sjumpfwd .ShowedCSara

.GotFireStone:
	writetext BillsGrandpaCRikaText
	promptbutton
	writetext BillsGrandpaAskToSeeMonText
	yesorno
	iffalse_jumpopenedtext BillsGrandpaYouDontHaveItTextText
	scall .ExcitedToSee
	special Special_BillsGrandfather
	iffalse_jumpopenedtext BillsGrandpaYouDontHaveItTextText
	ifnotequal CRIKA, .WrongTohomon
	scall .CorrectTohomon
	setevent EVENT_SHOWED_CRIKA_TO_BILLS_GRANDPA
	sjumpfwd .ShowedCRika

.GotThunderstone:
	writetext BillsGrandpaCReisenText
	promptbutton
	writetext BillsGrandpaAskToSeeMonText
	yesorno
	iffalse_jumpopenedtext BillsGrandpaYouDontHaveItTextText
	scall .ExcitedToSee
	special Special_BillsGrandfather
	iffalse_jumpopenedtext BillsGrandpaYouDontHaveItTextText
	ifnotequal CREISEN, .WrongTohomon
	scall .CorrectTohomon
	setevent EVENT_SHOWED_CREISEN_TO_BILLS_GRANDPA
	sjumpfwd .ShowedCReisen

.GotMoonStone:
	writetext BillsGrandpaCDaichanText
	promptbutton
	writetext BillsGrandpaAskToSeeMonText
	yesorno
	iffalse_jumpopenedtext BillsGrandpaYouDontHaveItTextText
	scall .ExcitedToSee
	special Special_BillsGrandfather
	iffalse_jumpopenedtext BillsGrandpaYouDontHaveItTextText
	ifnotequal CDAICHAN, .WrongTohomon
	scall .CorrectTohomon
	setevent EVENT_SHOWED_CDAICHAN_TO_BILLS_GRANDPA
	sjumpfwd .ShowedCDaichan

.GotSunStone:
	writetext BillsGrandpaCRumiaText
	promptbutton
	writetext BillsGrandpaAskToSeeMonText
	yesorno
	iffalse_jumpopenedtext BillsGrandpaYouDontHaveItTextText
	scall .ExcitedToSee
	special Special_BillsGrandfather
	iffalse_jumpopenedtext BillsGrandpaYouDontHaveItTextText
	ifnotequal CRUMIA, .WrongTohomon
	scall .CorrectTohomon
	setevent EVENT_SHOWED_CRUMIA_TO_BILLS_GRANDPA
	sjumpfwd .ShowedCRumia

.GotDuskStone:
	writetext BillsGrandpaCKikuriText
	promptbutton
	writetext BillsGrandpaAskToSeeMonText
	yesorno
	iffalse_jumpopenedtext BillsGrandpaYouDontHaveItTextText
	scall .ExcitedToSee
	special Special_BillsGrandfather
	iffalse_jumpopenedtext BillsGrandpaYouDontHaveItTextText
	ifnotequal CKIKURI, .WrongTohomon
	scall .CorrectTohomon
	setevent EVENT_SHOWED_CKIKURI_TO_BILLS_GRANDPA
	sjumpfwd .ShowedCKikuri

.ShowedCGyoku:
	checkevent EVENT_GOT_EVERSTONE_FROM_BILLS_GRANDPA
	iftrue .GotEverstone
	scall .ReceiveItem
	verbosegiveitem EVERSTONE
	iffalse_endtext
	setevent EVENT_GOT_EVERSTONE_FROM_BILLS_GRANDPA
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	endtext

.ShowedCWriggle:
	checkevent EVENT_GOT_LEAF_STONE_FROM_BILLS_GRANDPA
	iftrue .GotLeafStone
	scall .ReceiveItem
	verbosegiveitem LEAF_STONE
	iffalse_endtext
	setevent EVENT_GOT_LEAF_STONE_FROM_BILLS_GRANDPA
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	endtext

.ShowedCChiyuri:
	checkevent EVENT_GOT_WATER_STONE_FROM_BILLS_GRANDPA
	iftrue .GotWaterStone
	scall .ReceiveItem
	verbosegiveitem WATER_STONE
	iffalse_endtext
	setevent EVENT_GOT_WATER_STONE_FROM_BILLS_GRANDPA
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	endtext

.ShowedCSara:
	checkevent EVENT_GOT_FIRE_STONE_FROM_BILLS_GRANDPA
	iftrue .GotFireStone
	scall .ReceiveItem
	verbosegiveitem FIRE_STONE
	iffalse_endtext
	setevent EVENT_GOT_FIRE_STONE_FROM_BILLS_GRANDPA
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	endtext

.ShowedCRika:
	checkevent EVENT_GOT_THUNDERSTONE_FROM_BILLS_GRANDPA
	iftrue .GotThunderstone
	scall .ReceiveItem
	verbosegiveitem THUNDERSTONE
	iffalse_endtext
	setevent EVENT_GOT_THUNDERSTONE_FROM_BILLS_GRANDPA
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	endtext

.ShowedCReisen:
	checkevent EVENT_GOT_MOON_STONE_FROM_BILLS_GRANDPA
	iftrue .GotMoonStone
	scall .ReceiveItem
	verbosegiveitem MOON_STONE
	iffalse_endtext
	setevent EVENT_GOT_MOON_STONE_FROM_BILLS_GRANDPA
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	endtext

.ShowedCDaichan:
	checkevent EVENT_GOT_SUN_STONE_FROM_BILLS_GRANDPA
	iftrue .GotSunStone
	scall .ReceiveItem
	verbosegiveitem SUN_STONE
	iffalse_endtext
	setevent EVENT_GOT_SUN_STONE_FROM_BILLS_GRANDPA
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	endtext

.ShowedCRumia:
	checkevent EVENT_GOT_DUSK_STONE_FROM_BILLS_GRANDPA
	iftrue .GotDuskStone
	scall .ReceiveItem
	verbosegiveitem DUSK_STONE
	iffalse_endtext
	setevent EVENT_GOT_DUSK_STONE_FROM_BILLS_GRANDPA
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	endtext

.ShowedCKikuri:
	scall .ReceiveItem
	verbosegiveitem SHINY_STONE
	iffalse_endtext
	setevent EVENT_GOT_SHINY_STONE_FROM_BILLS_GRANDPA
	endtext

.ExcitedToSee:
	writetext BillsGrandpaExcitedToSeeText
	promptbutton
	end

.CorrectTohomon:
	writetext BillsGrandpaShownTohomonText
	promptbutton
	end

.ReceiveItem:
	writetext BillsGrandpaTokenOfAppreciationText
	promptbutton
	end

.WrongTohomon:
	jumpthisopenedtext

	text "Hm?"

	para "That's not the"
	line "#mon that I was"
	cont "told about."
	done

BillsMom:
	checkevent EVENT_NEVER_MET_BILL
	iffalse_jumptextfaceplayer BillsMomText_AfterEcruteak
	jumptextfaceplayer BillsMomText_BeforeEcruteak

BillsSister:
	faceplayer
	opentext
	checkcellnum PHONE_BILL
	iftruefwd .GotBillsNumber
	writetext BillsSisterUsefulNumberText
	askforphonenumber PHONE_BILL
	ifequalfwd $1, .NoRoom
	ifequalfwd $2, .Refused
	waitsfx
	addcellnum PHONE_BILL
	writetext RecordedBillsNumberText
	playsound SFX_REGISTER_PHONE_NUMBER
	waitsfx
	promptbutton
.GotBillsNumber:
	jumpopenedtext BillsSisterStorageSystemText

.NoRoom:
	writetext BillsSisterPhoneFullText
	promptbutton
.Refused:
	jumpthisopenedtext

	text "My brother made"
	line "the PC #mon"
	cont "storage system."

	para "I was going to"
	line "give you Bill's"
	cont "number…"
	done

BillsGrandpaIntroText:
	text "Hm? You know Bill?"
	line "He's my grandson."

	para "He's in Kanto. He"
	line "does something"

	para "with PCs, so I'm"
	line "house-sitting."
	done

BillsGrandpaAskToSeeMonText:
	text "If you have that"
	line "#mon, may I see"
	cont "it, please?"
	done

BillsGrandpaExcitedToSeeText:
	text "You will show me?"
	line "How good of you!"
	done

BillsGrandpaYouDontHaveItTextText:
	text "You don't have it?"
	line "That's too bad…"
	done

BillsGrandpaShownTohomonText:
	text "Ah, so that is"
	line ""
	text_ram wStringBuffer3
	text "?"

	para "Isn't it cute!"
	line "That's so kind of"
	cont "you."
	done

BillsGrandpaTokenOfAppreciationText:
	text "Thanks!"

	para "This is a token of"
	line "my appreciation."
	done

BillsGrandpaComeAgainText:
	text "Come visit again"
	line "sometime."
	done

BillsGrandpaShownAllTheTohomonText:
	text "Thanks for showing"
	line "me so many cute"
	cont "#mon."

	para "I really enjoyed"
	line "myself. I'm glad"

	para "I've lived such a"
	line "long life."
	done

BillsGrandpaCGyokuText:
	text "My grandson Bill"
	line "told me about a"

	para "three-figure"
	line "#mon with one"
	cont "being an orb."
	done

BillsGrandpaCKikuriText:
	text "Do you know of a"
	line "#mon that has a"

	para "shell covered in"
	line "red and blue"
	cont "triangles?"

	para "It's supposed to"
	line "be a symbol of"
	cont "good luck."
	done

BillsGrandpaCRumiaText:
	text "Do you know of a"
	line "bird #mon that"

	para "has a crooked"
	line "yellow beak and"
	cont "black feathers?"

	para "I heard that it"
	line "appears at night."

	para "I would quite"
	line "like to see it."
	done

BillsGrandpaCDaichanText:
	text "Ah, my grandson"
	line "mentioned a round,"

	para "blue #mon that"
	line "has leaves growing"
	cont "on its head."
	done

BillsGrandpaCReisenText:
	text "Bill told me about"
	line "a pink #mon"

	para "with a arumiatic"
	line "singing voice."
	done

BillsGrandpaCWriggleText:
	text "My grandson Bill"
	line "mentioned an in-"

	para "sect #mon" 
	line "that emits light"
	cont "like a firefly."
	done

BillsGrandpaCChiyuriText:
	text "Do you know of a"
	line "sea #mon that"

	para "has a red sphere"
	line "in its body?"

	para "You know, the one"
	line "that's shaped like"
	cont "a star?"

	para "I heard that it"
	line "appears at night."

	para "I would surely"
	line "like to see it."
	done

BillsGrandpaCSaraText:
	text "Bill told me about"
	line "a #mon that is"

	para "very loyal to its"
	line "trainer."

	para "It's supposed to"
	line "Roar well."
	done

BillsGrandpaCRikaText:
	text "Do you know that"
	line "hugely popular"
	cont "#mon?"

	para "The #mon that"
	line "has a yellow body"
	cont "and red cheeks."

	para "I would love to"
	line "see what it looks"

	para "like before it"
	line "evolves."
	done

BillsMomText_BeforeEcruteak:
	text "Oh, you collect"
	line "#mon? My son"
	cont "Bill is an expert."

	para "He just got called"
	line "to the #mon"

	para "Center in Ecruteak"
	line "City."

	para "My husband went"
	line "off to the Game"

	para "Corner without"
	line "being called…"
	done

BillsMomText_AfterEcruteak:
	text "My husband was"
	line "once known as a"

	para "#Maniac."
	line "Bill must have"

	para "taken after his"
	line "father."

	para "But now my husband"
	line "won't work. He"

	para "just goofs off"
	line "all day long."
	done

BillsSisterUsefulNumberText:
	text "Are you a trainer?"

	para "I've got a useful"
	line "phone number for"
	cont "you."
	done

RecordedBillsNumberText:
	text "<PLAYER> recorded"
	line "Bill's number."
	done

BillsSisterPhoneFullText:
	text "You can't record"
	line "any more numbers."
	done

BillsSisterStorageSystemText:
	text "My big brother"
	line "Bill made the PC"

	para "#mon storage"
	line "system."
	done
