MACRO size_nybble
	DEF size_value = (\1) | (size_value << 4)
	DEF list_index += 1
	if list_index % 2 == 0
		db size_value
		DEF size_value = 0
	endc
ENDM

; Terrible hack because we can't read files into strings (yet!)
	pushc
	setcharmap main ; ASCII
	assert "U" == $55 && "f" == $66 && "w" == $77
	DEF U EQUS " size_nybble 5"
	DEF f EQUS " size_nybble 6"
	DEF w EQUS " size_nybble 7"
	popc

PokemonPicSizes::
	list_start PokemonPicSizes
	DEF size_value = 0
INCLUDE "gfx/pokemon/creimu/front.dimensions"
INCLUDE "gfx/pokemon/reimu/front.dimensions"
INCLUDE "gfx/pokemon/ereimu/front.dimensions"
INCLUDE "gfx/pokemon/charmander/front.dimensions"
INCLUDE "gfx/pokemon/charmeleon/front.dimensions"
INCLUDE "gfx/pokemon/charizard/front.dimensions"
INCLUDE "gfx/pokemon/squirtle/front.dimensions"
INCLUDE "gfx/pokemon/wartortle/front.dimensions"
INCLUDE "gfx/pokemon/blastoise/front.dimensions"
INCLUDE "gfx/pokemon/caterpie/front.dimensions"
INCLUDE "gfx/pokemon/metapod/front.dimensions"
INCLUDE "gfx/pokemon/butterfree/front.dimensions"
INCLUDE "gfx/pokemon/weedle/front.dimensions"
INCLUDE "gfx/pokemon/kakuna/front.dimensions"
INCLUDE "gfx/pokemon/beedrill/front.dimensions"
INCLUDE "gfx/pokemon/pidgey/front.dimensions"
INCLUDE "gfx/pokemon/pidgeotto/front.dimensions"
INCLUDE "gfx/pokemon/pidgeot/front.dimensions"
INCLUDE "gfx/pokemon/rattata_plain/front.dimensions"
INCLUDE "gfx/pokemon/raticate_plain/front.dimensions"
INCLUDE "gfx/pokemon/spearow/front.dimensions"
INCLUDE "gfx/pokemon/fearow/front.dimensions"
INCLUDE "gfx/pokemon/ekans/front.dimensions"
INCLUDE "gfx/pokemon/arbok_johto/front.dimensions"
INCLUDE "gfx/pokemon/pikachu_plain/front.dimensions"
INCLUDE "gfx/pokemon/raichu_plain/front.dimensions"
INCLUDE "gfx/pokemon/sandshrew_plain/front.dimensions"
INCLUDE "gfx/pokemon/sandslash_plain/front.dimensions"
INCLUDE "gfx/pokemon/nidoran_f/front.dimensions"
INCLUDE "gfx/pokemon/nidorina/front.dimensions"
INCLUDE "gfx/pokemon/nidoqueen/front.dimensions"
INCLUDE "gfx/pokemon/nidoran_m/front.dimensions"
INCLUDE "gfx/pokemon/nidorino/front.dimensions"
INCLUDE "gfx/pokemon/nidoking/front.dimensions"
INCLUDE "gfx/pokemon/clefairy/front.dimensions"
INCLUDE "gfx/pokemon/clefable/front.dimensions"
INCLUDE "gfx/pokemon/vulpix_plain/front.dimensions"
INCLUDE "gfx/pokemon/ninetales_plain/front.dimensions"
INCLUDE "gfx/pokemon/jigglypuff/front.dimensions"
INCLUDE "gfx/pokemon/wigglytuff/front.dimensions"
INCLUDE "gfx/pokemon/zubat/front.dimensions"
INCLUDE "gfx/pokemon/golbat/front.dimensions"
INCLUDE "gfx/pokemon/oddish/front.dimensions"
INCLUDE "gfx/pokemon/gloom/front.dimensions"
INCLUDE "gfx/pokemon/vileplume/front.dimensions"
INCLUDE "gfx/pokemon/paras/front.dimensions"
INCLUDE "gfx/pokemon/parasect/front.dimensions"
INCLUDE "gfx/pokemon/venonat/front.dimensions"
INCLUDE "gfx/pokemon/venomoth/front.dimensions"
INCLUDE "gfx/pokemon/diglett_plain/front.dimensions"
INCLUDE "gfx/pokemon/dugtrio_plain/front.dimensions"
INCLUDE "gfx/pokemon/meowth_plain/front.dimensions"
INCLUDE "gfx/pokemon/persian_plain/front.dimensions"
INCLUDE "gfx/pokemon/psyduck/front.dimensions"
INCLUDE "gfx/pokemon/golduck/front.dimensions"
INCLUDE "gfx/pokemon/mankey/front.dimensions"
INCLUDE "gfx/pokemon/primeape/front.dimensions"
INCLUDE "gfx/pokemon/growlithe_plain/front.dimensions"
INCLUDE "gfx/pokemon/arcanine_plain/front.dimensions"
INCLUDE "gfx/pokemon/poliwag/front.dimensions"
INCLUDE "gfx/pokemon/poliwhirl/front.dimensions"
INCLUDE "gfx/pokemon/poliwrath/front.dimensions"
INCLUDE "gfx/pokemon/abra/front.dimensions"
INCLUDE "gfx/pokemon/kadabra/front.dimensions"
INCLUDE "gfx/pokemon/alakazam/front.dimensions"
INCLUDE "gfx/pokemon/machop/front.dimensions"
INCLUDE "gfx/pokemon/machoke/front.dimensions"
INCLUDE "gfx/pokemon/machamp/front.dimensions"
INCLUDE "gfx/pokemon/bellsprout/front.dimensions"
INCLUDE "gfx/pokemon/weepinbell/front.dimensions"
INCLUDE "gfx/pokemon/victreebel/front.dimensions"
INCLUDE "gfx/pokemon/tentacool/front.dimensions"
INCLUDE "gfx/pokemon/tentacruel/front.dimensions"
INCLUDE "gfx/pokemon/geodude_plain/front.dimensions"
INCLUDE "gfx/pokemon/graveler_plain/front.dimensions"
INCLUDE "gfx/pokemon/golem_plain/front.dimensions"
INCLUDE "gfx/pokemon/ponyta_plain/front.dimensions"
INCLUDE "gfx/pokemon/rapidash_plain/front.dimensions"
INCLUDE "gfx/pokemon/slowpoke_plain/front.dimensions"
INCLUDE "gfx/pokemon/slowbro_plain/front.dimensions"
INCLUDE "gfx/pokemon/magnemite/front.dimensions"
INCLUDE "gfx/pokemon/magneton/front.dimensions"
INCLUDE "gfx/pokemon/farfetch_d_plain/front.dimensions"
INCLUDE "gfx/pokemon/doduo/front.dimensions"
INCLUDE "gfx/pokemon/dodrio/front.dimensions"
INCLUDE "gfx/pokemon/seel/front.dimensions"
INCLUDE "gfx/pokemon/dewgong/front.dimensions"
INCLUDE "gfx/pokemon/grimer_plain/front.dimensions"
INCLUDE "gfx/pokemon/muk_plain/front.dimensions"
INCLUDE "gfx/pokemon/shellder/front.dimensions"
INCLUDE "gfx/pokemon/cloyster/front.dimensions"
INCLUDE "gfx/pokemon/gastly/front.dimensions"
INCLUDE "gfx/pokemon/haunter/front.dimensions"
INCLUDE "gfx/pokemon/gengar/front.dimensions"
INCLUDE "gfx/pokemon/onix/front.dimensions"
INCLUDE "gfx/pokemon/drowzee/front.dimensions"
INCLUDE "gfx/pokemon/hypno/front.dimensions"
INCLUDE "gfx/pokemon/krabby/front.dimensions"
INCLUDE "gfx/pokemon/kingler/front.dimensions"
INCLUDE "gfx/pokemon/voltorb_plain/front.dimensions"
INCLUDE "gfx/pokemon/electrode_plain/front.dimensions"
INCLUDE "gfx/pokemon/exeggcute/front.dimensions"
INCLUDE "gfx/pokemon/exeggutor_plain/front.dimensions"
INCLUDE "gfx/pokemon/cubone/front.dimensions"
INCLUDE "gfx/pokemon/marowak_plain/front.dimensions"
INCLUDE "gfx/pokemon/hitmonlee/front.dimensions"
INCLUDE "gfx/pokemon/hitmonchan/front.dimensions"
INCLUDE "gfx/pokemon/lickitung/front.dimensions"
INCLUDE "gfx/pokemon/koffing/front.dimensions"
INCLUDE "gfx/pokemon/weezing_plain/front.dimensions"
INCLUDE "gfx/pokemon/rhyhorn/front.dimensions"
INCLUDE "gfx/pokemon/rhydon/front.dimensions"
INCLUDE "gfx/pokemon/chansey/front.dimensions"
INCLUDE "gfx/pokemon/tangela/front.dimensions"
INCLUDE "gfx/pokemon/kangaskhan/front.dimensions"
INCLUDE "gfx/pokemon/horsea/front.dimensions"
INCLUDE "gfx/pokemon/seadra/front.dimensions"
INCLUDE "gfx/pokemon/goldeen/front.dimensions"
INCLUDE "gfx/pokemon/seaking/front.dimensions"
INCLUDE "gfx/pokemon/staryu/front.dimensions"
INCLUDE "gfx/pokemon/starmie/front.dimensions"
INCLUDE "gfx/pokemon/mr__mime_plain/front.dimensions"
INCLUDE "gfx/pokemon/scyther/front.dimensions"
INCLUDE "gfx/pokemon/jynx/front.dimensions"
INCLUDE "gfx/pokemon/electabuzz/front.dimensions"
INCLUDE "gfx/pokemon/magmar/front.dimensions"
INCLUDE "gfx/pokemon/pinsir/front.dimensions"
INCLUDE "gfx/pokemon/tauros_plain/front.dimensions"
INCLUDE "gfx/pokemon/magikarp_plain/front.dimensions"
INCLUDE "gfx/pokemon/gyarados_plain/front.dimensions"
INCLUDE "gfx/pokemon/lapras/front.dimensions"
INCLUDE "gfx/pokemon/ditto/front.dimensions"
INCLUDE "gfx/pokemon/eevee/front.dimensions"
INCLUDE "gfx/pokemon/vaporeon/front.dimensions"
INCLUDE "gfx/pokemon/jolteon/front.dimensions"
INCLUDE "gfx/pokemon/flareon/front.dimensions"
INCLUDE "gfx/pokemon/porygon/front.dimensions"
INCLUDE "gfx/pokemon/omanyte/front.dimensions"
INCLUDE "gfx/pokemon/omastar/front.dimensions"
INCLUDE "gfx/pokemon/kabuto/front.dimensions"
INCLUDE "gfx/pokemon/kabutops/front.dimensions"
INCLUDE "gfx/pokemon/aerodactyl/front.dimensions"
INCLUDE "gfx/pokemon/snorlax/front.dimensions"
INCLUDE "gfx/pokemon/articuno_plain/front.dimensions"
INCLUDE "gfx/pokemon/zapdos_plain/front.dimensions"
INCLUDE "gfx/pokemon/moltres_plain/front.dimensions"
INCLUDE "gfx/pokemon/dratini/front.dimensions"
INCLUDE "gfx/pokemon/dragonair/front.dimensions"
INCLUDE "gfx/pokemon/dragonite/front.dimensions"
INCLUDE "gfx/pokemon/mewtwo_plain/front.dimensions"
INCLUDE "gfx/pokemon/mew/front.dimensions"
INCLUDE "gfx/pokemon/chikorita/front.dimensions"
INCLUDE "gfx/pokemon/bayleef/front.dimensions"
INCLUDE "gfx/pokemon/meganium/front.dimensions"
INCLUDE "gfx/pokemon/cyndaquil/front.dimensions"
INCLUDE "gfx/pokemon/quilava/front.dimensions"
INCLUDE "gfx/pokemon/typhlosion_plain/front.dimensions"
INCLUDE "gfx/pokemon/totodile/front.dimensions"
INCLUDE "gfx/pokemon/croconaw/front.dimensions"
INCLUDE "gfx/pokemon/feraligatr/front.dimensions"
INCLUDE "gfx/pokemon/sentret/front.dimensions"
INCLUDE "gfx/pokemon/furret/front.dimensions"
INCLUDE "gfx/pokemon/hoothoot/front.dimensions"
INCLUDE "gfx/pokemon/noctowl/front.dimensions"
INCLUDE "gfx/pokemon/ledyba/front.dimensions"
INCLUDE "gfx/pokemon/ledian/front.dimensions"
INCLUDE "gfx/pokemon/spinarak/front.dimensions"
INCLUDE "gfx/pokemon/ariados/front.dimensions"
INCLUDE "gfx/pokemon/crobat/front.dimensions"
INCLUDE "gfx/pokemon/chinchou/front.dimensions"
INCLUDE "gfx/pokemon/lanturn/front.dimensions"
INCLUDE "gfx/pokemon/pichu_plain/front.dimensions"
INCLUDE "gfx/pokemon/cleffa/front.dimensions"
INCLUDE "gfx/pokemon/igglybuff/front.dimensions"
INCLUDE "gfx/pokemon/togepi/front.dimensions"
INCLUDE "gfx/pokemon/togetic/front.dimensions"
INCLUDE "gfx/pokemon/natu/front.dimensions"
INCLUDE "gfx/pokemon/xatu/front.dimensions"
INCLUDE "gfx/pokemon/mareep/front.dimensions"
INCLUDE "gfx/pokemon/flaaffy/front.dimensions"
INCLUDE "gfx/pokemon/ampharos/front.dimensions"
INCLUDE "gfx/pokemon/bellossom/front.dimensions"
INCLUDE "gfx/pokemon/marill/front.dimensions"
INCLUDE "gfx/pokemon/azumarill/front.dimensions"
INCLUDE "gfx/pokemon/sudowoodo/front.dimensions"
INCLUDE "gfx/pokemon/politoed/front.dimensions"
INCLUDE "gfx/pokemon/hoppip/front.dimensions"
INCLUDE "gfx/pokemon/skiploom/front.dimensions"
INCLUDE "gfx/pokemon/jumpluff/front.dimensions"
INCLUDE "gfx/pokemon/aipom/front.dimensions"
INCLUDE "gfx/pokemon/sunkern/front.dimensions"
INCLUDE "gfx/pokemon/sunflora/front.dimensions"
INCLUDE "gfx/pokemon/yanma/front.dimensions"
INCLUDE "gfx/pokemon/wooper_plain/front.dimensions"
INCLUDE "gfx/pokemon/quagsire/front.dimensions"
INCLUDE "gfx/pokemon/espeon/front.dimensions"
INCLUDE "gfx/pokemon/umbreon/front.dimensions"
INCLUDE "gfx/pokemon/murkrow/front.dimensions"
INCLUDE "gfx/pokemon/slowking_plain/front.dimensions"
INCLUDE "gfx/pokemon/misdreavus/front.dimensions"
INCLUDE "gfx/pokemon/unown_a/front.dimensions"
INCLUDE "gfx/pokemon/wobbuffet/front.dimensions"
INCLUDE "gfx/pokemon/girafarig/front.dimensions"
INCLUDE "gfx/pokemon/pineco/front.dimensions"
INCLUDE "gfx/pokemon/forretress/front.dimensions"
INCLUDE "gfx/pokemon/dunsparce/front.dimensions"
INCLUDE "gfx/pokemon/gligar/front.dimensions"
INCLUDE "gfx/pokemon/steelix/front.dimensions"
INCLUDE "gfx/pokemon/snubbull/front.dimensions"
INCLUDE "gfx/pokemon/granbull/front.dimensions"
INCLUDE "gfx/pokemon/qwilfish_plain/front.dimensions"
INCLUDE "gfx/pokemon/scizor/front.dimensions"
INCLUDE "gfx/pokemon/shuckle/front.dimensions"
INCLUDE "gfx/pokemon/heracross/front.dimensions"
INCLUDE "gfx/pokemon/sneasel_plain/front.dimensions"
INCLUDE "gfx/pokemon/teddiursa/front.dimensions"
INCLUDE "gfx/pokemon/ursaring/front.dimensions"
INCLUDE "gfx/pokemon/slugma/front.dimensions"
INCLUDE "gfx/pokemon/magcargo/front.dimensions"
INCLUDE "gfx/pokemon/swinub/front.dimensions"
INCLUDE "gfx/pokemon/piloswine/front.dimensions"
INCLUDE "gfx/pokemon/corsola_plain/front.dimensions"
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
INCLUDE "gfx/pokemon/porygon2/front.dimensions"
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
INCLUDE "gfx/pokemon/gliscor/front.dimensions"
INCLUDE "gfx/pokemon/mamoswine/front.dimensions"
INCLUDE "gfx/pokemon/porygon_z/front.dimensions"
INCLUDE "gfx/pokemon/sylveon/front.dimensions"
INCLUDE "gfx/pokemon/perrserker/front.dimensions"
INCLUDE "gfx/pokemon/cursola/front.dimensions"
INCLUDE "gfx/pokemon/sirfetch_d/front.dimensions"
INCLUDE "gfx/pokemon/mr__rime/front.dimensions"
INCLUDE "gfx/pokemon/wyrdeer/front.dimensions"
INCLUDE "gfx/pokemon/kleavor/front.dimensions"
INCLUDE "gfx/pokemon/ursaluna/front.dimensions"
INCLUDE "gfx/pokemon/sneasler/front.dimensions"
INCLUDE "gfx/pokemon/overqwil/front.dimensions"
INCLUDE "gfx/pokemon/dudunsparce_two_segment/front.dimensions"
INCLUDE "gfx/pokemon/farigiraf/front.dimensions"
INCLUDE "gfx/pokemon/clodsire/front.dimensions"
INCLUDE "gfx/pokemon/annihilape/front.dimensions"
	assert_list_length NUM_SPECIES

