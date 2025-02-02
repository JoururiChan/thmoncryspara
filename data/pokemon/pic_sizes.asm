MACRO size_nybble
	DEF size_value = (\1) | (size_value << 4)
	DEF list_index += 1
	if list_index % 2 == 0
		db size_value
		DEF size_value = 0
	endc
ENDM

; Terrible hack because we can't read files into strings (yet!)
	pushc main ; ASCII
	assert "U" == $55 && "f" == $66 && "w" == $77
	DEF U EQUS " size_nybble 5"
	DEF f EQUS " size_nybble 6"
	DEF w EQUS " size_nybble 7"
	popc

PokemonPicSizes::
	list_start
	DEF size_value = 0
INCLUDE "gfx/pokemon/creimu/front.dimensions"
INCLUDE "gfx/pokemon/reimu/front.dimensions"
INCLUDE "gfx/pokemon/treimu/front.dimensions"
INCLUDE "gfx/pokemon/cmarisa/front.dimensions"
INCLUDE "gfx/pokemon/marisa/front.dimensions"
INCLUDE "gfx/pokemon/amarisa/front.dimensions"
INCLUDE "gfx/pokemon/csakuya/front.dimensions"
INCLUDE "gfx/pokemon/sakuya/front.dimensions"
INCLUDE "gfx/pokemon/hsakuya/front.dimensions"
INCLUDE "gfx/pokemon/cgyoku/front.dimensions"
INCLUDE "gfx/pokemon/mgyoku/front.dimensions"
INCLUDE "gfx/pokemon/fgyoku/front.dimensions"
INCLUDE "gfx/pokemon/ogyoku/front.dimensions"
INCLUDE "gfx/pokemon/cmagan/front.dimensions"
INCLUDE "gfx/pokemon/magan/front.dimensions"
INCLUDE "gfx/pokemon/cmima/front.dimensions"
INCLUDE "gfx/pokemon/mima/front.dimensions"
INCLUDE "gfx/pokemon/celis/front.dimensions"
INCLUDE "gfx/pokemon/elis/front.dimensions"
INCLUDE "gfx/pokemon/ckikuri/front.dimensions"
INCLUDE "gfx/pokemon/kikuri_johto/front.dimensions"
INCLUDE "gfx/pokemon/csariel/front.dimensions"
INCLUDE "gfx/pokemon/sariel/front.dimensions"
INCLUDE "gfx/pokemon/ckongara/front.dimensions"
INCLUDE "gfx/pokemon/kongara/front.dimensions"
INCLUDE "gfx/pokemon/crika/front.dimensions"
INCLUDE "gfx/pokemon/rika/front.dimensions"
INCLUDE "gfx/pokemon/arika/front.dimensions"
INCLUDE "gfx/pokemon/cmeira/front.dimensions"
INCLUDE "gfx/pokemon/meira/front.dimensions"
INCLUDE "gfx/pokemon/cellen/front.dimensions"
INCLUDE "gfx/pokemon/ellen/front.dimensions"
INCLUDE "gfx/pokemon/ckotohime/front.dimensions"
INCLUDE "gfx/pokemon/kotohime/front.dimensions"
INCLUDE "gfx/pokemon/ckana/front.dimensions"
INCLUDE "gfx/pokemon/kana/front.dimensions"
INCLUDE "gfx/pokemon/crikako/front.dimensions"
INCLUDE "gfx/pokemon/rikako/front.dimensions"
INCLUDE "gfx/pokemon/cchiyuri/front.dimensions"
INCLUDE "gfx/pokemon/chiyuri/front.dimensions"
INCLUDE "gfx/pokemon/cyumemi/front.dimensions"
INCLUDE "gfx/pokemon/yumemi/front.dimensions"
INCLUDE "gfx/pokemon/corange/front.dimensions"
INCLUDE "gfx/pokemon/orange/front.dimensions"
INCLUDE "gfx/pokemon/ckurumi/front.dimensions"
INCLUDE "gfx/pokemon/kurumi/front.dimensions"
INCLUDE "gfx/pokemon/celly/front.dimensions"
INCLUDE "gfx/pokemon/elly/front.dimensions"
INCLUDE "gfx/pokemon/cyuka/front.dimensions"
INCLUDE "gfx/pokemon/yuka/front.dimensions"
INCLUDE "gfx/pokemon/ayuka/front.dimensions"
INCLUDE "gfx/pokemon/cmugetsu/front.dimensions"
INCLUDE "gfx/pokemon/mugetsu/front.dimensions"
INCLUDE "gfx/pokemon/cgengetsu/front.dimensions"
INCLUDE "gfx/pokemon/gengetsu/front.dimensions"
INCLUDE "gfx/pokemon/csara/front.dimensions"
INCLUDE "gfx/pokemon/sara/front.dimensions"
INCLUDE "gfx/pokemon/cluize/front.dimensions"
INCLUDE "gfx/pokemon/luize/front.dimensions"
INCLUDE "gfx/pokemon/dluize/front.dimensions"
INCLUDE "gfx/pokemon/calice/front.dimensions"
INCLUDE "gfx/pokemon/alice/front.dimensions"
INCLUDE "gfx/pokemon/aalice/front.dimensions"
INCLUDE "gfx/pokemon/cmai/front.dimensions"
INCLUDE "gfx/pokemon/mai/front.dimensions"
INCLUDE "gfx/pokemon/cyuki/front.dimensions"
INCLUDE "gfx/pokemon/yuki/front.dimensions"
INCLUDE "gfx/pokemon/cyumeko/front.dimensions"
INCLUDE "gfx/pokemon/yumeko/front.dimensions"
INCLUDE "gfx/pokemon/cshinki/front.dimensions"
INCLUDE "gfx/pokemon/shinki/front.dimensions"
INCLUDE "gfx/pokemon/crumia/front.dimensions"
INCLUDE "gfx/pokemon/rumia/front.dimensions"
INCLUDE "gfx/pokemon/arumia/front.dimensions"
INCLUDE "gfx/pokemon/cdaichan/front.dimensions"
INCLUDE "gfx/pokemon/daichan/front.dimensions"
INCLUDE "gfx/pokemon/ddaichan/front.dimensions"
INCLUDE "gfx/pokemon/ccirno/front.dimensions"
INCLUDE "gfx/pokemon/cirno/front.dimensions"
INCLUDE "gfx/pokemon/scirno/front.dimensions"
INCLUDE "gfx/pokemon/cmeiling/front.dimensions"
INCLUDE "gfx/pokemon/meiling/front.dimensions"
INCLUDE "gfx/pokemon/ameiling/front.dimensions"
INCLUDE "gfx/pokemon/ckoakuma/front.dimensions"
INCLUDE "gfx/pokemon/koakuma/front.dimensions"
INCLUDE "gfx/pokemon/hkoakuma/front.dimensions"
INCLUDE "gfx/pokemon/cpatchouli/front.dimensions"
INCLUDE "gfx/pokemon/patchouli/front.dimensions"
INCLUDE "gfx/pokemon/tpatchouli/front.dimensions"
INCLUDE "gfx/pokemon/cremilia/front.dimensions"
INCLUDE "gfx/pokemon/remilia/front.dimensions"
INCLUDE "gfx/pokemon/sremilia/front.dimensions"
INCLUDE "gfx/pokemon/cflandre/front.dimensions"
INCLUDE "gfx/pokemon/flandre/front.dimensions"
INCLUDE "gfx/pokemon/aflandre/front.dimensions"
INCLUDE "gfx/pokemon/cletty/front.dimensions"
INCLUDE "gfx/pokemon/letty/front.dimensions"
INCLUDE "gfx/pokemon/dletty/front.dimensions"
INCLUDE "gfx/pokemon/cchen/front.dimensions"
INCLUDE "gfx/pokemon/chen/front.dimensions"
INCLUDE "gfx/pokemon/hchen/front.dimensions"
INCLUDE "gfx/pokemon/clilywhite/front.dimensions"
INCLUDE "gfx/pokemon/lilywhite/front.dimensions"
INCLUDE "gfx/pokemon/dlilywhite/front.dimensions"
INCLUDE "gfx/pokemon/clilyblack/front.dimensions"
INCLUDE "gfx/pokemon/lilyblack/front.dimensions"
INCLUDE "gfx/pokemon/slilyblack/front.dimensions"
INCLUDE "gfx/pokemon/clyrica/front.dimensions"
INCLUDE "gfx/pokemon/lyrica/front.dimensions"
INCLUDE "gfx/pokemon/tlyrica/front.dimensions"
INCLUDE "gfx/pokemon/cmerlin/front.dimensions"
INCLUDE "gfx/pokemon/merlin/front.dimensions"
INCLUDE "gfx/pokemon/smerlin/front.dimensions"
INCLUDE "gfx/pokemon/clunasa/front.dimensions"
INCLUDE "gfx/pokemon/lunasa/front.dimensions"
INCLUDE "gfx/pokemon/alunasa/front.dimensions"
INCLUDE "gfx/pokemon/cyuyuko/front.dimensions"
INCLUDE "gfx/pokemon/yuyuko/front.dimensions"
INCLUDE "gfx/pokemon/ayuyuko/front.dimensions"
INCLUDE "gfx/pokemon/cran/front.dimensions"
INCLUDE "gfx/pokemon/ran/front.dimensions"
INCLUDE "gfx/pokemon/tran/front.dimensions"
INCLUDE "gfx/pokemon/cyukari/front.dimensions"
INCLUDE "gfx/pokemon/yukari/front.dimensions"
INCLUDE "gfx/pokemon/tyukari/front.dimensions"
INCLUDE "gfx/pokemon/csuika/front.dimensions"
INCLUDE "gfx/pokemon/suika/front.dimensions"
INCLUDE "gfx/pokemon/tsuika/front.dimensions"
INCLUDE "gfx/pokemon/cyoumu/front.dimensions"
INCLUDE "gfx/pokemon/youmu/front.dimensions"
INCLUDE "gfx/pokemon/syoumu/front.dimensions"
INCLUDE "gfx/pokemon/creisen/front.dimensions"
INCLUDE "gfx/pokemon/reisen/front.dimensions"
INCLUDE "gfx/pokemon/treisen/front.dimensions"
INCLUDE "gfx/pokemon/csanae/front.dimensions"
INCLUDE "gfx/pokemon/sanae/front.dimensions"
INCLUDE "gfx/pokemon/dsanae/front.dimensions"
INCLUDE "gfx/pokemon/cwriggle/front.dimensions"
INCLUDE "gfx/pokemon/wriggle/front.dimensions"
INCLUDE "gfx/pokemon/swriggle/front.dimensions"
INCLUDE "gfx/pokemon/cmystia/front.dimensions"
INCLUDE "gfx/pokemon/mystia/front.dimensions"
INCLUDE "gfx/pokemon/tmystia/front.dimensions"
INCLUDE "gfx/pokemon/ckeine/front.dimensions"
INCLUDE "gfx/pokemon/keine/front.dimensions"
INCLUDE "gfx/pokemon/akeine/front.dimensions"
INCLUDE "gfx/pokemon/ctei/front.dimensions"
INCLUDE "gfx/pokemon/tei/front.dimensions"
INCLUDE "gfx/pokemon/ttei/front.dimensions"
INCLUDE "gfx/pokemon/ceirin/front.dimensions"
INCLUDE "gfx/pokemon/eirin/front.dimensions"
INCLUDE "gfx/pokemon/teirin/front.dimensions"
INCLUDE "gfx/pokemon/ckaguya/front.dimensions"
INCLUDE "gfx/pokemon/kaguya/front.dimensions"
INCLUDE "gfx/pokemon/tkaguya/front.dimensions"
INCLUDE "gfx/pokemon/cmokou/front.dimensions"
INCLUDE "gfx/pokemon/mokou/front.dimensions"
INCLUDE "gfx/pokemon/amokou/front.dimensions"
INCLUDE "gfx/pokemon/caya/front.dimensions"
INCLUDE "gfx/pokemon/aya/front.dimensions"
INCLUDE "gfx/pokemon/saya/front.dimensions"
INCLUDE "gfx/pokemon/cmedicine/front.dimensions"
INCLUDE "gfx/pokemon/medicine/front.dimensions"
INCLUDE "gfx/pokemon/amedicine/front.dimensions"
INCLUDE "gfx/pokemon/ckomachi/front.dimensions"
INCLUDE "gfx/pokemon/komachi/front.dimensions"
INCLUDE "gfx/pokemon/akomachi/front.dimensions"
INCLUDE "gfx/pokemon/ceiki/front.dimensions"
INCLUDE "gfx/pokemon/eiki/front.dimensions"
INCLUDE "gfx/pokemon/aeiki/front.dimensions"
INCLUDE "gfx/pokemon/cshizuha/front.dimensions"
INCLUDE "gfx/pokemon/shizuha/front.dimensions"
INCLUDE "gfx/pokemon/sshizuha/front.dimensions"
INCLUDE "gfx/pokemon/cminoriko/front.dimensions"
INCLUDE "gfx/pokemon/minoriko/front.dimensions"
INCLUDE "gfx/pokemon/hminoriko/front.dimensions"
INCLUDE "gfx/pokemon/china/front.dimensions"
INCLUDE "gfx/pokemon/hina_a/front.dimensions"
INCLUDE "gfx/pokemon/ahina/front.dimensions"
INCLUDE "gfx/pokemon/cnitori/front.dimensions"
INCLUDE "gfx/pokemon/nitori/front.dimensions"
INCLUDE "gfx/pokemon/anitori/front.dimensions"
INCLUDE "gfx/pokemon/cmomiji/front.dimensions"
INCLUDE "gfx/pokemon/momiji/front.dimensions"
INCLUDE "gfx/pokemon/ckanako/front.dimensions"
INCLUDE "gfx/pokemon/kanako/front.dimensions"
INCLUDE "gfx/pokemon/akanako/front.dimensions"
INCLUDE "gfx/pokemon/csuwako/front.dimensions"
INCLUDE "gfx/pokemon/suwako/front.dimensions"
INCLUDE "gfx/pokemon/dsuwako/front.dimensions"
INCLUDE "gfx/pokemon/ciku/front.dimensions"
INCLUDE "gfx/pokemon/iku/front.dimensions"
INCLUDE "gfx/pokemon/aiku/front.dimensions"
INCLUDE "gfx/pokemon/ctenshi/front.dimensions"
INCLUDE "gfx/pokemon/tenshi/front.dimensions"
INCLUDE "gfx/pokemon/stenshi/front.dimensions"
INCLUDE "gfx/pokemon/swinub/front.dimensions"
INCLUDE "gfx/pokemon/piloswine/front.dimensions"
INCLUDE "gfx/pokemon/corsola/front.dimensions"
INCLUDE "gfx/pokemon/remoraid/front.dimensions"
INCLUDE "gfx/pokemon/octillery/front.dimensions"
INCLUDE "gfx/pokemon/delibird/front.dimensions"
INCLUDE "gfx/pokemon/mantine/front.dimensions"
INCLUDE "gfx/pokemon/skarmory/front.dimensions"
INCLUDE "gfx/pokemon/houndour/front.dimensions"
INCLUDE "gfx/pokemon/houndoom/front.dimensions"
INCLUDE "gfx/pokemon/kingdra/front.dimensions"
INCLUDE "gfx/pokemon/phanpy/front.dimensions"
INCLUDE "gfx/pokemon/donphan/front.dimensions"
INCLUDE "gfx/pokemon/clunasa2/front.dimensions"
INCLUDE "gfx/pokemon/stantler/front.dimensions"
INCLUDE "gfx/pokemon/smeargle/front.dimensions"
INCLUDE "gfx/pokemon/tyrogue/front.dimensions"
INCLUDE "gfx/pokemon/hitmontop/front.dimensions"
INCLUDE "gfx/pokemon/smoochum/front.dimensions"
INCLUDE "gfx/pokemon/elekid/front.dimensions"
INCLUDE "gfx/pokemon/magby/front.dimensions"
INCLUDE "gfx/pokemon/miltank/front.dimensions"
INCLUDE "gfx/pokemon/blissey/front.dimensions"
INCLUDE "gfx/pokemon/raikou/front.dimensions"
INCLUDE "gfx/pokemon/entei/front.dimensions"
INCLUDE "gfx/pokemon/suicune/front.dimensions"
INCLUDE "gfx/pokemon/larvitar/front.dimensions"
INCLUDE "gfx/pokemon/pupitar/front.dimensions"
INCLUDE "gfx/pokemon/tyranitar/front.dimensions"
INCLUDE "gfx/pokemon/lugia/front.dimensions"
INCLUDE "gfx/pokemon/ho_oh/front.dimensions"
INCLUDE "gfx/pokemon/celebi/front.dimensions"
INCLUDE "gfx/pokemon/azurill/front.dimensions"
INCLUDE "gfx/pokemon/wynaut/front.dimensions"
INCLUDE "gfx/pokemon/ambipom/front.dimensions"
INCLUDE "gfx/pokemon/egg/front.dimensions"
INCLUDE "gfx/pokemon/egg/front.dimensions" ; $100
INCLUDE "gfx/pokemon/mismagius/front.dimensions"
INCLUDE "gfx/pokemon/honchkrow/front.dimensions"
INCLUDE "gfx/pokemon/bonsly/front.dimensions"
INCLUDE "gfx/pokemon/mime_jr_/front.dimensions"
INCLUDE "gfx/pokemon/happiny/front.dimensions"
INCLUDE "gfx/pokemon/munchlax/front.dimensions"
INCLUDE "gfx/pokemon/mantyke/front.dimensions"
INCLUDE "gfx/pokemon/weavile/front.dimensions"
INCLUDE "gfx/pokemon/magnezone/front.dimensions"
INCLUDE "gfx/pokemon/lickilicky/front.dimensions"
INCLUDE "gfx/pokemon/rhyperior/front.dimensions"
INCLUDE "gfx/pokemon/tangrowth/front.dimensions"
INCLUDE "gfx/pokemon/electivire/front.dimensions"
INCLUDE "gfx/pokemon/magmortar/front.dimensions"
INCLUDE "gfx/pokemon/togekiss/front.dimensions"
INCLUDE "gfx/pokemon/yanmega/front.dimensions"
INCLUDE "gfx/pokemon/leafeon/front.dimensions"
INCLUDE "gfx/pokemon/glaceon/front.dimensions"
INCLUDE "gfx/pokemon/amomiji/front.dimensions"
INCLUDE "gfx/pokemon/mamoswine/front.dimensions"
INCLUDE "gfx/pokemon/clunasa_z/front.dimensions"
INCLUDE "gfx/pokemon/sylveon/front.dimensions"
INCLUDE "gfx/pokemon/perrserker/front.dimensions"
INCLUDE "gfx/pokemon/cursola/front.dimensions"
INCLUDE "gfx/pokemon/sirfetch_d/front.dimensions"
INCLUDE "gfx/pokemon/mr__rime/front.dimensions"
INCLUDE "gfx/pokemon/wyrdeer/front.dimensions"
INCLUDE "gfx/pokemon/kleavor/front.dimensions"
INCLUDE "gfx/pokemon/ursaluna_plain/front.dimensions"
INCLUDE "gfx/pokemon/sneasler/front.dimensions"
INCLUDE "gfx/pokemon/overqwil/front.dimensions"
INCLUDE "gfx/pokemon/placethm_two_segment/front.dimensions"
INCLUDE "gfx/pokemon/farigiraf/front.dimensions"
INCLUDE "gfx/pokemon/clodsire/front.dimensions"
INCLUDE "gfx/pokemon/annihilape/front.dimensions"
	assert_list_length NUM_SPECIES

