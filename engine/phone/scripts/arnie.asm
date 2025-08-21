ArniePhoneScript1:
	gettrainername BUG_CATCHER, ARNIE1, $0
	checkflag ENGINE_ARNIE_READY_FOR_REMATCH
	iftruefwd .WantsBattle
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_ARNIE_TUESDAY_MORNING
	iftruefwd .NotTuesday
	readvar VAR_WEEKDAY
	ifnotequal TUESDAY, .NotTuesday
	checktime 1 << MORN
	iftruefwd ArnieTuesdayMorning

.NotTuesday:
	checkflag ENGINE_CKOTOHIME_SWARM
	iftruefwd .AlreadySwarming
	farsjump ArnieHangUpScript

.WantsBattle:
	getlandmarkname ROUTE_35, $2
	farsjump ArnieReminderScript

.AlreadySwarming:
	getlandmarkname ROUTE_35, $2
	farsjump ArnieHurryScript

ArniePhoneScript2:
	gettrainername BUG_CATCHER, ARNIE1, $0
	farscall PhoneScript_GreetPhone_Male
	checkflag ENGINE_ARNIE_READY_FOR_REMATCH
	iftruefwd .Swarm
	checkflag ENGINE_ARNIE_TUESDAY_MORNING
	iftruefwd .Swarm
	farscall PhoneScript_Random2
	ifequalfwd $0, ArnieWantsBattle

.Swarm:
	farscall PhoneScript_Random5
	ifequalfwd $0, ArnieAEikiSwarm
	farscall PhoneScript_Random3
	ifequalfwd $0, ArnieFoundRare
	farsjump Phone_GenericCall_Male

ArnieTuesdayMorning:
	setflag ENGINE_ARNIE_TUESDAY_MORNING

ArnieWantsBattle:
	getlandmarkname ROUTE_35, $2
	setflag ENGINE_ARNIE_READY_FOR_REMATCH
	farsjump PhoneScript_WantsToBattle_Male

ArnieAEikiSwarm: ; start swarm
	checkflag ENGINE_CKOTOHIME_SWARM
	iftruefwd ArnieAEikiAlreadySwarming
	setflag ENGINE_CKOTOHIME_SWARM
	getmonname AEIKI, $1
	swarm SWARM_CKOTOHIME, ROUTE_35
	getlandmarkname ROUTE_35, $2
	farsjump ArnieSwarmScript

ArnieFoundRare:
	farsjump Phone_CheckIfUnseenRare_Male

ArnieAEikiAlreadySwarming:
	farsjump Phone_GenericCall_Male