INCLUDE "gfx/pokemon/unown_b/front.dimensions"
INCLUDE "gfx/pokemon/unown_c/front.dimensions"
INCLUDE "gfx/pokemon/unown_d/front.dimensions"
INCLUDE "gfx/pokemon/unown_e/front.dimensions"
INCLUDE "gfx/pokemon/unown_f/front.dimensions"
INCLUDE "gfx/pokemon/unown_g/front.dimensions"
INCLUDE "gfx/pokemon/unown_h/front.dimensions"
INCLUDE "gfx/pokemon/unown_i/front.dimensions"
INCLUDE "gfx/pokemon/unown_j/front.dimensions"
INCLUDE "gfx/pokemon/unown_k/front.dimensions"
INCLUDE "gfx/pokemon/unown_l/front.dimensions"
INCLUDE "gfx/pokemon/unown_m/front.dimensions"
INCLUDE "gfx/pokemon/unown_n/front.dimensions"
INCLUDE "gfx/pokemon/unown_o/front.dimensions"
INCLUDE "gfx/pokemon/unown_p/front.dimensions"
INCLUDE "gfx/pokemon/unown_q/front.dimensions"
INCLUDE "gfx/pokemon/unown_r/front.dimensions"
INCLUDE "gfx/pokemon/unown_s/front.dimensions"
INCLUDE "gfx/pokemon/unown_t/front.dimensions"
INCLUDE "gfx/pokemon/unown_u/front.dimensions"
INCLUDE "gfx/pokemon/unown_v/front.dimensions"
INCLUDE "gfx/pokemon/unown_w/front.dimensions"
INCLUDE "gfx/pokemon/unown_x/front.dimensions"
INCLUDE "gfx/pokemon/unown_y/front.dimensions"
INCLUDE "gfx/pokemon/unown_z/front.dimensions"
INCLUDE "gfx/pokemon/unown_exclamation/front.dimensions"
INCLUDE "gfx/pokemon/unown_question/front.dimensions"

