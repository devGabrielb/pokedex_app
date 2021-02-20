import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pokedex_app/constants/api_const.dart';
import 'package:pokedex_app/core/pokedex/models/pokemon.dart';
import 'package:pokedex_app/locator.dart';

class PokemonRepository {
  final Dio dio = locator.get<Dio>();

  Future<PokemonList> getAll() async {
    final result = await this.dio.get(ApiConsts.pokedexUrl);
    if (result.statusCode == 200) {
      var decodeJson = jsonDecode(result.data);
      final pokemons = PokemonList.fromJson(decodeJson);
      return pokemons;
    } else {
      throw Exception();
    }
  }
}