INCLUDE "gfx/pokemon/hina_b/front.dimensions"
INCLUDE "gfx/pokemon/hina_c/front.dimensions"
INCLUDE "gfx/pokemon/hina_d/front.dimensions"
INCLUDE "gfx/pokemon/hina_e/front.dimensions"
INCLUDE "gfx/pokemon/hina_f/front.dimensions"
INCLUDE "gfx/pokemon/hina_g/front.dimensions"
INCLUDE "gfx/pokemon/hina_h/front.dimensions"
INCLUDE "gfx/pokemon/hina_i/front.dimensions"
INCLUDE "gfx/pokemon/hina_j/front.dimensions"
INCLUDE "gfx/pokemon/hina_k/front.dimensions"
INCLUDE "gfx/pokemon/hina_l/front.dimensions"
INCLUDE "gfx/pokemon/hina_m/front.dimensions"
INCLUDE "gfx/pokemon/hina_n/front.dimensions"
INCLUDE "gfx/pokemon/hina_o/front.dimensions"
INCLUDE "gfx/pokemon/hina_p/front.dimensions"
INCLUDE "gfx/pokemon/hina_q/front.dimensions"
INCLUDE "gfx/pokemon/hina_r/front.dimensions"
INCLUDE "gfx/pokemon/hina_s/front.dimensions"
INCLUDE "gfx/pokemon/hina_t/front.dimensions"
INCLUDE "gfx/pokemon/hina_u/front.dimensions"
INCLUDE "gfx/pokemon/hina_v/front.dimensions"
INCLUDE "gfx/pokemon/hina_w/front.dimensions"
INCLUDE "gfx/pokemon/hina_x/front.dimensions"
INCLUDE "gfx/pokemon/hina_y/front.dimensions"
INCLUDE "gfx/pokemon/hina_z/front.dimensions"
INCLUDE "gfx/pokemon/hina_exclamation/front.dimensions"
INCLUDE "gfx/pokemon/hina_question/front.dimensions"