INCLUDE "gfx/pokemon/arbok_kanto/front.dimensions"
INCLUDE "gfx/pokemon/arbok_koga/front.dimensions"
INCLUDE "gfx/pokemon/arbok_agatha/front.dimensions"
INCLUDE "gfx/pokemon/arbok_ariana/front.dimensions"

INCLUDE "gfx/pokemon/pikachu_fly/front.dimensions"
INCLUDE "gfx/pokemon/pikachu_surf/front.dimensions"
INCLUDE "gfx/pokemon/pikachu_pika/front.dimensions"
INCLUDE "gfx/pokemon/pikachu_chuchu/front.dimensions"
INCLUDE "gfx/pokemon/pikachu_spark/front.dimensions"

INCLUDE "gfx/pokemon/pichu_spiky/front.dimensions"

INCLUDE "gfx/pokemon/magikarp_skelly/front.dimensions"
INCLUDE "gfx/pokemon/magikarp_calico1/front.dimensions"
INCLUDE "gfx/pokemon/magikarp_calico2/front.dimensions"
INCLUDE "gfx/pokemon/magikarp_calico3/front.dimensions"
INCLUDE "gfx/pokemon/magikarp_twotone/front.dimensions"
INCLUDE "gfx/pokemon/magikarp_orca/front.dimensions"
INCLUDE "gfx/pokemon/magikarp_dapples/front.dimensions"
INCLUDE "gfx/pokemon/magikarp_tiger/front.dimensions"
INCLUDE "gfx/pokemon/magikarp_zebra/front.dimensions"
INCLUDE "gfx/pokemon/magikarp_stripe/front.dimensions"
INCLUDE "gfx/pokemon/magikarp_bubbles/front.dimensions"
INCLUDE "gfx/pokemon/magikarp_diamonds/front.dimensions"
INCLUDE "gfx/pokemon/magikarp_patches/front.dimensions"
INCLUDE "gfx/pokemon/magikarp_forehead1/front.dimensions"
INCLUDE "gfx/pokemon/magikarp_mask1/front.dimensions"
INCLUDE "gfx/pokemon/magikarp_forehead2/front.dimensions"
INCLUDE "gfx/pokemon/magikarp_mask2/front.dimensions"
INCLUDE "gfx/pokemon/magikarp_saucy/front.dimensions"
INCLUDE "gfx/pokemon/magikarp_raindrop/front.dimensions"

	assert_list_length NUM_SPECIES + NUM_COSMETIC_FORMS

