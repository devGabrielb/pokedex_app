import 'package:flutter/material.dart';
import 'package:pokedex_app/core/pokemon-details/pokemon-details-page.dart';
import 'package:pokedex_app/locator.dart';

import 'core/home/home-page.dart';
import 'core/pokedex/pokedex-page.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        '/': (context) => HomePage(),
        '/pokedex': (context) => PokedexPage(),
        '/pokemon-details': (context) => PokemonDetailsPage(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