INCLUDE "gfx/pokemon/kikuri_kanto/front.dimensions"
INCLUDE "gfx/pokemon/kikuri_koga/front.dimensions"
INCLUDE "gfx/pokemon/kikuri_agatha/front.dimensions"
INCLUDE "gfx/pokemon/kikuri_ariana/front.dimensions"



INCLUDE "gfx/pokemon/ttei_spiky/front.dimensions"

INCLUDE "gfx/pokemon/lilyblack_skelly/front.dimensions"
INCLUDE "gfx/pokemon/lilyblack_calico1/front.dimensions"
INCLUDE "gfx/pokemon/lilyblack_calico2/front.dimensions"
INCLUDE "gfx/pokemon/lilyblack_calico3/front.dimensions"
INCLUDE "gfx/pokemon/lilyblack_twotone/front.dimensions"
INCLUDE "gfx/pokemon/lilyblack_orca/front.dimensions"
INCLUDE "gfx/pokemon/lilyblack_dapples/front.dimensions"
INCLUDE "gfx/pokemon/lilyblack_tiger/front.dimensions"
INCLUDE "gfx/pokemon/lilyblack_zebra/front.dimensions"
INCLUDE "gfx/pokemon/lilyblack_stripe/front.dimensions"
INCLUDE "gfx/pokemon/lilyblack_bubbles/front.dimensions"
INCLUDE "gfx/pokemon/lilyblack_diamonds/front.dimensions"
INCLUDE "gfx/pokemon/lilyblack_patches/front.dimensions"
INCLUDE "gfx/pokemon/lilyblack_forehead1/front.dimensions"
INCLUDE "gfx/pokemon/lilyblack_mask1/front.dimensions"
INCLUDE "gfx/pokemon/lilyblack_forehead2/front.dimensions"
INCLUDE "gfx/pokemon/lilyblack_mask2/front.dimensions"
INCLUDE "gfx/pokemon/lilyblack_saucy/front.dimensions"
INCLUDE "gfx/pokemon/lilyblack_raindrop/front.dimensions"

	assert_list_length NUM_SPECIES + NUM_COSMETIC_FORMS

INCLUDE "gfx/pokemon/slilyblack_red/front.dimensions"

INCLUDE "gfx/pokemon/suika_armored/front.dimensions"

INCLUDE "gfx/pokemon/placethm_three_segment/front.dimensions"

INCLUDE "gfx/pokemon/ursaluna_bloodmoon/front.dimensions"

	if list_index % 2
		db size_value << 4
	endc
	assert_list_length NUM_UNIQUE_POKEMON

PURGE U, f, w
