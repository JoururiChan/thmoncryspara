; swarms in grass

; CMomiji swarm
	def_grass_wildmons DARK_CAVE_VIOLET_ENTRANCE
	db 4 percent, 4 percent, 4 percent ; encounter rates: morn/day/nite
	; morn
	wildmon 3, CSARA
	wildmon 3, CMOMIJI, PLACETHM_THREE_SEGMENT_FORM
	wildmon 2, CKOTOHIME
	wildmon 2, CSARA
	wildmon 2, CMOMIJI, PLACETHM_TWO_SEGMENT_FORM
	wildmon 4, CMOMIJI, PLACETHM_THREE_SEGMENT_FORM
	wildmon 4, CMOMIJI, PLACETHM_TWO_SEGMENT_FORM
	; day
	wildmon 3, CSARA
	wildmon 3, CMOMIJI, PLACETHM_THREE_SEGMENT_FORM
	wildmon 2, CKOTOHIME
	wildmon 2, CSARA
	wildmon 2, CMOMIJI, PLACETHM_TWO_SEGMENT_FORM
	wildmon 4, CMOMIJI, PLACETHM_THREE_SEGMENT_FORM
	wildmon 4, CMOMIJI, PLACETHM_TWO_SEGMENT_FORM
	; nite
	wildmon 3, CSARA
	wildmon 3, CMOMIJI, PLACETHM_THREE_SEGMENT_FORM
	wildmon 2, CKOTOHIME
	wildmon 2, CSARA
	wildmon 2, CMOMIJI, PLACETHM_TWO_SEGMENT_FORM
	wildmon 4, CMOMIJI, PLACETHM_THREE_SEGMENT_FORM
	wildmon 4, CMOMIJI, PLACETHM_TWO_SEGMENT_FORM
	end_grass_wildmons

; AEiki swarm
	def_grass_wildmons ROUTE_35
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	wildmon 12, CRIKA
	wildmon 12, CKONGARA
	wildmon 12, AEIKI
	wildmon 14, AEIKI
	wildmon 14, CMAGAN
	wildmon 10, LYRICA
	wildmon 10, LYRICA
	; day
	wildmon 12, CRIKA
	wildmon 12, CKONGARA
	wildmon 12, AEIKI
	wildmon 14, AEIKI
	wildmon 14, CMAGAN
	wildmon 10, LYRICA
	wildmon 10, LYRICA
	; nite
	wildmon 12, CRIKA
	wildmon 12, CKONGARA
	wildmon 12, AEIKI
	wildmon 14, AEIKI
	wildmon 14, SWRIGGLE
	wildmon 10, LYRICA
	wildmon 10, LYRICA
	end_grass_wildmons

	db -1 ; end
