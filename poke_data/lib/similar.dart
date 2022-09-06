import 'package:flutter/material.dart';
import 'package:poke_data/pokemonButtonMap.dart';
import './pokemons.dart';

void main(List<String> args) {
  runApp(const Similar());
}
class Similar extends StatefulWidget {
  const Similar({Key? key}) : super(key: key);

  @override
  State<Similar> createState() => _SimilarState();
}

class _SimilarState extends State<Similar> {
  
  final List<int> teste = [1,2,3];

  _pokemonsSimiliarListView(){
    return Expanded(
      child: ListView.builder(
        itemCount: pokemons.length,
        itemBuilder: (context, index) {
          return PokemonButtonMap(pokemons[index]);
        }
      ),
    );
  }

  _similarLogo(){
    return Container(
      padding: const EdgeInsets.only(
        top: 40
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/pokebola.png',
                height: 80,
                width: 90,
              ),
              Image.asset(
                'assets/images/pokebola.png',
                height: 80,
                width: 90,
              )
            ],
          ),
          const Text(
            'Similar',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold
            ),
          ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(
            top: 42,
            left: 22,
            right: 22
          ),
          child: Column(
            children: <Widget> [
              Container(
                padding: const EdgeInsets.only(
                  top: 20,
                ),
                alignment: Alignment.topLeft,
                child: BackButton(
                  color: Colors.black,
                  onPressed: (){print('teste');},
                ),
              ),
              _similarLogo(),
              const SizedBox(
                width: 20,
              ),
              _pokemonsSimiliarListView()
            ],
          ),
        ),
      ) ,
    );
  }
}

//  @override
  // Widget build(BuildContext context) {
    // return MaterialApp(
      // home: Scaffold(
        // body: Padding(
          // padding: const EdgeInsets.only(
            // top: 42,
            // left: 22,
            // right: 22
          // ),
          // child: Column(
            // children: <Widget> [
              // _similarLogo(),
              // const SizedBox(
                // width: 20,
              // ),
              // _pokemonsSimiliarListView()
            // ],
          // ),
        // ),
      // ) ,
    // );
  // }