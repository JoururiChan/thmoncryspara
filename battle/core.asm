; Core components of the battle engine.
BattleCore:
DoBattle: ; 3c000
	xor a
	ld [wBattleTurnCounter], a
	ld [wBattleParticipantsNotFainted], a
	ld [wBattleParticipantsIncludingFainted], a
	ld [wPlayerAction], a
	ld [BattleEnded], a
	inc a
	ld [wAISwitch], a
	ld hl, OTPartyMon1HP
	ld bc, PARTYMON_STRUCT_LENGTH - 1
	ld d, BATTLEACTION_SWITCH1 - 1
.loop
	inc d
	ld a, [hli]
	or [hl]
	jr nz, .alive
	add hl, bc
	jr .loop

.alive
	ld a, d
	ld [wBattleAction], a
	ld a, [wLinkMode]
	and a
	jr z, .not_linked

	ld a, [hLinkPlayerNumber]
	cp $2
	jr z, .player_2

.not_linked
	ld a, [wBattleMode]
	dec a
	jr z, .wild
	xor a
	ld [wEnemySwitchMonIndex], a
	call NewEnemyMonStatus
	call ResetEnemyStatLevels
	call BreakAttraction
	call EnemySwitch

.wild
	; Wild mons bypass NewEnemyMonStatus, so set
	; their ability here too.
	call ResetEnemyAbility
	ld c, 40
	call DelayFrames

.player_2
	call LoadTileMapToTempTileMap
	call CheckPlayerPartyForFitPkmn
	ld a, d
	and a
	jp z, LostBattle
	call Call_LoadTempTileMapToTileMap
	ld a, [BattleType]
	cp BATTLETYPE_TUTORIAL
	jp z, .tutorial_debug
	xor a
	ld [CurPartyMon], a
.loop2
	call CheckIfCurPartyMonIsFitToFight
	jr nz, .alive2
	ld hl, CurPartyMon
	inc [hl]
	jr .loop2

.alive2
	ld a, [CurBattleMon]
	ld [LastPlayerMon], a
	ld a, [CurPartyMon]
	ld [CurBattleMon], a
	inc a
	ld hl, PartySpecies - 1
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]
	ld [CurPartySpecies], a
	ld [TempBattleMonSpecies], a
	hlcoord 1, 5
	ld a, 9
	call SlideBattlePicOut
	call LoadTileMapToTempTileMap
	call ResetBattleParticipants
	call InitBattleMon
	call ResetPlayerStatLevels
	call SendOutPkmnText
	call NewBattleMonStatus
	call BreakAttraction
	call SendOutPlayerMon
	call EmptyBattleTextBox
	call LoadTileMapToTempTileMap
	call SetPlayerTurn
	call SpikesDamage
	ld a, [wLinkMode]
	and a
	jr z, .not_linked_2
	ld a, [hLinkPlayerNumber]
	cp $2
	jr nz, .not_linked_2
	xor a
	ld [wEnemySwitchMonIndex], a
	call NewEnemyMonStatus
	call ResetEnemyStatLevels
	call BreakAttraction
	call EnemySwitch
	call SetEnemyTurn
	call SpikesDamage
	call RunBothActivationAbilities
	jp BattleTurn

.not_linked_2
	call RunBothActivationAbilities
	jp BattleTurn

.tutorial_debug
	jp BattleMenu
; 3c0e5



WildFled_EnemyFled_LinkBattleCanceled: ; 3c0e5
	call Call_LoadTempTileMapToTileMap
	ld a, [wBattleResult]
	and $c0
	add $2
	ld [wBattleResult], a

	ld hl, BattleText_LegendaryFled
	ld a, [BattleType]
	cp BATTLETYPE_ROAMING
	jr z, .print_text
	cp BATTLETYPE_CELEBI ; or BATTLETYPE_SUICUNE, BATTLETYPE_HO_OH, BATTLETYPE_LUGIA, BATTLETYPE_KANTO_LEGEND
	jr nc, .print_text

	ld hl, BattleText_WildFled
	ld a, [wLinkMode]
	and a
	jr z, .print_text

	ld a, [wBattleResult]
	and $c0
	ld [wBattleResult], a
	ld hl, BattleText_EnemyFled

.print_text
	call StdBattleTextBox

.skip_text
	call StopDangerSound
	ld de, SFX_RUN
	call PlaySFX
	call SetPlayerTurn
	ld a, 1
	ld [BattleEnded], a
	ret
; 3c12f


BattleTurn: ; 3c12f
.loop
	call CheckContestBattleOver
	jp c, .quit

	xor a
	ld [wPlayerIsSwitching], a
	ld [wEnemyIsSwitching], a
	ld [wAISwitch], a
	ld [wPlayerJustGotFrozen], a
	ld [wEnemyJustGotFrozen], a
	ld [CurDamage], a
	ld [CurDamage + 1], a

	call HandleBerserkGene
	call UpdateBattleMonInParty
	farcall AIChooseMove

	ld a, [wBattleTurnCounter]
	cp a, $ff
	jr z, .SkipIncrementingTurnCounter
	inc a
	ld [wBattleTurnCounter], a
.SkipIncrementingTurnCounter

	call CheckPlayerLockedIn
	jr c, .skip_iteration
.loop1
	call BattleMenu
	jr c, .quit
	ld a, [BattleEnded]
	and a
	jr nz, .quit
	ld a, [wForcedSwitch] ; roared/teleported
	and a
	jr nz, .quit
.skip_iteration
	call ParsePlayerAction
	jr nz, .loop1

	call EnemyTriesToFlee
	jr c, .quit

	call DetermineMoveOrder
	jr c, .false
	call Battle_EnemyFirst
	jr .proceed
.false
	call Battle_PlayerFirst
.proceed
	ld a, [wForcedSwitch]
	and a
	jr nz, .quit

	ld a, [BattleEnded]
	and a
	jr nz, .quit

	call HandleBetweenTurnEffects
	ld a, [BattleEnded]
	and a
	jr nz, .quit
	jp .loop

.quit
	ret
; 3c1bf


HandleBetweenTurnEffects: ; 3c1d6
	call CheckFaint
	ret c
	call HandleResidualDamage
	call CheckFaint
	ret c
	call HandleFutureSight
	call CheckFaint
	ret c
	call HandleWeather
	call CheckFaint
	ret c
	call HandleWrap
	call CheckFaint
	ret c
	call HandlePerishSong
	call CheckFaint
	ret c
	call HandleLeftovers
	call HandleLeppaBerry
	call HandleSafeguard
	call HandleScreens
	call HandleStatBoostingHeldItems
	call HandleHealingItems
	farcall HandleAbilities
	call UpdateBattleMonInParty
	call LoadTileMapToTempTileMap
	jp HandleEncore
; 3c23c

CheckFaint:
	ld a, [hLinkPlayerNumber]
	cp $1
	jr z, .enemy_first
	call .check_player
	call nc, .check_enemy
	ret

.enemy_first
	call .check_enemy
	call nc, .check_player
	ret

.check_player
	call HasPlayerFainted
	jr nz, .ok
	call HandlePlayerMonFaint
	ld a, [BattleEnded]
	and a
	jr nz, .over
	ret

.check_enemy
	call HasEnemyFainted
	jr nz, .ok
	call HandleEnemyMonFaint
	ld a, [BattleEnded]
	and a
	jr nz, .over
	ret

.ok
	and a
	ret
.over
	scf
	ret

HandleBerserkGene: ; 3c27c
	ld a, [hLinkPlayerNumber]
	cp $1
	jr z, .reverse

	call .player
	jr .enemy

.reverse
	call .enemy
;	jr .player

.player
	call SetPlayerTurn
	ld de, PartyMon1Item
	ld a, [CurBattleMon]
	ld b, a
	jr .go

.enemy
	call SetEnemyTurn
	ld de, OTPartyMon1Item
	ld a, [CurOTMon]
	ld b, a
;	jr .go

.go
	push de
	push bc
	farcall GetUserItem
	ld a, [hl]
	ld [wd265], a
	sub BERSERK_GENE
	pop bc
	pop de
	ret nz

	ld [hl], a

	ld h, d
	ld l, e
	ld a, b
	call GetPartyLocation
	xor a
	ld [hl], a
	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarAddr
	push af
	set SUBSTATUS_CONFUSED, [hl]
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVarAddr
	push hl
	push af
	xor a
	ld [hl], a
	ld [AttackMissed], a
	ld [EffectFailed], a
	farcall BattleCommand_AttackUp2
	pop af
	pop hl
	ld [hl], a
	call GetItemName
	ld hl, BattleText_UsersStringBuffer1Activated
	call StdBattleTextBox
	farcall BattleCommand_StatUpMessage
	pop af
	bit SUBSTATUS_CONFUSED, a
	ret nz
	xor a
	ld [wNumHits], a
	ld de, ANIM_CONFUSED
	call Call_PlayBattleAnim_OnlyIfVisible
	call SwitchTurn
	ld hl, BecameConfusedText
	jp StdBattleTextBox
; 3c300

EnemyTriesToFlee: ; 3c300
	ld a, [wLinkMode]
	and a
	jr z, .not_linked
	ld a, [wBattleAction]
	cp BATTLEACTION_FORFEIT
	jr z, .forfeit

.not_linked
	and a
	ret

.forfeit
	call WildFled_EnemyFled_LinkBattleCanceled
	scf
	ret
; 3c314

DetermineMoveOrder: ; 3c314
	ld a, [wPlayerAction]
	and a

	jp nz, .player_first
	call CompareMovePriority
	jr z, .equal_priority
	jp c, .player_first
	jp .enemy_first

.equal_priority
	call CheckSpeedWithQuickClaw
	jr z, .player_first
	jr .enemy_first

.player_first
	scf
	ret
; 3c3f3

.enemy_first ; 3c3f3
	and a
	ret
; 3c3f5

GetSpeed::
; Sets bc to speed after items and stat changes.
; If d=1, check (and proc) Quick Claw, which increases b by
; 128, effectively increasing final speed by 32768. This way,
; no awkward specific checks need to be made for Quick Claw
; ties and similar.
	push hl
	push de
	ld a, [hBattleTurn]
	and a
	ld a, [PlayerSpdLevel]
	ld hl, BattleMonSpeed
	jr z, .got_speed
	ld a, [EnemySpdLevel]
	ld hl, EnemyMonSpeed
.got_speed
	ld b, [hl]
	inc hl
	ld c, [hl]

	; Apply stat changes
	sub 7
	jr z, .stat_changes_done
	jr nc, .no_overflow1
	xor a
.no_overflow1
	add 2
	ld [hMultiplier], a
	ld d, a
	xor a
	ld [hMultiplicand + 0], a
	ld a, b
	ld [hMultiplicand + 1], a
	ld a, c
	ld [hMultiplicand + 2], a
	call Multiply
	ld b, 4
	ld a, 7
	sub d
	jr nc, .no_overflow2
	xor a
.no_overflow2
	add 2
	ld [hDivisor], a
	call Divide
	ld a, [hQuotient + 1]
	ld b, a
	ld a, [hQuotient + 2]
	ld c, a
.stat_changes_done
	; Apply paralyze effect
	ld a, BATTLE_VARS_STATUS
	call GetBattleVar
	cp 1 << PAR
	jr nz, .paralyze_check_done
	; Quick Feet ignores this
	ld a, BATTLE_VARS_ABILITY
	call GetBattleVar
	cp QUICK_FEET
	jr nz, .paralyze_check_done
	; Cut speed in half. Consistent with
	; VII (I-VI quartered it)
	srl b
	rr c
.paralyze_check_done
	farcall ApplySpeedAbilities
	; Apply item effects
	push bc
	farcall GetUserItem
	ld h, c
	ld a, b
	pop bc
	pop de ; needed early to check quick claw allowance
	cp HELD_QUICK_CLAW
	jr z, .quick_claw
	cp HELD_CHOICE_SPD
	jr z, .choice_scarf
	cp HELD_QUICK_POWDER
	jr z, .quick_powder
	jr .done
.quick_claw
	ld a, d
	and a
	jr z, .done ; don't apply quick claw
	push hl
	call BattleRandom
	pop hl
	cp h
	jr nc, .done
	; TODO: item animation
	ld a, b
	add 128
	ld b, a
	jr .done
.choice_scarf
	; Add a 50% boost
	ld h, b
	ld l, c
	srl b
	rr c
	add hl, bc
	ld b, h
	ld c, l
	jr .done
.quick_powder
	; Double speed, but only for Ditto
	ld a, MON_SPECIES
	call BattlePartyAttr
	ld a, [hBattleTurn]
	and a
	ld a, [hl]
	jr nz, .got_species
	ld a, [TempEnemyMonSpecies]
.got_species
	cp DITTO
	jr nz, .done
	sla c
	rl b
.done
	pop hl
	ret

CheckContestBattleOver: ; 3c3f5
	ld a, [BattleType]
	cp BATTLETYPE_CONTEST
	jr nz, .contest_not_over
	ld a, [wParkBallsRemaining]
	and a
	jr nz, .contest_not_over
	ld a, [wBattleResult]
	and $c0
	add $2
	ld [wBattleResult], a
	scf
	ret

.contest_not_over
	and a
	ret
; 3c410

CheckPlayerLockedIn: ; 3c410
	ld a, [PlayerSubStatus4]
	and 1 << SUBSTATUS_RECHARGE
	jp nz, .quit

	ld hl, EnemySubStatus3
	res SUBSTATUS_FLINCHED, [hl]
	ld hl, PlayerSubStatus3
	res SUBSTATUS_FLINCHED, [hl]

	ld a, [hl]
	and 1 << SUBSTATUS_CHARGED | 1 << SUBSTATUS_RAMPAGE
	jp nz, .quit

	ld hl, PlayerSubStatus1
	bit SUBSTATUS_ROLLOUT, [hl]
	jp nz, .quit

	and a
	ret

.quit
	scf
	ret
; 3c434

ParsePlayerAction: ; 3c434
	ld a, [BattleType]
	cp BATTLETYPE_GHOST
	jp z, .lavender_ghost

	call CheckPlayerLockedIn
	jp c, .locked_in
	ld hl, PlayerSubStatus2
	bit SUBSTATUS_ENCORED, [hl]
	jr z, .not_encored
	ld a, [LastPlayerMove]
	ld [CurPlayerMove], a
	jr .encored

.not_encored
	ld a, [wPlayerAction]
	cp $2
	jp z, .reset_rage
	and a
	jr nz, .reset_bide
	xor a
	ld [wMoveSelectionMenuType], a
	inc a ; ACROBATICS
	ld [FXAnimIDLo], a
	call MoveSelectionScreen
	push af

	call Call_LoadTempTileMapToTileMap
	call UpdateBattleHuds

	ld hl, UnknBGPals
	ld de, UnknBGPals + 6 palettes
	ld bc, 1 palettes
	ld a, $5
	call FarCopyWRAM
	call SetPalettes

	ld a, [CurPlayerMove]
	cp STRUGGLE
	jr z, .struggle
	call PlayClickSFX

.struggle
	ld a, $1
	ld [hBGMapMode], a
	pop af
	ret nz

.encored
	call SetPlayerTurn
	farcall UpdateMoveData
	xor a
	ld [wPlayerCharging], a
	ld a, [wPlayerMoveStruct + MOVE_EFFECT]
	cp EFFECT_FURY_CUTTER
	jr z, .continue_fury_cutter
	xor a
	ld [PlayerFuryCutterCount], a

.continue_fury_cutter
	ld a, [wPlayerMoveStruct + MOVE_EFFECT]
	cp EFFECT_RAGE
	jr z, .continue_rage
	ld hl, PlayerSubStatus4
	res SUBSTATUS_RAGE, [hl]
	xor a
	ld [wPlayerRageCounter], a

.continue_rage
	ld a, [wPlayerMoveStruct + MOVE_EFFECT]
	cp EFFECT_PROTECT
	jr z, .continue_protect
	cp EFFECT_ENDURE
	jr z, .continue_protect
	xor a
	ld [PlayerProtectCount], a
	jr .continue_protect

.reset_bide
	; unsure when this is called, but what this used to do was removed to free up
	; SUBSTATUS_BIDE (it fellthrough to locked_in afterwards)
.locked_in
	xor a
	ld [PlayerFuryCutterCount], a
	ld [PlayerProtectCount], a
	ld [wPlayerRageCounter], a
	ld hl, PlayerSubStatus4
	res SUBSTATUS_RAGE, [hl]

.continue_protect
	call ParseEnemyAction
	xor a
	ret

.reset_rage
	xor a
	ld [PlayerFuryCutterCount], a
	ld [PlayerProtectCount], a
	ld [wPlayerRageCounter], a
	ld hl, PlayerSubStatus4
	res SUBSTATUS_RAGE, [hl]
.lavender_ghost
	xor a
	ret

; 3c4df

HandleEncore: ; 3c4df
	ld a, [hLinkPlayerNumber]
	cp $1
	jr z, .player_1
	call .do_player
	jr .do_enemy

.player_1
	call .do_enemy
.do_player
	ld hl, PlayerSubStatus2
	bit SUBSTATUS_ENCORED, [hl]
	ret z
	ld a, [PlayerEncoreCount]
	dec a
	ld [PlayerEncoreCount], a
	jr z, .end_player_encore
	ld hl, BattleMonPP
	ld a, [CurMoveNum]
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]
	and $3f
	ret nz

.end_player_encore
	ld hl, PlayerSubStatus2
	res SUBSTATUS_ENCORED, [hl]
	call SetEnemyTurn
	ld hl, BattleText_TargetsEncoreEnded
	jp StdBattleTextBox

.do_enemy
	ld hl, EnemySubStatus2
	bit SUBSTATUS_ENCORED, [hl]
	ret z
	ld a, [EnemyEncoreCount]
	dec a
	ld [EnemyEncoreCount], a
	jr z, .end_enemy_encore
	ld hl, EnemyMonPP
	ld a, [CurEnemyMoveNum]
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]
	and $3f
	ret nz

.end_enemy_encore
	ld hl, EnemySubStatus2
	res SUBSTATUS_ENCORED, [hl]
	call SetPlayerTurn
	ld hl, BattleText_TargetsEncoreEnded
	jp StdBattleTextBox
; 3c543


TryEnemyFlee: ; 3c543
	ld a, [wBattleMode]
	dec a
	jr nz, .Stay

	ld a, [EnemyAbility]
	cp RUN_AWAY
	jr z, .skip_traps

	call SetEnemyTurn
	call CheckIfTrappedByAbility_Core
	jr z, .Stay

	ld a, [PlayerSubStatus2]
	bit SUBSTATUS_CANT_RUN, a
	jr nz, .Stay

	ld a, [wEnemyWrapCount]
	and a
	jr nz, .Stay

.skip_traps
	ld a, [EnemyMonStatus]
	and 1 << FRZ | SLP
	jr nz, .Stay

	ld a, [TempEnemyMonSpecies]
	ld de, 1
	ld hl, AlwaysFleeMons
	call IsInArray
	jr c, .Flee

	call BattleRandom
	ld b, a
	cp 1 + (50 percent)
	jr nc, .Stay

	push bc
	ld a, [TempEnemyMonSpecies]
	ld de, 1
	ld hl, OftenFleeMons
	call IsInArray
	pop bc
	jr c, .Flee

	ld a, b
	cp 1 + (10 percent)
	jr nc, .Stay

	ld a, [TempEnemyMonSpecies]
	ld de, 1
	ld hl, SometimesFleeMons
	call IsInArray
	jr c, .Flee

.Stay:
	and a
	ret

.Flee:
	scf
	ret
; 3c59a

FleeMons:

SometimesFleeMons: ; 3c59a
	db MAGNEMITE
	db GRIMER
	db TANGELA
	db TOGEPI
	db TOGETIC
	db MR__MIME
	db EEVEE
	db PORYGON
	db DRATINI
	db DRAGONAIR
	db ESPEON
	db UMBREON
	db UNOWN
	db SNUBBULL
	db HERACROSS
	db PICHU
	db MUNCHLAX
	db TYROGUE
	db ELEKID
	db MAGBY
	db LARVITAR
	db -1

OftenFleeMons: ; 3c5a8
	db TOGEKISS
	db CUBONE
	db QUAGSIRE
	db PHANPY
	db TEDDIURSA
	db -1

AlwaysFleeMons: ; 3c5b1
	db RAIKOU
	db ENTEI
	db -1
; 3c5b4


CompareMovePriority: ; 3c5b4
; Compare the priority of the player and enemy's moves.
; Return carry if the player goes first, or z if they match.
	call SetPlayerTurn
	call GetMovePriority
	ld b, a
	call SetEnemyTurn
	call GetMovePriority
	cp b
	ret
; 3c5c5

GetMovePriority: ; 3c5c5
; Return the priority (0-9) of move being used.
	push bc
	ld a, BATTLE_VARS_MOVE
	call GetBattleVar
	ld b, a
	ld hl, MoveEffectPriorities
.loop
	ld a, [hli]
	cp b
	jr z, .done
	inc hl
	cp -1
	jr nz, .loop

	xor a
	jr .check_prankster
.done
	ld a, [hl]
.check_prankster
	xor $80 ; treat it as a signed byte
	ld b, a
	ld a, BATTLE_VARS_ABILITY
	call GetBattleVar
	cp PRANKSTER
	jr nz, .no_priority
	ld a, BATTLE_VARS_MOVE_CATEGORY
	call GetBattleVar
	cp STATUS
	jr nz, .no_priority
	inc b
.no_priority
	ld a, b
	pop bc
	ret


MoveEffectPriorities: ; 3c5df
	db PROTECT,      4
	db ENDURE,       4
	db EXTREMESPEED, 2
	db SUCKER_PUNCH, 1
	db BULLET_PUNCH, 1
	db ICE_SHARD,    1
	db MACH_PUNCH,   1
	db QUICK_ATTACK, 1
	; everything else at 0
	db AVALANCHE,    -4
	db COUNTER,      -5
	db MIRROR_COAT,  -5
	db ROAR,         -6
	db -1


GetMoveEffect: ; 3c5ec
	ld a, b
	dec a
	ld hl, Moves + MOVE_EFFECT
	ld bc, MOVE_LENGTH
	call AddNTimes
	ld a, BANK(Moves)
	call GetFarByte
	ld b, a
	ret
; 3c5fe


Battle_EnemyFirst: ; 3c5fe
	call LoadTileMapToTempTileMap
	call TryEnemyFlee
	jp c, WildFled_EnemyFled_LinkBattleCanceled
	call SetEnemyTurn
	ld a, $1
	ld [wEnemyGoesFirst], a
	farcall AI_SwitchOrTryItem
	jr c, .switch_item
	call EnemyTurn_EndOpponentProtectEndureDestinyBond
	ld a, [wForcedSwitch]
	and a
	ret nz
	call HasPlayerFainted
	jp z, HandlePlayerMonFaint
	call HasEnemyFainted
	jp z, HandleEnemyMonFaint

.switch_item
	call SetEnemyTurn
	call HasUserFainted
	jp z, HandleEnemyMonFaint
	call RefreshBattleHuds
	call PlayerTurn_EndOpponentProtectEndureDestinyBond
	ld a, [wForcedSwitch]
	and a
	ret nz
	call HasEnemyFainted
	jp z, HandleEnemyMonFaint
	call HasPlayerFainted
	jp z, HandlePlayerMonFaint
	call SetPlayerTurn
	call HasUserFainted
	jp z, HandlePlayerMonFaint
	call RefreshBattleHuds
	xor a
	ld [wPlayerAction], a
	ret
; 3c664

Battle_PlayerFirst: ; 3c664
	xor a
	ld [wEnemyGoesFirst], a
	call SetEnemyTurn
	farcall AI_SwitchOrTryItem
	push af
	call PlayerTurn_EndOpponentProtectEndureDestinyBond
	pop bc
	ld a, [wForcedSwitch]
	and a
	ret nz
	call HasEnemyFainted
	jp z, HandleEnemyMonFaint
	call HasPlayerFainted
	jp z, HandlePlayerMonFaint
	push bc
	call SetPlayerTurn
	call HasUserFainted
	pop bc
	jp z, HandlePlayerMonFaint
	push bc
	call RefreshBattleHuds
	pop af
	jr c, .switched_or_used_item
	call LoadTileMapToTempTileMap
	call TryEnemyFlee
	jp c, WildFled_EnemyFled_LinkBattleCanceled
	call EnemyTurn_EndOpponentProtectEndureDestinyBond
	ld a, [wForcedSwitch]
	and a
	ret nz
	call HasPlayerFainted
	jp z, HandlePlayerMonFaint
	call HasEnemyFainted
	jp z, HandleEnemyMonFaint

.switched_or_used_item
	call SetEnemyTurn
	call HasUserFainted
	jp z, HandleEnemyMonFaint
	call RefreshBattleHuds
	xor a
	ld [wPlayerAction], a
	ret
; 3c6cf

PlayerTurn_EndOpponentProtectEndureDestinyBond: ; 3c6cf
	call SetPlayerTurn
	call EndUserDestinyBond
	farcall DoPlayerTurn
	jp EndOpponentProtectEndureDestinyBond
; 3c6de

EnemyTurn_EndOpponentProtectEndureDestinyBond: ; 3c6de
	call SetEnemyTurn
	call EndUserDestinyBond
	farcall DoEnemyTurn
	jp EndOpponentProtectEndureDestinyBond
; 3c6ed

EndOpponentProtectEndureDestinyBond: ; 3c6ed
	ld a, BATTLE_VARS_SUBSTATUS1_OPP
	call GetBattleVarAddr
	res SUBSTATUS_PROTECT, [hl]
	res SUBSTATUS_ENDURE, [hl]
	ld a, BATTLE_VARS_SUBSTATUS2_OPP
	call GetBattleVarAddr
	res SUBSTATUS_DESTINY_BOND, [hl]
	ret
; 3c6fe

EndUserDestinyBond: ; 3c6fe
	ld a, BATTLE_VARS_SUBSTATUS2
	call GetBattleVarAddr
	res SUBSTATUS_DESTINY_BOND, [hl]
	ret
; 3c706

HasUserFainted: ; 3c706
	ld a, [hBattleTurn]
	and a
	jr z, HasPlayerFainted
HasEnemyFainted: ; 3c70b
	ld hl, EnemyMonHP
	jr CheckIfHPIsZero

HasPlayerFainted: ; 3c710
	ld hl, BattleMonHP

CheckIfHPIsZero: ; 3c713
	ld a, [hli]
	or [hl]
	ret
; 3c716

HandleResidualDamage:
	call CheckSpeed
	jr nz, .enemy_first
	call SetPlayerTurn
	call .do_it
	call SetEnemyTurn
	jp .do_it

.enemy_first
	call SetEnemyTurn
	call .do_it
	call SetPlayerTurn

.do_it
	call HasUserFainted
	ret z

	; Magic guard prevents everything here
	ld a, BATTLE_VARS_ABILITY
	call GetBattleVar
	cp MAGIC_GUARD
	ret z

	ld a, BATTLE_VARS_STATUS
	call GetBattleVar
	and 1 << PSN | 1 << BRN
	jp z, .did_psn_brn
	ld hl, HurtByBurnText
	ld de, ANIM_BRN
	and 1 << PSN
	jr z, .got_anim
	ld hl, HurtByPoisonText
	ld de, ANIM_PSN
	push hl
	push de
	ld a, BATTLE_VARS_ABILITY
	call GetBattleVar
	pop de
	pop hl
	and a
	cp POISON_HEAL
	jr nz, .got_anim
	; check if we are at full HP
	call CheckFullHP
	jp z, .did_psn_brn
	ld hl, PoisonHealText
	ld de, ANIM_PSN
	push de
	call StdBattleTextBox
	pop de
	xor a
	ld [wNumHits], a
	call Call_PlayBattleAnim_OnlyIfVisible
	call GetEighthMaxHP
	call RestoreHP
	jp .did_psn_brn
.got_anim

	push de
	call StdBattleTextBox
	pop de

	xor a
	ld [wNumHits], a
	call Call_PlayBattleAnim_OnlyIfVisible

	ld a, BATTLE_VARS_STATUS
	call GetBattleVar
	and 1 << BRN
	jr nz, .burn_damage_amount
	call GetEighthMaxHP
	jr .got_damage_amount
.burn_damage_amount
	; Burn does 1/16 damage as of Gen VII
	call GetSixteenthMaxHP
.got_damage_amount
	ld de, PlayerToxicCount
	ld a, [hBattleTurn]
	and a
	jr z, .check_toxic
	ld de, EnemyToxicCount
.check_toxic

	ld a, BATTLE_VARS_SUBSTATUS2
	call GetBattleVar
	bit SUBSTATUS_TOXIC, a
	jr z, .did_toxic
	call GetSixteenthMaxHP
	ld a, [de]
	inc a
	ld [de], a
	ld hl, 0
.add
	add hl, bc
	dec a
	jr nz, .add
	ld b, h
	ld c, l
.did_toxic

	call SubtractHPFromUser
.did_psn_brn

	call HasUserFainted
	ret z

	ld a, BATTLE_VARS_SUBSTATUS4
	call GetBattleVarAddr
	bit SUBSTATUS_LEECH_SEED, [hl]
	jr z, .not_seeded

	call SwitchTurn
	xor a
	ld [wNumHits], a
	ld de, ANIM_SAP
	ld a, BATTLE_VARS_SUBSTATUS3_OPP
	call GetBattleVar
	and 1 << SUBSTATUS_FLYING | 1 << SUBSTATUS_UNDERGROUND
	call z, Call_PlayBattleAnim_OnlyIfVisible
	call SwitchTurn

	call GetEighthMaxHP
	call SubtractHPFromUser
	ld a, $1
	ld [hBGMapMode], a
	ld a, BATTLE_VARS_ABILITY
	call GetBattleVar
	cp LIQUID_OOZE
	jr z, .hurt
	call RestoreEnemyHP
	jr .sap_text