INCLUDE "gfx/pokemon/gyarados_red/front.dimensions"

INCLUDE "gfx/pokemon/mewtwo_armored/front.dimensions"

INCLUDE "gfx/pokemon/dudunsparce_three_segment/front.dimensions"

INCLUDE "gfx/pokemon/rattata_alolan/front.dimensions"
INCLUDE "gfx/pokemon/raticate_alolan/front.dimensions"
INCLUDE "gfx/pokemon/raichu_alolan/front.dimensions"
INCLUDE "gfx/pokemon/sandshrew_alolan/front.dimensions"
INCLUDE "gfx/pokemon/sandslash_alolan/front.dimensions"
INCLUDE "gfx/pokemon/vulpix_alolan/front.dimensions"
INCLUDE "gfx/pokemon/ninetales_alolan/front.dimensions"
INCLUDE "gfx/pokemon/diglett_alolan/front.dimensions"
INCLUDE "gfx/pokemon/dugtrio_alolan/front.dimensions"
INCLUDE "gfx/pokemon/meowth_alolan/front.dimensions"
INCLUDE "gfx/pokemon/persian_alolan/front.dimensions"
INCLUDE "gfx/pokemon/geodude_alolan/front.dimensions"
INCLUDE "gfx/pokemon/graveler_alolan/front.dimensions"
INCLUDE "gfx/pokemon/golem_alolan/front.dimensions"
INCLUDE "gfx/pokemon/grimer_alolan/front.dimensions"
INCLUDE "gfx/pokemon/muk_alolan/front.dimensions"
INCLUDE "gfx/pokemon/exeggutor_alolan/front.dimensions"
INCLUDE "gfx/pokemon/marowak_alolan/front.dimensions"

