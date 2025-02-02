DEF BATTLETOWER_PARTY_LENGTH EQU 3
DEF BATTLETOWER_STREAK_LENGTH EQU 7

DEF BATTLETOWER_PARTYDATA_SIZE EQU BATTLETOWER_PARTY_LENGTH * 2 ; set + index
DEF BATTLETOWER_SAVEDPARTIES EQU 3 ; to limit repeats

DEF BATTLETOWER_FORCED_LEVEL EQU 50

DEF BATTLETOWER_NUM_TRAINERS EQU 132

; facility brain IDs after regular trainers
	const_def BATTLETOWER_NUM_TRAINERS
	const BATTLETOWER_TOWERTYCOON
	const BATTLETOWER_FACTORYHEAD

DEF BATTLETOWER_NUM_TIERS EQU 4

; sBattleTowerChallengeState values
	const_def
	const BATTLETOWER_NO_CHALLENGE
	const BATTLETOWER_SAVED_AND_LEFT
	const BATTLETOWER_CHALLENGE_IN_PROGRESS
	const BATTLETOWER_LOST_CHALLENGE
	const BATTLETOWER_WON_CHALLENGE

; Special_BattleTower_Battle return values
	const_def
	const BTCHALLENGE_NEXT
	const BTCHALLENGE_FACILITYBRAIN
	const BTCHALLENGE_WON
	const BTCHALLENGE_LOST

; DV set indexes (see data/battle_tower/dvs.asm)
	const_def
	const BTDVS_PERFECT
	const BTDVS_TRICK_ROOM
	const BTDVS_HP_DREAM
	const BTDVS_HP_FLYING
	const BTDVS_HP_MIASMA
	const BTDVS_HP_EARTH
	const BTDVS_HP_BEAST
	const BTDVS_HP_BUG
	const BTDVS_HP_GHOST
	const BTDVS_HP_STEEL
	const BTDVS_HP_FIRE
	const BTDVS_HP_WATER
	const BTDVS_HP_NATURE
	const BTDVS_HP_WIND
	const BTDVS_HP_REASON
	const BTDVS_HP_ICE
	const BTDVS_HP_FAITH
	const BTDVS_HP_DARK
DEF NUM_BTDVS EQU const_value

DEF BATTLETOWER_CHALLENGEMASK EQU %00000111
DEF BATTLETOWER_NORMALMODE    EQU %00000000
DEF BATTLETOWER_RENTALMODE    EQU %00001000
DEF BATTLETOWER_MODEMASK      EQU %00001000

DEF BATTLETOWER_TRAINERMASK   EQU %00000111
DEF BATTLETOWER_SWAPMASK      EQU %00111000
