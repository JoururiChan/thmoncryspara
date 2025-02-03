MACRO ev_yield
	def_evs \#
	db (EV_HP << 6) | (EV_ATK << 4) | (EV_DEF << 2) | EV_SPE
	db (EV_SAT << 6) | (EV_SDF << 4)
ENDM

MACRO abilities_for
; mon, ability1, ability2, hiddenability
	db \2, \3, \4
	def ABIL_\1_\4 = HIDDEN_ABILITY
	def ABIL_\1_\3 = ABILITY_2
	def ABIL_\1_\2 = ABILITY_1
ENDM

MACRO tmhm
	; initialize bytes to 0
	for n, (NUM_TM_HM_TUTOR + 7) / 8
		def _tm{d:n} = 0
	endr
	; set bits of bytes
	for i, 1, _NARG + 1
		if DEF(\<i>_TMNUM)
			def n = (\<i>_TMNUM - 1) / 8
			def t = (\<i>_TMNUM - 1) % 8
			def _tm{d:n} |= 1 << t
		else
			fail "\<i> is not a TM, HM, or tutor move"
		endc
	endr
	; output bytes
	for n, (NUM_TM_HM_TUTOR + 7) / 8
		db _tm{d:n}
	endr
ENDM

BaseData::
	table_width BASE_DATA_SIZE
