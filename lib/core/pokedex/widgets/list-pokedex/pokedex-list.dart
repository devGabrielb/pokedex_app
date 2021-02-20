import 'package:flutter/material.dart';
import 'package:pokedex_app/core/pokedex/controller/pokedex-controller.dart';
import 'package:pokedex_app/core/pokedex/widgets/list-pokedex/pokedex-item.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../../../locator.dart';

class PokedexList extends StatefulWidget {
  @override
  _PokedexListState createState() => _PokedexListState();
}

class _PokedexListState extends State<PokedexList> {
  PokedexController controller;
  @override
  void initState() {
    super.initState();
    controller = locator.get<PokedexController>();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        child: ValueListenableBuilder(
          valueListenable: controller.pokemons,
          builder: (context, value, child) {
            return AnimationLimiter(
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: value.pokemon.length,
                itemBuilder: (BuildContext context, int index) {
                  return AnimationConfiguration.staggeredGrid(
                    position: index,
                    duration: const Duration(milliseconds: 375),
                    columnCount: 2,
                    child: ScaleAnimation(
                      child: FadeInAnimation(
                        child: PokedexItem(
                          pokemon: value.pokemon[index],
                        ),
                      ),
                    ),
                  );
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1.2,
                  crossAxisCount: 2,
                  mainAxisSpacing: 15.0,
                  crossAxisSpacing: 15.0,
                ),
              ),
            );
          },
        ));
  }
}
