import 'package:pokemon_app/domain/model/pokemon.dart';

abstract class PokemonRepository {
  Future<Pokemon> getPokemon();
}