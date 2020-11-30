import 'package:injectable/injectable.dart';
import 'package:pokemon_app/domain/model/pokemon.dart';
import 'package:pokemon_app/repository/pokemon_repository.dart';

@injectable
class PokemonDomain {
  final PokemonRepository _pokemonRepository;

  PokemonDomain(this._pokemonRepository);

  Future<Pokemon> getNextPokemon() async {
    return this._pokemonRepository.getPokemon();
  }
}
