import 'package:flutter/cupertino.dart';
import 'package:pokedex_app/core/pokedex/models/pokemon.dart';
import 'package:pokedex_app/core/pokedex/repositories/pokemon-repository.dart';

class PokedexController {
  final pokemons = ValueNotifier<PokemonList>(null);
  final pokemonAtual = ValueNotifier<Pokemon>(null);
  final isLoading = ValueNotifier<bool>(true);

  PokemonRepository _poke = PokemonRepository();
  Future<void> getPokedex() async {
    this.isLoading.value = true;
    try {
      var result = await _poke.getAll();
      this.pokemons.value = result;
    } catch (e) {
      throw Exception();
    }
    this.isLoading.value = false;
  }

  setPokemonAtual(Pokemon pokemon) {
    this.pokemonAtual.value = pokemon;
  }
}
