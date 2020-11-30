import 'package:injectable/injectable.dart';
import 'package:pokemon_app/domain/model/pokemon.dart';
import 'package:pokemon_app/http/api/pokemon_api.dart';
import 'package:pokemon_app/repository/pokemon_repository.dart';

import '../../injection.dart';

@Injectable(as: PokemonRepository, env: [Env.prod])
class ProdPokemonRepository implements PokemonRepository {
  final PokemonApi api;

  ProdPokemonRepository(this.api);

  @override
  Future<Pokemon> getPokemon() {
    return this.api.getPokemon();
  }
}
