import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:http/http.dart' as http;
import 'package:poke_data/Util/pokemon.dart';

class ComparePage extends StatefulWidget {
  String firstPokemonId;
  String secondPokemonId;

  ComparePage(
      {Key? key, required this.firstPokemonId, required this.secondPokemonId})
      : super(key: key);

  @override
  State<ComparePage> createState() => _ComparePageState();
}

class _ComparePageState extends State<ComparePage> {
  final String host = 'http://10.0.2.2:5000';
  final String endAllPokemonInfo = '/alldataofpokemon/';

  bool somtWentWrong = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _body(context));
  }

  Widget _body(context) {
    return SingleChildScrollView(
        child: Padding(
            padding:
                const EdgeInsets.only(top: 42, left: 8, right: 8, bottom: 20),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              _topRow(),
              const Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(
                    'Versus',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  )),
              _pokemonFeatures(widget.firstPokemonId),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Vs',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              _pokemonFeatures(widget.secondPokemonId)
            ])));
  }

  Widget _pokemonFeatures(String id) {
    return FutureBuilder<Pokemon>(
      future: _fetchPokemonData(id),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text("Erro ao carregar os pokémons"),
          );
        }
        if (snapshot.hasData) {
          return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _pokemonAssetAndTypes(snapshot.data!),
                _pokemonNameAndStatus(snapshot.data!),
              ]);
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Widget _pokemonAssetAndTypes(Pokemon pokemon) {
    return SizedBox(
        height: 280,
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Card(
            color: Colors.grey.shade300,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Image.network(
                'https://raw.githubusercontent.com/Dimitrimm/pokemonAssets/master/${pokemon.id}.png',
                width: 100,
                height: 100,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 5),
            child: Text('Types:'),
          ),
          _typeRow(pokemon.typing),
          const Padding(
            padding: EdgeInsets.only(top: 5),
            child: Text('Weakness:'),
          ),
          _typeRow(pokemon.weaknesses)
        ]));
  }

  Widget _pokemonNameAndStatus(Pokemon pokemon) {
    return SizedBox(
        height: 270,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      pokemon.name,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w400),
                    ),
                    Text('#${pokemon.pokedexNumber}',
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400))
                  ],
                )),
            SizedBox(
              child: Column(children: [
                const Padding(
                    padding: EdgeInsets.only(bottom: 6),
                    child: Text(
                      'Base Status',
                      style: TextStyle(fontSize: 15),
                    )),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _percentIndicator(" HP", Colors.green, pokemon.hp / 255),
                    _percentIndicator(
                        "ATK", Colors.blue.shade300, pokemon.attack / 255),
                    _percentIndicator(
                        "DEF", Colors.red.shade700, pokemon.defense / 255),
                    _percentIndicator(
                        "SPD", Colors.yellow, pokemon.speed / 255),
                  ],
                ),
                const Padding(
                    padding: EdgeInsets.only(bottom: 6, top: 30),
                    child: Text(
                      'Special Status',
                      style: TextStyle(fontSize: 15),
                    )),
                Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                  _percentIndicator("SATK", Colors.blue.shade300,
                      pokemon.specialAttack / 255),
                  _percentIndicator(
                      "SDEF", Colors.green, pokemon.specialDefense / 255),
                ]),
              ]),
            ),
          ],
        ));
  }

  _dexNumber(String id) {
    if (id.length == 1) {
      id = '00$id';
    } else if (id.length == 2) {
      id = ('0$id');
    }
    return id;
  }

  Widget _percentIndicator(
      String statusName, Color color, double percentValue) {
    return LinearPercentIndicator(
      alignment: MainAxisAlignment.end,
      leading: Text(statusName),
      percent: percentValue,
      progressColor: color,
      animation: true,
      animationDuration: 2000,
      barRadius: const Radius.circular(3),
      width: 150.0,
      lineHeight: 14.0,
    );
  }

  Widget _typeRow(Map<dynamic, dynamic> types) {
    List<Widget> typeCards = <Widget>[];
    for (String typekey in types.keys) {
      String type = types[typekey]!;
      typeCards.add(Card(
          elevation: 3,
          color: Colors.grey[300],
          child: Padding(
              padding:
                  const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
              child: Row(children: [
                Container(
                    padding: const EdgeInsets.only(
                      right: 3,
                    ),
                    child: CircleAvatar(
                      backgroundColor: Colors.grey.shade400,
                      backgroundImage:
                          AssetImage('assets/images/${type}_type_icon.png'),
                      radius: 10,
                    )),
                Text(type),
              ]))));
    }
    return Container(
        padding: const EdgeInsets.only(top: 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: typeCards,
        ));
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

  Future<Pokemon> _fetchPokemonData(String id) async {
    var url = Uri.parse(host + endAllPokemonInfo + id);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return Pokemon.fromJson(
          jsonDecode(utf8.decode(response.bodyBytes)) as Map);
    } else {
      return throw Exception("Error ao conectar-se ao servidor");
    }
  }

  _goBack() {
    Navigator.of(context).pop();
  }
}
