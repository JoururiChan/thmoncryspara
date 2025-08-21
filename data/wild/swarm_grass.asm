; swarms in grass

; CMomiji swarm
	def_grass_wildmons DARK_CAVE_VIOLET_ENTRANCE
	db 4 percent, 4 percent, 4 percent ; encounter rates: morn/day/nite
	; morn
	wildmon 3, CSARA
	wildmon 3, CEIKI
	wildmon 2, CRUMIA
	wildmon 2, CSARA
	wildmon 2, CEIKI
	wildmon 4, CEIKI
	wildmon 4, CEIKI
	; day
	wildmon 3, CSARA
	wildmon 3, CEIKI
	wildmon 2, CRUMIA
	wildmon 2, CSARA
	wildmon 2, CEIKI
	wildmon 4, CEIKI
	wildmon 4, CEIKI
	; nite
	wildmon 3, CSARA
	wildmon 3, CEIKI
	wildmon 2, CRUMIA
	wildmon 2, CSARA
	wildmon 2, CEIKI
	wildmon 4, CEIKI
	wildmon 4, CEIKI
	end_grass_wildmons

; CKOTOHIME swarm
	def_grass_wildmons ROUTE_35
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	wildmon 12, CRAN
	wildmon 12, CRAN
	wildmon 12, CKOTOHIME
	wildmon 14, CKOTOHIME
	wildmon 14, CTEI
	wildmon 10, CTEI
	wildmon 10, CKAGUYA
	; day
	wildmon 12, CREIMU
	wildmon 12, CREIMU
	wildmon 12, CKOTOHIME
	wildmon 14, CKOTOHIME
	wildmon 14, CTEI
	wildmon 10, CTEI
	wildmon 10, CMOKOU
	; nite
	wildmon 12, CRUMIA
	wildmon 12, CRUMIA
	wildmon 12, CKOTOHIME
	wildmon 14, CKOTOHIME
	wildmon 14, CRIKA
	wildmon 10, CRIKA
	wildmon 10, CYOUMU
	end_grass_wildmons

	db -1 ; end