INCLUDE "data/tohomon/base_stats/creimu.asm"
INCLUDE "data/tohomon/base_stats/reimu.asm"
INCLUDE "data/tohomon/base_stats/treimu.asm"
INCLUDE "data/tohomon/base_stats/cmarisa.asm"
INCLUDE "data/tohomon/base_stats/marisa.asm"
INCLUDE "data/tohomon/base_stats/amarisa.asm"
INCLUDE "data/tohomon/base_stats/csakuya.asm"
INCLUDE "data/tohomon/base_stats/sakuya.asm"
INCLUDE "data/tohomon/base_stats/hsakuya.asm"
INCLUDE "data/tohomon/base_stats/cgyoku.asm"
INCLUDE "data/tohomon/base_stats/mgyoku.asm"
INCLUDE "data/tohomon/base_stats/fgyoku.asm"
INCLUDE "data/tohomon/base_stats/ogyoku.asm"
INCLUDE "data/tohomon/base_stats/cmagan.asm"
INCLUDE "data/tohomon/base_stats/magan.asm"
INCLUDE "data/tohomon/base_stats/cmima.asm"
INCLUDE "data/tohomon/base_stats/mima.asm"
INCLUDE "data/tohomon/base_stats/celis.asm"
INCLUDE "data/tohomon/base_stats/elis.asm"
INCLUDE "data/tohomon/base_stats/ckikuri.asm"
INCLUDE "data/tohomon/base_stats/kikuri.asm"
INCLUDE "data/tohomon/base_stats/csariel.asm"
INCLUDE "data/tohomon/base_stats/sariel.asm"
INCLUDE "data/tohomon/base_stats/ckongara.asm"
INCLUDE "data/tohomon/base_stats/kongara.asm"
INCLUDE "data/tohomon/base_stats/crika.asm"
INCLUDE "data/tohomon/base_stats/rika.asm"
INCLUDE "data/tohomon/base_stats/arika.asm"
INCLUDE "data/tohomon/base_stats/cmeira.asm"
INCLUDE "data/tohomon/base_stats/meira.asm"
INCLUDE "data/tohomon/base_stats/cellen.asm"
INCLUDE "data/tohomon/base_stats/ellen.asm"
INCLUDE "data/tohomon/base_stats/ckotohime.asm"
INCLUDE "data/tohomon/base_stats/kotohime.asm"
INCLUDE "data/tohomon/base_stats/ckana.asm"
INCLUDE "data/tohomon/base_stats/kana.asm"
INCLUDE "data/tohomon/base_stats/crikako.asm"
INCLUDE "data/tohomon/base_stats/rikako.asm"
INCLUDE "data/tohomon/base_stats/cchiyuri.asm"
INCLUDE "data/tohomon/base_stats/chiyuri.asm"
INCLUDE "data/tohomon/base_stats/cyumemi.asm"
INCLUDE "data/tohomon/base_stats/yumemi.asm"
INCLUDE "data/tohomon/base_stats/corange.asm"
INCLUDE "data/tohomon/base_stats/orange.asm"
INCLUDE "data/tohomon/base_stats/ckurumi.asm"
INCLUDE "data/tohomon/base_stats/kurumi.asm"
INCLUDE "data/tohomon/base_stats/celly.asm"
INCLUDE "data/tohomon/base_stats/elly.asm"
INCLUDE "data/tohomon/base_stats/cyuka.asm"
INCLUDE "data/tohomon/base_stats/yuka.asm"
INCLUDE "data/tohomon/base_stats/ayuka.asm"
INCLUDE "data/tohomon/base_stats/cmugetsu.asm"
INCLUDE "data/tohomon/base_stats/mugetsu.asm"
INCLUDE "data/tohomon/base_stats/cgengetsu.asm"
INCLUDE "data/tohomon/base_stats/gengetsu.asm"
INCLUDE "data/tohomon/base_stats/csara.asm"
INCLUDE "data/tohomon/base_stats/sara.asm"
INCLUDE "data/tohomon/base_stats/cluize.asm"
INCLUDE "data/tohomon/base_stats/luize.asm"
INCLUDE "data/tohomon/base_stats/dluize.asm"
INCLUDE "data/tohomon/base_stats/calice.asm"
INCLUDE "data/tohomon/base_stats/alice.asm"
INCLUDE "data/tohomon/base_stats/aalice.asm"
INCLUDE "data/tohomon/base_stats/cmai.asm"
INCLUDE "data/tohomon/base_stats/mai.asm"
INCLUDE "data/tohomon/base_stats/cyuki.asm"
INCLUDE "data/tohomon/base_stats/yuki.asm"
INCLUDE "data/tohomon/base_stats/cyumeko.asm"
INCLUDE "data/tohomon/base_stats/yumeko.asm"
INCLUDE "data/tohomon/base_stats/cshinki.asm"
INCLUDE "data/tohomon/base_stats/shinki.asm"
INCLUDE "data/tohomon/base_stats/crumia.asm"
INCLUDE "data/tohomon/base_stats/rumia.asm"
INCLUDE "data/tohomon/base_stats/arumia.asm"
INCLUDE "data/tohomon/base_stats/cdaichan.asm"
INCLUDE "data/tohomon/base_stats/daichan.asm"
INCLUDE "data/tohomon/base_stats/ddaichan.asm"
INCLUDE "data/tohomon/base_stats/ccirno.asm"
INCLUDE "data/tohomon/base_stats/cirno.asm"
INCLUDE "data/tohomon/base_stats/scirno.asm"
INCLUDE "data/tohomon/base_stats/cmeiling.asm"
INCLUDE "data/tohomon/base_stats/meiling.asm"
INCLUDE "data/tohomon/base_stats/ameiling.asm"
INCLUDE "data/tohomon/base_stats/ckoakuma.asm"
INCLUDE "data/tohomon/base_stats/koakuma.asm"
INCLUDE "data/tohomon/base_stats/hkoakuma.asm"
INCLUDE "data/tohomon/base_stats/cpatchouli.asm"
INCLUDE "data/tohomon/base_stats/patchouli.asm"
INCLUDE "data/tohomon/base_stats/tpatchouli.asm"
INCLUDE "data/tohomon/base_stats/cremilia.asm"
INCLUDE "data/tohomon/base_stats/remilia.asm"
INCLUDE "data/tohomon/base_stats/sremilia.asm"
INCLUDE "data/tohomon/base_stats/cflandre.asm"
INCLUDE "data/tohomon/base_stats/flandre.asm"
INCLUDE "data/tohomon/base_stats/aflandre.asm"
INCLUDE "data/tohomon/base_stats/cletty.asm"
INCLUDE "data/tohomon/base_stats/letty.asm"
INCLUDE "data/tohomon/base_stats/dletty.asm"
INCLUDE "data/tohomon/base_stats/cchen.asm"
INCLUDE "data/tohomon/base_stats/chen.asm"
INCLUDE "data/tohomon/base_stats/hchen.asm"
INCLUDE "data/tohomon/base_stats/clilywhite.asm"
INCLUDE "data/tohomon/base_stats/lilywhite.asm"
INCLUDE "data/tohomon/base_stats/dlilywhite.asm"
INCLUDE "data/tohomon/base_stats/clilyblack.asm"
INCLUDE "data/tohomon/base_stats/lilyblack.asm"
INCLUDE "data/tohomon/base_stats/slilyblack.asm"
INCLUDE "data/tohomon/base_stats/clyrica.asm"
INCLUDE "data/tohomon/base_stats/lyrica.asm"
INCLUDE "data/tohomon/base_stats/tlyrica.asm"
INCLUDE "data/tohomon/base_stats/cmerlin.asm"
INCLUDE "data/tohomon/base_stats/merlin.asm"
INCLUDE "data/tohomon/base_stats/smerlin.asm"
INCLUDE "data/tohomon/base_stats/clunasa.asm"
INCLUDE "data/tohomon/base_stats/lunasa.asm"
INCLUDE "data/tohomon/base_stats/alunasa.asm"
INCLUDE "data/tohomon/base_stats/cyuyuko.asm"
INCLUDE "data/tohomon/base_stats/yuyuko.asm"
INCLUDE "data/tohomon/base_stats/ayuyuko.asm"
INCLUDE "data/tohomon/base_stats/cran.asm"
INCLUDE "data/tohomon/base_stats/ran.asm"
INCLUDE "data/tohomon/base_stats/tran.asm"
INCLUDE "data/tohomon/base_stats/cyukari.asm"
INCLUDE "data/tohomon/base_stats/yukari.asm"
INCLUDE "data/tohomon/base_stats/tyukari.asm"
INCLUDE "data/tohomon/base_stats/csuika.asm"
INCLUDE "data/tohomon/base_stats/suika.asm"
INCLUDE "data/tohomon/base_stats/tsuika.asm"
INCLUDE "data/tohomon/base_stats/cyoumu.asm"
INCLUDE "data/tohomon/base_stats/youmu.asm"
INCLUDE "data/tohomon/base_stats/syoumu.asm"
INCLUDE "data/tohomon/base_stats/creisen.asm"
INCLUDE "data/tohomon/base_stats/reisen.asm"
INCLUDE "data/tohomon/base_stats/treisen.asm"
INCLUDE "data/tohomon/base_stats/csanae.asm"
INCLUDE "data/tohomon/base_stats/sanae.asm"
INCLUDE "data/tohomon/base_stats/dsanae.asm"
INCLUDE "data/tohomon/base_stats/cwriggle.asm"
INCLUDE "data/tohomon/base_stats/wriggle.asm"
INCLUDE "data/tohomon/base_stats/swriggle.asm"
INCLUDE "data/tohomon/base_stats/cmystia.asm"
INCLUDE "data/tohomon/base_stats/mystia.asm"
INCLUDE "data/tohomon/base_stats/tmystia.asm"
INCLUDE "data/tohomon/base_stats/ckeine.asm"
INCLUDE "data/tohomon/base_stats/keine.asm"
INCLUDE "data/tohomon/base_stats/akeine.asm"
INCLUDE "data/tohomon/base_stats/ctei.asm"
INCLUDE "data/tohomon/base_stats/tei.asm"
INCLUDE "data/tohomon/base_stats/ttei.asm"
INCLUDE "data/tohomon/base_stats/ceirin.asm"
INCLUDE "data/tohomon/base_stats/eirin.asm"
INCLUDE "data/tohomon/base_stats/teirin.asm"
INCLUDE "data/tohomon/base_stats/ckaguya.asm"
INCLUDE "data/tohomon/base_stats/kaguya.asm"
INCLUDE "data/tohomon/base_stats/tkaguya.asm"
INCLUDE "data/tohomon/base_stats/cmokou.asm"
INCLUDE "data/tohomon/base_stats/mokou.asm"
INCLUDE "data/tohomon/base_stats/amokou.asm"
INCLUDE "data/tohomon/base_stats/caya.asm"
INCLUDE "data/tohomon/base_stats/aya.asm"
INCLUDE "data/tohomon/base_stats/saya.asm"
INCLUDE "data/tohomon/base_stats/cmedicine.asm"
INCLUDE "data/tohomon/base_stats/medicine.asm"
INCLUDE "data/tohomon/base_stats/amedicine.asm"
INCLUDE "data/tohomon/base_stats/ckomachi.asm"
INCLUDE "data/tohomon/base_stats/komachi.asm"
INCLUDE "data/tohomon/base_stats/akomachi.asm"
INCLUDE "data/tohomon/base_stats/ceiki.asm"
INCLUDE "data/tohomon/base_stats/eiki.asm"
INCLUDE "data/tohomon/base_stats/aeiki.asm"
INCLUDE "data/tohomon/base_stats/cshizuha.asm"
INCLUDE "data/tohomon/base_stats/shizuha.asm"
INCLUDE "data/tohomon/base_stats/sshizuha.asm"
INCLUDE "data/tohomon/base_stats/cminoriko.asm"
INCLUDE "data/tohomon/base_stats/minoriko.asm"
INCLUDE "data/tohomon/base_stats/hminoriko.asm"
INCLUDE "data/tohomon/base_stats/china.asm"
INCLUDE "data/tohomon/base_stats/hina.asm"
INCLUDE "data/tohomon/base_stats/ahina.asm"
INCLUDE "data/tohomon/base_stats/cnitori.asm"
INCLUDE "data/tohomon/base_stats/nitori.asm"
INCLUDE "data/tohomon/base_stats/anitori.asm"
INCLUDE "data/tohomon/base_stats/cmomiji.asm"
INCLUDE "data/tohomon/base_stats/momiji.asm"
INCLUDE "data/tohomon/base_stats/ckanako.asm"
INCLUDE "data/tohomon/base_stats/kanako.asm"
INCLUDE "data/tohomon/base_stats/akanako.asm"
INCLUDE "data/tohomon/base_stats/csuwako.asm"
INCLUDE "data/tohomon/base_stats/suwako.asm"
INCLUDE "data/tohomon/base_stats/dsuwako.asm"
INCLUDE "data/tohomon/base_stats/ciku.asm"
INCLUDE "data/tohomon/base_stats/iku.asm"
INCLUDE "data/tohomon/base_stats/aiku.asm"
INCLUDE "data/tohomon/base_stats/ctenshi.asm"
INCLUDE "data/tohomon/base_stats/tenshi.asm"
INCLUDE "data/tohomon/base_stats/stenshi.asm"
INCLUDE "data/tohomon/base_stats/swinub.asm"
INCLUDE "data/tohomon/base_stats/piloswine.asm"
INCLUDE "data/tohomon/base_stats/corsola.asm"
INCLUDE "data/tohomon/base_stats/remoraid.asm"
INCLUDE "data/tohomon/base_stats/octillery.asm"
INCLUDE "data/tohomon/base_stats/delibird.asm"
INCLUDE "data/tohomon/base_stats/mantine.asm"
INCLUDE "data/tohomon/base_stats/skarmory.asm"
INCLUDE "data/tohomon/base_stats/houndour.asm"
INCLUDE "data/tohomon/base_stats/houndoom.asm"
INCLUDE "data/tohomon/base_stats/kingdra.asm"
INCLUDE "data/tohomon/base_stats/phanpy.asm"
INCLUDE "data/tohomon/base_stats/donphan.asm"
INCLUDE "data/tohomon/base_stats/clunasa2.asm"
INCLUDE "data/tohomon/base_stats/stantler.asm"
INCLUDE "data/tohomon/base_stats/smeargle.asm"
INCLUDE "data/tohomon/base_stats/tyrogue.asm"
INCLUDE "data/tohomon/base_stats/hitmontop.asm"
INCLUDE "data/tohomon/base_stats/smoochum.asm"
INCLUDE "data/tohomon/base_stats/elekid.asm"
INCLUDE "data/tohomon/base_stats/magby.asm"
INCLUDE "data/tohomon/base_stats/miltank.asm"
INCLUDE "data/tohomon/base_stats/blissey.asm"
INCLUDE "data/tohomon/base_stats/raikou.asm"
INCLUDE "data/tohomon/base_stats/entei.asm"
INCLUDE "data/tohomon/base_stats/suicune.asm"
INCLUDE "data/tohomon/base_stats/larvitar.asm"
INCLUDE "data/tohomon/base_stats/pupitar.asm"
INCLUDE "data/tohomon/base_stats/tyranitar.asm"
INCLUDE "data/tohomon/base_stats/lugia.asm"
INCLUDE "data/tohomon/base_stats/ho_oh.asm"
INCLUDE "data/tohomon/base_stats/celebi.asm"
INCLUDE "data/tohomon/base_stats/azurill.asm"
INCLUDE "data/tohomon/base_stats/wynaut.asm"
INCLUDE "data/tohomon/base_stats/ambipom.asm"
INCLUDE "data/tohomon/base_stats/egg.asm"
INCLUDE "data/tohomon/base_stats/egg.asm"
INCLUDE "data/tohomon/base_stats/mismagius.asm"
INCLUDE "data/tohomon/base_stats/honchkrow.asm"
INCLUDE "data/tohomon/base_stats/bonsly.asm"
INCLUDE "data/tohomon/base_stats/mime_jr_.asm"
INCLUDE "data/tohomon/base_stats/happiny.asm"
INCLUDE "data/tohomon/base_stats/munchlax.asm"
INCLUDE "data/tohomon/base_stats/mantyke.asm"
INCLUDE "data/tohomon/base_stats/weavile.asm"
INCLUDE "data/tohomon/base_stats/magnezone.asm"
INCLUDE "data/tohomon/base_stats/lickilicky.asm"
INCLUDE "data/tohomon/base_stats/rhyperior.asm"
INCLUDE "data/tohomon/base_stats/tangrowth.asm"
INCLUDE "data/tohomon/base_stats/electivire.asm"
INCLUDE "data/tohomon/base_stats/magmortar.asm"
INCLUDE "data/tohomon/base_stats/togekiss.asm"
INCLUDE "data/tohomon/base_stats/yanmega.asm"
INCLUDE "data/tohomon/base_stats/leafeon.asm"
INCLUDE "data/tohomon/base_stats/glaceon.asm"
INCLUDE "data/tohomon/base_stats/amomiji.asm"
INCLUDE "data/tohomon/base_stats/mamoswine.asm"
INCLUDE "data/tohomon/base_stats/clunasa_z.asm"
INCLUDE "data/tohomon/base_stats/sylveon.asm"
INCLUDE "data/tohomon/base_stats/perrserker.asm"
INCLUDE "data/tohomon/base_stats/cursola.asm"
INCLUDE "data/tohomon/base_stats/sirfetch_d.asm"
INCLUDE "data/tohomon/base_stats/mr__rime.asm"
INCLUDE "data/tohomon/base_stats/wyrdeer.asm"
INCLUDE "data/tohomon/base_stats/kleavor.asm"
INCLUDE "data/tohomon/base_stats/ursaluna_plain.asm"
INCLUDE "data/tohomon/base_stats/sneasler.asm"
INCLUDE "data/tohomon/base_stats/overqwil.asm"
INCLUDE "data/tohomon/base_stats/placethm.asm"
INCLUDE "data/tohomon/base_stats/farigiraf.asm"
INCLUDE "data/tohomon/base_stats/clodsire.asm"
INCLUDE "data/tohomon/base_stats/annihilape.asm"
	assert_table_length NUM_SPECIES

INCLUDE "data/tohomon/base_stats/slilyblack.asm" ; red

INCLUDE "data/tohomon/base_stats/suika_armored.asm"

INCLUDE "data/tohomon/base_stats/placethm.asm" ; three segment

INCLUDE "data/tohomon/base_stats/ursaluna_bloodmoon.asm"

	assert_table_length NUM_EXT_TOHOMON
