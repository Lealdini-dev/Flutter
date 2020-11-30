import 'package:flutter/material.dart';
import 'package:pokemon_app/domain/pokemon.domain.dart';
import 'package:pokemon_app/injection.dart';

import 'domain/model/pokemon.dart';

void main() {
  configureInjection(Env.dev);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Pokemon _pokemon;

  void _onGetPokemon() async {
    final fetchedPokemon = await getIt<PokemonDomain>().getNextPokemon();
    setState(() {
      this._pokemon = fetchedPokemon;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokemon App',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Pokemon'),
        ),
        body: Center(
          child: Text('Hello World!'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: this._onGetPokemon,
          backgroundColor: Colors.red,
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
