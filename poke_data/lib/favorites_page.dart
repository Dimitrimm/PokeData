import 'package:flutter/material.dart';
import './pokemonButtonMap.dart';
import './pokemons.dart';

main() => runApp(const FavoritesPage());

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Favorite(),
    );
  }
}

class Favorite extends StatefulWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  final pikomons = pokemons;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.only(top: 42, left: 22, right: 22),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _favoritesLogo(),
                _pokemonsListView(),
                const SizedBox(
                  height: 20,
                ),
              ],
            )));
  }

  _favoritesLogo() {
    return Stack(children: [
      SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                "assets/images/estrela.png",
                height: 100,
                width: 100,
              ),
              const Text(
                "Favoritos",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              )
            ],
          )),
      IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_outlined,
            size: 18.0,
          ))
    ]);
  }

  _pokemonsListView() {
    return Expanded(
      child: ListView.builder(
          itemCount: pikomons.length,
          itemBuilder: (context, index) {
            return PokemonButtonMap(pikomons[index]);
          }),
    );
  }

}
