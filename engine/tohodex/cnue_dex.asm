Tohodex_CNue:
	ld a, DEXDISP_CNUE
	ld [wTohodex_DisplayMode], a

	; Reset the cursor for CNue Mode.
	xor a
	ld [wTohodex_CNueCursor], a

	; Writes interface palettes. Tohopic is handled seperately.
	ld hl, CNueModePals
	ld de, wBGPals1 palette 2
	ld bc, 2 palettes
	ld a, BANK(CNueModePals)
	call FarCopyBytesToColorWRAM

	call ClearSpriteAnims
	lb de, $5c, $24
	ld a, SPRITE_ANIM_INDEX_DEX_CNUE_CURSOR
	call InitSpriteAnimStruct

	; fallthrough
_Tohodex_CNue:
	; Load current cnue pic.
	call Tohodex_LoadCNuePic
	push af
	ld hl, DexTilemap_CNue
	call Tohodex_LoadTilemapWithTohopic

	; If we have caught the current CNue, we want to
	; display the relevant letter and a word alongside.
	; If not, we want to replace "CNUE" with whitespace.
	pop af
	jr z, .not_caught

	; Since CNue forms are 1-indexed, load table from CNueWords-1.
	call Tohodex_GetCNueCursorForm
	ld a, b
	push af
	ld e, a
	ld d, 0
	ld hl, CNueWords - 1
	add hl, de
	ld e, [hl]
	add hl, de
	ld e, l
	ld d, h
	hlcoord 10, 5
	rst PlaceString
	pop af
	call Tohodex_GetPrintableCNueChar

	hlcoord 16, 3
	ld [hl], a
	jr .current_done

.not_caught
	; Remove "CNUE"
	hlcoord 10, 3
	ld a, " "
	ld bc, 5
	rst ByteFill

.current_done
	; Print a table of CNue characters for all forms we've caught.
	hlcoord 4, 10
	lb bc, CNUE_A_FORM, LOW(CNUE)
	ld d, 4
.outer_loop
	ld e, 7
.inner_loop
	; Check if this form is captured.
	push hl
	push de
	push bc
	call CheckCaughtMon
	pop bc
	pop de
	pop hl
	jr z, .next

	; Print character
	ld a, b
	call Tohodex_GetPrintableCNueChar
	ld [hl], a
.next
	inc b
	inc hl
	inc hl
	dec e
	jr nz, .inner_loop
	push bc
	; 2x(screen) - cnue chars per line * 2
	ld bc, 2 * SCREEN_WIDTH - 7 * 2
	add hl, bc
	pop bc
	dec d
	jr nz, .outer_loop

	ld a, -1
	call Tohodex_ScheduleScreenUpdateWithHBlank
.joypad_loop
	call Tohodex_GetInput
	rrca ; ignore A press
	rrca
	jr c, .pressed_b
	rrca
	jr c, .pressed_select
	rrca ; ignore start
	rrca
	jr c, .pressed_right
	rrca
	jr c, .pressed_left
	rrca
	jr c, .pressed_up
	rrca
	jr c, .pressed_down
	jr .joypad_loop

.pressed_b
	call ClearSpriteAnims
	jmp Tohodex_Mode_ReloadPals

.pressed_select
	call Tohodex_SwitchNormalOrShinyPalette
	call Tohodex_ScheduleScreenUpdate
	jr .joypad_loop

.pressed_right
	ld b, 1
	jr .move_cursor
.pressed_left
	ld b, 7
	jr .move_cursor
.pressed_up
	ld b, $30
	jr .move_cursor
.pressed_down
	ld b, $10
.move_cursor
	ld a, [wTohodex_CNueCursor]
	add b
	and $37
	ld [wTohodex_CNueCursor], a

	; There's 7 columns, not 8.
	maskbits $7
	cp $7
	jr z, .move_cursor
	jmp _Tohodex_CNue

Tohodex_GetPrintableCNueChar:
; Convert cnue form in a to printable character.
	add "A" - 1

	cp (CNUE_Z_FORM + 1) + ("A" - 1)
	ret c

	assert CNUE_Z_FORM + 1 == CNUE_EXCLAMATION_FORM
	ld a, "!"
	ret z

	assert "!" - 1 == "?"
	dec a
	ret

Tohodex_LoadCNuePic:
; Returns z if the CNue form we are hovering isn't captured.
	; Cycle pokepic VRAM. Pointless on initial setup, but necessary after.
	call Tohodex_SwitchMonInfoBank

	; Get relevant CNue.
	call Tohodex_GetCNueCursorForm

	; Have we captured this CNue?
	push bc
	call CheckCaughtMon
	pop bc
	jmp z, Tohodex_LoadUndiscoveredTohopic

	; We've captured it. Load the relevant pokepic and pal.
	; Load pokepic.
	ld a, b
	ld [wCurForm], a
	ld [wTohodex_Form], a
	ld a, c
	ld [wCurPartySpecies], a
	call GetBaseData
	farcall PrepareFrontpic

	; Schedule a write of frontpic in VBlank.
	ld hl, wTohodex_GFXFlags
	set DEXGFX_FRONTPIC, [hl]

	; Load palette.
	ld bc, wTohodex_Personality
	ld a, [wCurPartySpecies]
	farcall GetMonNormalOrShinyPalettePointer
	ld de, wBGPals1 palette 6 + 2
	ld a, BANK(TohomonPalettes)
	ld bc, 4
	call FarCopyBytesToColorWRAM

	; Return nz, to signify that we have caught this CNue.
	or 1
	ret

Tohodex_GetCNueCursorForm:
; Returns given CNue form in bc from what the cursor is hovering.
	ld a, [wTohodex_CNueCursor]
	ld c, a

	; CNue form is (vertical pos * 7 + horizontal pos + 1)
	; Horizontal position
	and %111
	ld b, a

	; Vertical position
	ld a, c
	swap a
	and %11
	ld c, a

	; Multiply vertical position by 7
	ld a, 7
	call SimpleMultiply

	; Add horizontal position
	add b

	; Forms are 1-indexed
	inc a

	; Now we have the form.
	assert !HIGH(CNUE)
	ld b, a
	ld c, LOW(CNUE)
	ret

INCLUDE "data/tohomon/cnue_words.asm"

CNueModePals:
INCLUDE "gfx/tohodex/cnue.pal"
