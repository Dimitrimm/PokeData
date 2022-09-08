import 'package:flutter/material.dart';
import 'package:poke_data/search_page.dart';
import './main.dart';

void main() {
  runApp(const Pokedex());
}

class Pokedex extends StatefulWidget {
  const Pokedex({Key? key}) : super(key: key);
   

  @override
  State<Pokedex> createState() => _PokedexgetState();
}

class _PokedexgetState extends State<Pokedex> {

  final salvos = [];
  final List<int> teste = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25
  ];

  createCard(pokemon) {
    final ja_salvo = salvos.contains(pokemon);
    return Card(
        child: Column(
      children: [
        ListTile(
            title: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                icon: ja_salvo ? Icon(Icons.star) : Icon(Icons.star_border),
                color: ja_salvo ? Colors.yellow : null,
                onPressed: () {
                  setState(() {
                    if (ja_salvo){
                      salvos.remove(pokemon);
                    }
                    else{
                      salvos.add(pokemon);
                    }
                  });
                },
                iconSize: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text("Pokémon"),
                  Text("#${pokemon}"),
                ],
              )
            ],
          ),
        )),
        Image.asset(
          'assets/images/bullbasaur.png',
          width: 100,
        )
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        home: Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 21),
                  alignment: Alignment.topLeft,
                  child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(
                        Icons.arrow_back_ios_outlined,
                        size: 18.0,
                      )),
                ),
                Container(
                  padding: const EdgeInsets.only(right: 21),
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: const Icon(
                      Icons.search,
                      size: 35,
                    ),
                    onPressed: (() => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Search()))),
                  ),
                )
              ],
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
              child: Image.asset(
                'assets/images/pokedex.png',
                width: 100,
                height: 100,
              ),
            ),
            const Padding(
                padding: EdgeInsets.all(5.0),
                child: Text("Pokedex",
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
            // Expanded(child:buildListView()),
            Expanded(
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: teste.length,
                    itemBuilder: (context, index) {
                      final item = teste[index];

                      return createCard(item);
                    }))
          ],
        ),
      ),
    ));
  }
}