INCLUDE "gfx/pokemon/meowth_galarian/front.dimensions"
INCLUDE "gfx/pokemon/ponyta_galarian/front.dimensions"
INCLUDE "gfx/pokemon/rapidash_galarian/front.dimensions"
INCLUDE "gfx/pokemon/slowpoke_galarian/front.dimensions"
INCLUDE "gfx/pokemon/slowbro_galarian/front.dimensions"
INCLUDE "gfx/pokemon/farfetch_d_galarian/front.dimensions"
INCLUDE "gfx/pokemon/weezing_galarian/front.dimensions"
INCLUDE "gfx/pokemon/mr__mime_galarian/front.dimensions"
INCLUDE "gfx/pokemon/articuno_galarian/front.dimensions"
INCLUDE "gfx/pokemon/zapdos_galarian/front.dimensions"
INCLUDE "gfx/pokemon/moltres_galarian/front.dimensions"
INCLUDE "gfx/pokemon/slowking_galarian/front.dimensions"
INCLUDE "gfx/pokemon/corsola_galarian/front.dimensions"

INCLUDE "gfx/pokemon/growlithe_hisuian/front.dimensions"
INCLUDE "gfx/pokemon/arcanine_hisuian/front.dimensions"
INCLUDE "gfx/pokemon/voltorb_hisuian/front.dimensions"
INCLUDE "gfx/pokemon/electrode_hisuian/front.dimensions"
INCLUDE "gfx/pokemon/typhlosion_hisuian/front.dimensions"
INCLUDE "gfx/pokemon/qwilfish_hisuian/front.dimensions"
INCLUDE "gfx/pokemon/sneasel_hisuian/front.dimensions"

INCLUDE "gfx/pokemon/wooper_paldean/front.dimensions"
INCLUDE "gfx/pokemon/tauros_paldean/front.dimensions"
INCLUDE "gfx/pokemon/tauros_paldean_fire/front.dimensions"
INCLUDE "gfx/pokemon/tauros_paldean_water/front.dimensions"

	if list_index % 2
		db size_value << 4
	endc
	assert_list_length NUM_UNIQUE_POKEMON

PURGE U, f, w
