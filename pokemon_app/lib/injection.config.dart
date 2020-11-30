// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'repository/implementation/dev_pokemon_repository.dart';
import 'http/api/pokemon_api.dart';
import 'domain/pokemon.domain.dart';
import 'repository/pokemon_repository.dart';
import 'repository/implementation/prod_pokemon_repository.dart';

/// Environment names
const _dev = 'dev';
const _prod = 'prod';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  gh.factory<PokemonApi>(() => PokemonApi());
  gh.factory<PokemonRepository>(() => DevPokemonRepository(get<PokemonApi>()),
      registerFor: {_dev});
  gh.factory<PokemonRepository>(() => ProdPokemonRepository(get<PokemonApi>()),
      registerFor: {_prod});
  gh.factory<PokemonDomain>(() => PokemonDomain(get<PokemonRepository>()));
  return get;
}