.hurt
	farcall ShowAbilityActivation
	call SwitchTurn
	call SubtractHPFromUser
	call SwitchTurn
.sap_text
	ld hl, LeechSeedSapsText
	call StdBattleTextBox
.not_seeded

	call HasUserFainted
	ret z

	ld a, BATTLE_VARS_SUBSTATUS1
	call GetBattleVarAddr
	bit SUBSTATUS_CURSE, [hl]
	ret z

	xor a
	ld [wNumHits], a
	ld de, ANIM_UNDER_CURSE
	call Call_PlayBattleAnim_OnlyIfVisible
	call GetQuarterMaxHP
	call SubtractHPFromUser
	ld hl, HurtByCurseText
	jp StdBattleTextBox
; 3c801

CheckFullHP_b:
; Checks full HP and sets b to 0 if full, 1 otherwise.
; Used by effect_commands since farcalls kill flags.
	call CheckFullHP
	jr z, .is_full
	ld b, 1
	ret
.is_full
	ld b, 0
	ret

CheckFullHP:
; check if the user has full HP
; z: yes, nz: no
	ld hl, BattleMonHP
	ld a, [hBattleTurn]
	and a
	jr z, .got_hp
	ld hl, EnemyMonHP
.got_hp
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	cp b
	ret nz
	ld a, [hl]
	cp c
	ret

HandlePerishSong: ; 3c801
	call CheckSpeed
	jr nz, .enemy_first
	call SetPlayerTurn
	call .do_it
	call SetEnemyTurn
	jp .do_it

.enemy_first
	call SetEnemyTurn
	call .do_it
	call SetPlayerTurn

.do_it
	ld hl, PlayerPerishCount
	ld a, [hBattleTurn]
	and a
	jr z, .got_count
	ld hl, EnemyPerishCount

.got_count
	ld a, BATTLE_VARS_SUBSTATUS1
	call GetBattleVar
	bit SUBSTATUS_PERISH, a
	ret z
	dec [hl]
	ld a, [hl]
	ld [wd265], a
	push af
	ld hl, PerishCountText
	call StdBattleTextBox
	pop af
	ret nz
	ld a, BATTLE_VARS_SUBSTATUS1
	call GetBattleVarAddr
	res SUBSTATUS_PERISH, [hl]
	ld a, [hBattleTurn]
	and a
	jr nz, .kill_enemy
	ld hl, BattleMonHP
	xor a
	ld [hli], a
	ld [hl], a
	ld hl, PartyMon1HP
	ld a, [CurBattleMon]
	call GetPartyLocation
	xor a
	ld [hli], a
	ld [hl], a
	ret

.kill_enemy
	ld hl, EnemyMonHP
	xor a
	ld [hli], a
	ld [hl], a
	ld a, [wBattleMode]
	dec a
	ret z
	ld hl, OTPartyMon1HP
	ld a, [CurOTMon]
	call GetPartyLocation
	xor a
	ld [hli], a
	ld [hl], a
	ret
; 3c874

HandleWrap: ; 3c874
	call CheckSpeed
	jr nz, .enemy_first
	call SetPlayerTurn
	call .do_it
	call SetEnemyTurn
	jp .do_it

.enemy_first
	call SetEnemyTurn
	call .do_it
	call SetPlayerTurn

.do_it
	ld hl, wPlayerWrapCount
	ld de, wPlayerTrappingMove
	ld a, [hBattleTurn]
	and a
	jr z, .got_addrs
	ld hl, wEnemyWrapCount
	ld de, wEnemyTrappingMove

.got_addrs
	ld a, [hl]
	and a
	ret z

	ld a, BATTLE_VARS_SUBSTATUS4
	call GetBattleVar
	bit SUBSTATUS_SUBSTITUTE, a
	ret nz

	ld a, [de]
	ld [wd265], a
	ld [FXAnimIDLo], a
	call GetMoveName
	dec [hl]
	jr z, .release_from_bounds

	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVar
	and 1 << SUBSTATUS_FLYING | 1 << SUBSTATUS_UNDERGROUND
	jr nz, .skip_anim

	call SwitchTurn
	xor a
	ld [wNumHits], a
	ld [FXAnimIDHi], a
	predef PlayBattleAnim
	call SwitchTurn

.skip_anim
	call GetEighthMaxHP
	call SubtractHPFromUser
	ld hl, BattleText_UsersHurtByStringBuffer1
	jr .print_text

.release_from_bounds
	ld hl, BattleText_UserWasReleasedFromStringBuffer1

.print_text
	jp StdBattleTextBox
; 3c8e4

HandleLeftovers: ; 3c8eb
	call CheckSpeed
	jr nz, .enemy_first
	call SetPlayerTurn
	call .do_it
	call SetEnemyTurn
	jr .do_it

.enemy_first
	call SetEnemyTurn
	call .do_it
	call SetPlayerTurn

.do_it
	farcall GetUserItem
	ld a, [hl]
	ld [wd265], a
	call GetItemName
	ld a, b
	cp HELD_LEFTOVERS
	ret nz

	call CheckFullHP
	ret z
	call GetSixteenthMaxHP
	call RestoreHP
	ld hl, BattleText_UserRecoveredWithItem
	jp StdBattleTextBox
; 3c93c

HandleLeppaBerry: ; 3c93c
	call CheckSpeed
	jr nz, .enemy_first
	call SetPlayerTurn
	call .do_it
	call SetEnemyTurn
	jp .do_it

.enemy_first
	call SetEnemyTurn
	call .do_it
	call SetPlayerTurn

.do_it
	farcall GetUserItemAfterUnnerve
	ld a, b
	cp HELD_RESTORE_PP
	jr nz, .quit
	ld hl, PartyMon1PP
	ld a, [CurBattleMon]
	call GetPartyLocation
	ld d, h
	ld e, l
	ld hl, PartyMon1Moves
	ld a, [CurBattleMon]
	call GetPartyLocation
	ld a, [hBattleTurn]
	and a
	jr z, .wild
	ld de, wWildMonPP
	ld hl, wWildMonMoves
	ld a, [wBattleMode]
	dec a
	jr z, .wild
	ld hl, OTPartyMon1PP
	ld a, [CurOTMon]
	call GetPartyLocation
	ld d, h
	ld e, l
	ld hl, OTPartyMon1Moves
	ld a, [CurOTMon]
	call GetPartyLocation

.wild
	ld c, $0
.loop
	ld a, [hl]
	and a
	jr z, .quit
	ld a, [de]
	and $3f
	jr z, .restore
	inc hl
	inc de
	inc c
	ld a, c
	cp NUM_MOVES
	jr nz, .loop

.quit
	ret

.restore
	; lousy hack
	ld a, [hl]
	cp SKETCH
	ld b, 1
	jr z, .sketch
	ld b, 5
.sketch
	ld a, [de]
	add b
	ld [de], a
	push bc
	push bc
	ld a, [hl]
	ld [wd265], a
	ld de, BattleMonMoves - 1
	ld hl, BattleMonPP
	ld a, [hBattleTurn]
	and a
	jr z, .player_pp
	ld de, EnemyMonMoves - 1
	ld hl, EnemyMonPP
.player_pp
	inc de
	pop bc
	ld b, 0
	add hl, bc
	push hl
	ld h, d
	ld l, e
	add hl, bc
	pop de
	pop bc

	ld a, [wd265]
	cp [hl]
	jr nz, .skip_checks
	ld a, [hBattleTurn]
	and a
	ld a, [PlayerSubStatus2]
	jr z, .check_transform
	ld a, [EnemySubStatus2]
.check_transform
	bit SUBSTATUS_TRANSFORMED, a
	jr nz, .skip_checks
	ld a, [de]
	add b
	ld [de], a
.skip_checks
	farcall GetUserItem
	ld a, [hl]
	ld [wd265], a
	xor a
	ld [hl], a
	call GetPartymonItem
	ld a, [hBattleTurn]
	and a
	jr z, .consume_item
	ld a, [wBattleMode]
	dec a
	jr z, .skip_consumption
	call GetOTPartymonItem

.consume_item
	xor a
	ld [hl], a

.skip_consumption
	call GetItemName
	call ItemRecoveryAnim
	ld hl, BattleText_UserRecoveredPPUsing
	jp StdBattleTextBox
; 3ca26

HandleFutureSight: ; 3ca26
	call CheckSpeed
	jr nz, .enemy_first
	call SetPlayerTurn
	call .do_it
	call SetEnemyTurn
	jp .do_it

.enemy_first
	call SetEnemyTurn
	call .do_it
	call SetPlayerTurn

.do_it
	ld hl, wPlayerFutureSightCount
	ld a, [hBattleTurn]
	and a
	jr z, .okay
	ld hl, wEnemyFutureSightCount

.okay
	ld a, [hl]
	and a
	ret z
	dec a
	ld [hl], a
	cp $1
	ret nz

	ld hl, BattleText_TargetWasHitByFutureSight
	call StdBattleTextBox

	ld a, BATTLE_VARS_MOVE
	call GetBattleVarAddr
	push af
	ld a, FUTURE_SIGHT
	ld [hl], a

	farcall UpdateMoveData
	xor a
	ld [AttackMissed], a
	ld [AlreadyDisobeyed], a
	ld a, $10
	ld [TypeModifier], a
	farcall DoMove
	xor a
	ld [CurDamage], a
	ld [CurDamage + 1], a

	ld a, BATTLE_VARS_MOVE
	call GetBattleVarAddr
	pop af
	ld [hl], a

	call UpdateBattleMonInParty
	jp UpdateEnemyMonInParty
; 3ca8f

HandleSafeguard: ; 3cafb
	call CheckSpeed
	jr nz, .enemy_first
	call .CheckPlayer
	jr .CheckEnemy

.enemy_first
	call .CheckEnemy
.CheckPlayer:
	ld a, [PlayerScreens]
	bit SCREENS_SAFEGUARD, a
	ret z
	ld hl, PlayerSafeguardCount
	dec [hl]
	ret nz
	res SCREENS_SAFEGUARD, a
	ld [PlayerScreens], a
	xor a
	jr .print

.CheckEnemy:
	ld a, [EnemyScreens]
	bit SCREENS_SAFEGUARD, a
	ret z
	ld hl, EnemySafeguardCount
	dec [hl]
	ret nz
	res SCREENS_SAFEGUARD, a
	ld [EnemyScreens], a
	ld a, $1

.print
	ld [hBattleTurn], a
	ld hl, BattleText_SafeguardFaded
	jp StdBattleTextBox


HandleScreens: ; 3cb36
	call CheckSpeed
	jr nz, .enemy_first

	call .CheckPlayer
	jr .CheckEnemy

.enemy_first
	call .CheckEnemy
.CheckPlayer:
	call SetPlayerTurn
	ld de, .Your
	call .Copy
	ld hl, PlayerScreens
	ld de, PlayerLightScreenCount
	jr .TickScreens

.CheckEnemy:
	call SetEnemyTurn
	ld de, .Enemy
	call .Copy
	ld hl, EnemyScreens
	ld de, EnemyLightScreenCount

.TickScreens:
	bit SCREENS_LIGHT_SCREEN, [hl]
	call nz, .LightScreenTick
	bit SCREENS_REFLECT, [hl]
	call nz, .ReflectTick
	ret

.Copy:
	ld hl, StringBuffer1
	jp CopyName2
; 3cb75

.Your:
	db "Your@"
.Enemy:
	db "Foe@"
; 3cb80


.LightScreenTick: ; 3cb80
	ld a, [de]
	dec a
	ld [de], a
	ret nz
	res SCREENS_LIGHT_SCREEN, [hl]
	push hl
	push de
	ld hl, BattleText_PkmnLightScreenFell
	call StdBattleTextBox
	pop de
	pop hl
	ret
; 3cb91

.ReflectTick: ; 3cb91
	inc de
	ld a, [de]
	dec a
	ld [de], a
	ret nz
	res SCREENS_REFLECT, [hl]
	ld hl, BattleText_PkmnReflectFaded
	jp StdBattleTextBox
; 3cb9e

HandleWeather: ; 3cb9e
	ld a, [Weather]
	cp WEATHER_NONE
	ret z

	ld hl, WeatherCount
	dec [hl]
	jp z, .ended

	; the above needs actual [Weather] to be
	; able to time it out, but otherwise check
	; Cloud Nine
	call GetWeatherAfterCloudNine
	cp WEATHER_NONE
	ret z

	ld hl, .WeatherMessages
	call .PrintWeatherMessage
	call SetPlayerTurn
	call .ShowWeatherAnimation

	call CheckSpeed
	jr nz, .enemy_first
	call SetPlayerTurn
	call HandleWeatherEffects
	call SetEnemyTurn
	jp HandleWeatherEffects

.enemy_first
	call SetEnemyTurn
	call HandleWeatherEffects
	call SetPlayerTurn
	jp HandleWeatherEffects

.ended
	ld hl, .WeatherEndedMessages
	call .PrintWeatherMessage
	xor a
	ld [Weather], a
	ret

.PrintWeatherMessage:
	ld a, [Weather]
	dec a
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp StdBattleTextBox

.ShowWeatherAnimation:
	ld hl, .WeatherAnimations
	ld a, [Weather]
	dec a
	ld b, 0
	ld c, a
	add hl, bc
	ld d, 0
	ld e, [hl]
	jp Call_PlayBattleAnim

.WeatherMessages:
	dw BattleText_RainContinuesToFall
	dw BattleText_TheSunlightIsStrong
	dw BattleText_TheSandstormRages
	dw BattleText_TheHailContinuesToFall
.WeatherEndedMessages:
	dw BattleText_TheRainStopped
	dw BattleText_TheSunlightFaded
	dw BattleText_TheSandstormSubsided
	dw BattleText_TheHailStopped
.WeatherAnimations:
	db RAIN_DANCE
	db SUNNY_DAY
	; TODO: use ANIM_IN_SANDSTORM and ANIM_IN_HAIL (16-bit values)
	db SANDSTORM
	db HAIL
; 3cc39

HandleWeatherEffects:
; sandstorm/hail damage, abilities like rain dish, etc.
	call GetWeatherAfterCloudNine
	cp WEATHER_HAIL
	call z, .HandleHail
	call GetWeatherAfterCloudNine
	cp WEATHER_SANDSTORM
	call z, .HandleSandstorm
	farcall RunWeatherAbilities
	ret

.HandleSandstorm
	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVar
	bit SUBSTATUS_UNDERGROUND, a
	ret nz
	ld a, BATTLE_VARS_ABILITY
	call GetBattleVar
	cp MAGIC_GUARD
	ret z
	cp OVERCOAT
	ret z
	cp SAND_FORCE
	ret z
	cp SAND_RUSH
	ret z
	cp SAND_VEIL
	ret z

	call CheckIfUserIsGroundType
	ret z
	call CheckIfUserIsRockType
	ret z
	call CheckIfUserIsSteelType
	ret z

	ld hl, SandstormHitsText
	call StdBattleTextBox

	call GetSixteenthMaxHP
	jp SubtractHPFromUser

.HandleHail
	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVar
	bit SUBSTATUS_UNDERGROUND, a
	ret nz
	ld a, BATTLE_VARS_ABILITY
	call GetBattleVar
	cp MAGIC_GUARD
	ret z
	cp OVERCOAT
	ret z
	cp SNOW_CLOAK
	ret z
	cp ICE_BODY
	ret z

	call CheckIfUserIsIceType
	ret z
	ld hl, HailHitsText
	jp StdBattleTextBox

	call GetSixteenthMaxHP
	jp SubtractHPFromUser

SubtractHPFromTarget: ; 3cc39
	call SubtractHP
	jp UpdateHPBar
; 3cc3f

SubtractHPFromUser: ; 3cc3f
; Subtract HP from Pkmn
	call SubtractHP
	jp UpdateHPBarBattleHuds
; 3cc45


SubtractHP: ; 3cc45
	ld hl, BattleMonHP
	ld a, [hBattleTurn]
	and a
	jr z, .ok
	ld hl, EnemyMonHP
.ok
	inc hl
	ld a, [hl]
	ld [Buffer3], a
	sub c
	ld [hld], a
	ld [Buffer5], a
	ld a, [hl]
	ld [Buffer4], a
	sbc b
	ld [hl], a
	ld [Buffer6], a
	ret nc

	ld a, [Buffer3]
	ld c, a
	ld a, [Buffer4]
	ld b, a
	xor a
	ld [hli], a
	ld [hl], a
	ld [Buffer5], a
	ld [Buffer6], a
	ret
; 3cc76

GetSixteenthMaxHP: ; 3cc76
	call GetQuarterMaxHP
	; quarter result
	srl c
	srl c
	; round up
	ld a, c
	and a
	jr nz, .ok
	inc c
.ok
	ret
; 3cc83


GetEighthMaxHP: ; 3cc83
; output: bc
	call GetQuarterMaxHP
; assumes nothing can have 1024 or more hp
; halve result
	srl c
; round up
	ld a, c
	and a
	jr nz, .end
	inc c
.end
	ret
; 3cc8e


GetQuarterMaxHP: ; 3cc8e
; output: bc
	call GetMaxHP

; quarter result
	srl b
	rr c
	srl b
	rr c

; assumes nothing can have 1024 or more hp
; round up
	ld a, c
	and a
	jr nz, .end
	inc c
.end
	ret
; 3cc9f


