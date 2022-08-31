import 'package:flutter/material.dart';
import './pokemonButtonMap.dart';
import './pokemons.dart';

main() => runApp(Favorite());

class Favorite extends StatefulWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  final pikomons = pokemons;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Padding(
        padding:
            const EdgeInsets.only(top: 42, left: 22, right: 22, bottom: 22),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/insignia.png',
              width: 110,
              height: 110,
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Favorites',
              style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: pikomons.length,
                itemBuilder: (context, index) {
                  return PokemonButtonMap(pikomons[index]);
                },
              ),
            )
          ],
        ),
      )),
    );
  }
}
