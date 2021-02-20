import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex_app/constants/app_consts.dart';
import 'package:pokedex_app/core/pokedex/controller/pokedex-controller.dart';
import 'package:pokedex_app/core/pokedex/models/pokemon.dart';
import 'package:pokedex_app/locator.dart';

class PokedexItem extends StatelessWidget {
  final Pokemon pokemon;
  final PokedexController pokedex;
  PokedexItem({
    Key key,
    this.pokemon,
  })  : pokedex = locator.get<PokedexController>(),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, "/pokemon-details");
          pokedex.setPokemonAtual(pokemon);
        },
        child: Container(
          width: 170,
          height: 100,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomRight,
                colors: [
                  AppConsts.getColorType(type: this.pokemon.type[0])
                      .withOpacity(0.7),
                  AppConsts.getColorType(type: this.pokemon.type[0])
                ],
              ),
              borderRadius: BorderRadius.circular(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          this.pokemon.name,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                        children:
                            List.generate(this.pokemon.type.length, (index) {
                          return Container(
                            margin: EdgeInsets.only(bottom: 6),
                            width: 43,
                            height: 16,
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(38)),
                            child: Center(
                              child: Text(
                                this.pokemon.type[index],
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Stack(
                  children: [
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                          padding: EdgeInsets.only(top: 20, right: 30),
                          child: Text(
                            "#${this.pokemon.num}",
                            style: TextStyle(
                                color: Color(0xFF3E8570),
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                    Positioned(
                      bottom: -10,
                      right: -20,
                      child: SvgPicture.asset(
                        "assets/pokebola_transparent.svg",
                        color: Colors.white.withOpacity(0.2),
                        width: 95,
                        height: 100,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: -5,
                      child: Hero(
                        tag: this.pokemon.num,
                        child: Image.network(
                          "https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/${this.pokemon.num}.png",
                          width: 85,
                          height: 85,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