GetThirdMaxHP::
; divides by 3 without using arithmetic helpers (screws up dam calc)
; Parts of this function relies on the fact that the result can't
; be more than 1 byte (Blissey's base 255 HP is at most 718 at L100)
; This works because x/3 is x/4 + x/16 + x/64 + ...
	call GetMaxHP
	push de
	ld d, 0
	; if b is nonzero, involve b in the bitshift
	ld a, b
	and a
	ld a, c
	jr z, .loop

	and 3
	ld e, a
	srl b
	rr c
	srl b
	rr c
	jr .postshift
.loop
	cp 3
	jr c, .loop_end_skip_add
	jr z, .loop_end
	and 3
	ld e, a
	srl c
	srl c
.postshift
	ld a, d
	add c
	ld d, a
	ld a, c
	add e
	ld c, a
	jr .loop
.loop_end
	inc d
.loop_end_skip_add
	ld a, d
	pop de
; floor = 1
	and a
	ld c, a
	jr nz, .end
	inc c
.end
	ret
; 3ccac


GetHalfMaxHP: ; 3cc9f
; output: bc
	call GetMaxHP

; halve result
	srl b
	rr c

; floor = 1
	ld a, c
	or b
	jr nz, .end
	inc c
.end
	ret
; 3ccac


GetMaxHP: ; 3ccac
; output: bc, Buffer1-2

	ld hl, BattleMonMaxHP
	ld a, [hBattleTurn]
	and a
	jr z, .ok
	ld hl, EnemyMonMaxHP
.ok
	ld a, [hli]
	ld [Buffer2], a
	ld b, a

	ld a, [hl]
	ld [Buffer1], a
	ld c, a
	ret
; 3ccc2

RestoreEnemyHP:
	call SwitchTurn
	call RestoreHP
	jp SwitchTurn

RestoreHP ; 3ccef
	ld hl, BattleMonMaxHP
	ld a, [hBattleTurn]
	and a
	jr z, .ok
	ld hl, EnemyMonMaxHP
.ok
	ld a, [hli]
	ld [Buffer2], a
	ld a, [hld]
	ld [Buffer1], a
	dec hl
	ld a, [hl]
	ld [Buffer3], a
	add c
	ld [hld], a
	ld [Buffer5], a
	ld a, [hl]
	ld [Buffer4], a
	adc b
	ld [hli], a
	ld [Buffer6], a

	ld a, [Buffer1]
	ld c, a
	ld a, [hld]
	sub c
	ld a, [Buffer2]
	ld b, a
	ld a, [hl]
	sbc b
	jr c, UpdateHPBarBattleHuds
	ld a, b
	ld [hli], a
	ld [Buffer6], a
	ld a, c
	ld [hl], a
	ld [Buffer5], a
	; fallthrough

UpdateHPBarBattleHuds: ; 3cd36
	call UpdateHPBar
	jp UpdateBattleHuds
; 3cd3c

UpdateHPBar: ; 3cd3c
	hlcoord 11, 9
	ld a, [hBattleTurn]
	and a
	ld a, 1
	jr z, .ok
	hlcoord 1, 2
	xor a
.ok
	push bc
	ld [wWhichHPBar], a
	predef AnimateHPBar
	pop bc
	ret
; 3cd55

HandleEnemyMonFaint: ; 3cd55
	call FaintEnemyPokemon
	ld hl, BattleMonHP
	ld a, [hli]
	or [hl]
	call z, FaintYourPokemon
	xor a
	ld [wWhichMonFaintedFirst], a
	call UpdateBattleStateAndExperienceAfterEnemyFaint
	call CheckPlayerPartyForFitPkmn
	ld a, d
	and a
	jp z, LostBattle

	ld hl, BattleMonHP
	ld a, [hli]
	or [hl]
	call nz, UpdatePlayerHUD

	ld a, $1
	ld [hBGMapMode], a
	ld c, 60
	call DelayFrames

	ld a, [wBattleMode]
	dec a
	jr nz, .trainer

	ld a, 1
	ld [BattleEnded], a
	ret

.trainer
	call CheckEnemyTrainerDefeated
	jp z, WinTrainerBattle

	ld hl, BattleMonHP
	ld a, [hli]
	or [hl]
	jr nz, .player_mon_not_fainted

	call AskUseNextPokemon
	jr nc, .dont_flee

	ld a, 1
	ld [BattleEnded], a
	ret

.dont_flee
	call ForcePlayerMonChoice

	ld a, $1
	ld [wPlayerAction], a
	call HandleEnemySwitch
	jp z, WildFled_EnemyFled_LinkBattleCanceled
	jr DoubleSwitch

.player_mon_not_fainted
	ld a, $1
	ld [wPlayerAction], a
	call HandleEnemySwitch
	jp z, WildFled_EnemyFled_LinkBattleCanceled
	xor a
	ld [wPlayerAction], a
	ret
; 3cdca

DoubleSwitch: ; 3cdca
	ld a, [hLinkPlayerNumber]
	cp $1
	jr z, .player_1
	call ClearSprites
	hlcoord 0, 0
	lb bc, 4, 11
	call ClearBox
	call PlayerPartyMonEntrance
	ld a, $1
	call EnemyPartyMonEntrance
	jr .done

.player_1
	ld a, [CurPartyMon]
	push af
	ld a, $1
	call EnemyPartyMonEntrance
	call ClearSprites
	call LoadTileMapToTempTileMap
	pop af
	ld [CurPartyMon], a
	call PlayerPartyMonEntrance

.done
	xor a
	ld [wPlayerAction], a
	ret
; 3ce01

UpdateBattleStateAndExperienceAfterEnemyFaint: ; 3ce01
	call UpdateBattleMonInParty
	ld a, [wBattleMode]
	dec a
	jr z, .wild
	ld a, [CurOTMon]
	ld hl, OTPartyMon1HP
	call GetPartyLocation
	xor a
	ld [hli], a
	ld [hl], a

.wild
	ld hl, PlayerSubStatus3
	res SUBSTATUS_IN_LOOP, [hl]
	xor a
	ld hl, EnemyDamageTaken
	ld [hli], a
	ld [hl], a
	call NewEnemyMonStatus
	call BreakAttraction
	ld a, [wBattleMode]
	dec a
	jr z, .wild2
	jr .trainer

.wild2
	call StopDangerSound
	ld a, $1
	ld [wDanger], a

.trainer
	ld hl, BattleMonHP
	ld a, [hli]
	or [hl]
	jr nz, .player_mon_did_not_faint
	ld a, [wWhichMonFaintedFirst]
	and a
	jr nz, .player_mon_did_not_faint
	call PlayerMonFaintHappinessMod

.player_mon_did_not_faint
	call CheckPlayerPartyForFitPkmn
	ld a, d
	and a
	ret z
	ld a, [wBattleMode]
	dec a
	call z, PlayVictoryMusic
	call EmptyBattleTextBox
	call LoadTileMapToTempTileMap
	ld a, [wBattleResult]
	and $c0
	ld [wBattleResult], a

GiveExperiencePointsAfterCatch:
	call IsAnyMonHoldingExpShare
	ld a, [wBattleParticipantsNotFainted]
	push af
	or d
	ld [wBattleParticipantsNotFainted], a
	xor a
	ld [wGivingExperienceToExpShareHolders], a
	call GiveExperiencePoints
	pop af
	ld [wBattleParticipantsNotFainted], a
	ret
; 3ceaa

IsAnyMonHoldingExpShare: ; 3ceaa
	ld a, [PartyCount]
	ld b, a
	ld hl, PartyMon1
	ld c, 1
	ld d, 0
.loop
	push hl
	push bc
	ld bc, MON_HP
	add hl, bc
	ld a, [hli]
	or [hl]
	pop bc
	pop hl
	jr z, .next

	push hl
	push bc
	ld bc, MON_ITEM
	add hl, bc
	pop bc
	ld a, [hl]
	pop hl

	cp EXP_SHARE
	jr nz, .next
	ld a, d
	or c
	ld d, a

.next
	sla c
	push de
	ld de, PARTYMON_STRUCT_LENGTH
	add hl, de
	pop de
	dec b
	jr nz, .loop

	ld a, d
	ld e, 0
	ld b, PARTY_LENGTH
.loop2
	srl a
	jr nc, .okay
	inc e

.okay
	dec b
	jr nz, .loop2
	ld a, e
	and a
	ret
; 3ceec



StopDangerSound: ; 3ceec
	xor a
	ld [Danger], a
	ret
; 3cef1

FaintYourPokemon: ; 3cef1
	call StopDangerSound
	call WaitSFX
	ld a, $f0
	ld [CryTracks], a
	ld a, [BattleMonSpecies]
	ld b, a
	farcall PlayFaintingCry
	call PlayerMonFaintedAnimation
	hlcoord 9, 7
	lb bc, 5, 11
	call ClearBox
	ld hl, BattleText_PkmnFainted
	jp StdBattleTextBox
; 3cf14

FaintEnemyPokemon: ; 3cf14
	call WaitSFX
	ld a, $f
	ld [CryTracks], a
	ld a, [EnemyMonSpecies]
	ld b, a
	farcall PlayFaintingCry
	ld de, SFX_KINESIS
	call PlaySFX
	call EnemyMonFaintedAnimation
	ld de, SFX_FAINT
	call PlaySFX
	hlcoord 0, 0
	lb bc, 4, 11
	call ClearBox
	ld hl, BattleText_EnemyPkmnFainted
	jp StdBattleTextBox
; 3cf35

CheckEnemyTrainerDefeated: ; 3cf35
	ld a, [OTPartyCount]
	ld b, a
	xor a
	ld hl, OTPartyMon1HP
	ld de, PARTYMON_STRUCT_LENGTH

.loop
	or [hl]
	inc hl
	or [hl]
	dec hl
	add hl, de
	dec b
	jr nz, .loop

	and a
	ret
; 3cf4a

HandleEnemySwitch: ; 3cf4a
	ld hl, EnemyHPPal
	ld e, HP_BAR_LENGTH_PX
	call UpdateHPPal
	call WaitBGMap
	farcall EnemySwitch_TrainerHud
	ld a, [wLinkMode]
	and a
	jr z, .not_linked

	call LinkBattleSendReceiveAction
	ld a, [wBattleAction]
	cp BATTLEACTION_FORFEIT
	ret z

	call Call_LoadTempTileMapToTileMap

.not_linked
	ld hl, BattleMonHP
	ld a, [hli]
	or [hl]
	ld a, 0 ; not xor a; preserve carry flag
	jr nz, EnemyPartyMonEntrance
	inc a
	ret
; 3cf78

EnemyPartyMonEntrance: ; 3cf78
	push af
	xor a
	ld [wEnemySwitchMonIndex], a
	call NewEnemyMonStatus
	call ResetEnemyStatLevels
	call BreakAttraction
	pop af
	and a
	jr nz, .set
	call EnemySwitch
	jr .done_switch

.set
	call EnemySwitch_SetMode
.done_switch
	call ResetBattleParticipants
	call SetEnemyTurn
	call SpikesDamage
	call RunActivationAbilities
	xor a
	ld [wEnemyMoveStruct + MOVE_ANIM], a
	ld [wPlayerAction], a
	inc a
	ret
; 3cfa4

WinTrainerBattle: ; 3cfa4
; Player won the battle
	call StopDangerSound
	ld a, $1
	ld [wDanger], a
	ld [BattleEnded], a
	ld a, [wLinkMode]
	and a
	ld a, b
	call z, PlayVictoryMusic
	farcall Battle_GetTrainerName

	ld hl, BattleText_EnemyWereDefeated
	call CheckPluralTrainer
	jr nz, .PlaceBattleEndText
	ld hl, BattleText_EnemyWasDefeated

.PlaceBattleEndText
	call StdBattleTextBox

	ld a, [wLinkMode]
	and a
	ret nz

	ld a, [InBattleTowerBattle]
	bit 0, a
	jr nz, .battle_tower

	call BattleWinSlideInEnemyTrainerFrontpic
	ld c, 40
	call DelayFrames
	ld a, [BattleType]
	cp BATTLETYPE_CANLOSE
	jr nz, .skip_heal
	predef HealParty
.skip_heal
	ld a, [wMonStatusFlags]
	bit 0, a
	jr nz, .skip_win_loss_text
	call PrintWinLossText

.skip_win_loss_text
	jp .GiveMoney

.battle_tower
	call BattleWinSlideInEnemyTrainerFrontpic
	ld c, 40
	call DelayFrames
	call EmptyBattleTextBox
	ld c, $3
	farcall BattleTowerText
	call WaitPressAorB_BlinkCursor
	ld hl, wPayDayMoney
	ld a, [hli]
	or [hl]
	inc hl
	or [hl]
	ret nz
	call ClearTileMap
	call ClearBGPalettes
	ret

.GiveMoney:
	ld a, [wAmuletCoin]
	and a
	call nz, .DoubleReward
	call .CheckMaxedOutMomMoney
	push af
	ld a, 0 ; not xor a; preserve carry flag?
	jr nc, .okay
	ld a, [wMomSavingMoney]
	and $7
	cp $3
	jr nz, .okay
	inc a

.okay
	ld b, a
	ld c, $4
.loop
	ld a, b
	and a
	jr z, .loop2
	call .SendMoneyToMom
	dec c
	dec b
	jr .loop

.loop2
	ld a, c
	and a
	jr z, .done
	call .AddMoneyToWallet
	dec c
	jr .loop2

.done
	call .DoubleReward
	call .DoubleReward
	pop af
	jr nc, .KeepItAll
	ld a, [wMomSavingMoney]
	and $7
	jr z, .KeepItAll
	ld hl, .SentToMomTexts
	dec a
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp StdBattleTextBox

.KeepItAll:
	ld hl, GotMoneyForWinningText
	jp StdBattleTextBox
; 3d081

.SendMoneyToMom: ; 3d081
	push bc
	ld hl, wBattleReward + 2
	ld de, wMomsMoney + 2
	call AddBattleMoneyToAccount
	pop bc
	ret
; 3d08d

.AddMoneyToWallet: ; 3d08d
	push bc
	ld hl, wBattleReward + 2
	ld de, Money + 2
	call AddBattleMoneyToAccount
	pop bc
	ret
; 3d099

.DoubleReward: ; 3d099
	ld hl, wBattleReward + 2
	sla [hl]
	dec hl
	rl [hl]
	dec hl
	rl [hl]
	ret nc
	ld a, $ff
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ret
; 3d0ab

.SentToMomTexts: ; 3d0ab
	dw SentSomeToMomText
	dw SentHalfToMomText
	dw SentAllToMomText
; 3d0b1


.CheckMaxedOutMomMoney: ; 3d0b1
	ld hl, wMomsMoney + 2
	ld a, [hld]
	cp 9999999 % $100
	ld a, [hld]
	sbc 9999999 / $100 % $100
	ld a, [hl]
	sbc 9999999 / $10000 % $100
	ret
; 3d0be

AddBattleMoneyToAccount: ; 3d0be
	ld c, $3
	and a
	push de
.loop
	ld a, [de]
	adc [hl]
	ld [de], a
	dec de
	dec hl
	dec c
	jr nz, .loop
	pop hl
	ld a, [hld]
	cp 9999999 % $100
	ld a, [hld]
	sbc 9999999 / $100 % $100
	ld a, [hl]
	sbc 9999999 / $10000 % $100
	ret c
	ld [hl], 9999999 / $10000 % $100
	inc hl
	ld [hl], 9999999 / $100 % $100
	inc hl
	ld [hl], 9999999 % $100
	ret
; 3d0ea

PlayVictoryMusic: ; 3d0ea
	push de
	ld de, MUSIC_NONE
	call PlayMusic
	call DelayFrame
	ld de, MUSIC_WILD_VICTORY
	ld a, [wBattleMode]
	dec a
	jr nz, .trainer_victory
	push de
	call IsAnyMonHoldingExpShare
	pop de
	jr nz, .play_music
	ld hl, wPayDayMoney
	ld a, [hli]
	or [hl]
	jr nz, .play_music
	ld a, [wBattleParticipantsNotFainted]
	and a
	jr z, .lost
	jr .play_music

.trainer_victory
	ld de, MUSIC_GYM_VICTORY
	call IsBossTrainer
	jr c, .play_music
	ld de, MUSIC_TRAINER_VICTORY

.play_music
	call PlayMusic

.lost
	pop de
	ret
; 3d123



; These functions check if the current opponent is a gym leader or one of a
; few other special trainers.

; Note: KantoGymLeaders is a subset of JohtoGymLeaders. If you wish to
; differentiate between the two, call IsKantoGymLeader first.

IsKantoGymLeader: ; 0x3d123
	ld hl, KantoGymLeaders
	jr IsBossTrainerCommon

IsJohtoGymLeader: ; 0x3d128
	ld hl, JohtoGymLeaders
	jr IsBossTrainerCommon

IsBossTrainer:
	ld hl, BossTrainers
IsBossTrainerCommon:
	push de
	ld a, [OtherTrainerClass]
	ld de, $0001
	call IsInArray
	pop de
	ret
; 0x3d137

BossTrainers:
	; unused for music checks
	db CHAMPION
	db RED
	db LEAF
	db STEVEN
	db CYNTHIA
	db TOWERTYCOON
	db VALERIE
	db GIOVANNI
	db LORELEI
	db AGATHA
	; elite 4
	db WILL
	db KOGA
	db BRUNO
	db KAREN
JohtoGymLeaders:
	db FALKNER
	db WHITNEY
	db BUGSY
	db MORTY
	db CHUCK
	db JASMINE
	db PRYCE
	db CLAIR
KantoGymLeaders:
	db BROCK
	db MISTY
	db LT_SURGE
	db ERIKA
	db JANINE
	db SABRINA
	db BLAINE
	db BLUE
	db -1


HandlePlayerMonFaint: ; 3d14e
	call FaintYourPokemon
	ld hl, EnemyMonHP
	ld a, [hli]
	or [hl]
	call z, FaintEnemyPokemon
	ld a, $1
	ld [wWhichMonFaintedFirst], a
	call PlayerMonFaintHappinessMod
	call CheckPlayerPartyForFitPkmn
	ld a, d
	and a
	jp z, LostBattle
	ld hl, EnemyMonHP
	ld a, [hli]
	or [hl]
	jr nz, .notfainted
	call UpdateBattleStateAndExperienceAfterEnemyFaint
	ld a, [wBattleMode]
	dec a
	jr nz, .trainer
	ld a, $1
	ld [BattleEnded], a
	ret

.trainer
	call CheckEnemyTrainerDefeated
	jp z, WinTrainerBattle

.notfainted
	call AskUseNextPokemon
	jr nc, .switch
	ld a, $1
	ld [BattleEnded], a
	ret

.switch
	call ForcePlayerMonChoice
	ld a, c
	and a
	ret nz
	ld a, $1
	ld [wPlayerAction], a
	call HandleEnemySwitch
	jp z, WildFled_EnemyFled_LinkBattleCanceled
	jp DoubleSwitch
; 3d1aa

PlayerMonFaintHappinessMod: ; 3d1aa
	ld a, [CurBattleMon]
	ld c, a
	ld hl, wBattleParticipantsNotFainted
	ld b, RESET_FLAG
	predef FlagPredef
	ld hl, EnemySubStatus3
	res SUBSTATUS_IN_LOOP, [hl]
	xor a
	ld [Danger], a
	ld hl, PlayerDamageTaken
	ld [hli], a
	ld [hl], a
	ld [BattleMonStatus], a
	call UpdateBattleMonInParty
	ld c, HAPPINESS_FAINTED
	; If TheirLevel > (YourLevel + 30), use a different parameter
	ld a, [BattleMonLevel]
	add 30
	ld b, a
	ld a, [EnemyMonLevel]
	cp b
	jr c, .got_param
	ld c, HAPPINESS_BEATENBYSTRONGFOE

.got_param
	ld a, [CurBattleMon]
	ld [CurPartyMon], a
	farcall ChangeHappiness
	ld a, [wBattleResult]
	and %11000000
	add $1
	ld [wBattleResult], a
	ld a, [wWhichMonFaintedFirst]
	and a
	ret
; 3d1f8

AskUseNextPokemon: ; 3d1f8
	call EmptyBattleTextBox
	call LoadTileMapToTempTileMap
; We don't need to be here if we're in a Trainer battle,
; as that decision is made for us.
	ld a, [wBattleMode]
	and a
	dec a
	ret nz

	ld hl, BattleText_UseNextMon
	call StdBattleTextBox
.loop
	lb bc, 1, 7
	call PlaceYesNoBox
	ld a, [wMenuCursorY]
	jr c, .pressed_b
	and a
	ret

.pressed_b
	ld a, [wMenuCursorY]
	cp $1 ; YES
	jr z, .loop
	ld hl, PartyMon1Speed
	ld de, EnemyMonSpeed
	jp TryToRunAwayFromBattle
; 3d227

ForcePlayerMonChoice: ; 3d227
	call EmptyBattleTextBox
	call LoadStandardMenuDataHeader
	call SetUpBattlePartyMenu_NoLoop
	call ForcePickPartyMonInBattle
	ld a, [wLinkMode]
	and a
	jr z, .skip_link
	ld a, $1
	ld [wPlayerAction], a
	call LinkBattleSendReceiveAction

.skip_link
	xor a
	ld [wPlayerAction], a
	ld hl, EnemyMonHP
	ld a, [hli]
	or [hl]
	jr nz, .send_out_pokemon

	call ClearSprites
	call ClearBGPalettes
	call _LoadStatusIcons
	call ExitMenu
	call LoadTileMapToTempTileMap
	call WaitBGMap
	call GetMemSGBLayout
	call SetPalettes
	xor a
	ld c, a
	ret

.send_out_pokemon
	call ClearSprites
	ld a, [CurBattleMon]
	ld [LastPlayerMon], a
	ld a, [CurPartyMon]
	ld [CurBattleMon], a
	call AddBattleParticipant
	call InitBattleMon
	call ResetPlayerStatLevels
	call ClearPalettes
	call DelayFrame
	call _LoadStatusIcons
	call CloseWindow
	call GetMemSGBLayout
	call SetPalettes
	call SendOutPkmnText
	call NewBattleMonStatus
	call BreakAttraction
	call SendOutPlayerMon
	call EmptyBattleTextBox
	call LoadTileMapToTempTileMap
	call SetPlayerTurn
	call SpikesDamage
	call RunActivationAbilities
	ld a, $1
	and a
	ld c, a
	ret
; 3d2b3

PlayerPartyMonEntrance: ; 3d2b3
	ld a, [CurBattleMon]
	ld [LastPlayerMon], a
	ld a, [CurPartyMon]
	ld [CurBattleMon], a
	call AddBattleParticipant
	call InitBattleMon
	call ResetPlayerStatLevels
	call SendOutPkmnText
	call NewBattleMonStatus
	call BreakAttraction
	call SendOutPlayerMon
	call EmptyBattleTextBox
	call LoadTileMapToTempTileMap
	call SetPlayerTurn
	call SpikesDamage
	jp RunActivationAbilities
; 3d2e0

SetUpBattlePartyMenu_NoLoop: ; 3d2f7
	call ClearBGPalettes
SetUpBattlePartyMenu: ; switch to fullscreen menu?
	farcall LoadPartyMenuGFX
	farcall InitPartyMenuWithCancel
	farcall InitPartyMenuBGPal7
	farcall InitPartyMenuGFX
	ret
; 3d313

JumpToPartyMenuAndPrintText: ; 3d313
	farcall WritePartyMenuTilemap
	farcall PrintPartyMenuText
	call WaitBGMap
	call SetPalettes
	call DelayFrame
	ret
; 3d329

SelectBattleMon: ; 3d329
	farcall PartyMenuSelect
	ret
; 3d33c

PickPartyMonInBattle: ; 3d33c
.loop
	ld a, $2 ; Which PKMN?
	ld [PartyMenuActionText], a
	call JumpToPartyMenuAndPrintText
	call SelectBattleMon
	ret c
	call CheckIfCurPartyMonIsFitToFight
	jr z, .loop
	xor a
	ret
; 3d34f

SwitchMonAlreadyOut: ; 3d34f
	ld hl, CurBattleMon
	ld a, [CurPartyMon]
	cp [hl]
	jr nz, .notout

	ld hl, BattleText_PkmnIsAlreadyOut
	call StdBattleTextBox
	scf
	ret

.notout
	xor a
	ret
; 3d362

ForcePickPartyMonInBattle: ; 3d362
; Can't back out.

.pick
	call PickPartyMonInBattle
	ret nc

	ld de, SFX_WRONG
	call PlaySFX
	call WaitSFX
	jr .pick
; 3d375


PickSwitchMonInBattle: ; 3d375
.pick
	call PickPartyMonInBattle
	ret c
	call SwitchMonAlreadyOut
	jr c, .pick
	xor a
	ret
; 3d380

ForcePickSwitchMonInBattle: ; 3d380
; Can't back out.

.pick
	call ForcePickPartyMonInBattle
	call SwitchMonAlreadyOut
	jr c, .pick

	xor a
	ret
; 3d38e


LostBattle: ; 3d38e
	ld a, 1
	ld [BattleEnded], a

	ld a, [InBattleTowerBattle]
	bit 0, a
	jr nz, .battle_tower

	ld a, [BattleType]
	cp BATTLETYPE_CANLOSE
	jr nz, .not_canlose

; Remove the enemy from the screen.
	hlcoord 0, 0
	lb bc, 8, 21
	call ClearBox
	call BattleWinSlideInEnemyTrainerFrontpic

	ld c, 40
	call DelayFrames

	ld a, [wMonStatusFlags]
	bit 0, a
	jr nz, .skip_win_loss_text
	call PrintWinLossText
.skip_win_loss_text
	ret

.battle_tower
; Remove the enemy from the screen.
	hlcoord 0, 0
	lb bc, 8, 21
	call ClearBox
	call BattleWinSlideInEnemyTrainerFrontpic

	ld c, 40
	call DelayFrames

	call EmptyBattleTextBox
	ld c, 2
	farcall BattleTowerText
	call WaitPressAorB_BlinkCursor
	call ClearTileMap
	call ClearBGPalettes
	ret

.not_canlose
	ld a, [wLinkMode]
	and a
	jr nz, .LostLinkBattle

; Greyscale
	ld b, SCGB_BATTLE_GRAYSCALE
	call GetSGBLayout
	call SetPalettes
	jr .end

.LostLinkBattle:
	call UpdateEnemyMonInParty
	call CheckEnemyTrainerDefeated
	jr nz, .not_tied
	ld hl, TiedAgainstText
	ld a, [wBattleResult]
	and $c0
	add 2
	ld [wBattleResult], a
	jr .text

.not_tied
	ld hl, LostAgainstText

.text
	call StdBattleTextBox

.end
	scf
	ret
; 3d432


EnemyMonFaintedAnimation: ; 3d432
	hlcoord 12, 5
	decoord 12, 6
	jp MonFaintedAnimation
; 3d43b

PlayerMonFaintedAnimation: ; 3d43b
	hlcoord 1, 10
	decoord 1, 11
	jp MonFaintedAnimation
; 3d444

MonFaintedAnimation: ; 3d444
	ld a, [wcfbe]
	push af
	set 6, a
	ld [wcfbe], a
	ld b, 7

.OuterLoop:
	push bc
	push de
	push hl
	ld b, 6

.InnerLoop:
	push bc
	push hl
	push de
	ld bc, 7
	call CopyBytes
	pop de
	pop hl
	ld bc, -SCREEN_WIDTH
	add hl, bc
	push hl
	ld h, d
	ld l, e
	add hl, bc
	ld d, h
	ld e, l
	pop hl
	pop bc
	dec b
	jr nz, .InnerLoop

	ld bc, 20
	add hl, bc
	ld de, .Spaces
	call PlaceString
	ld c, 2
	call DelayFrames
	pop hl
	pop de
	pop bc
	dec b
	jr nz, .OuterLoop

	pop af
	ld [wcfbe], a
	ret
; 3d488

.Spaces:
	db "       @"
; 3d490


SlideBattlePicOut: ; 3d490
	ld [hMapObjectIndexBuffer], a
	ld c, a
.loop
	push bc
	push hl
	ld b, $7
.loop2
	push hl
	call .DoFrame
	pop hl
	ld de, SCREEN_WIDTH
	add hl, de
	dec b
	jr nz, .loop2
	ld c, 2
	call DelayFrames
	pop hl
	pop bc
	dec c
	jr nz, .loop
	ret
; 3d4ae

.DoFrame: ; 3d4ae
	ld a, [hMapObjectIndexBuffer]
	ld c, a
	cp $8
	jr nz, .back
.forward
	ld a, [hli]
	ld [hld], a
	dec hl
	dec c
	jr nz, .forward
	ret

.back
	ld a, [hld]
	ld [hli], a
	inc hl
	dec c
	jr nz, .back
	ret
; 3d4c3


ForceEnemySwitch: ; 3d4c3
	call ResetEnemyBattleVars
	ld a, [wEnemySwitchMonIndex]
	dec a
	ld b, a
	call LoadEnemyPkmnToSwitchTo
	call ClearEnemyMonBox
	call NewEnemyMonStatus
	call ResetEnemyStatLevels
	call Function_SetEnemyPkmnAndSendOutAnimation
	call BreakAttraction
	call ResetBattleParticipants
	ret
; 3d4e1


EnemySwitch: ; 3d4e1
	call CheckWhetherToAskSwitch
	jr nc, EnemySwitch_SetMode
	; Shift Mode
	call ResetEnemyBattleVars
	call CheckWhetherSwitchmonIsPredetermined
	jr c, .skip
	call FindPkmnInOTPartyToSwitchIntoBattle
.skip
	; 'b' contains the PartyNr of the Pkmn the AI will switch to
	call LoadEnemyPkmnToSwitchTo
	call OfferSwitch
	push af
	call ClearEnemyMonBox
	call Function_BattleTextEnemySentOut
	call Function_SetEnemyPkmnAndSendOutAnimation
	call FinalPkmnMusicAndAnimation
	pop af
	ret c
	; If we're here, then we're switching too
	xor a
	ld [wBattleParticipantsNotFainted], a
	ld [wBattleParticipantsIncludingFainted], a
	ld [wPlayerAction], a
	inc a
	ld [wEnemyIsSwitching], a
	call LoadTileMapToTempTileMap
	jp PlayerSwitch
; 3d517

EnemySwitch_SetMode: ; 3d517
	call ResetEnemyBattleVars
	call CheckWhetherSwitchmonIsPredetermined
	jr c, .skip
	call FindPkmnInOTPartyToSwitchIntoBattle
.skip
	; 'b' contains the PartyNr of the Pkmn the AI will switch to
	call LoadEnemyPkmnToSwitchTo
	ld a, 1
	ld [wEnemyIsSwitching], a
	call ClearEnemyMonBox
	call Function_BattleTextEnemySentOut
	call Function_SetEnemyPkmnAndSendOutAnimation
	jp FinalPkmnMusicAndAnimation
; 3d533

CheckWhetherSwitchmonIsPredetermined: ; 3d533
; returns carry if: ???
	ld a, [wLinkMode]
	and a
	jr z, .not_linked

	ld a, [wBattleAction]
	sub BATTLEACTION_SWITCH1
	ld b, a
	jr .return_carry

.not_linked
	ld a, [wEnemySwitchMonIndex]
	and a
	jr z, .check_wAISwitch

	dec a
	ld b, a
	jr .return_carry

.check_wAISwitch
	ld a, [wAISwitch]
	and a
	ld b, $0
	jr nz, .return_carry

	and a
	ret

.return_carry
	scf
	ret
; 3d557

ResetEnemyBattleVars: ; 3d557
; and draw empty TextBox
	xor a
	ld [LastEnemyCounterMove], a
	ld [LastPlayerCounterMove], a
	ld [LastEnemyMove], a
	ld [CurEnemyMove], a
	dec a
	ld [wEnemyItemState], a
	xor a
	ld [wPlayerWrapCount], a
	hlcoord 18, 0
	ld a, 8
	call SlideBattlePicOut
	call EmptyBattleTextBox
	jp LoadStandardMenuDataHeader
; 3d57a

ResetBattleParticipants: ; 3d57a
	xor a
	ld [wBattleParticipantsNotFainted], a
	ld [wBattleParticipantsIncludingFainted], a
AddBattleParticipant: ; 3d581
	ld a, [CurBattleMon]
	ld c, a
	ld hl, wBattleParticipantsNotFainted
	ld b, SET_FLAG
	push bc
	predef FlagPredef
	pop bc
	ld hl, wBattleParticipantsIncludingFainted
	predef_jump FlagPredef
; 3d599

FindPkmnInOTPartyToSwitchIntoBattle: ; 3d599
	ld b, $ff
	ld a, $1
	ld [Buffer1], a
	ld [Buffer2], a
.loop
	ld hl, Buffer1
	sla [hl]
	inc hl
	sla [hl]
	inc b
	ld a, [OTPartyCount]
	cp b
	jp z, ScoreMonTypeMatchups
	ld a, [CurOTMon]
	cp b
	jr z, .discourage
	ld hl, OTPartyMon1HP
	push bc
	ld a, b
	call GetPartyLocation
	ld a, [hli]
	ld c, a
	ld a, [hl]
	or c
	pop bc
	jr z, .discourage
	call LookUpTheEffectivenessOfEveryMove
	call IsThePlayerPkmnTypesEffectiveAgainstOTPkmn
	jr .loop

.discourage
	ld hl, Buffer2
	set 0, [hl]
	jr .loop
; 3d5d7

LookUpTheEffectivenessOfEveryMove: ; 3d5d7
	push bc
	ld hl, OTPartyMon1Moves
	ld a, b
	call GetPartyLocation
	pop bc
	ld e, NUM_MOVES + 1
.loop
	dec e
	jr z, .done
	ld a, [hli]
	and a
	jr z, .done
	push hl
	push de
	push bc
	dec a
	ld hl, Moves
	ld bc, MOVE_LENGTH
	call AddNTimes
	ld de, wEnemyMoveStruct
	ld a, BANK(Moves)
	call FarCopyBytes
	call SetEnemyTurn
	farcall BattleCheckTypeMatchup
	pop bc
	pop de
	pop hl
	ld a, [wd265] ; Get The Effectiveness Modifier
	cp 10 + 1 ; 1.0 + 0.1
	jr c, .loop
	ld hl, Buffer1
	set 0, [hl]
	ret
.done
	ret
; 3d618

IsThePlayerPkmnTypesEffectiveAgainstOTPkmn: ; 3d618
; Calculates the effectiveness of the types of the PlayerPkmn
; against the OTPkmn
	push bc
	ld hl, OTPartyCount
	ld a, b
	inc a
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]
	dec a
	ld hl, BASEMON_TYPES
	ld bc, BASEMON_STRUCT_LENGTH
	call AddNTimes
	ld de, EnemyMonType
	ld bc, 2
	ld a, BANK(BaseData)
	call FarCopyBytes
	ld a, [BattleMonType1]
	ld [wPlayerMoveStruct + MOVE_TYPE], a
	call SetPlayerTurn
	farcall BattleCheckTypeMatchup
	ld a, [wd265]
	cp 10 + 1 ; 1.0 + 0.1
	jr nc, .super_effective
	ld a, [BattleMonType2]
	ld [wPlayerMoveStruct + MOVE_TYPE], a
	farcall BattleCheckTypeMatchup
	ld a, [wd265]
	cp 10 + 1 ; 1.0 + 0.1
	jr nc, .super_effective
	pop bc
	ret

.super_effective
	pop bc
	ld hl, Buffer1
	bit 0, [hl]
	jr nz, .reset
	inc hl
	set 0, [hl]
	ret

.reset
	res 0, [hl]
	ret
; 3d672

ScoreMonTypeMatchups: ; 3d672
.loop1
	ld hl, Buffer1
	sla [hl]
	inc hl
	sla [hl]
	jr nc, .loop1
	ld a, [OTPartyCount]
	ld b, a
	ld c, [hl]
.loop2
	sla c
	jr nc, .okay
	dec b
	jr z, .loop5
	jr .loop2

.okay
	ld a, [Buffer1]
	and a
	jr z, .okay2
	ld b, $ff
	ld c, a
.loop3
	inc b
	sla c
	jr nc, .loop3
	jr .quit

.okay2
	ld b, $ff
	ld a, [Buffer2]
	ld c, a
.loop4
	inc b
	sla c
	jr c, .loop4
	jr .quit

.loop5
	ld a, [OTPartyCount]
	ld b, a
	call BattleRandom
	and $7
	cp b
	jr nc, .loop5
	ld b, a
	ld a, [CurOTMon]
	cp b
	jr z, .loop5
	ld hl, OTPartyMon1HP
	push bc
	ld a, b
	call GetPartyLocation
	pop bc
	ld a, [hli]
	ld c, a
	ld a, [hl]
	or c
	jr z, .loop5

.quit
	ret
; 3d6ca

LoadEnemyPkmnToSwitchTo: ; 3d6ca
	; 'b' contains the PartyNr of the Pkmn the AI will switch to
	ld a, b
	ld [CurPartyMon], a
	ld hl, OTPartyMon1Level
	call GetPartyLocation
	ld a, [hl]
	ld [CurPartyLevel], a
	ld a, [CurPartyMon]
	inc a
	ld hl, OTPartyCount
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]
	ld [TempEnemyMonSpecies], a
	ld [CurPartySpecies], a
	call LoadEnemyMon

	ld a, [CurPartySpecies]
	cp UNOWN
	jr nz, .skip_unown
	ld a, [wFirstUnownSeen]
	and a
	jr nz, .skip_unown
	ld hl, EnemyMonForm
	predef GetVariant
	ld a, [MonVariant]
	ld [wFirstUnownSeen], a
.skip_unown

	ld hl, EnemyMonHP
	ld a, [hli]
	ld [wEnemyHPAtTimeOfPlayerSwitch], a
	ld a, [hl]
	ld [wEnemyHPAtTimeOfPlayerSwitch + 1], a
	jp ResetEnemyAbility
; 3d714

FinalPkmnMusicAndAnimation:
	; if this is not a link battle...
	ld a, [wLinkMode]
	and a
	ret nz
	; ...and this trainer has final text...
	farcall GetFinalPkmnTextPointer
	ret nc
	; ...and this is their last Pokémon...
	farcall CheckAnyOtherAliveEnemyMons
	ret nz
	; ...then hide the Pokémon...
	call EmptyBattleTextBox
	ld c, 20
	call DelayFrames
	hlcoord 18, 0
	ld a, 8
	call SlideBattlePicOut
	; ...play the final Pokémon music...
	call IsJohtoGymLeader
	jr nc, .no_music
	push de
	ld de, MUSIC_NONE
	call PlayMusic
	call DelayFrame
	ld de, MUSIC_FINAL_POKEMON_BW
	call PlayMusic
	pop de
.no_music
	; ...show their sprite and final dialog...
	call FinalPkmnSlideInEnemyTrainerFrontpic
	farcall GetFinalPkmnTextPointer
	call StdBattleTextBox
	; ...and return the Pokémon
	call EmptyBattleTextBox
	call WaitBGMap
	hlcoord 18, 0
	ld a, 8
	call SlideBattlePicOut
	ld c, 10
	call DelayFrames
	call FinalPkmnSlideInEnemyMonFrontpic
	ret

CheckWhetherToAskSwitch: ; 3d714
	ld a, [wAISwitch]
	dec a
	jp z, .return_nc
	ld a, [PartyCount]
	dec a
	jp z, .return_nc
	ld a, [wLinkMode]
	and a
	jp nz, .return_nc
	ld a, [Options2]
	and (1 << BATTLE_SWITCH) | (1 << BATTLE_PREDICT)
	jr z, .return_nc
	ld a, [CurPartyMon]
	push af
	ld a, [CurBattleMon]
	ld [CurPartyMon], a
	farcall CheckCurPartyMonFainted
	pop bc
	ld a, b
	ld [CurPartyMon], a
	jr c, .return_nc
	scf
	ret

.return_nc
	and a
	ret
; 3d74b

OfferSwitch: ; 3d74b
	ld a, [CurPartyMon]
	push af
	farcall Battle_GetTrainerName

	ld a, [Options2]
	bit BATTLE_PREDICT, a
	jr nz, .predict
	ld hl, BattleText_EnemyAreAboutToSwitchWillPlayerSwitchPkmn
	call CheckPluralTrainer
	jr nz, .PlaceBattleChangeText
	ld hl, BattleText_EnemyIsAboutToSwitchWillPlayerSwitchPkmn
	jr .PlaceBattleChangeText
.predict
	ld hl, BattleText_EnemyAreAboutToUseWillPlayerSwitchPkmn
	call CheckPluralTrainer
	jr nz, .PlaceBattleChangeText
	ld hl, BattleText_EnemyIsAboutToUseWillPlayerSwitchPkmn

.PlaceBattleChangeText
	call StdBattleTextBox
	lb bc, 1, 7
	call PlaceYesNoBox
	ld a, [wMenuCursorY]
	dec a
	jr nz, .said_no
	call SetUpBattlePartyMenu_NoLoop
	call PickSwitchMonInBattle
	jr c, .canceled_switch
	ld a, [CurBattleMon]
	ld [LastPlayerMon], a
	ld a, [CurPartyMon]
	ld [CurBattleMon], a
	call ClearPalettes
	call DelayFrame
	call _LoadStatusIcons
	pop af
	ld [CurPartyMon], a
	xor a
	ld [CurEnemyMove], a
	ld [CurPlayerMove], a
	and a
	ret

.canceled_switch
	call ClearPalettes
	call DelayFrame
	call _LoadStatusIcons

.said_no
	pop af
	ld [CurPartyMon], a
	scf
	ret
; 3d7a0

ClearEnemyMonBox: ; 3d7a0
	xor a
	ld [hBGMapMode], a
	call ExitMenu
	call ClearSprites
	hlcoord 0, 0
	lb bc, 4, 11
	call ClearBox
	call WaitBGMap
	jp FinishBattleAnim
; 3d7b8

