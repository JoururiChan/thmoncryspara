; AIDamageCalc uses BattleCommand_constantdamage
; to calculate damage for these instead of
; BattleCommand_damagecalc and BattleCommand_stab.

ConstantDamageEffects:
	db EFFECT_HEAT_CLAW
	db EFFECT_STATIC_DAMAGE
	db EFFECT_LEVEL_DAMAGE
	db -1 ; end
