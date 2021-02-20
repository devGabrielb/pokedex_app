import 'package:flutter/material.dart';
import 'package:pokedex_app/core/pokemon-details/models/pokemon-specie-v2.dart';
import 'package:pokedex_app/core/pokemon-details/models/pokemon-v2.dart';
import 'package:pokedex_app/core/pokemon-details/repositories/pokemon-details-repository.dart';

class PokemonDetailsController {
  final pokemonDetail = ValueNotifier<Pokemonv2>(null);
  final pokemonSpecie = ValueNotifier<PokemonSpeciev2>(null);

  PokemonDetailsRepository _poke = PokemonDetailsRepository();
  Future<void> getDetailsPokemon(String name) async {
    try {
      var result = await _poke.getDetailsPokemon(name);
      this.pokemonDetail.value = result;
    } catch (e) {
      throw Exception();
    }
  }

  Future<void> getSpeciePokemon(String name) async {
    try {
      var result = await _poke.getSteciePokemon(name);
      this.pokemonSpecie.value = result;
    } catch (e) {
      throw Exception();
    }
  }
}