Function_BattleTextEnemySentOut: ; 3d7b8
	farcall Battle_GetTrainerName
	ld hl, BattleText_EnemySentOut
	call StdBattleTextBox
	jp WaitBGMap
; 3d7c7

Function_SetEnemyPkmnAndSendOutAnimation: ; 3d7c7
	ld a, [TempEnemyMonSpecies]
	ld [CurPartySpecies], a
	ld [CurSpecies], a
	call GetBaseData
	ld a, OTPARTYMON
	ld [MonType], a
	predef CopyPkmnToTempMon
	call GetMonFrontpic

	xor a
	ld [wNumHits], a
	ld [wBattleAnimParam], a
	call SetEnemyTurn
	ld de, ANIM_SEND_OUT_MON
	call Call_PlayBattleAnim

	call BattleCheckEnemyShininess
	jr nc, .not_shiny
	ld a, 1 ; shiny anim
	ld [wBattleAnimParam], a
	ld de, ANIM_SEND_OUT_MON
	call Call_PlayBattleAnim
.not_shiny

	ld bc, TempMonSpecies
	farcall CheckFaintedFrzSlp
	jr c, .skip_cry
	farcall CheckBattleEffects
	jr c, .cry_no_anim
	hlcoord 12, 0
	ld d, $0
	ld e, ANIM_MON_SLOW
	predef AnimateFrontpic
	jr .skip_cry

.cry_no_anim
	ld a, $f
	ld [CryTracks], a
	ld a, [TempEnemyMonSpecies]
	call PlayStereoCry

.skip_cry
	call UpdateEnemyHUD
	ld a, $1
	ld [hBGMapMode], a
	ret
; 3d834

NewEnemyMonStatus: ; 3d834
	xor a
	ld [LastEnemyCounterMove], a
	ld [LastPlayerCounterMove], a
	ld [LastEnemyMove], a
	ld hl, EnemySubStatus1
rept 3
	ld [hli], a
endr
	ld [hl], a
	ld [EnemyDisableCount], a
	ld [EnemyFuryCutterCount], a
	ld [EnemyProtectCount], a
	ld [wEnemyRageCounter], a
	ld [EnemyDisabledMove], a
	ld [wEnemyMinimized], a
	ld [wPlayerWrapCount], a
	ld [wEnemyWrapCount], a
	ld [EnemyTurnsTaken], a
	ld hl, PlayerSubStatus2
	res SUBSTATUS_CANT_RUN, [hl]
	jp ResetEnemyAbility
; 3d867

ResetPlayerAbility:
	ld a, [BattleMonAbility]
	ld b, a
	ld a, [BattleMonSpecies]
	ld c, a
	farcall GetAbility
	ld a, b
	ld [PlayerAbility], a
	xor a
	ret

ResetEnemyAbility:
	ld a, [EnemyMonAbility]
	ld b, a
	ld a, [EnemyMonSpecies]
	ld c, a
	farcall GetAbility
	ld a, b
	ld [EnemyAbility], a
	xor a
	ret

ResetEnemyStatLevels: ; 3d867
	ld a, BASE_STAT_LEVEL
	ld b, NUM_LEVEL_STATS
	ld hl, EnemyStatLevels
.loop
	ld [hli], a
	dec b
	jr nz, .loop
	ret
; 3d873

CheckPlayerPartyForFitPkmn: ; 3d873
; Has the player any Pkmn in his Party that can fight?
	ld a, [PartyCount]
	ld e, a
	xor a
	ld hl, PartyMon1HP
	ld bc, PartyMon2 - (PartyMon1 + 1)
.loop
	or [hl]
	inc hl
	or [hl]
	add hl, bc
	dec e
	jr nz, .loop
	ld d, a
	ret
; 3d887


CheckIfCurPartyMonIsFitToFight: ; 3d887
	ld a, [CurPartyMon]
	ld hl, PartyMon1HP
	call GetPartyLocation
	ld a, [hli]
	or [hl]
	ret nz

	ld a, [wAISwitch]
	and a
	jr nz, .finish_fail
	ld hl, PartySpecies
	ld a, [CurPartyMon]
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]
	cp EGG
	ld hl, BattleText_AnEGGCantBattle
	jr z, .print_textbox

	ld hl, BattleText_TheresNoWillToBattle

.print_textbox
	call StdBattleTextBox

.finish_fail
	xor a
	ret
; 3d8b3


TryToRunAwayFromBattle: ; 3d8b3
; Run away from battle, with or without item
	ld a, [BattleType]
	cp BATTLETYPE_CONTEST
	jp z, .can_escape
	cp BATTLETYPE_GHOST
	jp z, .can_escape
	cp BATTLETYPE_TRAP ; or BATTLETYPE_CELEBI, BATTLETYPE_SUICUNE, BATTLETYPE_HO_OH, BATTLETYPE_LUGIA, BATTLETYPE_KANTO_LEGEND
	jp nc, .cant_escape

	ld a, [wLinkMode]
	and a
	jp nz, .can_escape

	ld a, [wBattleMode]
	dec a
	jp nz, .cant_run_from_trainer

	ld a, [PlayerAbility]
	cp RUN_AWAY
	jr nz, .no_flee_ability
	call SetPlayerTurn
	farcall ShowAbilityActivation
	jp .can_escape
.no_flee_ability
	push hl
	push de
	ld a, [BattleMonItem]
	ld [wd265], a
	ld b, a
	farcall GetItemHeldEffect
	ld a, b
	cp HELD_ESCAPE
	pop de
	pop hl
	jr nz, .no_flee_item

	call SetPlayerTurn
	call GetItemName
	ld hl, BattleText_UserFledUsingAStringBuffer1
	call StdBattleTextBox
	jp .can_escape

.no_flee_item
	ld a, [EnemySubStatus2]
	bit SUBSTATUS_CANT_RUN, a
	jp nz, .cant_escape

	ld a, [wPlayerWrapCount]
	and a
	jp nz, .cant_escape

	call SetPlayerTurn
	call CheckIfTrappedByAbility_Core
	jp z, .skip_inescapable_text
	ld a, [wNumFleeAttempts]
	inc a
	ld [wNumFleeAttempts], a
	ld a, [hli]
	ld [hStringCmpString2 + 0], a
	ld a, [hl]
	ld [hStringCmpString2 + 1], a
	ld a, [de]
	inc de
	ld [hStringCmpString1 + 0], a
	ld a, [de]
	ld [hStringCmpString1 + 1], a
	call Call_LoadTempTileMapToTileMap
	ld de, hStringCmpString2
	ld hl, hStringCmpString1
	ld c, $2
	call StringCmp
	jr nc, .can_escape

	xor a
	ld [hMultiplicand], a
	ld a, $20
	ld [hMultiplier], a
	call Multiply
	ld a, [hProduct + 2]
	ld [hDividend + 0], a
	ld a, [hProduct + 3]
	ld [hDividend + 1], a
	ld a, [hStringCmpString1 + 0]
	ld b, a
	ld a, [hStringCmpString1 + 1]
	srl b
	rr a
	srl b
	rr a
	and a
	jr z, .can_escape
	ld [hDivisor], a
	ld b, 2
	call Divide
	ld a, [hQuotient + 1]
	and a
	jr nz, .can_escape
	ld a, [wNumFleeAttempts]
	ld c, a
.loop
	dec c
	jr z, .cant_escape_2
	ld b, 30
	ld a, [hQuotient + 2]
	add b
	ld [hQuotient + 2], a
	jr c, .can_escape
	jr .loop

.cant_escape_2
	call BattleRandom
	ld b, a
	ld a, [hQuotient + 2]
	cp b
	jr nc, .can_escape
	ld a, $1
	ld [wPlayerAction], a
.cant_escape
	ld hl, BattleText_CantEscape
	jr .print_inescapable_text

.cant_run_from_trainer
	ld hl, BattleText_TheresNoEscapeFromTrainerBattle

.print_inescapable_text
	call StdBattleTextBox
.skip_inescapable_text
	; for abilities preventing escape to avoid redundancy
	ld a, 1
	ld [wFailedToFlee], a
	call LoadTileMapToTempTileMap
	and a
	ret

.can_escape
	ld a, [wLinkMode]
	and a
	ld a, DRAW
	jr z, .fled
	call LoadTileMapToTempTileMap
	xor a
	ld [wPlayerAction], a
	ld a, $f
	ld [CurMoveNum], a
	xor a
	ld [CurPlayerMove], a
	call LinkBattleSendReceiveAction
	call Call_LoadTempTileMapToTileMap

	; Got away safely
	ld a, [wBattleAction]
	cp BATTLEACTION_FORFEIT
	ld a, DRAW
	jr z, .fled
	dec a
.fled
	ld b, a
	ld a, [wBattleResult]
	and $c0
	add b
	ld [wBattleResult], a
	call StopDangerSound
	push de
	ld de, SFX_RUN
	call WaitPlaySFX
	pop de
	call WaitSFX
	ld hl, BattleText_GotAwaySafely
	call StdBattleTextBox
	call WaitSFX
	call LoadTileMapToTempTileMap
	scf
	ret
; 3da0d

CheckIfTrappedByAbility_Core:
	farcall _CheckIfTrappedByAbility
	ld a, b
	and a
	ret

InitBattleMon: ; 3da0d
	ld a, MON_SPECIES
	call GetPartyParamLocation
	ld de, BattleMonSpecies
	ld bc, MON_ID - MON_SPECIES
	call CopyBytes ; copy Species, Item, Moves
	ld bc, MON_DVS - MON_ID
	add hl, bc ; skip ID, Exp, EVs
	ld de, BattleMonDVs
	ld bc, MON_PKRUS - MON_DVS
	call CopyBytes ; copy DVs, Personality, PP, Happiness
	ld bc, MON_LEVEL - MON_PKRUS
	add hl, bc ; skip PokerusStatus, CaughtData
	ld de, BattleMonLevel
	ld bc, PARTYMON_STRUCT_LENGTH - MON_LEVEL
	call CopyBytes ; copy Level, Status, Unused, HP, MaxHP, Stats
	ld a, [BattleMonSpecies]
	ld [TempBattleMonSpecies], a
	ld [CurPartySpecies], a
	ld [CurSpecies], a
	call GetBaseData
	ld a, [BaseType1]
	ld [BattleMonType1], a
	ld a, [BaseType2]
	ld [BattleMonType2], a

	; Armored Mewtwo is Psychic/Steel
	ld a, [BattleMonSpecies]
	cp MEWTWO
	jr nz, .not_armored_mewtwo
	ld a, [BattleMonItem]
	cp ARMOR_SUIT
	jr nz, .not_armored_mewtwo
	ld a, STEEL
	ld [BattleMonType2], a
.not_armored_mewtwo

	ld hl, PartyMonNicknames
	ld a, [CurBattleMon]
	call SkipNames
	ld de, BattleMonNick
	ld bc, PKMN_NAME_LENGTH
	call CopyBytes
	ld hl, BattleMonAttack
	ld de, PlayerStats
	ld bc, PARTYMON_STRUCT_LENGTH - MON_ATK
	call CopyBytes
	jp ResetPlayerAbility
; 3da74

BattleCheckPlayerShininess: ; 3da74
	call GetPartyMonPersonality
	jr BattleCheckShininess

BattleCheckEnemyShininess: ; 3da79
	call GetEnemyMonPersonality

BattleCheckShininess: ; 3da7c
	ld b, h
	ld c, l
	farcall CheckShininess
	ret
; 3da85

GetPartyMonDVs: ; 3da85
	ld hl, BattleMonDVs
	ld a, [PlayerSubStatus2]
	bit SUBSTATUS_TRANSFORMED, a
	ret z
	ld hl, PartyMon1DVs
	ld a, [CurBattleMon]
	jp GetPartyLocation
; 3da97

GetEnemyMonDVs: ; 3da97
	ld hl, EnemyMonDVs
	ld a, [EnemySubStatus2]
	bit SUBSTATUS_TRANSFORMED, a
	ret z
	ld hl, wEnemyBackupDVs
	ld a, [wBattleMode]
	dec a
	ret z
	ld hl, OTPartyMon1DVs
	ld a, [CurOTMon]
	jp GetPartyLocation
; 3dab1

GetPartyMonPersonality:
	ld hl, BattleMonPersonality
	ld a, [PlayerSubStatus2]
	bit SUBSTATUS_TRANSFORMED, a
	ret z
	ld hl, PartyMon1Personality
	ld a, [CurBattleMon]
	jp GetPartyLocation

GetEnemyMonPersonality:
	ld hl, EnemyMonPersonality
	ld a, [EnemySubStatus2]
	bit SUBSTATUS_TRANSFORMED, a
	ret z
	ld hl, wEnemyBackupPersonality
	ld a, [wBattleMode]
	dec a
	ret z
	ld hl, OTPartyMon1Personality
	ld a, [CurOTMon]
	jp GetPartyLocation

ResetPlayerStatLevels: ; 3dab1
	ld a, BASE_STAT_LEVEL
	ld b, NUM_LEVEL_STATS
	ld hl, PlayerStatLevels
.loop
	ld [hli], a
	dec b
	jr nz, .loop
	ret
; 3dabd

InitEnemyMon: ; 3dabd
	ld a, [CurPartyMon]
	ld hl, OTPartyMon1Species
	call GetPartyLocation
	ld de, EnemyMonSpecies
	ld bc, MON_ID - MON_SPECIES
	call CopyBytes ; copy Species, Item, Moves
	ld bc, MON_DVS - MON_ID
	add hl, bc ; skip ID, Exp, EVs
	ld de, EnemyMonDVs
	ld bc, MON_PKRUS - MON_DVS
	call CopyBytes ; copy DVs, Personality, PP, Happiness
	ld bc, MON_LEVEL - MON_PKRUS
	add hl, bc ; skip PokerusStatus, CaughtData
	ld de, EnemyMonLevel
	ld bc, PARTYMON_STRUCT_LENGTH - MON_LEVEL
	call CopyBytes ; copy Level, Status, Unused, HP, MaxHP, Stats
	ld a, [EnemyMonSpecies]
	ld [CurSpecies], a
	call GetBaseData
	ld hl, OTPartyMonNicknames
	ld a, [CurPartyMon]
	call SkipNames
	ld de, EnemyMonNick
	ld bc, PKMN_NAME_LENGTH
	call CopyBytes
	ld hl, EnemyMonAttack
	ld de, EnemyStats
	ld bc, PARTYMON_STRUCT_LENGTH - MON_ATK
	call CopyBytes
	ld hl, BaseType1
	ld de, EnemyMonType1
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a

	; Armored Mewtwo is Psychic/Steel
	ld a, [EnemyMonSpecies]
	cp MEWTWO
	jr nz, .not_armored_mewtwo
	ld a, [EnemyMonItem]
	cp ARMOR_SUIT
	jr nz, .not_armored_mewtwo
	ld a, STEEL
	ld [EnemyMonType2], a
.not_armored_mewtwo

	ld hl, BaseStats
	ld de, EnemyMonBaseStats
	ld b, 5
.loop
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .loop
	ld a, [CurPartyMon]
	ld [CurOTMon], a
	jp ResetEnemyAbility
; 3db32


SwitchPlayerMon: ; 3db32
	call ClearSprites
	ld a, [CurBattleMon]
	ld [LastPlayerMon], a
	ld a, [CurPartyMon]
	ld [CurBattleMon], a
	call AddBattleParticipant
	call InitBattleMon
	call ResetPlayerStatLevels
	call NewBattleMonStatus
	call BreakAttraction
	call SendOutPlayerMon
	call EmptyBattleTextBox
	call LoadTileMapToTempTileMap
	ld hl, EnemyMonHP
	ld a, [hli]
	or [hl]
	ret
; 3db5f


SendOutPlayerMon: ; 3db5f
	ld hl, BattleMonForm
	predef GetVariant
	hlcoord 1, 5
	lb bc, 7, 8
	call ClearBox
	call WaitBGMap
	xor a
	ld [hBGMapMode], a
	call GetMonBackpic
	xor a
	ld [hGraphicStartTile], a
	ld [wd0d2], a
	ld [CurMoveNum], a
	ld [TypeModifier], a
	ld [wPlayerMoveStruct + MOVE_ANIM], a
	ld [LastEnemyCounterMove], a
	ld [LastPlayerCounterMove], a
	ld [LastPlayerMove], a
	call CheckAmuletCoin
	call FinishBattleAnim
	xor a
	ld [wEnemyWrapCount], a
	call SetPlayerTurn
	xor a
	ld [wNumHits], a
	ld [wBattleAnimParam], a
	ld de, ANIM_SEND_OUT_MON
	call Call_PlayBattleAnim
	call BattleCheckPlayerShininess
	jr nc, .not_shiny
	ld a, 1
	ld [wBattleAnimParam], a
	ld de, ANIM_SEND_OUT_MON
	call Call_PlayBattleAnim

.not_shiny
	ld a, MON_SPECIES
	call GetPartyParamLocation
	ld b, h
	ld c, l
	farcall CheckFaintedFrzSlp
	jr c, .statused
	ld a, $f0
	ld [CryTracks], a
	ld a, [CurPartySpecies]
	call PlayStereoCry

.statused
	call UpdatePlayerHUD
	ld a, $1
	ld [hBGMapMode], a
	ret
; 3dbde

NewBattleMonStatus: ; 3dbde
	xor a
	ld [LastEnemyCounterMove], a
	ld [LastPlayerCounterMove], a
	ld [LastPlayerMove], a
	ld hl, PlayerSubStatus1
rept 3
	ld [hli], a
endr
	ld [hl], a
	ld hl, PlayerUsedMoves
rept 3
	ld [hli], a
endr
	ld [hl], a
	ld [PlayerDisableCount], a
	ld [PlayerFuryCutterCount], a
	ld [PlayerProtectCount], a
	ld [wPlayerRageCounter], a
	ld [DisabledMove], a
	ld [wPlayerMinimized], a
	ld [wEnemyWrapCount], a
	ld [wPlayerWrapCount], a
	ld [PlayerTurnsTaken], a
	ld hl, EnemySubStatus2
	res SUBSTATUS_CANT_RUN, [hl]
	jp ResetPlayerAbility
; 3dc18

BreakAttraction: ; 3dc18
	ld hl, PlayerSubStatus1
	res SUBSTATUS_IN_LOVE, [hl]
	ld hl, EnemySubStatus1
	res SUBSTATUS_IN_LOVE, [hl]
	ret
; 3dc23

RunBothActivationAbilities:
; runs both pokémon's activation abilities (Intimidate, etc.).
; The faster Pokémon activates abilities first. This mostly
; just matter for weather abilities.
	; TODO: factor in speed
	ld a, [hBattleTurn]
	push af
	call SetPlayerTurn
	call CheckSpeed
	jr z, .got_order
	call SetEnemyTurn
.got_order
	; Don't run RunActivationAbilities, it
	; will make Traced abilities activate
	; twice
	farcall RunActivationAbilitiesInner
	call SwitchTurn
	farcall RunActivationAbilitiesInner
	pop af
	ld [hBattleTurn], a
	ret

RunActivationAbilities:
; Trace will, on failure, copy a later switched in Pokémon's
; Ability. To handle this correctly without redundancy except
; on double switch-ins or similar, we need to do some extra
; handling around it.
	farcall RunActivationAbilitiesInner
	ld a, BATTLE_VARS_ABILITY
	call GetBattleVar
	cp TRACE
	ret z ; trace failed, so don't check opponent trace
	ld a, BATTLE_VARS_ABILITY_OPP
	call GetBattleVar
	cp TRACE
	ret nz
	; invert whose turn it is to properly handle abilities.
	call SwitchTurn
	farcall RunActivationAbilitiesInner
	call SwitchTurn
	ret

SpikesDamage_CheckMoldBreaker:
; Called when a Pokémon with Mold Breaker uses Roar/Whirlwind.
; This is neccessary because it negates Levitate (but not Magic Guard for some reason),
; but can't be checked unconditionally since other kind of switches ignore MB as usual.
	ld a, BATTLE_VARS_ABILITY_OPP
	cp MOLD_BREAKER
	jr z, SpikesDamage_SkipLevitate
SpikesDamage: ; 3dc23
	ld a, BATTLE_VARS_ABILITY
	cp LEVITATE
	jr z, HandleAirBalloon ; still print the message even if we have levitate
SpikesDamage_SkipLevitate:
	call HandleAirBalloon
	ret z
	ld a, BATTLE_VARS_ABILITY
	cp MAGIC_GUARD
	ret z
	ld hl, PlayerScreens
	ld de, BattleMonType
	ld bc, UpdatePlayerHUD
	ld a, [hBattleTurn]
	and a
	jr z, .ok
	ld hl, EnemyScreens
	ld de, EnemyMonType
	ld bc, UpdateEnemyHUD
.ok

	bit SCREENS_SPIKES, [hl]
	ret z

	; Flying-types aren't affected by Spikes.
	call CheckIfUserIsFlyingType
	ret z

	push bc

	ld hl, BattleText_UserHurtBySpikes ; "hurt by Spikes!"
	call StdBattleTextBox

	call GetEighthMaxHP
	call SubtractHPFromTarget

	pop hl
	call .hl

	jp WaitBGMap

.hl
	jp [hl]
; 3dc5b

HandleAirBalloon:
; prints air balloon msg and returns z if we have air balloon
	farcall GetUserItem
	ld a, b
	cp HELD_AIR_BALLOON
	ret nz
	ld a, [hl]
	ld [wd265], a
	call GetItemName
	ld hl, NotifyAirBalloonText
	call StdBattleTextBox
	xor a
	ret

PursuitSwitch: ; 3dc5b
	ld a, BATTLE_VARS_MOVE
	call GetBattleVar
	ld b, a
	call GetMoveEffect
	ld a, b
	cp EFFECT_PURSUIT
	jp nz, PursuitSwitch_done

	ld a, [CurBattleMon]
	push af

	; Kludge: if player is target, override CurPlayerMon to
	; properly update party struct (FIXME: make this unneccessary)
	ld hl, DoPlayerTurn
	ld a, [hBattleTurn]
	and a
	jr z, .do_turn
	ld hl, DoEnemyTurn
	ld a, [LastPlayerMon]
	ld [CurBattleMon], a
.do_turn
	ld a, BANK(DoPlayerTurn)
	rst FarCall

	ld a, BATTLE_VARS_MOVE
	call GetBattleVarAddr
	ld a, $ff
	ld [hl], a

	pop af
	ld [CurBattleMon], a

	ld a, [hBattleTurn]
	and a
	jr z, .check_enemy_fainted

	ld a, [LastPlayerMon]
	call UpdateBattleMon
	call HasPlayerFainted
	jp nz, PursuitSwitch_done

	ld a, $f0
	ld [CryTracks], a
	ld a, [BattleMonSpecies]
	ld b, a
	farcall PlayFaintingCry
	ld a, [LastPlayerMon]
	ld c, a
	ld hl, wBattleParticipantsNotFainted
	ld b, RESET_FLAG
	predef FlagPredef
	call PlayerMonFaintedAnimation
	ld hl, BattleText_PkmnFainted
	jr .done_fainted

.check_enemy_fainted
	call HasEnemyFainted
	jp nz, PursuitSwitch_done

	ld a, $f
	ld [CryTracks], a
	ld a, [EnemyMonSpecies]
	ld b, a
	farcall PlayFaintingCry
	ld de, SFX_KINESIS
	call PlaySFX
	call WaitSFX
	ld de, SFX_FAINT
	call PlaySFX
	call WaitSFX
	call EnemyMonFaintedAnimation
	ld hl, BattleText_EnemyPkmnFainted

.done_fainted
	call StdBattleTextBox
	scf
	ret

PursuitSwitch_done
	; run switch-out abilities
	call SwitchTurn
	ld a, [CurBattleMon]
	push af
	ld a, [hBattleTurn]
	and a
	jr nz, .override_done
	ld a, [LastPlayerMon]
	ld [CurBattleMon], a
.override_done
	farcall RunSwitchAbilities
	pop af
	ld [CurBattleMon], a
	call SwitchTurn
	and a
	ret
; 3dce6

RecallPlayerMon: ; 3dce6
	ld a, [hBattleTurn]
	push af
	xor a
	ld [hBattleTurn], a
	ld [wNumHits], a
	ld de, ANIM_RETURN_MON
	call Call_PlayBattleAnim
	pop af
	ld [hBattleTurn], a
	ret
; 3dcf9

HandleHealingItems: ; 3dcf9
	call CheckSpeed
	jr nz, .enemy_first
	call SetPlayerTurn
	call .do_it
	call SetEnemyTurn
	jr .do_it

.enemy_first
	call SetEnemyTurn
	call .do_it
	call SetPlayerTurn

.do_it
	call HandleHPHealingItem
	call UseHeldStatusHealingItem
	jp UseConfusionHealingItem

HandleHPHealingItem: ; 3dd2f
	; only restore HP if HP<=1/2
	call GetHalfMaxHP
	call CompareHP
	jr z, .ok
	ret nc
.ok
	farcall GetUserItemAfterUnnerve
	ld a, b
	cp HELD_BERRY
	ret nz
	ld b, 0 ; c contains HP to restore
	call ItemRecoveryAnim
	ld a, [hl]
	cp SITRUS_BERRY
	jr nz, .got_hp_to_restore
	call GetQuarterMaxHP
.got_hp_to_restore
	call RestoreHP
UseBattleItem:
	call RefreshBattleHuds
	farcall GetUserItemAfterUnnerve
	ld a, [hl]
	ld [wNamedObjectIndexBuffer], a
	call GetItemName
	farcall ConsumeHeldItem
	ld hl, RecoveredUsingText
	jp StdBattleTextBox
; 3ddc8

SitrusBerryQuarterHP:
	ld a, [Buffer2]
	ld b, a
	ld a, [Buffer1]
	ld c, a
	srl b
	rr c
	srl b
	rr c
	ld a, b
	or c
	jr nz, .continue
	ld c, 1
.continue
	ld a, [de]
	add c
	ld [Buffer5], a
	ld c, a
	dec de
	ld a, [de]
	adc b
	ld [Buffer6], a
	ld b, a
	ret


ItemRecoveryAnim: ; 3ddc8
	push hl
	push de
	push bc
	call EmptyBattleTextBox
	ld a, RECOVER
	ld [FXAnimIDLo], a
	xor a
	ld [wNumHits], a
	ld [FXAnimIDHi], a
	predef PlayBattleAnim
	pop bc
	pop de
	pop hl
	ret
; 3dde9

UseEnemyHeldStatusHealingItem:
	call SwitchTurn
	call UseHeldStatusHealingItem
	jp SwitchTurn

UseHeldStatusHealingItem: ; 3dde9
	farcall GetUserItemAfterUnnerve
	ld hl, .Statuses
.loop
	ld a, [hli]
	cp $ff
	ret z
	inc hl
	cp b
	jr nz, .loop
	dec hl
	ld b, [hl]
	ld a, BATTLE_VARS_STATUS
	call GetBattleVarAddr
	and b
	ret z
	xor a
	ld [hl], a
	push bc
	call UpdateUserInParty
	pop bc
	ld a, BATTLE_VARS_SUBSTATUS2
	call GetBattleVarAddr
	and [hl]
	res SUBSTATUS_TOXIC, [hl]
	ld a, b
	cp ALL_STATUS
	jr nz, .skip_confuse
	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarAddr
	res SUBSTATUS_CONFUSED, [hl]

.skip_confuse
	ld hl, CalcPlayerStats
	ld a, [hBattleTurn]
	and a
	jr z, .got_pointer
	ld hl, CalcEnemyStats

.got_pointer
	ld a, BANK(CalcEnemyStats)
	rst FarCall
	call ItemRecoveryAnim
	call UseBattleItem
	ld a, $1
	and a
	ret
; 3de44

.Statuses: ; 3de44
	db HELD_HEAL_POISON, 1 << PSN
	db HELD_HEAL_FREEZE, 1 << FRZ
	db HELD_HEAL_BURN, 1 << BRN
	db HELD_HEAL_SLEEP, SLP
	db HELD_HEAL_PARALYZE, 1 << PAR
	db HELD_HEAL_STATUS, ALL_STATUS
	db $ff
; 3de51

UseEnemyConfusionHealingItem:
	call SwitchTurn
	call UseConfusionHealingItem
	jp SwitchTurn

UseConfusionHealingItem: ; 3de51
	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVar
	bit SUBSTATUS_CONFUSED, a
	ret z
	farcall GetUserItemAfterUnnerve
	ld a, b
	cp HELD_HEAL_CONFUSE
	jr z, .heal_status
	cp HELD_HEAL_STATUS
	ret nz

.heal_status
	ld a, [hl]
	ld [wd265], a
	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarAddr
	res SUBSTATUS_CONFUSED, [hl]
	call GetItemName
	call ItemRecoveryAnim
	ld hl, BattleText_ItemHealedConfusion
	call StdBattleTextBox
	ld a, [hBattleTurn]
	and a
	jr z, .do_partymon
	call GetOTPartymonItem
	xor a
	ld [bc], a
	ld a, [wBattleMode]
	dec a
	ret z
	ld [hl], $0
	ret

.do_partymon
	call GetPartymonItem
	xor a
	ld [bc], a
	ld [hl], a
	ret
; 3de97

HandleStatBoostingHeldItems: ; 3de97
; The effects handled here are not used in-game.
	call CheckSpeed
	jr nz, .enemy_first
	call .DoPlayer
	jp .DoEnemy

.enemy_first
	call .DoEnemy
	jp .DoPlayer
; 3dea9

.DoPlayer: ; 3dea9
	call GetPartymonItem
	xor a
	jp .HandleItem
; 3deb1

.DoEnemy: ; 3deb1
	call GetOTPartymonItem
	ld a, $1
