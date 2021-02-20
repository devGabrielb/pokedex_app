import 'package:flutter/material.dart';
import 'package:pokedex_app/core/pokedex/controller/pokedex-controller.dart';
import 'package:pokedex_app/core/pokemon-details/controllers/pokemon-details-controller.dart';
import 'package:pokedex_app/locator.dart';

class AboutWidget extends StatelessWidget {
  PokedexController pokemonPokedex = locator.get<PokedexController>();
  PokemonDetailsController pokemonSpecie =
      locator.get<PokemonDetailsController>();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: pokemonSpecie.pokemonSpecie,
        builder: (context, value, child) {
          return Container(
            padding: EdgeInsets.only(left: 27, right: 27, top: 19),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: pokemonSpecie != null
                        ? Text(
                            pokemonSpecie.pokemonSpecie.value.flavorTextEntries
                                // ignore: unrelated_type_equality_checks
                                .where((item) => item.version.name == "ruby")
                                .first
                                .flavorText
                                .toLowerCase()
                                .replaceAll("\n", " "),
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF303943)),
                          )
                        : LinearProgressIndicator(),
                  ),
                  SizedBox(
                    height: 28,
                  ),
                  Text(
                    "Biology",
                    style: TextStyle(
                        color: Color(0xFF303943),
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 30),
                            child: Text(
                              "Height",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Container(
                            child: Text(
                              pokemonPokedex.pokemonAtual.value.height,
                              style: TextStyle(
                                  color: Color(0xFF303943),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 30),
                            child: Text(
                              "Weight",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Container(
                            child: Text(
                              pokemonPokedex.pokemonAtual.value.weight,
                              style: TextStyle(
                                  color: Color(0xFF303943),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 30),
                            child: Text(
                              "Shape",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Container(
                            child: Text(
                              pokemonSpecie.pokemonSpecie.value.shape.name,
                              style: TextStyle(
                                  color: Color(0xFF303943),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
