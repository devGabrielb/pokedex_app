import 'package:flutter/material.dart';
import 'package:pokedex_app/constants/app_consts.dart';
import 'package:pokedex_app/core/pokedex/controller/pokedex-controller.dart';
import 'package:pokedex_app/core/pokemon-details/models/pokemon-specie-v2.dart';
import 'package:pokedex_app/core/pokemon-details/widgets/tabs/about-widget.dart';
import 'package:pokedex_app/locator.dart';

import 'controllers/pokemon-details-controller.dart';

class PokemonDetailsPage extends StatefulWidget {
  @override
  _PokemonDetailsPageState createState() => _PokemonDetailsPageState();
}

class _PokemonDetailsPageState extends State<PokemonDetailsPage> {
  PokemonDetailsController _pokemonDetailsController;
  PokedexController _pokedexController;
  PageController _pageController;

  @override
  void initState() {
    super.initState();

    _pokemonDetailsController = locator.get<PokemonDetailsController>();
    _pokedexController = locator.get<PokedexController>();
    _pokemonDetailsController.getDetailsPokemon(
        _pokedexController.pokemonAtual.value.name.toLowerCase());
    _pokemonDetailsController.getSpeciePokemon(
        _pokedexController.pokemonAtual.value.name.toLowerCase());

    _pageController = PageController(
        initialPage: _pokedexController.pokemonAtual.value.id - 1);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: _pokedexController.pokemonAtual,
        builder: (context, value, child) {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomRight,
                colors: [
                  AppConsts.getColorType(
                          type: this
                              ._pokedexController
                              .pokemonAtual
                              .value
                              .type[0])
                      .withOpacity(0.7),
                  AppConsts.getColorType(
                      type: this._pokedexController.pokemonAtual.value.type[0])
                ],
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomRight,
                  colors: [
                    AppConsts.getColorType(
                            type: this
                                ._pokedexController
                                .pokemonAtual
                                .value
                                .type[0])
                        .withOpacity(0.7),
                    AppConsts.getColorType(
                        type:
                            this._pokedexController.pokemonAtual.value.type[0])
                  ],
                ),
              ),
              child: Scaffold(
                backgroundColor: AppConsts.getColorType(
                    type: this._pokedexController.pokemonAtual.value.type[0]),
                body: NestedScrollView(
                  headerSliverBuilder: (context, innerBoxIsScrolled) {
                    return <Widget>[
                      SliverAppBar(
                        elevation: 0,
                        backgroundColor: AppConsts.getColorType(
                            type: this
                                ._pokedexController
                                .pokemonAtual
                                .value
                                .type[0]),
                        leading: IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        actions: <Widget>[
                          IconButton(
                            icon: Icon(Icons.favorite_border_outlined),
                            onPressed: () {},
                          )
                        ],
                        expandedHeight: 200.0,
                        floating: true,
                        pinned: true,
                        flexibleSpace: FlexibleSpaceBar(
                            background: Container(
                          margin: EdgeInsets.only(top: 105),
                          padding: EdgeInsets.symmetric(horizontal: 25),
                          width: MediaQuery.of(context).size.width,
                          height: 75,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 75,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      this
                                          ._pokedexController
                                          .pokemonAtual
                                          .value
                                          .name,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 36,
                                          color: Colors.white),
                                    ),
                                    Row(
                                      children: List.generate(
                                          this
                                              ._pokedexController
                                              .pokemonAtual
                                              .value
                                              .type
                                              .length, (index) {
                                        return Container(
                                          margin: EdgeInsets.only(right: 15),
                                          width: 70,
                                          height: 28,
                                          decoration: BoxDecoration(
                                              color:
                                                  Colors.white.withOpacity(0.4),
                                              borderRadius:
                                                  BorderRadius.circular(38)),
                                          child: Center(
                                            child: Text(
                                              this
                                                  ._pokedexController
                                                  .pokemonAtual
                                                  .value
                                                  .type[index],
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                height: 75,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      child: Text(
                                        "#${this._pokedexController.pokemonAtual.value.num}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            color: Colors.white),
                                      ),
                                    ),
                                    ValueListenableBuilder(
                                        valueListenable:
                                            _pokemonDetailsController
                                                .pokemonSpecie,
                                        builder: (context,
                                            PokemonSpeciev2 value, child) {
                                          return value != null
                                              ? Text(
                                                  value.genera
                                                      .where((item) =>
                                                          item.language.name ==
                                                          "en")
                                                      .first
                                                      .genus
                                                      .toLowerCase()
                                                      .replaceAll("\n", " "),
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.white),
                                                )
                                              : Container();
                                        }),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )),
                      )
                    ];
                  },
                  body: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: PageView.builder(
                      controller: _pageController,
                      onPageChanged: (i) {
                        _pokedexController.setPokemonAtual(
                            _pokedexController.pokemons.value.pokemon[i]);
                        _pokemonDetailsController.getDetailsPokemon(
                            _pokedexController.pokemonAtual.value.name
                                .toLowerCase());
                        _pokemonDetailsController.getSpeciePokemon(
                            _pokedexController.pokemonAtual.value.name
                                .toLowerCase());
                      },
                      itemCount:
                          _pokedexController.pokemons.value.pokemon.length,
                      itemBuilder: (context, index) {
                        return Container(
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                right: 0,
                                bottom: 0,
                                top: 190,
                                child: Container(
                                  padding: EdgeInsets.only(
                                      left: 8, right: 8, top: 8),
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height -
                                      (200 * 2),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(30),
                                          topRight: Radius.circular(30)),
                                      color: Colors.white),
                                  child: DefaultTabController(
                                      initialIndex: 0,
                                      length: 4,
                                      child: Scaffold(
                                        appBar: TabBar(
                                          indicatorColor: Colors.blue,
                                          indicatorWeight: 1.0,
                                          labelColor: Colors.black,
                                          labelPadding:
                                              EdgeInsets.only(top: 10.0),
                                          unselectedLabelColor: Colors.grey,
                                          tabs: [
                                            Tab(
                                              text: 'About',
                                            ),
                                            //child: Image.asset('images/android.png'),

                                            Tab(
                                              text: 'Base Stats',
                                            ),
                                            Tab(
                                              text: 'Evolution',
                                            ),
                                            Tab(
                                              text: 'Moves',
                                            ),
                                          ],
                                        ),
                                        body: TabBarView(
                                          children: [
                                            AboutWidget(),
                                            Center(
                                                child: Text(
                                              'This is Radio Tab',
                                              style: TextStyle(fontSize: 32),
                                            )),
                                            ListView(
                                              shrinkWrap: true,
                                              children: List.generate(
                                                  30,
                                                  (index) => Container(
                                                        margin: EdgeInsets
                                                            .symmetric(
                                                                vertical: 8),
                                                        height: 30,
                                                        color: Colors.amber,
                                                        child: Center(
                                                          child: Text("$index"),
                                                        ),
                                                      )),
                                            ),
                                            Center(
                                                child: Text(
                                              'This is Gift Tab',
                                              style: TextStyle(fontSize: 32),
                                            )),
                                          ],
                                        ),
                                      )),
                                ),
                              ),
                              Positioned(
                                top: 0,
                                left: 0,
                                right: 0,
                                child: Container(
                                  height: 218,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: -50,
                                        top: 0,
                                        bottom: 0,
                                        child: Container(
                                          child: int.parse(_pokedexController
                                                      .pokemonAtual.value.num) >
                                                  1
                                              ? ColorFiltered(
                                                  colorFilter: ColorFilter.mode(
                                                      Colors.black,
                                                      BlendMode.modulate),
                                                  child: Image.network(
                                                    "https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/${_parsePokemon(int.parse(_pokedexController.pokemonAtual.value.num) - 1)}.png",
                                                    width: 110,
                                                    height: 80,
                                                  ),
                                                )
                                              : Container(
                                                  width: 110,
                                                  height: 80,
                                                ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 0,
                                        right: 0,
                                        top: 0,
                                        bottom: 0,
                                        child: Container(
                                          child: Center(
                                            child: Hero(
                                              tag: _pokedexController
                                                  .pokemonAtual.value.num,
                                              child: Image.network(
                                                "https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/${_pokedexController.pokemonAtual.value.num}.png",
                                                width: 1992,
                                                height: 220,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        right: -50,
                                        top: 0,
                                        bottom: 0,
                                        child: Container(
                                          child: ColorFiltered(
                                            colorFilter: ColorFilter.mode(
                                                Colors.black,
                                                BlendMode.modulate),
                                            child: Image.network(
                                              "https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/${_parsePokemon(int.parse(_pokedexController.pokemonAtual.value.num) + 1)}.png",
                                              width: 110,
                                              height: 80,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}

String _parsePokemon(int number) {
  if (number < 10) {
    return "00$number";
  }
  if (number >= 10 && number <= 99) {
    return "0$number";
  }
  return "$number";
}