.HandleItem: ; 3deb6
	ld [hBattleTurn], a
	ld d, h
	ld e, l
	push de
	push bc
	ld a, [bc]
	ld b, a
	farcall GetItemHeldEffect
	ld hl, .StatUpItems
.loop
	ld a, [hli]
	cp $ff
	jr z, .finish
	inc hl
	inc hl
	cp b
	jr nz, .loop
	pop bc
	ld a, [bc]
	ld [wd265], a
	push bc
	dec hl
	dec hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, BANK(BattleCommand_AttackUp)
	rst FarCall
	pop bc
	pop de
	ld a, [FailedMessage]
	and a
	ret nz
	xor a
	ld [bc], a
	ld [de], a
	call GetItemName
	ld hl, BattleText_UsersStringBuffer1Activated
	call StdBattleTextBox
	farcall BattleCommand_StatUpMessage
	ret

.finish
	pop bc
	pop de
	ret
; 3defc

.StatUpItems:
	dbw HELD_ATTACK_UP,     BattleCommand_AttackUp
	dbw HELD_DEFENSE_UP,    BattleCommand_DefenseUp
	dbw HELD_SPEED_UP,      BattleCommand_SpeedUp
	dbw HELD_SP_ATTACK_UP,  BattleCommand_SpecialAttackUp
	dbw HELD_SP_DEFENSE_UP, BattleCommand_SpecialDefenseUp
	dbw HELD_ACCURACY_UP,   BattleCommand_AccuracyUp
	dbw HELD_EVASION_UP,    BattleCommand_EvasionUp
	db $ff
; 3df12


GetPartymonItem: ; 3df12
	ld hl, PartyMon1Item
	ld a, [CurBattleMon]
	call GetPartyLocation
	ld bc, BattleMonItem
	ret
; 3df1f

GetOTPartymonItem: ; 3df1f
	ld hl, OTPartyMon1Item
	ld a, [CurOTMon]
	call GetPartyLocation
	ld bc, EnemyMonItem
	ret
; 3df2c

UpdateBattleHUDs: ; 3df2c
	push hl
	push de
	push bc
	call DrawPlayerHUD
	ld hl, PlayerHPPal
	call SetHPPal
	call CheckDanger
	call DrawEnemyHUD
	ld hl, EnemyHPPal
	call SetHPPal
	pop bc
	pop de
	pop hl
	ret
; 3df48



UpdatePlayerHUD:: ; 3df48
	push hl
	push de
	push bc
	call DrawPlayerHUD
	call UpdatePlayerHPPal
	call CheckDanger
	pop bc
	pop de
	pop hl
	ret
; 3df58

DrawPlayerHUD: ; 3df58
	xor a
	ld [hBGMapMode], a

	; Clear the area
	hlcoord 9, 7
	lb bc, 5, 11
	call ClearBox

	farcall DrawPlayerHUDBorder

;	hlcoord 18, 9
;	ld [hl], $73 ; vertical bar
	call PrintPlayerHUD

	; HP bar
	hlcoord 11, 9
	xor a ; PARTYMON
	ld [MonType], a
	predef DrawPlayerHP

	; Exp bar
	push de
	ld a, [CurBattleMon]
	ld hl, PartyMon1Exp + 2
	call GetPartyLocation
	ld d, h
	ld e, l

	hlcoord 12, 11
	ld a, [TempMonLevel]
	ld b, a
	call FillInExpBar
	pop de

	; Status icon
	farcall LoadPlayerStatusIcon
	hlcoord 12, 8
	ld [hl], $57
	inc hl
	ld [hl], $58
	farcall InstantReloadPaletteHack
	ret
; 3df98

UpdatePlayerHPPal: ; 3df98
	ld hl, PlayerHPPal
	jp UpdateHPPal
; 3df9e

CheckDanger: ; 3df9e
	ld hl, BattleMonHP
	ld a, [hli]
	or [hl]
	jr z, .no_danger
	ld a, [wDanger]
	and a
	jr nz, .done
	ld a, [PlayerHPPal]
	cp HP_RED
	jr z, .danger

.no_danger
	xor a
	ld [Danger], a
	jr .done

.danger
	ld hl, Danger
	set 7, [hl]

.done
	ret
; 3dfbf

PrintPlayerHUD: ; 3dfbf

	ld de, BattleMonNick
	hlcoord 11, 7
	ld a, [BattleMonNick + PKMN_NAME_LENGTH - 2]
	cp "@"
	jr z, .short_name
	dec hl ; hlcoord 10, 7
.short_name
	call PlaceString

	push bc

	ld a, [CurBattleMon]
	ld hl, PartyMon1DVs
	call GetPartyLocation
	ld de, TempMonDVs
rept 4
	ld a, [hli]
	ld [de], a
	inc de
endr
	ld a, [hl]
	ld [de], a
	ld hl, BattleMonLevel
	ld de, TempMonLevel
	ld bc, $0011
	call CopyBytes
	ld a, [CurBattleMon]
	ld hl, PartyMon1Species
	call GetPartyLocation
	ld a, [hl]
	ld [CurPartySpecies], a
	ld [CurSpecies], a
	call GetBaseData

	pop hl
	dec hl

	ld bc, BattleMonShiny
	farcall CheckShininess
	jr nc, .not_own_shiny
	ld a, "★"
	hlcoord 19, 8
	ld [hl], a

.not_own_shiny
	ld a, BREEDMON
	ld [MonType], a
	farcall GetGender
	ld a, " "
	jr c, .got_gender_char
	ld a, "♂"
	jr nz, .got_gender_char
	ld a, "♀"

.got_gender_char
	hlcoord 18, 8
	ld [hl], a

	hlcoord 15, 8
	ld a, [BattleMonLevel]
	ld [TempMonLevel], a
	jp PrintLevel
; 3e036

UpdateEnemyHUD:: ; 3e036
	push hl
	push de
	push bc
	call DrawEnemyHUD
	call UpdateEnemyHPPal
	pop bc
	pop de
	pop hl
	ret
; 3e043

DrawEnemyHUD: ; 3e043
	xor a
	ld [hBGMapMode], a

	hlcoord 0, 0
	lb bc, 4, 12
	call ClearBox

	farcall DrawEnemyHUDBorder

	ld a, [TempEnemyMonSpecies]
	ld [CurSpecies], a
	ld [CurPartySpecies], a
	call GetBaseData
	ld de, EnemyMonNick
	hlcoord 1, 0
	call PlaceString
	ld h, b
	ld l, c
	dec hl

	ld hl, EnemyMonDVs
	ld de, TempMonDVs
	ld a, [EnemySubStatus2]
	bit SUBSTATUS_TRANSFORMED, a
	jr z, .ok
	ld hl, wEnemyBackupDVs
.ok
rept 4
	ld a, [hli]
	ld [de], a
	inc de
endr
	ld a, [hl]
	ld [de], a

	ld bc, EnemyMonShiny
	farcall CheckShininess
	jr nc, .not_shiny
	ld a, "★"
	hlcoord 9, 1
	ld [hl], a

.not_shiny
	ld a, BREEDMON
	ld [MonType], a
	farcall GetGender
	ld a, " "
	jr c, .got_gender
	ld a, "♂"
	jr nz, .got_gender
	ld a, "♀"

.got_gender
	hlcoord 8, 1
	ld [hl], a

	hlcoord 5, 1
	ld a, [EnemyMonLevel]
	ld [TempMonLevel], a
	call PrintLevel

	ld hl, EnemyMonHP
	ld a, [hli]
	ld [hMultiplicand + 1], a
	ld a, [hld]
	ld [hMultiplicand + 2], a
	or [hl]
	jr nz, .not_fainted

	ld c, a
	ld e, a
	ld d, HP_BAR_LENGTH
	jp .draw_bar

.not_fainted
	xor a
	ld [hMultiplicand], a
	ld a, HP_BAR_LENGTH_PX
	ld [hMultiplier], a
	call Multiply
	ld hl, EnemyMonMaxHP
	ld a, [hli]
	ld b, a
	ld a, [hl]
	ld [hMultiplier], a
	ld a, b
	and a
	jr z, .less_than_256_max
	ld a, [hMultiplier]
	srl b
	rr a
	srl b
	rr a
	ld [hDivisor], a
	ld a, [hProduct + 2]
	ld b, a
	srl b
	ld a, [hProduct + 3]
	rr a
	srl b
	rr a
	ld [hProduct + 3], a
	ld a, b
	ld [hProduct + 2], a

.less_than_256_max
	ld a, [hProduct + 2]
	ld [hDividend + 0], a
	ld a, [hProduct + 3]
	ld [hDividend + 1], a
	ld a, 2
	ld b, a
	call Divide
	ld a, [hQuotient + 2]
	ld e, a
	ld a, HP_BAR_LENGTH
	ld d, a
	ld c, a

.draw_bar
	xor a
	ld [wWhichHPBar], a
	hlcoord 1, 2
	call DrawBattleHPBar

	farcall LoadEnemyStatusIcon
	hlcoord 2, 1
	ld [hl], $59
	inc hl
	ld [hl], $5a
	farcall InstantReloadPaletteHack
	ret
; 3e127

UpdateEnemyHPPal: ; 3e127
	ld hl, EnemyHPPal
	call UpdateHPPal
	ret
; 3e12e

UpdateHPPal: ; 3e12e
	ld b, [hl]
	call SetHPPal
	ld a, [hl]
	cp b
	ret z
	jp FinishBattleAnim
; 3e138

BattleMenu: ; 3e139
	xor a
	ld [hBGMapMode], a
	call LoadTempTileMapToTileMap

	ld a, [BattleType]
	cp BATTLETYPE_TUTORIAL
	jr z, .ok
	call EmptyBattleTextBox
	call UpdateBattleHuds
	call EmptyBattleTextBox
	call LoadTileMapToTempTileMap
.ok

.loop
	ld a, [BattleType]
	cp BATTLETYPE_CONTEST
	jr nz, .not_contest
	farcall ContestBattleMenu
	jr .next
.not_contest

	; Auto input: choose "ITEM"
	ld a, [InputType]
	or a
	jr z, .skip_dude_pack_select
	farcall _DudeAutoInput_DownA
.skip_dude_pack_select

	call LoadBattleMenu2
	ret c

.next
	ld a, $1
	ld [hBGMapMode], a
	ld a, [wd0d2]
	cp $1
	jp z, BattleMenu_Fight
	cp $3
	jp z, BattleMenu_Pack
	cp $2
	jp z, BattleMenu_PKMN
	cp $4
	jp z, BattleMenu_Run
	jr .loop
; 3e192

BattleMenu_Fight: ; 3e192
	xor a
	ld [wNumFleeAttempts], a
	call Call_LoadTempTileMapToTileMap
	and a
	ret
; 3e19b

LoadBattleMenu2: ; 3e19b
	farcall LoadBattleMenu
	and a
	ret
; 3e1c7

BattleMenu_Pack: ; 3e1c7
	ld a, [wLinkMode]
	and a
	jp nz, .ItemsCantBeUsed

	ld a, [InBattleTowerBattle]
	and a
	jp nz, .ItemsCantBeUsed

	call LoadStandardMenuDataHeader

	ld a, [BattleType]
	cp BATTLETYPE_TUTORIAL
	jr z, .tutorial
	cp BATTLETYPE_CONTEST
	jr z, .contest

	farcall BattlePack
	ld a, [wPlayerAction]
	and a
	jr z, .didnt_use_item
	jr .got_item

.tutorial
	farcall TutorialPack
	ld a, POKE_BALL
	ld [CurItem], a
	call DoItemEffect
	jr .got_item

.contest
	ld a, PARK_BALL
	ld [CurItem], a
	call DoItemEffect

.got_item
	call .UseItem
	ret

.didnt_use_item
	call ClearPalettes
	call DelayFrame
	call _LoadBattleFontsHPBar
	call GetMonBackpic
	call GetMonFrontpic
	call ExitMenu
	call WaitBGMap
	call FinishBattleAnim
	call LoadTileMapToTempTileMap
	jp BattleMenu
; 3e22b

.ItemsCantBeUsed: ; 3e22b
	ld hl, BattleText_ItemsCantBeUsedHere
	call StdBattleTextBox
	jp BattleMenu
; 3e234

.UseItem: ; 3e234
	ld a, [wWildMon]
	and a
	jr nz, .run
	farcall CheckItemPocket
	ld a, [wItemAttributeParamBuffer]
	cp BALL
	jr z, .ball
	call ClearBGPalettes

.ball
	xor a
	ld [hBGMapMode], a
	call _LoadBattleFontsHPBar
	call ClearSprites
	ld a, [BattleType]
	cp BATTLETYPE_TUTORIAL
	jr z, .tutorial2
	call GetMonBackpic

.tutorial2
	call GetMonFrontpic
	ld a, $1
	ld [wMenuCursorY], a
	call ExitMenu
	call UpdateBattleHUDs
	call WaitBGMap
	call LoadTileMapToTempTileMap
	call ClearWindowData
	call FinishBattleAnim
	and a
	ret

.run
	xor a
	ld [wWildMon], a
	ld a, [wBattleResult]
	and $c0
	ld [wBattleResult], a
	call ClearWindowData
	call SetPalettes
	scf
	ret
; 3e28d

BattleMenu_PKMN: ; 3e28d
	call LoadStandardMenuDataHeader
BattleMenuPKMN_ReturnFromStats:
	call ExitMenu
	call LoadStandardMenuDataHeader
	call ClearBGPalettes
BattleMenuPKMN_Loop:
	call SetUpBattlePartyMenu
	xor a
	ld [PartyMenuActionText], a
	call JumpToPartyMenuAndPrintText
	call SelectBattleMon
	jr c, .Cancel
.loop
	farcall FreezeMonIcons
	call .GetMenu
	jr c, .PressedB
	call PlaceHollowCursor
	ld a, [wMenuCursorY]
	cp $1 ; SWITCH
	jp z, TryPlayerSwitch
	cp $2 ; STATS
	jr z, .Stats
	cp $3 ; CANCEL
	jr z, .Cancel
	jr .loop

.PressedB:
	jr BattleMenuPKMN_Loop

.Stats:
	call Battle_StatsScreen
	jp BattleMenuPKMN_ReturnFromStats

.Cancel:
	call ClearSprites
	call ClearPalettes
	call DelayFrame
	call _LoadStatusIcons
	call CloseWindow
	call LoadTileMapToTempTileMap
	call GetMemSGBLayout
	call SetPalettes
	jp BattleMenu
; 3e2f5

.GetMenu: ; 3e2f5
	farcall BattleMonMenu
	ret
; 3e308

Battle_StatsScreen: ; 3e308
	call DisableLCD
	ld hl, VTiles2 tile $31
	ld de, VTiles0
	ld bc, $0110
	call CopyBytes
	ld hl, VTiles2
	ld de, VTiles0 tile $11
	ld bc, $31 tiles
	call CopyBytes
	call EnableLCD
	call ClearSprites
	call LowVolume
	xor a ; PARTYMON
	ld [MonType], a
	farcall StatsScreenInit
	call MaxVolume
	call DisableLCD
	ld hl, VTiles0
	ld de, VTiles2 tile $31
	ld bc, $11 tiles
	call CopyBytes
	ld hl, VTiles0 tile $11
	ld de, VTiles2
	ld bc, $31 tiles
	call CopyBytes
	call EnableLCD
	ret
; 3e358


TryPlayerSwitch: ; 3e358
	ld a, [CurBattleMon]
	ld d, a
	ld a, [CurPartyMon]
	cp d
	jr nz, .check_trapped
	ld hl, BattleText_PkmnIsAlreadyOut
	call StdBattleTextBox
	jp BattleMenuPKMN_Loop

.check_trapped
	call SetPlayerTurn
	call CheckIfTrappedByAbility_Core
	jr nz, .check_other_trapped
	ld a, BATTLE_VARS_ABILITY_OPP
	call GetBattleVar
	ld b, a
	farcall BufferAbility
	ld hl, BattleText_PkmnCantBeRecalledAbility
	call StdBattleTextBox
	jp BattleMenuPKMN_Loop

.check_other_trapped
	ld a, [wPlayerWrapCount]
	and a
	jr nz, .trapped
	ld a, [EnemySubStatus2]
	bit SUBSTATUS_CANT_RUN, a
	jr z, .try_switch

.trapped
	ld hl, BattleText_PkmnCantBeRecalled
	call StdBattleTextBox
	jp BattleMenuPKMN_Loop

.try_switch
	call CheckIfCurPartyMonIsFitToFight
	jp z, BattleMenuPKMN_Loop
	ld a, [CurBattleMon]
	ld [LastPlayerMon], a
	ld a, $2
	ld [wPlayerAction], a
	call ClearPalettes
	call DelayFrame
	call ClearSprites
	call _LoadStatusIcons
	call CloseWindow
	call GetMemSGBLayout
	call SetPalettes
	ld a, [CurPartyMon]
	ld [CurBattleMon], a
PlayerSwitch: ; 3e3ad
	ld a, 1
	ld [wPlayerIsSwitching], a
	ld a, [wLinkMode]
	and a
	jr z, .not_linked
	call LoadStandardMenuDataHeader
	call LinkBattleSendReceiveAction
	call CloseWindow

.not_linked
	call ParseEnemyAction
	ld a, [wLinkMode]
	and a
	jr nz, .linked

.switch
	call BattleMonEntrance
	and a
	ret

.linked
	ld a, [wBattleAction]
	cp BATTLEACTION_STRUGGLE
	jp z, .switch
	cp BATTLEACTION_SWITCH1
	jp c, .switch
	cp BATTLEACTION_FORFEIT
	jr nz, .dont_run
	call WildFled_EnemyFled_LinkBattleCanceled
	ret

.dont_run
	ld a, [hLinkPlayerNumber]
	cp $1
	jr z, .player_1
	call BattleMonEntrance
	call EnemyMonEntrance
	and a
	ret

.player_1
	call EnemyMonEntrance
	call BattleMonEntrance
	and a
	ret
; 3e3ff

EnemyMonEntrance: ; 3e3ff
	farcall AI_Switch
	call SetEnemyTurn
	call SpikesDamage
	jp RunActivationAbilities
; 3e40b

BattleMonEntrance: ; 3e40b
	call WithdrawPkmnText

	ld c, 50
	call DelayFrames

	ld hl, PlayerSubStatus4
	res SUBSTATUS_RAGE, [hl]

	call SetEnemyTurn
	call PursuitSwitch
	jr c, .ok
	call RecallPlayerMon
.ok

	hlcoord 9, 7
	lb bc, 5, 11
	call ClearBox

	ld a, [CurBattleMon]
	ld [CurPartyMon], a
	call AddBattleParticipant
	call InitBattleMon
	call ResetPlayerStatLevels
	call SendOutPkmnText
	call NewBattleMonStatus
	call BreakAttraction
	call SendOutPlayerMon
	call EmptyBattleTextBox
	call LoadTileMapToTempTileMap
	call SetPlayerTurn
	call SpikesDamage
	call RunActivationAbilities
	ld a, $2
	ld [wMenuCursorY], a
	ret
; 3e459

PassedBattleMonEntrance: ; 3e459
	ld c, 50
	call DelayFrames

	hlcoord 9, 7
	lb bc, 5, 11
	call ClearBox

	ld a, [CurPartyMon]
	ld [CurBattleMon], a
	call AddBattleParticipant
	call InitBattleMon
	xor a
	ld [wd265], a
	call ApplyStatLevelMultiplierOnAllStats
	call SendOutPlayerMon
	call EmptyBattleTextBox
	call LoadTileMapToTempTileMap
	call SetPlayerTurn
	call SpikesDamage
	jp RunActivationAbilities
; 3e489


BattleMenu_Run: ; 3e489
	call Call_LoadTempTileMapToTileMap
	ld a, $3
	ld [wMenuCursorY], a
	ld hl, BattleMonSpeed
	ld de, EnemyMonSpeed
	call TryToRunAwayFromBattle
	ld a, 0 ; not xor a; preserve carry flag
	ld [wFailedToFlee], a
	ret c
	ld a, [wPlayerAction]
	and a
	ret nz
	jp BattleMenu
; 3e4a8


CheckAmuletCoin: ; 3e4a8
	ld a, [BattleMonItem]
	ld b, a
	farcall GetItemHeldEffect
	ld a, b
	cp HELD_AMULET_COIN
	ret nz
	ld a, 1
	ld [wAmuletCoin], a
	ret
; 3e4bc

MoveSelectionScreen: ; 3e4bc
	ld hl, EnemyMonMoves
	ld a, [wMoveSelectionMenuType]
	dec a
	jr z, .got_menu_type
	dec a
	jr z, .ether_elixer_menu
	call CheckPlayerHasUsableMoves
	ret z ; use Struggle
	ld hl, BattleMonMoves
	jr .got_menu_type

.ether_elixer_menu
	ld a, MON_MOVES
	call GetPartyParamLocation

.got_menu_type
	ld de, wListMoves_MoveIndicesBuffer
	ld bc, NUM_MOVES
	call CopyBytes
	xor a
	ld [hBGMapMode], a

	hlcoord 4, 17 - NUM_MOVES - 1
	ld b, 4
	ld c, 14
	ld a, [wMoveSelectionMenuType]
	cp $2
	jr nz, .got_dims
	hlcoord 4, 17 - NUM_MOVES - 1 - 4
	ld b, 4
	ld c, 14
.got_dims
	call TextBox

	hlcoord 6, 17 - NUM_MOVES
	ld a, [wMoveSelectionMenuType]
	cp $2
	jr nz, .got_start_coord
	hlcoord 6, 17 - NUM_MOVES - 4
.got_start_coord
	ld a, SCREEN_WIDTH
	ld [Buffer1], a
	predef ListMoves

	ld b, 5
	ld a, [wMoveSelectionMenuType]
	cp $2
	ld a, 17 - NUM_MOVES
	jr nz, .got_default_coord
	ld b, 5
	ld a, 17 - NUM_MOVES - 4

.got_default_coord
	ld [w2DMenuCursorInitY], a
	ld a, b
	ld [w2DMenuCursorInitX], a
	ld a, [wMoveSelectionMenuType]
	cp $1
	jr z, .skip_inc
	ld a, [CurMoveNum]
	inc a

.skip_inc
	ld [wMenuCursorY], a
	ld a, $1
	ld [wMenuCursorX], a
	ld a, [wNumMoves]
	inc a
	ld [w2DMenuNumRows], a
	ld a, $1
	ld [w2DMenuNumCols], a
	ld c, $2c
	ld a, [wMoveSelectionMenuType]
	dec a
	ld b, D_DOWN | D_UP | A_BUTTON
	jr z, .okay
	dec a
	ld b, D_DOWN | D_UP | A_BUTTON | B_BUTTON
	jr z, .okay
	ld a, [wLinkMode]
	and a
	jr nz, .okay
	ld b, D_DOWN | D_UP | A_BUTTON | B_BUTTON | SELECT

.okay
	ld a, b
	ld [wMenuJoypadFilter], a
	ld a, c
	ld [w2DMenuFlags1], a
	xor a
	ld [w2DMenuFlags2], a
	ld a, $10
	ld [w2DMenuCursorOffsets], a
.menu_loop
	ld a, [wMoveSelectionMenuType]
	and a
	jr z, .battle_player_moves
	dec a
	jr nz, .interpret_joypad
	hlcoord 11, 14
	ld de, .string_3e61c
	call PlaceString
	jr .interpret_joypad

.battle_player_moves
	call MoveInfoBox
	ld a, [wMoveSwapBuffer]
	and a
	jr z, .interpret_joypad
	hlcoord 5, 13
	ld bc, SCREEN_WIDTH
	dec a
	call AddNTimes
	ld [hl], "▷"

.interpret_joypad
	ld a, $1
	ld [hBGMapMode], a
	call ScrollingMenuJoypad
	bit D_UP_F, a
	jp nz, .pressed_up
	bit D_DOWN_F, a
	jp nz, .pressed_down
	bit SELECT_F, a
	jp nz, .pressed_select
	bit B_BUTTON_F, a
	; A button
	push af

	xor a
	ld [wMoveSwapBuffer], a
	ld a, [wMenuCursorY]
	dec a
	ld [wMenuCursorY], a
	ld b, a
	ld a, [wMoveSelectionMenuType]
	dec a
	jr nz, .not_enemy_moves_process_b

	pop af
	ret

.not_enemy_moves_process_b
	dec a
	ld a, b
	ld [CurMoveNum], a
	jr nz, .use_move

	pop af
	ret

.use_move
	pop af
	ret nz

	ld hl, BattleMonPP
	ld a, [wMenuCursorY]
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]
	and $3f
	jr z, .no_pp_left
	ld a, [PlayerDisableCount]
	swap a
	and $f
	dec a
	cp c
	jr z, .move_disabled
	ld a, [wUnusedPlayerLockedMove]
	and a
	jr nz, .skip2
	ld a, [wMenuCursorY]
	ld hl, BattleMonMoves
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]

.skip2
	ld [CurPlayerMove], a
	xor a
	ret

.move_disabled
	ld hl, BattleText_TheMoveIsDisabled
	jr .place_textbox_start_over

.choiced
	ld hl, BattleText_ItemOnlyAllowsMove
	jr .place_textbox_start_over

.assault_vest
	ld hl, BattleText_ItemPreventsStatusMoves
	jr .place_textbox_start_over

.no_pp_left
	ld hl, BattleText_TheresNoPPLeftForThisMove

.place_textbox_start_over
	call StdBattleTextBox
	call Call_LoadTempTileMapToTileMap
	jp MoveSelectionScreen
; 3e61c

.string_3e61c ; 3e61c
	db "@"
; 3e61d

.pressed_up
	ld a, [wMenuCursorY]
	and a
	jp nz, .menu_loop
	ld a, [wNumMoves]
	inc a
	ld [wMenuCursorY], a
	jp .menu_loop
; 3e62e

.pressed_down ; 3e62e
	ld a, [wMenuCursorY]
	ld b, a
	ld a, [wNumMoves]
	inc a
	inc a
	cp b
	jp nz, .menu_loop
	ld a, $1
	ld [wMenuCursorY], a
	jp .menu_loop
; 3e643

.pressed_select ; 3e643
	ld a, [wMoveSwapBuffer]
	and a
	jr z, .start_swap
	ld hl, BattleMonMoves
	call .swap_bytes
	ld hl, BattleMonPP
	call .swap_bytes
	ld hl, PlayerDisableCount
	ld a, [hl]
	swap a
	and $f
	ld b, a
	ld a, [wMenuCursorY]
	cp b
	jr nz, .not_swapping_disabled_move
	ld a, [hl]
	and $f
	ld b, a
	ld a, [wMoveSwapBuffer]
	swap a
	add b
	ld [hl], a
	jr .swap_moves_in_party_struct

.not_swapping_disabled_move
	ld a, [wMoveSwapBuffer]
	cp b
	jr nz, .swap_moves_in_party_struct
	ld a, [hl]
	and $f
	ld b, a
	ld a, [wMenuCursorY]
	swap a
	add b
	ld [hl], a

.swap_moves_in_party_struct
; Fixes the COOLTRAINER glitch
	ld a, [PlayerSubStatus2]
	bit SUBSTATUS_TRANSFORMED, a
	jr nz, .transformed
	ld hl, PartyMon1Moves
	ld a, [CurBattleMon]
	call GetPartyLocation
	push hl
	call .swap_bytes
	pop hl
	ld bc, MON_PP - MON_MOVES
	add hl, bc
	call .swap_bytes

.transformed
	xor a
	ld [wMoveSwapBuffer], a
	jp MoveSelectionScreen

.swap_bytes
	push hl
	ld a, [wMoveSwapBuffer]
	dec a
	ld c, a
	ld b, 0
	add hl, bc
	ld d, h
	ld e, l
	pop hl
	ld a, [wMenuCursorY]
	dec a
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [de]
	ld b, [hl]
	ld [hl], a
	ld a, b
	ld [de], a
	ret

.start_swap
	ld a, [wMenuCursorY]
	ld [wMoveSwapBuffer], a
	jp MoveSelectionScreen
; 3e6c8

MoveInfoBox: ; 3e6c8
	xor a
	ld [hBGMapMode], a

	hlcoord 0, 8
	ld b, 3
	ld c, 9
	call TextBox

	ld a, [PlayerDisableCount]
	and a
	jr z, .not_disabled

	swap a
	and $f
	ld b, a
	ld a, [wMenuCursorY]
	cp b
	jr nz, .not_disabled

	hlcoord 1, 10
	ld de, .Disabled
	call PlaceString
	jp .done

.not_disabled
	ld hl, wMenuCursorY
	dec [hl]
	call SetPlayerTurn
	ld hl, BattleMonMoves
	ld a, [wMenuCursorY]
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]
	ld [CurPlayerMove], a

	ld a, [CurBattleMon]
	ld [CurPartyMon], a
	ld a, WILDMON
	ld [MonType], a
	farcall GetMaxPPOfMove

	ld hl, wMenuCursorY
	ld c, [hl]
	inc [hl]
	ld b, 0
	ld hl, BattleMonPP
	add hl, bc
	ld a, [hl]
	and $3f
	ld [StringBuffer1], a
	call .PrintPP

	farcall UpdateMoveData

	hlcoord 1, 10
	ld de, .PowAcc
	call PlaceString

; Power and accuracy display code copied from engine/startmenu.asm

	ld a, [CurMove]
	dec a
	ld hl, Moves + MOVE_POWER
	ld bc, MOVE_LENGTH
	call AddNTimes
	ld a, BANK(Moves)
	call GetFarByte
	hlcoord 1, 10
	cp 2
	jr c, .no_power
	ld [wd265], a
	ld de, wd265
	lb bc, 1, 3
	call PrintNum
	jr .place_accuracy
