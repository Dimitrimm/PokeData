import 'package:flutter/material.dart';
import 'package:poke_data/pokemonButtoMapsimilar.dart';
import 'package:poke_data/pokemonButtonMap.dart';
import './pokemons.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// void main(List<String> args) {
//   runApp(const Similar(pokemonId:'1'));
// }
class Similar extends StatefulWidget {
  String pokemonId;

  Similar({Key? key, required this.pokemonId}) : super(key: key);

  @override
  State<Similar> createState() => _SimilarState();
}

class _SimilarState extends State<Similar> {
  final List<int> teste = [1, 2, 3];

  Future<List> fetch() async {
    var url =
        Uri.parse('http://10.0.2.2:5000/pokemonscluster/${widget.pokemonId}');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(utf8.decode(response.bodyBytes));
    } else {
      return throw Exception("No data has been found");
    }
  }

  _pokemonsSimiliarListView() {
    return Expanded(
        child: FutureBuilder<List>(
      future: fetch(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text("No data has been found"),
          );
        }

        if (snapshot.hasData) {
          return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final item = snapshot.data![index];
                print('tipo:${item}');
                return PokemonButtonMapSimilar(item);
              });
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    ));
  }

  _similarLogo() {
    return Container(
      child: Column(
        children: [
          Image.network(
            'https://raw.githubusercontent.com/Dimitrimm/pokemonAssets/master/${widget.pokemonId}.png',
            height: 70,
            width: 70,
          ),
          const Text(
            'Similar',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
          padding: const EdgeInsets.only(top: 42, left: 22, right: 22),
          child: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(
                  top: 20,
                ),
                alignment: Alignment.topLeft,
                child: BackButton(
                  color: Colors.black,
                  onPressed: () => Navigator.pop(context),
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
      ),
    );
  }
}

  // _pokemonsSimiliarListView(){
  //   return Expanded(
  //     child: ListView.builder(
  //       itemCount: pokemons.length,
  //       itemBuilder: (context, index) {
  //         return PokemonButtonMap(pokemons[index]);
  //       }
  //     ),
  //   );
  // }





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