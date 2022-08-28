import 'package:flutter/material.dart';
import './pokemonButtonMap.dart';
import './pokemonsPorTime.dart';

main() => runApp(Favorite());

class Favorite extends StatefulWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  final time = pokemons;

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
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.keyboard_arrow_left),
                  onPressed: () {},
                ),
              ],
            ),
            Image.asset(
              'assets/images/pokebolas.png',
              width: 110,
              height: 110,
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              '"Team Name"',
              style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const SizedBox(
              height: 32,
            ),
            _AddPokemonTime('Add'),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Text("Members:"),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: time.length,
                itemBuilder: (context, index) {
                  return PokemonButtonMap(time[index]);
                },
              ),
            )
          ],
        ),
      )),
    );
  }

  _AddPokemonTime(texto) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
      child: Container(
        height: 65,
        // alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(
              Radius.circular(8),
            ),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 0,
                  blurRadius: 4,
                  offset: const Offset(0, 4)),
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 0.0, 0.0, 0.0),
              child: IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
              child: Text(
                texto,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