.no_power
	ld de, .NA
	call PlaceString

.place_accuracy
	ld a, [CurMove]
	dec a
	ld hl, Moves + MOVE_ACC
	ld bc, MOVE_LENGTH
	call AddNTimes
	; convert internal accuracy representation to a number
	; between 0-100
	ld a, BANK(Moves)
	call GetFarByte
	ld [hMultiplicand], a
	ld a, 100
	ld [hMultiplier], a
	call Multiply
	ld a, [hProduct]
	; don't increase a for 0% moves
	and a
	jr z, .no_inc
	inc a
.no_inc
	hlcoord 6, 10
	cp 2
	jr c, .no_acc
	ld [wd265], a
	ld de, wd265
	lb bc, 1, 3
	call PrintNum
	jr .icons
.no_acc
	ld de, .NA
	call PlaceString

.icons
	ld hl, CategoryIconGFX
	ld bc, 2 tiles
	ld a, [wPlayerMoveStruct + MOVE_CATEGORY]
	call AddNTimes
	ld d, h
	ld e, l
	ld hl, VTiles2 tile $5b
	lb bc, BANK(CategoryIconGFX), 2
	call Request2bpp
	hlcoord 1, 9
	ld [hl], $5b
	inc hl
	ld [hl], $5c

	ld hl, TypeIconGFX
	ld bc, 4 tiles
	ld a, [wPlayerMoveStruct + MOVE_TYPE]
	call AddNTimes
	ld d, h
	ld e, l
	ld hl, VTiles2 tile $5d
	lb bc, BANK(TypeIconGFX), 4
	call Request2bpp
	hlcoord 3, 9
	ld [hl], $5d
	inc hl
	ld [hl], $5e
	inc hl
	ld [hl], $5f
	inc hl
	ld [hl], $60

	farcall LoadBattleCategoryAndTypePalettes
	call WaitBGMap
	call SetPalettes

.done
	ret
; 3e74f

.Disabled:
	db "Disabled!@"
.PowAcc:
	db "   <BOLDP>/   %@"
.NA:
	db "---@"
; 3e75f


.PrintPP: ; 3e75f
	hlcoord 2, 11
rept 2
	ld [hl], "<BOLDP>"
	inc hl
endr
	inc hl
	push hl
	ld de, StringBuffer1
	lb bc, 1, 2
	call PrintNum
	pop hl
	inc hl
	inc hl
	ld [hl], "/"
	inc hl
	ld de, wNamedObjectIndexBuffer
	lb bc, 1, 2
	call PrintNum
	ret
; 3e786

CheckPlayerHasUsableMoves: ; 3e786
	ld a, STRUGGLE
	ld [CurPlayerMove], a
	ld a, [PlayerDisableCount]
	and a
	ld hl, BattleMonPP
	jr nz, .disabled

	ld a, [hli]
	or [hl]
	inc hl
	or [hl]
	inc hl
	or [hl]
	and $3f
	ret nz
	jr .force_struggle

.disabled
	swap a
	and $f
	ld b, a
	ld d, $5
	xor a
.loop
	dec d
	jr z, .done
	ld c, [hl]
	inc hl
	dec b
	jr z, .loop
	or c
	jr .loop

.done
	and $3f
	ret nz

.force_struggle
	ld hl, BattleText_PkmnHasNoMovesLeft
	call StdBattleTextBox
	ld c, 60
	call DelayFrames
	xor a
	ret
; 3e7c1



ParseEnemyAction: ; 3e7c1
	ld a, [wEnemyIsSwitching]
	and a
	ret nz
	ld a, [wLinkMode]
	and a
	jr z, .not_linked
	call EmptyBattleTextBox
	call LoadTileMapToTempTileMap
	ld a, [wPlayerAction]
	and a
	call z, LinkBattleSendReceiveAction
	call Call_LoadTempTileMapToTileMap
	ld a, [wBattleAction]
	cp BATTLEACTION_STRUGGLE
	jp z, .struggle
	cp BATTLEACTION_SWITCH1
	jp nc, ResetVarsForSubstatusRage
	ld [CurEnemyMoveNum], a
	ld c, a
	ld a, [EnemySubStatus1]
	bit SUBSTATUS_ROLLOUT, a
	jp nz, .skip_load
	ld a, [EnemySubStatus3]
	and 1 << SUBSTATUS_CHARGED | 1 << SUBSTATUS_RAMPAGE
	jp nz, .skip_load

	ld hl, EnemySubStatus2
	bit SUBSTATUS_ENCORED, [hl]
	ld a, [LastEnemyMove]
	jp nz, .finish
	ld hl, EnemyMonMoves
	ld b, 0
	add hl, bc
	ld a, [hl]
	jp .finish

.not_linked
	ld hl, EnemySubStatus2
	bit SUBSTATUS_ENCORED, [hl]
	jr z, .skip_encore
	ld a, [LastEnemyMove]
	jp .finish

.skip_encore
	call CheckEnemyLockedIn
	jp nz, ResetVarsForSubstatusRage
	jr .continue

.continue
	ld hl, EnemyMonMoves
	ld de, EnemyMonPP
	ld b, NUM_MOVES
.loop
	ld a, [hl]
	and a
	jp z, .struggle
	ld a, [EnemyDisabledMove]
	cp [hl]
	jr z, .disabled
	ld a, [de]
	and $3f
	jr nz, .enough_pp

.disabled
	inc hl
	inc de
	dec b
	jr nz, .loop
	jr .struggle

.enough_pp
	ld a, [wBattleMode]
	dec a
	jr nz, .skip_load
; wild
.loop2
	ld hl, EnemyMonMoves
	call BattleRandom
	and %11 ; NUM_MOVES - 1
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [EnemyDisableCount]
	swap a
	and $f
	dec a
	cp c
	jr z, .loop2
	ld a, [hl]
	and a
	jr z, .loop2
	ld hl, EnemyMonPP
	add hl, bc
	ld b, a
	ld a, [hl]
	and $3f
	jr z, .loop2
	ld a, c
	ld [CurEnemyMoveNum], a
	ld a, b

.finish
	ld [CurEnemyMove], a

.skip_load
	call SetEnemyTurn
	farcall UpdateMoveData
	call CheckEnemyLockedIn
	jr nz, .raging
	xor a
	ld [wEnemyCharging], a

.raging
	ld a, [wEnemyMoveStruct + MOVE_EFFECT]
	cp EFFECT_FURY_CUTTER
	jr z, .fury_cutter
	xor a
	ld [EnemyFuryCutterCount], a

.fury_cutter
	ld a, [wEnemyMoveStruct + MOVE_EFFECT]
	cp EFFECT_RAGE
	jr z, .no_rage
	ld hl, EnemySubStatus4
	res SUBSTATUS_RAGE, [hl]
	xor a
	ld [wEnemyRageCounter], a

.no_rage
	ld a, [wEnemyMoveStruct + MOVE_EFFECT]
	cp EFFECT_PROTECT
	ret z
	cp EFFECT_ENDURE
	ret z
	xor a
	ld [EnemyProtectCount], a
	ret

.struggle
	ld a, STRUGGLE
	jr .finish
; 3e8c1

ResetVarsForSubstatusRage: ; 3e8c1
	xor a
	ld [EnemyFuryCutterCount], a
	ld [EnemyProtectCount], a
	ld [wEnemyRageCounter], a
	ld hl, EnemySubStatus4
	res SUBSTATUS_RAGE, [hl]
	ret
; 3e8d1

CheckEnemyLockedIn: ; 3e8d1
	ld a, [EnemySubStatus4]
	and 1 << SUBSTATUS_RECHARGE
	ret nz

	ld hl, EnemySubStatus3
	ld a, [hl]
	and 1 << SUBSTATUS_CHARGED | 1 << SUBSTATUS_RAMPAGE
	ret nz

	ld hl, EnemySubStatus1
	bit SUBSTATUS_ROLLOUT, [hl]
	ret
; 3e8e4

LinkBattleSendReceiveAction: ; 3e8e4
	farcall _LinkBattleSendReceiveAction
	ret
; 3e8eb


LoadEnemyMon: ; 3e8eb
; Initialize enemy monster parameters
; To do this we pull the species from TempEnemyMonSpecies

; Notes:
;   BattleRandom is used to ensure sync between Game Boys

; Clear the whole EnemyMon struct
	xor a
	ld hl, EnemyMonSpecies
	ld bc, EnemyMonEnd - EnemyMon
	call ByteFill

; We don't need to be here if we're in a link battle
	ld a, [wLinkMode]
	and a
	jp nz, InitEnemyMon

; and also not in a BattleTower-Battle
	ld a, [InBattleTowerBattle] ; ????
	bit 0, a
	jp nz, InitEnemyMon

; Make sure everything knows what species we're working with
	ld a, [TempEnemyMonSpecies]
	ld [EnemyMonSpecies], a
	ld [CurSpecies], a
	ld [CurPartySpecies], a

; Grab the BaseData for this species
	call GetBaseData


; Let's get the item:

; Is the item predetermined?
	ld a, [wBattleMode]
	dec a
	jr z, .WildItem

; If we're in a trainer battle, the item is in the party struct
	ld a, [CurPartyMon]
	ld hl, OTPartyMon1Item
	call GetPartyLocation ; bc = PartyMon[CurPartyMon] - PartyMons
	ld a, [hl]
	jr .UpdateItem


.WildItem:
; In a wild battle, we pull from the item slots in BaseData

; Force Item1
; Used for Snorlax, Ho-Oh, Lugia, and Kanto legendary encounters
	ld a, [BattleType]
	cp BATTLETYPE_FORCEITEM
	ld a, [BaseItems]
	jr z, .UpdateItem

	ld a, [BattleType]
	cp BATTLETYPE_HO_OH
	ld a, [BaseItems]
	jr z, .UpdateItem

	ld a, [BattleType]
	cp BATTLETYPE_LUGIA
	ld a, [BaseItems]
	jr z, .UpdateItem

	ld a, [BattleType]
	cp BATTLETYPE_KANTO_LEGEND
	ld a, [BaseItems]
	jr z, .UpdateItem

; Failing that, it's all up to chance

	push bc
	ld a, [PartyMon1Ability]
	ld b, a
	ld a, [PartyMon1Species]
	ld c, a
	farcall GetAbility
	ld a, b
	pop bc

if DEF(FAITHFUL)
	cp COMPOUND_EYES
	jr nz, .no_compound_eyes_or_amulet_coin
else
	cp COMPOUND_EYES
	jr z, .compound_eyes
; If the party lead holds an Amulet Coin, chances are increased
	ld a, [PartyMon1Item]
	cp AMULET_COIN
	jr nz, .no_compound_eyes_or_amulet_coin
endc

.compound_eyes:
; 60% chance of getting Item1 with an Amulet Coin
	call BattleRandom
	cp a, 60 percent
	ld a, [BaseItems]
	jr c, .UpdateItem

; 20% chance of getting Item2 (50% of (100% - 60%) = 20%) with an Amulet Coin
	call BattleRandom
	cp a, 50 percent
	ld a, [BaseItems+1]
	jr c, .UpdateItem

; 20% chance of not getting an item (100% - 60% - 20% = 20%)
	ld a, NO_ITEM
	jr .UpdateItem

; Default chances without Compound Eyes or Amulet Coin
.no_compound_eyes_or_amulet_coin:

; 50% chance of getting Item1
	call BattleRandom
	cp a, 50 percent
	ld a, [BaseItems]
	jr c, .UpdateItem

; 5% chance of getting Item2 (10% of (100% - 50%) = 5%)
	call BattleRandom
	cp a, 10 percent
	ld a, [BaseItems+1]
	jr c, .UpdateItem

; 45% chance of not getting an item (100% - 50% - 5% = 45%)
	ld a, NO_ITEM


.UpdateItem:
	ld [EnemyMonItem], a


; Initialize DVs and personality

; If we're in a trainer battle, DVs and personality are predetermined
	ld a, [wBattleMode]
	and a
	jr z, .InitDVs

	ld a, [EnemySubStatus2]
	bit SUBSTATUS_TRANSFORMED, a
	jr z, .InitDVs

; Unknown
	ld hl, wEnemyBackupDVs
	ld de, EnemyMonDVs
rept 4
	ld a, [hli]
	ld [de], a
	inc de
endr
	ld a, [hl]
	ld [de], a
	jp .Happiness


.InitDVs:

; Trainer DVs

; All trainers have preset DVs, determined by class
; See GetTrainerDVsAndPersonality for more on that
; These are the DVs we'll use if we're actually in a trainer battle

	ld a, [wBattleMode]
	dec a
	jr z, .WildDVs

	ld a, [CurPartyMon]
	ld hl, OTPartyMon1DVs
	call GetPartyLocation
	ld de, DVAndPersonalityBuffer
	ld bc, 5 ; 3 DVs + 2 personality bytes
	call CopyBytes

	jr .UpdateDVs

.WildDVs:

; Wild DVs
; Here's where the fun starts

; Roaming monsters (Entei, Raikou) work differently
; They have their own structs, which are shorter than normal
	ld a, [BattleType]
	cp a, BATTLETYPE_ROAMING
	jr nz, .GenerateDVs

; Grab DVs and personality
	call GetRoamMonDVsAndPersonality
	ld b, h
	ld c, l
; Grab HP
	call GetRoamMonHP
	ld a, [hl]
; Check if the HP has been initialized
	and a
; If the RoamMon struct has already been initialized, we're done
	jr nz, .UpdateDVs

; If it hasn't, we need to initialize the DVs
; (HP is initialized at the end of the battle)
	; DVs
	call BattleRandom
	ld [hli], a
	call BattleRandom
	ld [hli], a
	call BattleRandom
	ld [hli], a
	; TODO: random shininess, ability, and nature
	xor a
	ld [hli], a
	ld [hl], a
; We're done with DVs
	jr .UpdateDVs

.GenerateDVs:
; Generate new random DVs
	call BattleRandom
	ld [DVAndPersonalityBuffer], a
	call BattleRandom
	ld [DVAndPersonalityBuffer + 1], a
	call BattleRandom
	ld [DVAndPersonalityBuffer + 2], a

.GeneratePersonality:
	; TODO: random shininess, ability, and nature
	; shininess: 1/4096 (3/4096 with shiny charm, 0 if NumBalls == 0)
	; ability: 5% hidden, 47.5% first, 47.5% second
	; nature: even chance of any
	xor a
	ld [DVAndPersonalityBuffer + 3], a

; Arbok form
	ld a, [CurPartySpecies]
	cp EKANS
	jr z, .arbok_form
	cp ARBOK
	jr z, .arbok_form
	ld a, 1
	jr .got_form
.arbok_form
	push bc
	push de
	farcall RegionCheck
	ld a, e
	pop de
	pop bc
	and a
	jr nz, .kanto_arbok
.johto_arbok
	ld a, 1
	jr .got_form
.kanto_arbok
	ld a, 2
.got_form
	and FORM_MASK
	ld [DVAndPersonalityBuffer + 4], a

.UpdateDVs:
	ld bc, DVAndPersonalityBuffer
	ld hl, EnemyMonDVs
rept 4
	ld a, [bc]
	ld [hli], a
	inc bc
endr
	ld a, [bc]
	ld [hl], a


; We've still got more to do if we're dealing with a wild monster
	ld a, [wBattleMode]
	dec a
	jp nz, .Happiness

	ld a, [BattleType]
	cp a, BATTLETYPE_SHINY
	jr nz, .not_forced_shiny
	ld a, [EnemyMonShiny]
	or SHINY_MASK
	ld [EnemyMonShiny], a
.not_forced_shiny

; TODO: Shiny Charm (if not shiny, try again with better odds such that the total chance is 3/4096)

	push bc
	ld a, [PartyMon1Ability]
	ld b, a
	ld a, [PartyMon1Species]
	ld c, a
	farcall GetAbility
	ld a, b
	pop bc
	cp SYNCHRONIZE
	jr nz, .no_synchronize
	ld a, [PartyMon1Nature]
	and NATURE_MASK
	ld b, a
	ld a, [EnemyMonNature]
	and NOT_NATURE_MASK
	add b
	ld [EnemyMonNature], a
.no_synchronize

; Species-specfic:


; Unown
	ld a, [TempEnemyMonSpecies]
	cp a, UNOWN
	jr nz, .Magikarp

.RegenerateUnownLetter
; Get letter based on form
	ld hl, EnemyMonForm
	predef GetVariant
; Can't use any letters that haven't been unlocked
; If combined with forced shiny battletype, causes an infinite loop
	push de
	call CheckUnownLetter
	pop de
	jr nc, .Happiness
	ld a, NUM_UNOWN
	call RandomRange
	ld b, a
	ld a, [EnemyMonForm]
	and NOT_FORM_MASK
	add b
	ld [EnemyMonForm], a
	ld hl, EnemyMonForm
	predef GetVariant
	call CheckUnownLetter
	jr c, .RegenerateUnownLetter ; re-roll

.Magikarp:
; Skimming this part recommended

	ld a, [TempEnemyMonSpecies]
	cp a, MAGIKARP
	jr nz, .Happiness

; Get Magikarp's length
	ld de, EnemyMonDVs
	ld bc, PlayerID
	farcall CalcMagikarpLength

; We're clear if the length is < 1536
	ld a, [MagikarpLength]
	cp a, $06 ; $600 = 1536
	jr nz, .CheckMagikarpArea

; 5% chance of skipping size checks
	call Random
	cp a, $0c ; / $100
	jr c, .CheckMagikarpArea
; Try again if > 1614
	ld a, [MagikarpLength + 1]
	cp a, $50
	jp nc, .GenerateDVs

; 20% chance of skipping this check
	call Random
	cp a, $32 ; / $100
	jr c, .CheckMagikarpArea
; Try again if > 1598
	ld a, [MagikarpLength + 1]
	cp a, $40
	jp nc, .GenerateDVs

.CheckMagikarpArea:
	ld a, [MapGroup]
	cp a, GROUP_LAKE_OF_RAGE
	jr nz, .Happiness
	ld a, [MapNumber]
	cp a, MAP_LAKE_OF_RAGE
	jr nz, .Happiness
; 40% chance of not flooring
	call Random
	cp a, $64 ; / $100
	jr c, .Happiness
; Floor at length 1024
	ld a, [MagikarpLength]
	cp a, 1024 >> 8
	jp c, .GenerateDVs ; try again


; Finally done with DVs

.Happiness:
; Set happiness
	ld a, BASE_HAPPINESS
	ld [EnemyMonHappiness], a
; Set level
	ld a, [CurPartyLevel]
	ld [EnemyMonLevel], a
; Fill stats
	ld de, EnemyMonMaxHP
	ld b, FALSE
	ld hl, EnemyMonDVs - (MON_DVS - (MON_EVS - 1)) ; LinkBattleRNs + 7 (?)
	predef CalcPkmnStats

; If we're in a trainer battle,
; get the rest of the parameters from the party struct
	ld a, [wBattleMode]
	cp a, TRAINER_BATTLE
	jr z, .OpponentParty

; If we're in a wild battle, check wild-specific stuff
	and a
	jr z, .TreeMon

	ld a, [EnemySubStatus2]
	bit SUBSTATUS_TRANSFORMED, a
	jp nz, .Moves

.TreeMon:
; If we're headbutting trees, some monsters enter battle asleep
	call CheckSleepingTreeMon
	ld a, SLP ; Asleep for 7 turns
	jr c, .UpdateStatus
; Otherwise, no status
	xor a

.UpdateStatus:
	ld hl, EnemyMonStatus
	ld [hli], a

; Unused byte
	xor a
	ld [hli], a

; Full HP..
	ld a, [EnemyMonMaxHP]
	ld [hli], a
	ld a, [EnemyMonMaxHP + 1]
	ld [hl], a

; ..unless it's a RoamMon
	ld a, [BattleType]
	cp a, BATTLETYPE_ROAMING
	jr nz, .Moves

; Grab HP
	call GetRoamMonHP
	ld a, [hl]
; Check if it's been initialized again
	and a
	jr z, .InitRoamHP
; Update from the struct if it has
	ld a, [hl]
	ld [EnemyMonHP + 1], a
	jr .Moves

.InitRoamHP:
; HP only uses the lo byte in the RoamMon struct since
; Raikou/Entei/Suicune will have < 256 hp at level 40
	ld a, [EnemyMonHP + 1]
	ld [hl], a
	jr .Moves


.OpponentParty:
; Get HP from the party struct
	ld hl, (OTPartyMon1HP + 1)
	ld a, [CurPartyMon]
	call GetPartyLocation
	ld a, [hld]
	ld [EnemyMonHP + 1], a
	ld a, [hld]
	ld [EnemyMonHP], a

; Make sure everything knows which monster the opponent is using
	ld a, [CurPartyMon]
	ld [CurOTMon], a

; Get status from the party struct
	dec hl
	ld a, [hl] ; OTPartyMonStatus
	ld [EnemyMonStatus], a


.Moves:
	ld hl, BaseType1
	ld de, EnemyMonType1
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a

	; Armored Mewtwo is Psychic/Steel
	ld a, [EnemyMonSpecies]
	cp MEWTWO
	jr nz, .not_armored_mewtwo
	ld a, [EnemyMonItem]
	cp ARMOR_SUIT
	jr nz, .not_armored_mewtwo
	ld a, STEEL
	ld [EnemyMonType2], a
.not_armored_mewtwo

; Get moves
	ld de, EnemyMonMoves
; Are we in a trainer battle?
	ld a, [wBattleMode]
	cp a, TRAINER_BATTLE
	jr nz, .WildMoves
; Then copy moves from the party struct
	ld hl, OTPartyMon1Moves
	ld a, [CurPartyMon]
	call GetPartyLocation
	ld bc, NUM_MOVES
	call CopyBytes
	jp .PP

.WildMoves:
; Clear EnemyMonMoves
	xor a
	ld h, d
	ld l, e
rept 3
	ld [hli], a
endr
	ld [hl], a
; Make sure the predef knows this isn't a partymon
	ld [MagikarpLength], a
; Fill moves based on level
	predef FillMoves

	call CheckUniqueWildMove

.PP:
; Trainer battle?
	ld a, [wBattleMode]
	cp a, TRAINER_BATTLE
	jr z, .TrainerPP

; Fill wild PP
	ld hl, EnemyMonMoves
	ld de, EnemyMonPP
	predef FillPP
	jr .Finish

.TrainerPP:
; Copy PP from the party struct
	ld hl, OTPartyMon1PP
	ld a, [CurPartyMon]
	call GetPartyLocation
	ld de, EnemyMonPP
	ld bc, NUM_MOVES
	call CopyBytes

.Finish:
; Only the first five base stats are copied..
	ld hl, BaseStats
	ld de, EnemyMonBaseStats
	ld b, BaseSpecialDefense - BaseStats
.loop
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .loop

	ld a, [BaseCatchRate]
	ld [de], a
	inc de

	ld a, [BaseExp]
	ld [de], a

	ld a, [TempEnemyMonSpecies]
	ld [wd265], a

; Did we catch it?
	ld a, [wBattleMode]
	and a
	ret z

; Update enemy nick
	ld a, [wBattleMode]
	dec a
	jr z, .no_nickname
	ld a, [OtherTrainerType]
	bit TRNTYPE_NICKNAME, a
	jr z, .no_nickname
	ld a, [CurPartyMon]
	ld hl, OTPartyMonNicknames
	ld bc, PKMN_NAME_LENGTH
	call AddNTimes
	jr .got_nickname
.no_nickname
	call GetPokemonName
	ld hl, StringBuffer1
.got_nickname
	ld de, EnemyMonNick
	ld bc, PKMN_NAME_LENGTH
	call CopyBytes

; Saw this mon
	ld a, [TempEnemyMonSpecies]
	dec a
	ld c, a
	ld b, SET_FLAG
	ld hl, PokedexSeen
	predef FlagPredef

	ld hl, EnemyMonStats
	ld de, EnemyStats
	ld bc, EnemyMonStatsEnd - EnemyMonStats
	call CopyBytes

	ret
; 3eb38


CheckSleepingTreeMon: ; 3eb38
; Return carry if species is in the list
; for the current time of day

; Don't do anything if this isn't a tree encounter
	ld a, [BattleType]
	cp a, BATTLETYPE_TREE
	jr nz, .NotSleeping

; Nor if the Pokémon has Insomnia/Vital Spirit
	ld a, [EnemyMonAbility] ; is properly updated at this point, so OK to check
	ld b, a
	ld a, [TempEnemyMonSpecies]
	ld c, a
	farcall GetAbility
	ld a, b
	cp INSOMNIA
	jr z, .NotSleeping
	cp VITAL_SPIRIT
	jr z, .NotSleeping

; Get list for the time of day
	ld hl, .Morn
	ld a, [TimeOfDay]
	cp a, DAY
	jr c, .Check
	ld hl, .Day
	jr z, .Check
	ld hl, .Nite

.Check:
	ld a, [TempEnemyMonSpecies]
	ld de, 1 ; length of species id
	call IsInArray
; If it's a match, the opponent is asleep
	ret c

.NotSleeping:
	and a
	ret

.Nite:
	db CATERPIE
	db METAPOD
	db BUTTERFREE
	db WEEDLE
	db KAKUNA
	db BEEDRILL
	db PIDGEY
	db EKANS
	db EXEGGCUTE
	db LEDYBA
	db -1 ; end

.Day:
	db VENONAT
	db HOOTHOOT
	db NOCTOWL
	db SPINARAK
	db HERACROSS
	db -1 ; end

.Morn:
	db VENONAT
	db HOOTHOOT
	db NOCTOWL
	db SPINARAK
	db HERACROSS
	db -1 ; end
; 3eb75


CheckUnownLetter: ; 3eb75
; Return carry if the Unown letter hasn't been unlocked yet

	ld a, [UnlockedUnowns]
	ld c, a
	ld de, 0

.loop

; Don't check this set unless it's been unlocked
	srl c
	jr nc, .next

; Is our letter in the set?
	ld hl, .LetterSets
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a

	push de
	ld a, [MonVariant]
	ld de, 1
	push bc
	call IsInArray
	pop bc
	pop de

	jr c, .match

.next
; Make sure we haven't gone past the end of the table
	inc e
	inc e
	ld a, e
	cp a, .Set1 - .LetterSets
	jr c, .loop

; Hasn't been unlocked, or the letter is invalid
	scf
	ret

.match
; Valid letter
	and a
	ret

.LetterSets:
	dw .Set1
	dw .Set2
	dw .Set3
	dw .Set4

.Set1:
	;  A   B   C   D   E   F   G   H   I   J
	db 01, 02, 03, 04, 05, 06, 07, 08, 09, 10, $ff
.Set2:
	;  K   L   M   N   O   P   Q
	db 11, 12, 13, 14, 15, 16, 17, $ff
.Set3:
	;  R   S   T   U   V   W
	db 18, 19, 20, 21, 22, 23, $ff
.Set4:
	;  X   Y   Z   !   ?
	db 24, 25, 26, 27, 28, $ff

; 3ebc7


FinalPkmnSlideInEnemyMonFrontpic:
	call FinishBattleAnim
	call GetMonFrontpic
	jr FinalPkmnSlideInCommonFrontpic

FinalPkmnSlideInEnemyTrainerFrontpic:
	ld a, [TempEnemyMonSpecies]
	push af
	xor a
	ld [TempEnemyMonSpecies], a
	call FinishBattleAnim
	ld a, [OtherTrainerClass]
	ld [TrainerClass], a
	ld de, VTiles2
	farcall GetTrainerPic
	pop af
	ld [TempEnemyMonSpecies], a
FinalPkmnSlideInCommonFrontpic:
	hlcoord 18, 0
	ld c, 0

.outer_loop
	inc c
	ld a, c
	cp 8
	ret z
	xor a
	ld [hBGMapMode], a
	ld [hBGMapThird], a
	ld d, $0
	push bc
	push hl

.inner_loop
	call .CopyColumn
	inc hl
	ld a, 7
	add d
	ld d, a
	dec c
	jr nz, .inner_loop

	ld a, $1
	ld [hBGMapMode], a
	ld c, 4
	call DelayFrames
	pop hl
	pop bc
	dec hl
	jr .outer_loop

.CopyColumn:
	push hl
	push de
	push bc
	ld e, 7

.loop
	ld [hl], d
	ld bc, SCREEN_WIDTH
	add hl, bc
	inc d
	dec e
	jr nz, .loop

	pop bc
	pop de
	pop hl
	ret


BattleWinSlideInEnemyTrainerFrontpic: ; 3ebd8
	xor a
	ld [TempEnemyMonSpecies], a
	call FinishBattleAnim
	ld a, [OtherTrainerClass]
	ld [TrainerClass], a
	ld de, VTiles2
	farcall GetTrainerPic
	hlcoord 19, 0
	ld c, 0

.outer_loop
	inc c
	ld a, c
	cp 7
	ret z
	xor a
	ld [hBGMapMode], a
	ld [hBGMapThird], a
	ld d, $0
	push bc
	push hl

.inner_loop
	call .CopyColumn
	inc hl
	ld a, 7
	add d
	ld d, a
	dec c
	jr nz, .inner_loop

	ld a, $1
	ld [hBGMapMode], a
	ld c, 4
	call DelayFrames
	pop hl
	pop bc
	dec hl
	jr .outer_loop
; 3ec1a

.CopyColumn: ; 3ec1a
	push hl
	push de
	push bc
	ld e, 7

.loop
	ld [hl], d
	ld bc, SCREEN_WIDTH
	add hl, bc
	inc d
	dec e
	jr nz, .loop

	pop bc
	pop de
	pop hl
	ret
; 3ec2c


ApplyStatLevelMultiplierOnAllStats: ; 3ecab
; Apply StatLevelMultipliers on all 5 Stats
	ld c, 0
