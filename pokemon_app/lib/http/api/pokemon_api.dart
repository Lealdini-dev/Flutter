import 'dart:convert';

import 'package:pokemon_app/domain/model/pokemon.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

@injectable
class PokemonApi {
  static final String _baseURL = 'https://pokeapi.co/api/v2/pokemon/1/';

  Future<Pokemon> getPokemon() async {
    final res = await http.get(_baseURL);
    final Map<String, dynamic> jsonPokemon = jsonDecode(res.body);
    return Pokemon.fromJson(jsonPokemon);
  }
}
