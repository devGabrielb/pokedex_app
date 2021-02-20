import 'package:dio/dio.dart';
import 'package:pokedex_app/constants/api_const.dart';
import 'package:pokedex_app/core/pokemon-details/models/pokemon-specie-v2.dart';
import 'package:pokedex_app/core/pokemon-details/models/pokemon-v2.dart';

import '../../../locator.dart';

class PokemonDetailsRepository {
  final Dio dio = locator.get<Dio>();

  Future<Pokemonv2> getDetailsPokemon(String name) async {
    final result = await this.dio.get("${ApiConsts.baseUrlApiv2}$name");
    if (result.statusCode == 200) {
      final pokemons = Pokemonv2.fromJson(result.data);
      return pokemons;
    } else {
      throw Exception();
    }
  }

  Future<PokemonSpeciev2> getSteciePokemon(String name) async {
    final result = await this.dio.get("${ApiConsts.baseUrlApiSpeciesv2}$name");
    if (result.statusCode == 200) {
      final pokemons = PokemonSpeciev2.fromJson(result.data);
      return pokemons;
    } else {
      throw Exception();
    }
  }
}