.stat_loop
	call ApplyStatLevelMultiplier
	inc c
	ld a, c
	cp 5
	jr nz, .stat_loop
	ret
; 3ecb7

ApplyStatLevelMultiplier: ; 3ecb7
	push bc
	push bc
	ld a, [wd265]
	and a
	ld a, c
	ld hl, BattleMonAttack
	ld de, PlayerStats
	ld bc, PlayerAtkLevel
	jr z, .got_pointers
	ld hl, EnemyMonAttack
	ld de, EnemyStats
	ld bc, EnemyAtkLevel

.got_pointers
	add c
	ld c, a
	jr nc, .okay
	inc b
.okay
	ld a, [bc]
	pop bc
	ld b, a
	push bc
	sla c
	ld b, 0
	add hl, bc
	ld a, c
	add e
	ld e, a
	jr nc, .okay2
	inc d
.okay2
	pop bc
	push hl
	ld hl, .StatLevelMultipliers
	dec b
	sla b
	ld c, b
	ld b, 0
	add hl, bc
	xor a
	ld [hMultiplicand + 0], a
	ld a, [de]
	ld [hMultiplicand + 1], a
	inc de
	ld a, [de]
	ld [hMultiplicand + 2], a
	ld a, [hli]
	ld [hMultiplier], a
	call Multiply
	ld a, [hl]
	ld [hDivisor], a
	ld b, $4
	call Divide
	pop hl

; Cap at 999.
	ld a, [hQuotient + 2]
	sub 999 % $100
	ld a, [hQuotient + 1]
	sbc 999 / $100
	jp c, .okay3

	ld a, 999 / $100
	ld [hQuotient + 1], a
	ld a, 999 % $100
	ld [hQuotient + 2], a

.okay3
	ld a, [hQuotient + 1]
	ld [hli], a
	ld b, a
	ld a, [hQuotient + 2]
	ld [hl], a
	or b
	jr nz, .okay4
	inc [hl]

.okay4
	pop bc
	ret
; 3ed2b

.StatLevelMultipliers:
;	      /
	db 25, 100 ; 25%
	db 28, 100 ; 28%
	db 33, 100 ; 33%
	db 40, 100 ; 40%
	db 50, 100 ; 50%
	db 66, 100 ; 66%

	db  1,  1 ; 100%

	db 15, 10 ; 150%
	db  2,  1 ; 200%
	db 25, 10 ; 250%
	db  3,  1 ; 300%
	db 35, 10 ; 350%
	db  4,  1 ; 400%
; 3ed45


BoostStat: ; 3ed7c
; Raise stat at hl by 1/8.

	ld a, [hli]
	ld d, a
	ld e, [hl]
	srl d
	rr e
	srl d
	rr e
	srl d
	rr e
	ld a, [hl]
	add e
	ld [hld], a
	ld a, [hl]
	adc d
	ld [hli], a

; Cap at 999.
	ld a, [hld]
	sub 999 % $100
	ld a, [hl]
	sbc 999 / $100
	ret c
	ld a, 999 / $100
	ld [hli], a
	ld a, 999 % $100
	ld [hld], a
	ret
; 3ed9f


_LoadBattleFontsHPBar: ; 3ed9f
	farcall LoadBattleFontsHPBar
	ret
; 3eda6

_LoadStatusIcons: ; 3eda6
	farcall LoadStatusIcons
	ret
; 3edad


EmptyBattleTextBox: ; 3edd1
	ld hl, .empty
	jp BattleTextBox
.empty
	db "@"
; 3edd8


_BattleRandom:: ; 3edd8
; If the normal RNG is used in a link battle it'll desync.
; To circumvent this a shared PRNG is used instead.

; But if we're in a non-link battle we're safe to use it
	ld a, [wLinkMode]
	and a
	jp z, Random

; The PRNG operates in streams of 10 values.

; Which value are we trying to pull?
	push hl
	push bc
	ld a, [LinkBattleRNCount]
	ld c, a
	ld b, 0
	ld hl, LinkBattleRNs
	add hl, bc
	inc a
	ld [LinkBattleRNCount], a

; If we haven't hit the end yet, we're good
	cp 10 - 1 ; Exclude last value. See the closing comment
	ld a, [hl]
	pop bc
	pop hl
	ret c

; If we have, we have to generate new pseudorandom data
; Instead of having multiple PRNGs, ten seeds are used
	push hl
	push bc
	push af

; Reset count to 0
	xor a
	ld [LinkBattleRNCount], a
	ld hl, LinkBattleRNs
	ld b, 10 ; number of seeds

; Generate next number in the sequence for each seed
; The algorithm takes the form *5 + 1 % 256
.loop
	; get last #
	ld a, [hl]

	; a * 5 + 1
	ld c, a
	add a
	add a
	add c
	inc a

	; update #
	ld [hli], a
	dec b
	jr nz, .loop

; This has the side effect of pulling the last value first,
; then wrapping around. As a result, when we check to see if
; we've reached the end, we check the one before it.

	pop af
	pop bc
	pop hl
	ret
; 3ee0f


Call_PlayBattleAnim_OnlyIfVisible: ; 3ee0f
	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVar
	and 1 << SUBSTATUS_FLYING | 1 << SUBSTATUS_UNDERGROUND
	ret nz
; 3ee17

Call_PlayBattleAnim: ; 3ee17
	ld a, e
	ld [FXAnimIDLo], a
	ld a, d
	ld [FXAnimIDHi], a
	call WaitBGMap
	predef_jump PlayBattleAnim
; 3ee27

FinishBattleAnim: ; 3ee27
	push af
	push bc
	push de
	push hl
	ld b, SCGB_BATTLE_COLORS
	call GetSGBLayout
	call SetPalettes
	call DelayFrame
	pop hl
	pop de
	pop bc
	pop af
	ret
; 3ee3b


GiveExperiencePoints: ; 3ee3b
; Give experience.
; Don't give experience if linked or in the Battle Tower.
	ld a, [wLinkMode]
	and a
	ret nz

	ld a, [InBattleTowerBattle]
	bit 0, a
	ret nz

	call .EvenlyDivideExpAmongParticipants
	xor a
	ld [CurPartyMon], a
	ld bc, PartyMon1Species

.loop
	ld hl, MON_HP
	add hl, bc
	ld a, [hli]
	or [hl]
	jp z, .skip_stats ; fainted

	push bc
	ld hl, wBattleParticipantsNotFainted
	ld a, [CurPartyMon]
	ld c, a
	ld b, CHECK_FLAG
	ld d, $0
	predef FlagPredef
	ld a, c
	and a
	pop bc
	jp z, .skip_stats

	call GiveBattleEVs

	push bc
	xor a
	ld [hMultiplicand + 0], a
	ld [hMultiplicand + 1], a
	ld a, [EnemyMonBaseExp]
	ld [hMultiplicand + 2], a
	ld a, [EnemyMonLevel]
	ld [hMultiplier], a
	call Multiply
	ld a, 7
	ld [hDivisor], a
	ld b, 4
	call Divide
; Boost Experience for traded Pokemon
	pop bc
	ld hl, MON_ID
	add hl, bc
	ld a, [PlayerID]
	cp [hl]
	jr nz, .boosted
	inc hl
	ld a, [PlayerID + 1]
	cp [hl]
	ld a, 0 ; not xor a; preserve carry flag
	jr z, .no_boost
	ld a, [InitialOptions]
	bit TRADED_BEHAVIOR, a
	jr z, .no_boost

.boosted
	call BoostExp
	ld a, $1

.no_boost
; Boost experience for a Trainer Battle
	ld [StringBuffer2 + 2], a
	ld a, [wBattleMode]
	dec a
	call nz, BoostExp
; Boost experience for Lucky Egg
	push bc
	ld a, MON_ITEM
	call GetPartyParamLocation
	ld a, [hl]
	cp LUCKY_EGG
	call z, BoostExp
	ld a, [hQuotient + 2]
	ld [StringBuffer2 + 1], a
	ld a, [hQuotient + 1]
	ld [StringBuffer2], a
	ld a, [CurPartyMon]
	ld hl, PartyMonNicknames
	call GetNick
	ld hl, Text_PkmnGainedExpPoint
	call BattleTextBox
	ld a, [StringBuffer2 + 1]
	ld [hQuotient + 2], a
	ld a, [StringBuffer2]
	ld [hQuotient + 1], a
	pop bc
	call AnimateExpBar
	push bc
	call LoadTileMapToTempTileMap
	pop bc
	ld hl, MON_EXP + 2
	add hl, bc
	ld d, [hl]
	ld a, [hQuotient + 2]
	add d
	ld [hld], a
	ld d, [hl]
	ld a, [hQuotient + 1]
	adc d
	ld [hl], a
	jr nc, .skip2
	dec hl
	inc [hl]
	jr nz, .skip2
	ld a, $ff
	ld [hli], a
	ld [hli], a
	ld [hl], a

.skip2
	ld a, [CurPartyMon]
	ld e, a
	ld d, $0
	ld hl, PartySpecies
	add hl, de
	ld a, [hl]
	ld [CurSpecies], a
	call GetBaseData
	push bc
	ld d, MAX_LEVEL
	farcall CalcExpAtLevel
	pop bc
	ld hl, MON_EXP + 2
	add hl, bc
	push bc
	ld a, [hQuotient]
	ld b, a
	ld a, [hQuotient + 1]
	ld c, a
	ld a, [hQuotient + 2]
	ld d, a
	ld a, [hld]
	sub d
	ld a, [hld]
	sbc c
	ld a, [hl]
	sbc b
	jr c, .not_max_exp
	ld a, b
	ld [hli], a
	ld a, c
	ld [hli], a
	ld a, d
	ld [hld], a

.not_max_exp
	xor a ; PARTYMON
	ld [MonType], a
	predef CopyPkmnToTempMon
	farcall CalcLevel
	pop bc
	ld hl, MON_LEVEL
	add hl, bc
	ld a, [hl]
	cp MAX_LEVEL
	jp nc, .skip_stats
	cp d
	jp z, .skip_stats
; <NICKNAME> grew to level ##!
	ld [wTempLevel], a
	ld a, [CurPartyLevel]
	push af
	ld a, d
	ld [CurPartyLevel], a
	ld [hl], a
	ld hl, MON_SPECIES
	add hl, bc
	ld a, [hl]
	ld [CurSpecies], a
	ld [wd265], a
	call GetBaseData
	ld hl, MON_MAXHP + 1
	add hl, bc
	ld a, [hld]
	ld e, a
	ld d, [hl]
	push de
	ld hl, MON_MAXHP
	add hl, bc
	ld d, h
	ld e, l
	ld hl, MON_EVS - 1
	add hl, bc
	push bc
	ld b, TRUE
	predef CalcPkmnStats
	pop bc
	pop de
	ld hl, MON_MAXHP + 1
	add hl, bc
	ld a, [hld]
	sub e
	ld e, a
	ld a, [hl]
	sbc d
	ld d, a
	dec hl
	ld a, [hl]
	add e
	ld [hld], a
	ld a, [hl]
	adc d
	ld [hl], a
	ld a, [CurBattleMon]
	ld d, a
	ld a, [CurPartyMon]
	cp d
	jr nz, .skip_animation
	ld de, BattleMonHP
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	ld de, BattleMonMaxHP
	push bc
	ld bc, PARTYMON_STRUCT_LENGTH - MON_MAXHP
	call CopyBytes
	pop bc
	ld hl, MON_LEVEL
	add hl, bc
	ld a, [hl]
	ld [BattleMonLevel], a
	ld a, [PlayerSubStatus2]
	bit SUBSTATUS_TRANSFORMED, a
	jr nz, .transformed
	ld hl, MON_ATK
	add hl, bc
	ld de, PlayerStats
	ld bc, PARTYMON_STRUCT_LENGTH - MON_ATK
	call CopyBytes

.transformed
	xor a
	ld [wd265], a
	call ApplyStatLevelMultiplierOnAllStats
	farcall UpdatePlayerHUD
	call EmptyBattleTextBox
	call LoadTileMapToTempTileMap
	ld a, $1
	ld [hBGMapMode], a

.skip_animation
	farcall LevelUpHappinessMod
	ld a, [CurBattleMon]
	ld b, a
	ld a, [CurPartyMon]
	cp b
	jr z, .skip_animation2
	ld de, SFX_HIT_END_OF_EXP_BAR
	call PlaySFX
	call WaitSFX
	ld hl, BattleText_StringBuffer1GrewToLevel
	call StdBattleTextBox
	call LoadTileMapToTempTileMap

.skip_animation2
	xor a ; PARTYMON
	ld [MonType], a
	predef CopyPkmnToTempMon
	hlcoord 9, 0
	ld b, $a
	ld c, $9
	call TextBox
	hlcoord 10, 1
	ld bc, 6
	predef PrintTempMonStats
	ld c, $1e
	call DelayFrames
	call WaitPressAorB_BlinkCursor
	call Call_LoadTempTileMapToTileMap
	xor a ; PARTYMON
	ld [MonType], a
	ld a, [CurSpecies]
	ld [wd265], a
	ld a, [CurPartyLevel]
	push af
	ld c, a
	ld a, [wTempLevel]
	ld b, a

.level_loop
	inc b
	ld a, b
	ld [CurPartyLevel], a
	push bc
	predef LearnLevelMoves
	pop bc
	ld a, b
	cp c
	jr nz, .level_loop
	pop af
	ld [CurPartyLevel], a
	ld hl, EvolvableFlags
	ld a, [CurPartyMon]
	ld c, a
	ld b, SET_FLAG
	predef FlagPredef
	pop af
	ld [CurPartyLevel], a

.skip_stats
	ld a, [PartyCount]
	ld b, a
	ld a, [CurPartyMon]
	inc a
	cp b
	jr z, .done
	ld [CurPartyMon], a
	ld a, MON_SPECIES
	call GetPartyParamLocation
	ld b, h
	ld c, l
	jp .loop

.done
	jp ResetBattleParticipants
; 3f0d4

.EvenlyDivideExpAmongParticipants:
; count number of battle participants
	ld a, [wBattleParticipantsNotFainted]
	ld b, a
	ld c, PARTY_LENGTH
	ld d, 0
.count_loop
	xor a
	srl b
	adc d
	ld d, a
	dec c
	jr nz, .count_loop
	cp 2
	ret c

	ld [wd265], a
	ld hl, EnemyMonBaseStats
	ld c, EnemyMonEnd - EnemyMonBaseStats
.count_loop2
	xor a
	ld [hDividend + 0], a
	ld a, [hl]
	ld [hDividend + 1], a
	ld a, [wd265]
	ld [hDivisor], a
	ld b, 2
	call Divide
	ld a, [hQuotient + 2]
	ld [hli], a
	dec c
	jr nz, .count_loop2
	ret
; 3f106

GiveBattleEVs:
; prepare registers for EV gain loop.
; b: contains EV yield data
; c: loop iterator
; d: bit 0 is set on pokérus, bit 1 on macho brace
; e: set to abcdef00, where a: HP EV boosted, etc, for
; power items
	push de
	ld d, 0
	ld e, 0
	; check pokérus
	ld hl, MON_PKRUS
	add hl, bc
	ld a, [hl]
	and a
	jr z, .check_item
	set 0, d
.check_item
	; check held item
	push bc
	ld hl, BattleMonItem
	farcall GetItemHeldEffect
	ld a, b
	cp HELD_EV_DOUBLE
	call z, .item_double
	cp HELD_EV_HP_UP
	call z, .item_hpup
	cp HELD_EV_ATK_UP
	call z, .item_atkup
	cp HELD_EV_DEF_UP
	call z, .item_defup
	cp HELD_EV_SPD_UP
	call z, .item_spdup
	cp HELD_EV_SAT_UP
	call z, .item_satup
	cp HELD_EV_SDF_UP
	call z, .item_sdfup
	pop bc
	ld hl, MON_EVS
	add hl, bc
	push bc
	ld a, [EnemyMonSpecies]
	ld [CurSpecies], a
	call GetBaseData
	; EV yield format:
	; Byte 1: xxyyzzmm x: HP, y: Atk, z: Def, m: Spd
	; Byte 2: aabb0000 a: Sat, b: Sdf, 0: unused
	ld a, [BaseEVYield1]
	ld b, a
	ld c, 6 ; iterator
.loop
	rlc b
	rlc b
	rlc e
	ld a, b
	and $3
	; Check power item. Since e is formatted as
	; abcdef00 (a=hp b=atk c=def etc), and we do rlc e on
	; each iteration, bit 0 will be 1 if we have the
	; power item for the current stat.
	bit 0, e
	jr z, .no_power_item
	add 8
.no_power_item
	; check EV doubling with pokerus or macho brace
	bit 0, d
	jr z, .no_pokerus
	add a
.no_pokerus
	bit 1, d
	jr z, .add
	add a
.add
	add [hl]
	jr c, .ev_overflow

	; Check if our EV is >252 in the stat, and if so,
	; revert it to 252.
	cp 253
	jr c, .add_done
.ev_overflow
	ld a, 252
.add_done
	ld [hli], a
	dec c
	jr z, .done
	; For Sat and Sdf, we want to use byte 2
	ld a, c
	cp 2
	jr nz, .loop
	ld a, [BaseEVYield2]
	ld b, a
	jr .loop
.done
	pop bc
	pop de
	ret
.item_double
	set 1, d
	ret
.item_hpup
	set 7, e
	ret
.item_atkup
	set 6, e
	ret
.item_defup
	set 5, e
	ret
.item_spdup
	set 4, e
	ret
.item_satup
	set 3, e
	ret
.item_sdfup
	set 2, e
	ret

BoostExp: ; 3f106
; Multiply experience by 1.5x
	push bc
; load experience value
	ld a, [hProduct + 2]
	ld b, a
	ld a, [hProduct + 3]
	ld c, a
; halve it
	srl b
	rr c
; add it back to the whole exp value
	add c
	ld [hProduct + 3], a
	ld a, [hProduct + 2]
	adc b
	ld [hProduct + 2], a
	pop bc
	ret
; 3f11b

Text_PkmnGainedExpPoint: ; 3f11b
	text_jump Text_Gained
	start_asm
	ld hl, TextJump_StringBuffer2ExpPoints
	ld a, [StringBuffer2 + 2] ; IsTradedMon
	and a
	ret z

	ld hl, TextJump_ABoostedStringBuffer2ExpPoints
	ret
; 3f12c

TextJump_ABoostedStringBuffer2ExpPoints: ; 3f12c
	text_jump Text_ABoostedStringBuffer2ExpPoints
	db "@"
; 3f131

TextJump_StringBuffer2ExpPoints: ; 3f131
	text_jump Text_StringBuffer2ExpPoints
	db "@"
; 3f136


AnimateExpBar: ; 3f136
	push bc

	ld hl, CurPartyMon
	ld a, [CurBattleMon]
	cp [hl]
	jp nz, .finish

	ld a, [BattleMonLevel]
	cp MAX_LEVEL
	jp nc, .finish

	ld a, [hProduct + 3]
	ld [wd004], a
	push af
	ld a, [hProduct + 2]
	ld [wd003], a
	push af
	xor a
	ld [wd002], a
	xor a ; PARTYMON
	ld [MonType], a
	predef CopyPkmnToTempMon
	ld a, [TempMonLevel]
	ld b, a
	ld e, a
	push de
	ld de, TempMonExp + 2
	call CalcExpBar
	push bc
	ld hl, TempMonExp + 2
	ld a, [wd004]
	add [hl]
	ld [hld], a
	ld a, [wd003]
	adc [hl]
	ld [hld], a
	jr nc, .NoOverflow
	inc [hl]
	jr nz, .NoOverflow
	ld a, $ff
	ld [hli], a
	ld [hli], a
	ld [hl], a

.NoOverflow:
	ld d, MAX_LEVEL
	farcall CalcExpAtLevel
	ld a, [hProduct + 1]
	ld b, a
	ld a, [hProduct + 2]
	ld c, a
	ld a, [hProduct + 3]
	ld d, a
	ld hl, TempMonExp + 2
	ld a, [hld]
	sub d
	ld a, [hld]
	sbc c
	ld a, [hl]
	sbc b
	jr c, .AlreadyAtMaxExp
	ld a, b
	ld [hli], a
	ld a, c
	ld [hli], a
	ld a, d
	ld [hld], a

.AlreadyAtMaxExp:
	farcall CalcLevel
	ld a, d
	pop bc
	pop de
	ld d, a
	cp e
	jr nc, .LoopLevels
	ld a, e
	ld d, a

.LoopLevels:
	ld a, e
	cp MAX_LEVEL
	jr nc, .FinishExpBar
	cp d
	jr z, .FinishExpBar
	inc a
	ld [TempMonLevel], a
	ld [CurPartyLevel], a
	ld [BattleMonLevel], a
	push de
	call .PlayExpBarSound
	ld c, $40
	call .LoopBarAnimation
	call PrintPlayerHUD
	ld hl, BattleMonNick
	ld de, StringBuffer1
	ld bc, PKMN_NAME_LENGTH
	call CopyBytes
	call TerminateExpBarSound
	ld de, SFX_HIT_END_OF_EXP_BAR
	call PlaySFX
	farcall AnimateEndOfExpBar
	call WaitSFX
	ld hl, BattleText_StringBuffer1GrewToLevel
	call StdBattleTextBox
	pop de
	inc e
	ld b, $0
	jr .LoopLevels

.FinishExpBar:
	push bc
	ld b, d
	ld de, TempMonExp + 2
	call CalcExpBar
	ld a, b
	pop bc
	ld c, a
	call .PlayExpBarSound
	call .LoopBarAnimation
	call TerminateExpBarSound
	pop af
	ld [hProduct + 2], a
	pop af
	ld [hProduct + 3], a

.finish
	pop bc
	ret

.PlayExpBarSound:
	push bc
	call WaitSFX
	ld de, SFX_EXP_BAR
	call PlaySFX
	ld c, 10
	call DelayFrames
	pop bc
	ret

.LoopBarAnimation:
	ld d, 3
	dec b
.anim_loop
	inc b
	push bc
	push de
	hlcoord 12, 11
	call PlaceExpBar
	pop de
	ld a, $1
	ld [hBGMapMode], a
	ld c, d
	call DelayFrames
	xor a
	ld [hBGMapMode], a
	pop bc
	ld a, c
	cp b
	jr z, .end_animation
	inc b
	push bc
	push de
	hlcoord 12, 11
	call PlaceExpBar
	pop de
	ld a, $1
	ld [hBGMapMode], a
	ld c, d
	call DelayFrames
	xor a
	ld [hBGMapMode], a
	dec d
	jr nz, .min_number_of_frames
	ld d, 1
.min_number_of_frames
	pop bc
	ld a, c
	cp b
	jr nz, .anim_loop
.end_animation
	ld a, $1
	ld [hBGMapMode], a
	ret



SendOutPkmnText: ; 3f26d
	ld a, [wLinkMode]
	and a
	jr z, .not_linked

	ld hl, JumpText_GoPkmn ; If we're in a LinkBattle print just "Go <PlayerMon>"

	ld a, [wAISwitch] ; unless this (unidentified) variable is set
	and a
	jr nz, .skip_to_textbox

.not_linked
; Depending on the HP of the enemy Pkmn, the game prints a different text
	ld hl, EnemyMonHP
	ld a, [hli]
	or [hl]
	ld hl, JumpText_GoPkmn
	jr z, .skip_to_textbox

	; compute enemy helth remaining as a percentage
	xor a
	ld [hMultiplicand + 0], a
	ld hl, EnemyMonHP
	ld a, [hli]
	ld [wEnemyHPAtTimeOfPlayerSwitch], a
	ld [hMultiplicand + 1], a
	ld a, [hl]
	ld [wEnemyHPAtTimeOfPlayerSwitch + 1], a
	ld [hMultiplicand + 2], a
	ld a, 25
	ld [hMultiplier], a
	call Multiply
	ld hl, EnemyMonMaxHP
	ld a, [hli]
	ld b, [hl]
	srl a
	rr b
	srl a
	rr b
	ld a, b
	ld b, 4
	ld [hDivisor], a
	call Divide

	ld a, [hQuotient + 2]
	ld hl, JumpText_GoPkmn
	cp 70
	jr nc, .skip_to_textbox

	ld hl, JumpText_DoItPkmn
	cp 40
	jr nc, .skip_to_textbox

	ld hl, JumpText_GoForItPkmn
	cp 10
	jr nc, .skip_to_textbox

	ld hl, JumpText_YourFoesWeakGetmPkmn
.skip_to_textbox
	jp BattleTextBox
; 3f2d1


JumpText_GoPkmn: ; 3f2d1
	text_jump Text_GoPkmn
	start_asm
	jr Function_TextJump_BattleMonNick01
; 3f2d6

JumpText_DoItPkmn: ; 3f2d8
	text_jump Text_DoItPkmn
	start_asm
	jr Function_TextJump_BattleMonNick01
; 3f2dd

JumpText_GoForItPkmn: ; 3f2df
	text_jump Text_GoForItPkmn
	start_asm
	jr Function_TextJump_BattleMonNick01
; 3f2e4

JumpText_YourFoesWeakGetmPkmn: ; 3f2e6
	text_jump Text_YourFoesWeakGetmPkmn
	start_asm
Function_TextJump_BattleMonNick01: ; 3f2eb
	ld hl, TextJump_BattleMonNick01
	ret
; 3f2ef

TextJump_BattleMonNick01: ; 3f2ef
	text_jump Text_BattleMonNick01
	db "@"
; 3f2f4

WithdrawPkmnText: ; 3f2f4
	ld hl, .WithdrawPkmnText
	jp BattleTextBox

.WithdrawPkmnText:
	text_jump Text_BattleMonNickComma
	start_asm
; Print text to withdraw Pkmn
; depending on HP the message is different
	push de
	push bc
	ld hl, EnemyMonHP + 1
	ld de, wEnemyHPAtTimeOfPlayerSwitch + 1
	ld b, [hl]
	dec hl
	ld a, [de]
	sub b
	ld [hMultiplicand + 2], a
	dec de
	ld b, [hl]
	ld a, [de]
	sbc b
	ld [hMultiplicand + 1], a
	ld a, 25
	ld [hMultiplier], a
	call Multiply
	ld hl, EnemyMonMaxHP
	ld a, [hli]
	ld b, [hl]
	srl a
	rr b
	srl a
	rr b
	ld a, b
	ld b, 4
	ld [hDivisor], a
	call Divide
	pop bc
	pop de
	ld a, [hQuotient + 2]
	ld hl, TextJump_ThatsEnoughComeBack
	and a
	ret z

	ld hl, TextJump_ComeBack
	cp 30
	ret c

	ld hl, TextJump_OKComeBack
	cp 70
	ret c

	ld hl, TextJump_GoodComeBack
	ret
; 3f348

TextJump_ThatsEnoughComeBack: ; 3f348
	text_jump Text_ThatsEnoughComeBack
	db "@"
; 3f34d

TextJump_OKComeBack: ; 3f34d
	text_jump Text_OKComeBack
	db "@"
; 3f352

TextJump_GoodComeBack: ; 3f352
	text_jump Text_GoodComeBack
	db "@"
; 3f357

TextJump_ComeBack: ; 3f35b
	text_jump Text_ComeBack
	db "@"
; 3f360


;HandleSafariAngerEatingStatus: ; unreferenced
;	ld hl, wSafariMonEating
;	ld a, [hl]
;	and a
;	jr z, .angry
;	dec [hl]
;	ld hl, BattleText_WildPkmnIsEating
;	jr .finish
;
;.angry
;	dec hl ; wSafariMonAngerCount
;	ld a, [hl]
;	and a
;	ret z
;	dec [hl]
;	ld hl, BattleText_WildPkmnIsAngry
;	jr nz, .finish
;	push hl
;	ld a, [EnemyMonSpecies]
;	ld [CurSpecies], a
;	call GetBaseData
;	ld a, [BaseCatchRate]
;	ld [EnemyMonCatchRate], a
;	pop hl
;
;.finish
;	push hl
;	call Call_LoadTempTileMapToTileMap
;	pop hl
;	jp StdBattleTextBox
;; 3f390


FillInExpBar: ; 3f390
	push hl
	call CalcExpBar
	pop hl
	jp PlaceExpBar
; 3f39c

CalcExpBar: ; 3f39c
; Calculate the percent exp between this level and the next
; Level in b
	push de
	ld d, b
	push de
	farcall CalcExpAtLevel
	pop de
; exp at current level gets pushed to the stack
	ld hl, hMultiplicand
	ld a, [hli]
	push af
	ld a, [hli]
	push af
	ld a, [hl]
	push af
; next level
	inc d
	farcall CalcExpAtLevel
; back up the next level exp, and subtract the two levels
	ld hl, hMultiplicand + 2
	ld a, [hl]
	ld [hMathBuffer + 2], a
	pop bc
	sub b
	ld [hld], a
	ld a, [hl]
	ld [hMathBuffer + 1], a
	pop bc
	sbc b
	ld [hld], a
	ld a, [hl]
	ld [hMathBuffer], a
	pop bc
	sbc b
	ld [hl], a
	pop de

	ld hl, hMultiplicand + 1
	ld a, [hli]
	push af
	ld a, [hl]
	push af

; get the amount of exp remaining to the next level
	ld a, [de]
	dec de
	ld c, a
	ld a, [hMathBuffer + 2]
	sub c
	ld [hld], a
	ld a, [de]
	dec de
	ld b, a
	ld a, [hMathBuffer + 1]
	sbc b
	ld [hld], a
	ld a, [de]
	ld c, a
	ld a, [hMathBuffer]
	sbc c
	ld [hld], a
	xor a
	ld [hl], a
