Fish:
; Using a fishing rod.
; Fish for monsters with rod e in encounter group d.
; Return monster bc at level d.

	push hl
	push af

	ld b, e
	call GetFishGroupIndex

	ld hl, FishGroups
rept FISHGROUP_DATA_LENGTH
	add hl, de
endr
	call .Fish

	pop af
	pop hl
	ret

.Fish:
; Fish for monsters with rod b from encounter data in FishGroup at hl.
; Return monster bc at level d; or item bc if d = 0; or nothing if bc = 0 and d = 0.

	ld e, b
	ld d, 0
	call Random
	cp [hl]
	jr c, .bite
	inc hl
	cp [hl]
	jr nc, .no_bite

	; Get item by rod
	; 0: Old
	; 1: Good
	; 2: Super
	ld hl, FishItems
	add hl, de
	ld c, [hl]
	ld b, d ; ld b, 0
	ret

.bite
	; Get encounter data by rod:
	; 0: Old
	; 1: Good
	; 2: Super
	inc hl
	inc hl
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a

	; Compare the encounter chance to select a Pokemon.
	call Random
.loop
	cp [hl]
	inc hl
	jr z, .ok
	jr c, .ok
	inc hl
	inc hl
	inc hl
	jr .loop
.ok
	; Species 0 is Corsola during morning/day
	; and Staryu during evening/night.
	ld a, [hli]
	and a
	call z, .TimeEncounter
	ld c, a

	ld a, [hli]
	ld b, a
	ld d, [hl]
	ret

.no_bite
	ld b, d ; d already = 0
	ld c, d
	ret

.TimeEncounter:
	ld a, [wTimeOfDay]
	and 3
	cp NITE
	; a = carry ? CORSOLA : STARYU
	sbc a
	and CORSOLA - STARYU
	add STARYU
	ret

GetFishGroupIndex:
; Return the index of fishgroup d in de.

	push hl
	ld hl, wDailyFlags
	bit 2, [hl] ; ENGINE_FISH_SWARM
	pop hl
	jr z, .done

	ld a, d
	cp FISHGROUP_QWILFISH
	jr z, .qwilfish
	cp FISHGROUP_REMORAID
	jr z, .remoraid

.done
	dec d
	ld e, d
	ld d, 0
	ret

.qwilfish
	ld a, [wFishingSwarmFlag]
	cp FISHSWARM_QWILFISH
	jr nz, .done
	ld d, FISHGROUP_QWILFISH_SWARM
	jr .done

.remoraid
	ld a, [wFishingSwarmFlag]
	cp FISHSWARM_REMORAID
	jr nz, .done
	ld d, FISHGROUP_REMORAID_SWARM
	jr .done

INCLUDE "data/wild/fish.asm"
