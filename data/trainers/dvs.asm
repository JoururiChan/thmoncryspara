TrainerClassDVsAndPersonality:
; entries correspond to trainer classes (see constants/trainer_constants.asm)
	table_width 5
	;  EVs  HP   Def  SAt
	;  *    Atk  Spe  SDf  Gender
	db 252, PERFECT_DVS,   YIN ; carrie
	db 252, PERFECT_DVS,   YANG   ; cal
	db 252, PERFECT_DVS,   YANG   ; jacky
	db 252, $BB, $BB, $BB, YANG   ; falkner
	db 252, $BB, $BB, $BB, YANG   ; bugsy
	db 252, $CC, $CC, $CC, YIN ; whitney
	db 252, $CC, $CC, $CC, YANG   ; morty
	db 252, $DD, $DD, $DD, YANG   ; chuck
	db 252, $DD, $DD, $DD, YIN ; jasmine
	db 252, $EE, $EE, $EE, YANG   ; pryce
	db 252, $EE, $EE, $EE, YIN ; clair
	db 252, PERFECT_DVS,   YANG   ; will
	db 252, PERFECT_DVS,   YANG   ; koga
	db 252, PERFECT_DVS,   YANG   ; bruno
	db 252, PERFECT_DVS,   YIN ; karen
	db 252, PERFECT_DVS,   YANG   ; champion
	db 252, PERFECT_DVS,   YANG   ; brock
	db 252, PERFECT_DVS,   YIN ; misty
	db 252, PERFECT_DVS,   YANG   ; lt surge
	db 252, PERFECT_DVS,   YIN ; erika
	db 252, PERFECT_DVS,   YIN ; janine
	db 252, PERFECT_DVS,   YIN ; sabrina
	db 252, PERFECT_DVS,   YANG   ; blaine
	db 252, PERFECT_DVS,   YANG   ; blue
	db 252, PERFECT_DVS,   YANG   ; red
	db 252, PERFECT_DVS,   YIN ; leaf
	db   0, PERFECT_DVS,   YANG   ; rival0
	db 144, PERFECT_DVS,   YANG   ; rival1
	db 252, PERFECT_DVS,   YANG   ; rival2
	db   0, $BB, $BB, $BB, YIN ; lyra1
	db 252, $BB, $BB, $BB, YIN ; lyra2
	db   0, $66, $66, $66, YANG   ; youngster
	db   0, $66, $66, $66, YANG   ; bug catcher
	db   8, $77, $77, $77, YANG   ; camper
	db   8, $77, $77, $77, YIN ; picnicker
	db  16, $88, $88, $88, YIN ; twins
	db  16, $88, $88, $88, YANG   ; fisher
	db  16, $88, $88, $88, YANG   ; bird keeper
	db  24, $99, $99, $99, YANG   ; hiker
	db  32, $AA, $AA, $AA, YANG   ; gruntm
	db  32, $AA, $AA, $AA, YIN ; gruntf
	db  32, $AA, $AA, $AA, YANG   ; pokefanm
	db  32, $AA, $AA, $AA, YIN ; pokefanf
	db  48, $DD, $BB, $DB, YANG   ; officerm
	db  48, $7B, $DB, $FF, YIN ; officerf
	db  48, $E5, $FA, $D6, YIN ; nurse
	db  40, $BB, $BB, $BB, YANG   ; pokemaniac
	db  40, $BB, $BB, $BB, YIN ; cosplayer
	db  40, $BB, $BB, $BB, YANG   ; super nerd
	db  40, $BB, $BB, $BB, YIN ; lass
	db  48, $CC, $CC, $CC, YIN ; beauty
	db  48, $CC, $CC, $CC, YANG   ; bug maniac
	db  48, $CC, $CC, $CC, YANG   ; ruin maniac
	db  48, $CC, $CC, $CC, YANG   ; firebreather
	db  48, $CC, $CC, $CC, YANG   ; juggler
	db  48, $CC, $CC, $CC, YANG   ; schoolboy
	db  48, $CC, $CC, $CC, YIN ; schoolgirl
	db  48, $AA, $CC, $EE, YANG   ; psychic
	db  48, $AA, $CC, $EE, YIN ; hex maniac
	db  48, $CC, $CC, $CC, YANG   ; sage
	db  48, $CC, $CC, $CC, YIN ; medium
	db  56, $DD, $DD, $DD, YIN ; kimono girl 1
	db  56, $DD, $DD, $DD, YIN ; kimono girl 2
	db  56, $DD, $DD, $DD, YIN ; kimono girl 3
	db  56, $DD, $DD, $DD, YIN ; kimono girl 4
	db  56, $DD, $DD, $DD, YIN ; kimono girl 5
	db  56, $DD, $DD, $DD, YIN ; kimono girl 6
	db  56, $DD, $DD, $DD, YIN ; kimono girl 7
	db  56, $DD, $DD, $DD, YIN ; kimono girl 8
	db  56, $DD, $DD, $DD, YANG   ; elder
	db  48, $CC, $CC, $CC, YIN ; sr&jr
	db  48, $CC, $CC, $CC, YANG   ; couple
	db  48, $CC, $CC, $CC, YANG   ; gentleman
	db 100, $CC, $CC, $CC, YANG   ; rich boy (high EVs from vitamins)
	db  48, $CC, $CC, $CC, YIN ; lady
	db  56, $DD, $DD, $DD, YIN ; breeder (low EVs due to breeding)
	db  48, $CC, $CC, $CC, YIN ; baker
	db  48, $CC, $CC, $CC, YIN ; cowgirl
	db  48, $CC, $CC, $CC, YANG   ; sailor
	db  48, $CC, $CC, $CC, YANG   ; swimmerm
	db  48, $CC, $CC, $CC, YIN ; swimmerf
	db  56, $DD, $DD, $DD, YANG   ; burglar
	db  56, $DD, $DD, $DD, YANG   ; pi
	db  56, $DD, $DD, $DD, YANG   ; scientist
	db  56, $DD, $DD, $DD, YANG   ; rocket scientist
	db  56, $DD, $DD, $DD, YANG   ; boarder
	db  56, $DD, $DD, $DD, YIN ; skier
	db  64, $FF, $DD, $DD, YANG   ; blackbelt
	db  64, $FF, $DD, $DD, YIN ; battle girl
	db  72, $DF, $DF, $DD, YANG   ; dragon tamer
	db  72, $DD, $DD, $DD, YANG   ; engineer
	db  72, $DD, $DD, $DD, YIN ; teacher
	db  72, $DD, $DD, $DD, YANG   ; guitaristm
	db  72, $DD, $DD, $DD, YIN ; guitaristf
	db  72, $DD, $DD, $DD, YANG   ; biker
	db  72, $DD, $DD, $DD, YANG   ; roughneck
	db  72, $DD, $DD, $DD, YANG   ; tamer
	db  72, $DD, $DD, $DD, YIN ; artist
	db  72, $DD, $DD, $DD, YIN ; aroma lady
	db  72, $DD, $DD, $DD, YANG   ; soldier
	db  72, $DD, $DD, $DD, YANG   ; waiter
	db  72, $DD, $DD, $DD, YIN ; waitress
	db  72, $DD, $DD, $DD, YANG   ; sightseerm
	db  72, $DD, $DD, $DD, YIN ; sightseerf
	db  72, $EE, $EE, $EE, YANG   ; sightseers
	db  64, $EE, $EE, $EE, YANG   ; cooltrainerm
	db  64, $EE, $EE, $EE, YIN ; cooltrainerf
	db  72, $EE, $EE, $EE, YANG   ; ace duo
	db 128, PERFECT_DVS,   YANG   ; veteranm
	db 128, PERFECT_DVS,   YIN ; veteranf
	db  80, $BB, $BB, $BB, YANG   ; proton
	db  96, $CC, $CC, $CC, YANG   ; petrel
	db 128, $EE, $EE, $EE, YANG   ; archer
	db 112, $DD, $DD, $DD, YIN ; ariana
	db 160, PERFECT_DVS,   YANG   ; giovanni
	db 252, PERFECT_DVS,   YANG   ; prof oak
	db  32, $BB, $BB, $BB, YANG   ; prof elm
	db 252, PERFECT_DVS,   YIN ; prof ivy
	db  88, $DD, $DD, $DD, YANG   ; mysticalman
	db  88, PERFECT_DVS,   YANG   ; karate king
	db 252, PERFECT_DVS,   YANG   ; towertycoon
	db 252, PERFECT_DVS,   YANG   ; factoryhead
	db  88, $BB, $B8, $BB, YANG   ; jessie&james
	db 252, PERFECT_DVS,   YIN ; lorelei
	db 252, PERFECT_DVS,   YIN ; agatha
	db 252, PERFECT_DVS,   YANG   ; steven
	db 252, PERFECT_DVS,   YIN ; cynthia
	db 252, PERFECT_DVS,   YANG   ; inver
	db 192, $EE, $EE, $EE, YIN ; cheryl
	db 192, $EE, $EE, $EE, YANG   ; riley
	db 192, $EE, $EE, $EE, YANG   ; buck
	db 192, $EE, $EE, $EE, YIN ; marley
	db 192, $EE, $EE, $EE, YIN ; mira
	db 192, $EE, $EE, $EE, YIN ; anabel
	db 252, PERFECT_DVS,   YANG   ; darach
	db 252, PERFECT_DVS,   YIN ; caitlin
	db 252, PERFECT_DVS,   YIN ; candela
	db 252, PERFECT_DVS,   YIN ; blanche
	db 252, PERFECT_DVS,   YANG   ; spark
	db 252, PERFECT_DVS,   YIN ; flannery
	db 252, PERFECT_DVS,   YIN ; maylene
	db 252, PERFECT_DVS,   YANG   ; marlon
	db 252, PERFECT_DVS,   YIN ; valerie
	db 252, PERFECT_DVS,   YANG   ; kukui
	db 252, $DD, $DD, $DD, YANG   ; piers
	db 252, $DD, $DD, $DD, YIN ; katy
	db 192, $EE, $EE, $EE, YANG   ; victor
	db 252, PERFECT_DVS,   YANG   ; bill
	db 252, $EE, $EE, $EE, YIN ; yellow
	db 252, $EE, $EE, $EE, YANG   ; walker
	db 192, $EE, $EE, $EE, YANG   ; imakuni
	db 252, PERFECT_DVS,   YANG   ; lawrence
	db 252, $EE, $EE, $EE, YIN ; rei
	assert_table_length NUM_TRAINER_CLASSES