; multiply by (7 tiles * 8 px/tile) = 56 px
	ld a, 56
	ld [hMultiplier], a
	call Multiply
	pop af
	ld c, a
	pop af
	ld b, a
.loop
	ld a, b
	and a
	jr z, .done
	srl b
	rr c
	ld hl, hProduct
	srl [hl]
	inc hl
	rr [hl]
	inc hl
	rr [hl]
	inc hl
	rr [hl]
	jr .loop

.done
	ld a, c
	ld [hDivisor], a
	ld b, 4
	call Divide
	ld a, [hQuotient + 2]
	ld b, a
	ld a, 56
	sub b
	ld b, a
	ret
; 3f41c

PlaceExpBar: ; 3f41c
	ld c, 7 ; number of tiles
.loop1
	ld a, b
	sub $8
	jr c, .next
	ld b, a
	ld a, $77 ; full thin bar
	ld [hli], a
	dec c
	jr z, .finish
	jr .loop1

.next
	add $8
	jr z, .loop2
	add $6f ; tile to the left of thin exp bar tile
	jr .skip

.loop2
	ld a, $6f ; empty thin bar

.skip
	ld [hli], a
	ld a, $6f ; empty thin bar
	dec c
	jr nz, .loop2

.finish
	ret
; 3f43d

GetMonBackpic: ; 3f43d
	ld a, [PlayerSubStatus4]
	bit SUBSTATUS_SUBSTITUTE, a
	ld hl, BattleAnimCmd_RaiseSub
	jr nz, GetBackpic_DoAnim ; substitute

DropPlayerSub: ; 3f447
	ld a, [wPlayerMinimized]
	and a
	ld hl, BattleAnimCmd_MinimizeOpp
	jr nz, GetBackpic_DoAnim
	ld a, [CurPartySpecies]
	push af
	ld a, [BattleMonSpecies]
	ld [CurPartySpecies], a
	ld hl, BattleMonForm
	predef GetVariant
	ld de, VTiles2 tile $31
	predef GetBackpic
	pop af
	ld [CurPartySpecies], a
	ret
; 3f46f

GetBackpic_DoAnim: ; 3f46f
	ld a, [hBattleTurn]
	push af
	xor a
	ld [hBattleTurn], a
	ld a, BANK(BattleAnimCommands)
	rst FarCall
	pop af
	ld [hBattleTurn], a
	ret
; 3f47c

GetMonFrontpic: ; 3f47c
	ld a, [EnemySubStatus4]
	bit SUBSTATUS_SUBSTITUTE, a
	ld hl, BattleAnimCmd_RaiseSub
	jr nz, GetFrontpic_DoAnim

DropEnemySub: ; 3f486
	ld a, [wEnemyMinimized]
	and a
	ld hl, BattleAnimCmd_MinimizeOpp
	jr nz, GetFrontpic_DoAnim

	ld a, [CurPartySpecies]
	push af
	ld a, [EnemyMonSpecies]
	ld [CurSpecies], a
	ld [CurPartySpecies], a
	call GetBaseData
	ld hl, EnemyMonForm
	predef GetVariant
	ld de, VTiles2
	predef FrontpicPredef
	pop af
	ld [CurPartySpecies], a
	ret
; 3f4b4

GetFrontpic_DoAnim: ; 3f4b4
	ld a, [hBattleTurn]
	push af
	call SetEnemyTurn
	ld a, BANK(BattleAnimCommands)
	rst FarCall
	pop af
	ld [hBattleTurn], a
	ret
; 3f4c1


StartBattle: ; 3f4c1
; This check prevents you from entering a battle without any Pokemon.
; Those using walk-through-walls to bypass getting a Pokemon experience
; the effects of this check.
	ld a, [PartyCount]
	and a
	ret z

	ld a, [TimeOfDayPal]
	push af
	call BattleIntro
	call DoBattle
	call ExitBattle
	pop af
	ld [TimeOfDayPal], a
	scf
	ret
; 3f4d9


BattleIntro: ; 3f4dd
	call LoadTrainerOrWildMonPic
	xor a
	ld [TempBattleMonSpecies], a
	ld [wd0d2], a
	xor a
	ld [hMapAnims], a
	ld a, [OtherTrainerClass]
	cp LYRA2
	jr z, .skip_music ; assume that the music is already playing
	farcall PlayBattleMusic
.skip_music
	farcall ShowLinkBattleParticipants
	farcall FindFirstAliveMonAndStartBattle
	call DisableSpriteUpdates
	farcall ClearBattleRAM
	call InitEnemy
	call BackUpVBGMap2
	ld b, SCGB_BATTLE_GRAYSCALE
	call GetSGBLayout
	ld hl, rLCDC
	res 6, [hl]
	call InitBattleDisplay
	call BattleStartMessage
	ld hl, rLCDC
	set 6, [hl]
	xor a
	ld [hBGMapMode], a
	call EmptyBattleTextBox
	hlcoord 9, 7
	lb bc, 5, 11
	call ClearBox
	hlcoord 0, 0
	lb bc, 4, 11
	call ClearBox
	call ClearSprites
	ld a, [wBattleMode]
	cp WILD_BATTLE
	call z, UpdateEnemyHUD
	ld a, $1
	ld [hBGMapMode], a
	ret
; 3f54e

LoadTrainerOrWildMonPic: ; 3f54e
	ld a, [OtherTrainerClass]
	and a
	jr nz, .Trainer
	ld a, [TempWildMonSpecies]
	ld [CurPartySpecies], a

.Trainer:
	ld [TempEnemyMonSpecies], a
	ret
; 3f55e

InitEnemy: ; 3f55e
	ld a, [OtherTrainerClass]
	and a
	jp nz, InitEnemyTrainer ; trainer
	jp InitEnemyWildmon ; wild
; 3f568

BackUpVBGMap2: ; 3f568
	ld a, [rSVBK]
	push af
	ld a, $6 ; BANK(wDecompressScratch)
	ld [rSVBK], a
	ld hl, wDecompressScratch
	ld bc, $40 tiles ; VBGMap3 - VBGMap2
	ld a, $2
	call ByteFill
	ld a, [rVBK]
	push af
	ld a, $1
	ld [rVBK], a
	ld de, wDecompressScratch
	hlbgcoord 0, 0 ; VBGMap2
	lb bc, BANK(BackUpVBGMap2), $40
	call Request2bpp
	pop af
	ld [rVBK], a
	pop af
	ld [rSVBK], a
	ret
; 3f594

InitEnemyTrainer: ; 3f594
	ld [TrainerClass], a
	xor a
	ld [TempEnemyMonSpecies], a
	farcall GetTrainerAttributes
	farcall ReadTrainerParty
	ld de, VTiles2
	farcall GetTrainerPic
	xor a
	ld [hGraphicStartTile], a
	dec a
	ld [wEnemyItemState], a
	hlcoord 12, 0
	lb bc, 7, 7
	predef PlaceGraphic
	ld a, -1
	ld [CurOTMon], a
	ld a, TRAINER_BATTLE
	ld [wBattleMode], a

	call IsBossTrainer
	jr nc, .done
	xor a
	ld [CurPartyMon], a
	ld a, [PartyCount]
	ld b, a
.partyloop
	push bc
	ld a, MON_HP
	call GetPartyParamLocation
	ld a, [hli]
	or [hl]
	jr z, .skipfaintedmon
	ld c, HAPPINESS_GYMBATTLE
	farcall ChangeHappiness
.skipfaintedmon
	pop bc
	dec b
	jr z, .done
	ld hl, CurPartyMon
	inc [hl]
	jr .partyloop
.done
	ret
; 3f607

InitEnemyWildmon: ; 3f607
	ld a, WILD_BATTLE
	ld [wBattleMode], a
	call LoadEnemyMon
	ld hl, EnemyMonMoves
	ld de, wWildMonMoves
	ld bc, NUM_MOVES
	call CopyBytes
	ld hl, EnemyMonPP
	ld de, wWildMonPP
	ld bc, NUM_MOVES
	call CopyBytes
	ld hl, EnemyMonForm
	predef GetVariant
	ld a, [CurPartySpecies]
	cp UNOWN
	jr nz, .skip_unown
	ld a, [wFirstUnownSeen]
	and a
	jr nz, .skip_unown
	ld a, [MonVariant]
	ld [wFirstUnownSeen], a
.skip_unown
	ld de, VTiles2
	predef FrontpicPredef
	xor a
	ld [TrainerClass], a
	ld [hGraphicStartTile], a
	hlcoord 12, 0
	lb bc, 7, 7
	predef PlaceGraphic
	ret
; 3f662

ExitBattle: ; 3f69e
	call .HandleEndOfBattle
	call HandleNuzlockeFlags
	call CleanUpBattleRAM
	ret
; 3f6a5

.HandleEndOfBattle: ; 3f6a5
	ld a, [wLinkMode]
	and a
	jr z, .not_linked
	call ShowLinkBattleParticipantsAfterEnd
	ld c, 150
	call DelayFrames
	call ShowLinkBattleResult
	ret

.not_linked
	ld a, [wBattleResult]
	and $f
	ret nz
	call CheckPayDay
	xor a
	ld [wForceEvolution], a
	predef EvolveAfterBattle
	farcall GivePokerus
	ret
; 3f6d0

HandleNuzlockeFlags:
	ld a, [wBattleMode]
	cp WILD_BATTLE
	ret nz

	; Dupes clause: don't count duplicate encounters
	ld a, [EnemyMonSpecies]
	dec a
	call CheckCaughtMon
	ret nz

	; Only flag landmarks for Nuzlocke runs after getting Poké Balls
	ld de, EVENT_LEARNED_TO_CATCH_POKEMON
	ld b, CHECK_FLAG
	call EventFlagAction
	ld a, c
	and a
	ret z

	; Get current landmark
	ld a, [MapGroup]
	ld b, a
	ld a, [MapNumber]
	ld c, a
	call GetWorldMapLocation
	; Use landmark as index into flag array
	ld c, a
	ld hl, NuzlockeLandmarkFlags
	ld b, SET_FLAG
	predef FlagPredef
	ret

CleanUpBattleRAM: ; 3f6d0
	call BattleEnd_HandleRoamMons
	xor a
	ld [Danger], a
	ld [wBattleMode], a
	ld [BattleType], a
	ld [AttackMissed], a
	ld [TempWildMonSpecies], a
	ld [OtherTrainerClass], a
	ld [wFailedToFlee], a
	ld [wNumFleeAttempts], a
	ld [wForcedSwitch], a
	ld [wPartyMenuCursor], a
	ld [wKeyItemsPocketCursor], a
	ld [wItemsPocketCursor], a
	ld [wd0d2], a
	ld [CurMoveNum], a
	ld [wBallsPocketCursor], a
	ld [wLastPocket], a
	ld [wMenuScrollPosition], a
	ld [wKeyItemsPocketScrollPosition], a
	ld [wItemsPocketScrollPosition], a
	ld [wBallsPocketScrollPosition], a
	ld hl, PlayerSubStatus1
	ld b, EnemyFuryCutterCount - PlayerSubStatus1
.loop
	ld [hli], a
	dec b
	jr nz, .loop
	call WaitSFX
	ret
; 3f71d

CheckPayDay: ; 3f71d
	ld hl, wPayDayMoney
	ld a, [hli]
	or [hl]
	inc hl
	or [hl]
	ret z
	ld a, [wAmuletCoin]
	and a
	jr z, .okay
	ld hl, wPayDayMoney + 2
	sla [hl]
	dec hl
	rl [hl]
	dec hl
	rl [hl]
	jr nc, .okay
	ld a, $ff
	ld [hli], a
	ld [hli], a
	ld [hl], a

.okay
	ld hl, wPayDayMoney + 2
	ld de, Money + 2
	call AddBattleMoneyToAccount
	ld hl, BattleText_PlayerPickedUpPayDayMoney
	call StdBattleTextBox
	ld a, [InBattleTowerBattle]
	bit 0, a
	ret z
	call ClearTileMap
	call ClearBGPalettes
	ret
; 3f759

ShowLinkBattleParticipantsAfterEnd: ; 3f759
	ld a, [CurOTMon]
	ld hl, OTPartyMon1Status
	call GetPartyLocation
	ld a, [EnemyMonStatus]
	ld [hl], a
	call ClearTileMap
	farcall _ShowLinkBattleParticipants
	ret
; 3f77c

ShowLinkBattleResult: ; 3f77c
	farcall DetermineLinkBattleResult

	ld a, [wBattleResult]
	and $f
	cp $1
	jr c, .victory
	jr z, .loss
	ld de, .Draw
	jr .store_result

.victory
	ld de, .Win
	jr .store_result

.loss
	ld de, .Lose
	jr .store_result

.store_result
	hlcoord 6, 8
	call PlaceString
	ld c, 200
	call DelayFrames

	ld a, BANK(sLinkBattleStats)
	call GetSRAMBank

	call AddLastBattleToLinkRecord
	call ReadAndPrintLinkBattleRecord

	call CloseSRAM

	call WaitPressAorB_BlinkCursor
	call ClearTileMap
	ret
; 3f7f7

.Win:
	db "You Win@"
.Lose:
	db "You Lose@"
.Draw:
	db "  Draw@"
; 3f80f


DisplayLinkRecord: ; 3f836
	ld a, BANK(sLinkBattleStats)
	call GetSRAMBank

	call ReadAndPrintLinkBattleRecord

	call CloseSRAM
	hlcoord 0, 0, AttrMap
	xor a
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	call ByteFill
	call WaitBGMap2
	ld b, SCGB_08
	call GetSGBLayout
	call SetPalettes
	ld c, 8
	call DelayFrames
	call WaitPressAorB_BlinkCursor
	ret
; 3f85f


ReadAndPrintLinkBattleRecord: ; 3f85f
	call ClearTileMap
	call ClearSprites
	call .PrintBattleRecord
	hlcoord 0, 8
	ld b, 5
	ld de, sLinkBattleRecord + 2
.loop
	push bc
	push hl
	push de
	ld a, [de]
	and a
	jr z, .PrintFormatString
	ld a, [wSavedAtLeastOnce]
	and a
	jr z, .PrintFormatString
	push hl
	push hl
	ld h, d
	ld l, e
	ld de, wd002
	ld bc, 10
	call CopyBytes
	ld a, "@"
	ld [de], a
	inc de
	ld bc, 6
	call CopyBytes
	ld de, wd002
	pop hl
	call PlaceString
	pop hl
	ld de, 26
	add hl, de
	push hl
	ld de, wd00d
	lb bc, 2, 4
	call PrintNum
	pop hl
	ld de, 5
	add hl, de
	push hl
	ld de, wd00f
	lb bc, 2, 4
	call PrintNum
	pop hl
	ld de, 5
	add hl, de
	ld de, wd011
	lb bc, 2, 4
	call PrintNum
	jr .next

.PrintFormatString:
	ld de, .Format
	call PlaceString
.next
	pop hl
	ld bc, 18
	add hl, bc
	ld d, h
	ld e, l
	pop hl
	ld bc, 2 * SCREEN_WIDTH
	add hl, bc
	pop bc
	dec b
	jr nz, .loop
	ret

.PrintBattleRecord:
	hlcoord 1, 0
	ld de, .Record
	call PlaceString

	hlcoord 0, 6
	ld de, .Result
	call PlaceString

	hlcoord 0, 2
	ld de, .Total
	call PlaceString

	hlcoord 6, 4
	ld de, sLinkBattleWins
	call .PrintZerosIfNoSaveFileExists
	jr c, .quit

	lb bc, 2, 4
	call PrintNum

	hlcoord 11, 4
	ld de, sLinkBattleLosses
	call .PrintZerosIfNoSaveFileExists

	lb bc, 2, 4
	call PrintNum

	hlcoord 16, 4
	ld de, sLinkBattleDraws
	call .PrintZerosIfNoSaveFileExists

	lb bc, 2, 4
	call PrintNum

.quit
	ret

.PrintZerosIfNoSaveFileExists:
	ld a, [wSavedAtLeastOnce]
	and a
	ret nz
	ld de, .Scores
	call PlaceString
	scf
	ret
; 3f938

.Scores:
	db "   0    0    0@"
; 3f947

.Format: ; 3f947
	db "  ---  <LNBRK>"
	db "         -    -    -@"
.Record: ; 3f964
	db "<PLAYER>'s Record@"
.Result: ; 3f96e
	db "Result Win Lose Draw@"
.Total: ; 3f983
	db "Total  Win Lose Draw@"
; 3f998


BattleEnd_HandleRoamMons: ; 3f998
	ld a, [BattleType]
	cp BATTLETYPE_ROAMING
	jr nz, .not_roaming
	ld a, [wBattleResult]
	and $f
	jr z, .caught_or_defeated_roam_mon
	call GetRoamMonHP
	ld a, [EnemyMonHP + 1]
	ld [hl], a
	jr .update_roam_mons

.caught_or_defeated_roam_mon
	call GetRoamMonHP
	ld [hl], $0
	call GetRoamMonMapGroup
	ld [hl], $ff
	call GetRoamMonMapNumber
	ld [hl], $ff
	call GetRoamMonSpecies
	ld [hl], $0
	ret

.not_roaming
	call BattleRandom
	and $f
	ret nz

.update_roam_mons
	farcall UpdateRoamMons
	ret
; 3f9d1

GetRoamMonMapGroup: ; 3f9d1
	ld a, [TempEnemyMonSpecies]
	ld b, a
	ld a, [wRoamMon1Species]
	cp b
	ld hl, wRoamMon1MapGroup
	ret z
	ld a, [wRoamMon2Species]
	cp b
	ld hl, wRoamMon2MapGroup
	ret z
	ld hl, wRoamMon3MapGroup
	ret
; 3f9e9

GetRoamMonMapNumber: ; 3f9e9
	ld a, [TempEnemyMonSpecies]
	ld b, a
	ld a, [wRoamMon1Species]
	cp b
	ld hl, wRoamMon1MapNumber
	ret z
	ld a, [wRoamMon2Species]
	cp b
	ld hl, wRoamMon2MapNumber
	ret z
	ld hl, wRoamMon3MapNumber
	ret
; 3fa01

GetRoamMonHP: ; 3fa01
; output: hl = wRoamMonHP
	ld a, [TempEnemyMonSpecies]
	ld b, a
	ld a, [wRoamMon1Species]
	cp b
	ld hl, wRoamMon1HP
	ret z
	ld a, [wRoamMon2Species]
	cp b
	ld hl, wRoamMon2HP
	ret z
	ld hl, wRoamMon3HP
	ret
; 3fa19

GetRoamMonDVsAndPersonality: ; 3fa19
; output: hl = wRoamMonDVs
	ld a, [TempEnemyMonSpecies]
	ld b, a
	ld a, [wRoamMon1Species]
	cp b
	ld hl, wRoamMon1DVs
	ret z
	ld a, [wRoamMon2Species]
	cp b
	ld hl, wRoamMon2DVs
	ret z
	ld hl, wRoamMon3DVs
	ret
; 3fa31

GetRoamMonSpecies: ; 3fa31
	ld a, [TempEnemyMonSpecies]
	ld hl, wRoamMon1Species
	cp [hl]
	ret z
	ld hl, wRoamMon2Species
	cp [hl]
	ret z
	ld hl, wRoamMon3Species
	ret
; 3fa42


AddLastBattleToLinkRecord: ; 3fa42
	ld hl, OTPlayerID
	ld de, StringBuffer1
	ld bc, 2
	call CopyBytes
	ld hl, OTPlayerName
	ld bc, NAME_LENGTH - 1
	call CopyBytes
	ld hl, sLinkBattleResults
	call .StoreResult
	ld hl, sLinkBattleRecord
	ld d, 5
.loop
	push hl
	inc hl
	inc hl
	ld a, [hl]
	dec hl
	dec hl
	and a
	jr z, .copy
	push de
	ld bc, 12
	ld de, StringBuffer1
	call CompareLong
	pop de
	pop hl
	jr c, .done
	ld bc, 18
	add hl, bc
	dec d
	jr nz, .loop
	ld bc, -18
	add hl, bc
	push hl

.copy
	ld d, h
	ld e, l
	ld hl, StringBuffer1
	ld bc, 12
	call CopyBytes
	ld b, 6
	xor a
.loop2
	ld [de], a
	inc de
	dec b
	jr nz, .loop2
	pop hl

.done
	call .StoreResult
	call .FindOpponentAndAppendRecord
	ret
; 3faa0
.StoreResult: ; 3faa0
	ld a, [wBattleResult]
	and $f
	cp $1
	ld bc, sLinkBattleWins + 1 - sLinkBattleResults
	jr c, .okay
	ld bc, sLinkBattleLosses + 1 - sLinkBattleResults
	jr z, .okay
	ld bc, sLinkBattleDraws + 1 - sLinkBattleResults
.okay
	add hl, bc
	call .CheckOverflow
	ret nc
	inc [hl]
	ret nz
	dec hl
	inc [hl]
	ret
; 3fabe

.CheckOverflow: ; 3fabe
	dec hl
	ld a, [hl]
	inc hl
	cp 9999 / $100
	ret c
	ld a, [hl]
	cp 9999 % $100
	ret
; 3fac8

.FindOpponentAndAppendRecord: ; 3fac8
	ld b, 5
	ld hl, sLinkBattleRecord + 17
	ld de, wd002
.loop3
	push bc
	push de
	push hl
	call .LoadPointer
	pop hl
	ld a, e
	pop de
	ld [de], a
	inc de
	ld a, b
	ld [de], a
	inc de
	ld a, c
	ld [de], a
	inc de
	ld bc, 18
	add hl, bc
	pop bc
	dec b
	jr nz, .loop3
	ld b, $0
	ld c, $1
.loop4
	ld a, b
	add b
	add b
	ld e, a
	ld d, $0
	ld hl, wd002
	add hl, de
	push hl
	ld a, c
	add c
	add c
	ld e, a
	ld d, $0
	ld hl, wd002
	add hl, de
	ld d, h
	ld e, l
	pop hl
	push bc
	ld c, 3
	call StringCmp
	pop bc
	jr z, .equal
	jr nc, .done2

.equal
	inc c
	ld a, c
	cp $5
	jr nz, .loop4
	inc b
	ld c, b
	inc c
	ld a, b
	cp $4
	jr nz, .loop4
	ret

.done2
	push bc
	ld a, b
	ld bc, 18
	ld hl, sLinkBattleRecord
	call AddNTimes
	push hl
	ld de, wd002
	ld bc, 18
	call CopyBytes
	pop hl
	pop bc
	push hl
	ld a, c
	ld bc, 18
	ld hl, sLinkBattleRecord
	call AddNTimes
	pop de
	push hl
	ld bc, 18
	call CopyBytes
	ld hl, wd002
	ld bc, 18
	pop de
	call CopyBytes
	ret
; 3fb54

.LoadPointer: ; 3fb54
	ld e, $0
	ld a, [hld]
	ld c, a
	ld a, [hld]
	ld b, a
	ld a, [hld]
	add c
	ld c, a
	ld a, [hld]
	adc b
	ld b, a
	jr nc, .okay2
	inc e

.okay2
	ld a, [hld]
	add c
	ld c, a
	ld a, [hl]
	adc b
	ld b, a
	ret nc
	inc e
	ret
; 3fb6c

InitBattleDisplay: ; 3fb6c
	call .InitBackPic
	hlcoord 0, 12
	ld b, 4
	ld c, 18
	call TextBox
	hlcoord 1, 5
	lb bc, 3, 7
	call ClearBox
	call LoadStandardFont
	call _LoadBattleFontsHPBar
	call .BlankBGMap
	xor a
	ld [hMapAnims], a
	ld [hSCY], a
	ld a, $90
	ld [hWY], a
	ld [rWY], a
	call WaitBGMap
	xor a
	ld [hBGMapMode], a
	farcall BattleIntroSlidingPics
	ld a, $1
	ld [hBGMapMode], a
	ld a, $31
	ld [hGraphicStartTile], a
	hlcoord 2, 6
	lb bc, 6, 6
	predef PlaceGraphic
	xor a
	ld [hWY], a
	ld [rWY], a
	call WaitBGMap
	call HideSprites
	ld b, SCGB_BATTLE_COLORS
	call GetSGBLayout
	call SetPalettes
	ld a, $90
	ld [hWY], a
	xor a
	ld [hSCX], a
	ret
; 3fbd6

.BlankBGMap: ; 3fbd6
	ld a, [rSVBK]
	push af
	ld a, $6
	ld [rSVBK], a

	ld hl, wDecompressScratch
	ld bc, wScratchAttrMap - wDecompressScratch
	ld a, " "
	call ByteFill

	ld de, wDecompressScratch
	hlbgcoord 0, 0
	lb bc, BANK(.BlankBGMap), $40
	call Request2bpp

	pop af
	ld [rSVBK], a
	ret
; 3fbf8

.InitBackPic: ; 3fbf8
	call GetTrainerBackpic
	call CopyBackpic
	ret
; 3fbff


GetTrainerBackpic: ; 3fbff
; Load the player character's backpic (6x6) into VRAM starting from VTiles2 tile $31.

; Special exception for Dude.
	ld b, BANK(DudeBackpic)
	ld hl, DudeBackpic
	ld a, [BattleType]
	cp BATTLETYPE_TUTORIAL
	jr z, .Decompress

; What gender are we?
	ld a, [wPlayerSpriteSetupFlags]
	bit 2, a ; transformed to male
	jr nz, .Chris
	ld a, [PlayerGender]
	bit 0, a
	jr z, .Chris

; It's a girl.
	farcall GetKrisBackpic
	ret

.Chris:
; It's a boy.
	ld b, BANK(ChrisBackpic)
	ld hl, ChrisBackpic

.Decompress:
	ld de, VTiles2 tile $31
	ld c, 6 * 6
	predef DecompressPredef
	ret
; 3fc30


CopyBackpic: ; 3fc30
	ld a, [rSVBK]
	push af
	ld a, $6
	ld [rSVBK], a
	ld hl, VTiles0
	ld de, VTiles2 tile $31
	ld a, [hROMBank]
	ld b, a
	ld c, 7 * 7
	call Get2bpp
	pop af
	ld [rSVBK], a
	call .LoadTrainerBackpicAsOAM
	ld a, $31
	ld [hGraphicStartTile], a
	hlcoord 2, 6
	lb bc, 6, 6
	predef PlaceGraphic
	ret
; 3fc5b

.LoadTrainerBackpicAsOAM: ; 3fc5b
	ld hl, Sprites
	xor a
	ld [hMapObjectIndexBuffer], a
	ld b, $6
	ld e, 21 * 8
.outer_loop
	ld c, $3
	ld d, 8 * 8
.inner_loop
	ld [hl], d
	inc hl
	ld [hl], e
	inc hl
	ld a, [hMapObjectIndexBuffer]
	ld [hli], a
	inc a
	ld [hMapObjectIndexBuffer], a
	ld a, $1
	ld [hli], a
	ld a, d
	add $8
	ld d, a
	dec c
	jr nz, .inner_loop
	ld a, [hMapObjectIndexBuffer]
	add $3
	ld [hMapObjectIndexBuffer], a
	ld a, e
	add $8
	ld e, a
	dec b
	jr nz, .outer_loop
	ret
; 3fc8b


BattleStartMessage: ; 3fc8b
	ld a, [wBattleMode]
	dec a
	jr z, .wild

	ld de, SFX_SHINE
	call PlaySFX
	call WaitSFX

	ld c, 20
	call DelayFrames

	farcall Battle_GetTrainerName

	ld hl, WantToBattleText
	call CheckPluralTrainer
	jr nz, .PlaceBattleStartText
	ld hl, WantsToBattleText
	jr .PlaceBattleStartText

.wild
	call BattleCheckEnemyShininess
	jr nc, .not_shiny

	xor a
	ld [wNumHits], a
	ld a, 1
	ld [hBattleTurn], a
	ld a, 1
	ld [wBattleAnimParam], a
	ld de, ANIM_SEND_OUT_MON
	call Call_PlayBattleAnim

.not_shiny
	farcall CheckSleepingTreeMon
	jr c, .skip_cry

	farcall CheckBattleEffects
	jr c, .cry_no_anim

	hlcoord 12, 0
	ld d, $0
	ld e, ANIM_MON_NORMAL
	predef AnimateFrontpic
	jr .skip_cry ; cry is played during the animation

.cry_no_anim
	ld a, $f
	ld [CryTracks], a
	ld a, [TempEnemyMonSpecies]
	call PlayStereoCry

.skip_cry
	ld a, [BattleType]
	cp BATTLETYPE_FISH
	jr nz, .NotFishing

	ld hl, HookedPokemonAttackedText
	jr .PlaceBattleStartText

.NotFishing:
	ld hl, PokemonFellFromTreeText
	cp BATTLETYPE_TREE
	jr z, .PlaceBattleStartText
	ld hl, LegendaryAppearedText
	cp BATTLETYPE_ROAMING
	jr z, .PlaceBattleStartText
	cp BATTLETYPE_CELEBI ; or BATTLETYPE_SUICUNE, BATTLETYPE_HO_OH, BATTLETYPE_LUGIA, BATTLETYPE_KANTO_LEGEND
	jr nc, .PlaceBattleStartText
	ld hl, WildPokemonAppearedText

.PlaceBattleStartText:
	push hl
	farcall BattleStart_TrainerHuds
	pop hl
	call StdBattleTextBox
	ret
; 3fd26

CheckPluralTrainer:
	ld a, [OtherTrainerClass]
	cp TWINS
	jr z, .plural
	cp SR_AND_JR
	jr z, .plural
	cp COUPLE
	jr z, .plural
	cp ACE_DUO
	jr z, .plural
	cp JESSIE_JAMES
	jr z, .plural
	xor a
	scf
	ret

.plural
	ld a, 1
	and a
	ret

INCLUDE "battle/unique_moves.asm"
