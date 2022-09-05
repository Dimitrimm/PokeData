import 'package:flutter/material.dart';
import './pokemonButtonMap.dart';
import './pokemonsPorTime.dart';
import './search_page.dart';

main() => runApp(viewTimes());

class viewTimes extends StatefulWidget {
  const viewTimes({Key? key}) : super(key: key);

  @override
  State<viewTimes> createState() => _viewTimesState();
}

class _viewTimesState extends State<viewTimes> {
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.add),
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
              'Teams',
              style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Text("Seus times:"),
                ),
              ],
            ),
            Row(
              children: [
                CreateCardTime("Bravo Team"),
                CreateCardTime("Delta Team"),
              ],
            )
          ],
        ),
      )),
    );
  }

 CreateCardTime(texto) {
    return Card(
    child: Padding(
      padding: const EdgeInsets.only(left: 16, top: 8, right: 16, bottom: 8),
      child: Column(  
        children: [
          Text(texto),
          SizedBox(height: 8),
          Image.asset(
                'assets/images/valentia.png',
                width: 120,
                height: 120,
              ),
        ],
      ),
    ),  
  );
 }
}