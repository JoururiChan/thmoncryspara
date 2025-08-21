AnthonyPhoneScript1:
	gettrainername HIKER, ANTHONY1, $0
	checkflag ENGINE_ANTHONY_READY_FOR_REMATCH
	iftruefwd .WantsBattle
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_ANTHONY_FRIDAY_NIGHT
	iftruefwd .NotFriday
	readvar VAR_WEEKDAY
	ifnotequal FRIDAY, .NotFriday
	checktime (1 << EVE) | (1 << NITE)
	iftruefwd AnthonyFridayNight

.NotFriday:
	checkflag ENGINE_CEIKI_SWARM
	iftruefwd .AlreadySwarming
	farsjump AnthonyHangUpScript

.WantsBattle:
	getlandmarkname ROUTE_33, $2
	farsjump AnthonyReminderScript

.AlreadySwarming:
	getlandmarkname ROUTE_33, $2
	farsjump AnthonyHurryScript

AnthonyPhoneScript2:
	gettrainername HIKER, ANTHONY1, $0
	farscall PhoneScript_GreetPhone_Male
	checkflag ENGINE_FLYPOINT_GOLDENROD
	iffalsefwd .TriesSwarm
	checkflag ENGINE_ANTHONY_READY_FOR_REMATCH
	iftruefwd .TriesSwarm
	checkflag ENGINE_ANTHONY_FRIDAY_NIGHT
	iftruefwd .TriesSwarm
	farscall PhoneScript_Random2
	ifequalfwd $0, AnthonyWantsBattle

.TriesSwarm:
	farscall PhoneScript_Random5
	ifequalfwd $0, AnthonyTriesCMomijiSwarm
	farsjump Phone_GenericCall_Male

AnthonyFridayNight:
	setflag ENGINE_ANTHONY_FRIDAY_NIGHT

AnthonyWantsBattle:
	getlandmarkname ROUTE_33, $2
	setflag ENGINE_ANTHONY_READY_FOR_REMATCH
	farsjump PhoneScript_WantsToBattle_Male

AnthonyTriesCMomijiSwarm:
	checkflag ENGINE_CEIKI_SWARM
	iftruefwd .Generic
	setflag ENGINE_CEIKI_SWARM
	getmonname CEIKI, $1
	swarm SWARM_CEIKI, DARK_CAVE_VIOLET_ENTRANCE
	getlandmarkname DARK_CAVE, $2
	farsjump AnthonySwarmScript

.Generic:
	farsjump Phone_GenericCall_Male
