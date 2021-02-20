import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex_app/core/pokedex/controller/pokedex-controller.dart';
import 'package:pokedex_app/core/pokemon-details/controllers/pokemon-details-controller.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton<Dio>(Dio());
  locator.registerSingleton<PokedexController>(PokedexController());
  locator
      .registerSingleton<PokemonDetailsController>(PokemonDetailsController());
}
