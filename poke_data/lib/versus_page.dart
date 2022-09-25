import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:poke_data/compare_page.dart';

class VersusPage extends StatefulWidget {
  const VersusPage({Key? key}) : super(key: key);

  @override
  State<VersusPage> createState() => _VersusPageState();
}

class _VersusPageState extends State<VersusPage> {
  String pokemonId = '';
  final String host = 'http://10.0.2.2:5000';
  final String endAllPokemonInfo = '/alldataofpokemon/';
  final String endAllPokemons = '/allpokemons';
  List<Map> selectedPokemons = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _body(context));
  }

  Widget _body(context) {
    return Padding(
        padding: const EdgeInsets.only(top: 42, left: 22, right: 22, bottom: 0),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          _topRow(),
          const Text(
            'Versus',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          _selectedColumn(),
          _futurePokemonListBuilder(),
        ]));
  }

  Widget _topRow() {
    return Stack(
      children: [
        Container(
          width: double.infinity,
        ),
        const Center(
            child: Image(
                height: 60,
                width: 60,
                image: AssetImage('assets/images/luta.png'))),
        IconButton(
            onPressed: _goBack, icon: const Icon(Icons.arrow_back_ios_new))
      ],
    );
  }

  Widget _selectedColumn() {
    if (selectedPokemons.isEmpty) {
      return Container(
        height: 10,
      );
    } else {
      List<Widget> pokemonCards = <Widget>[];
      for (Map selected in selectedPokemons) {
        pokemonCards.add(_selectedPokemonCard(selected));
      }
      if (selectedPokemons.length == 2) {
        Widget compareButton = GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ComparePage(
                      firstPokemonId: selectedPokemons[0]['id'],
                      secondPokemonId: selectedPokemons[1]['id'])));
            },
            child: Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Card(
                  color: Colors.grey.shade300,
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Compare',
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ),
                  ),
                )));
        pokemonCards.add(compareButton);
      }
      return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: pokemonCards,
          ));
    }
  }

  Widget _selectedPokemonCard(selectedPokemonMap) {
    return Card(
        color: Colors.grey.shade300,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(children: [
              Padding(
                  padding: const EdgeInsets.only(
                      left: 15, top: 8, bottom: 8, right: 8),
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.grey.shade400,
                    backgroundImage: NetworkImage(
                        'https://raw.githubusercontent.com/Dimitrimm/pokemonAssets/master/${selectedPokemonMap["id"]}.png'),
                  )),
              Text(
                selectedPokemonMap["name"],
                style: const TextStyle(fontSize: 20),
              ),
            ]),
            Padding(
                padding: const EdgeInsets.only(right: 10),
                child: IconButton(
                    onPressed: () {
                      selectedPokemons.remove(selectedPokemonMap);
                      setState(() {});
                    },
                    icon: const Icon(
                      Icons.remove_circle,
                      color: Colors.black,
                      size: 25,
                    )))
          ],
        ));
  }

  Widget _futurePokemonListBuilder() {
    return Expanded(
        child: FutureBuilder<List>(
      future: fetchAllPokemon(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text("Erro ao carregar os pokémons"),
          );
        }

        if (snapshot.hasData) {
          return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final item = snapshot.data![index];

                return _pokemonListCard(item);
              });
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    ));
  }

  _pokemonListCard(pokemon) {
    return GestureDetector(
        onTap: () {
          if (selectedPokemons.length < 2) {
            selectedPokemons.add(pokemon);
            setState(() {});
          }
        },
        child: Card(
            color: Colors.grey.shade300,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Container(
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(pokemon['name']),
                          Text(
                              "#${_dexNumber(pokemon['pokedex_number'].toString())}"),
                        ],
                      )),
                  Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Image.network(
                        'https://raw.githubusercontent.com/Dimitrimm/pokemonAssets/master/${pokemon["img"]}.png',
                        width: 100,
                        height: 100,
                      )),
                ],
              ),
            )));
  }

  _dexNumber(String id) {
    if (id.length == 1) {
      id = '00$id';
    } else if (id.length == 2) {
      id = ('0$id');
    }
    return id;
  }

  Future<List> fetchAllPokemon() async {
    var url = Uri.parse('http://10.0.2.2:5000/allpokemons');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(utf8.decode(response.bodyBytes));
    } else {
      return throw Exception("Error ao conectar-se ao servidor");
    }
  }

  _goBack() {
    Navigator.of(context).pop();
  }
}
