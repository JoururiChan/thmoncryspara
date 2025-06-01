BattleCommand_rage:
	ld a, BATTLE_VARS_SUBSTATUS4
	call GetBattleVarAddr
	set SUBSTATUS_FIRE_LAUNCH, [hl]
	ret
