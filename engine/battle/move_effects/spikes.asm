BattleCommand_spikes:
	ldh a, [hBattleTurn]
	and a
	ld hl, wEnemyHazards
	jr z, .got_hazards
	ld hl, wPlayerHazards
.got_hazards
	ld a, [hl]
	or ~HAZARDS_SPIKES
	inc a
	jmp z, FailSpikes
	ld a, HAZARDS_SPIKES / 3
	add [hl]
	ld [hl], a

	call AnimateCurrentMove

	ld hl, SpikesText
	jmp StdBattleTextbox

BattleCommand_toxicspikes:
	ldh a, [hBattleTurn]
	and a
	ld hl, wEnemyHazards
	jr z, .got_screens
	ld hl, wPlayerHazards
.got_screens
	ld a, [hl]
	and HAZARDS_POISON_NAIL
	cp (HAZARDS_POISON_NAIL / 3) * 2
	jmp z, FailSpikes
	ld a, HAZARDS_POISON_NAIL / 3
	add [hl]
	ld [hl], a

	call AnimateCurrentMove

	ld hl, PoisonNailText
	jmp StdBattleTextbox

.failed
	jmp FailSpikes
