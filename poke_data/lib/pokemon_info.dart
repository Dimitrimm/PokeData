import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:http/http.dart' as http;

class PokemonInfo extends StatefulWidget {
  String pokemonId;

  PokemonInfo({Key? key, required this.pokemonId}) : super(key: key);
  @override
  State<PokemonInfo> createState() => _PokemonInfoState();
}

class _PokemonInfoState extends State<PokemonInfo> {
  final String host = 'http://localhost:5000';
  final String endAllPokemonInfo = '/alldataofpokemon/';
  final String endAllAdvantageInfo = '/alladvantageofpokemon/';
  final String endAllWeaknessInfo = '/alladvantageofpokemon/';

  late Map<dynamic, dynamic> allInfoMap;
  late Map<dynamic, dynamic> allAdvantageMap;
  late Map<dynamic, dynamic> allWeaknessMap;

  String pokemonName = "Pikachu";
  String pokemonType = "Mouse Pokémon";
  String weight = '100KG';
  String color = 'Yellow';
  String height = '1.5 M';
  List<String> types = ['type 1', 'type 2'];
  List<String> abilities = ['Abilite 1', 'Abilite 2', 'Abilite 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
    );
  }

  Widget _body(context) {
    if (fetch() == true) {
      return SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.only(
                  top: 42, left: 22, right: 22, bottom: 22),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _actionButtonRow(),
                  Text(
                    pokemonName,
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    pokemonType,
                    style: const TextStyle(fontSize: 15),
                  ),
                  _pokemonAssetsCard(),
                  _typeRow(types),
                  _featuresRow(weight, color, height),
                  _featureFieldName('Base Status'),
                  _baseStatus(),
                  _featureFieldName('Special Status'),
                  _specialStatus(),
                  _commonFieldName('Abilities:'),
                  _abilitiesRow(abilities),
                  _commonFieldName('Weakness:'),
                  _typeFeaturesRow(),
                  _commonFieldName('Advantage:'),
                  _typeFeaturesRow(),
                  _formFeaturesRow(),
                ],
              )));
    } else {
      return Text('não foi possível carregar os dados!');
    }
  }

  Widget _baseStatus() {
    return Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
      _percentIndicator(" HP", Colors.green, 0.5),
      _percentIndicator("ATK", Colors.blue.shade300, 0.2),
      _percentIndicator("DEF", Colors.red.shade700, 0.8),
      _percentIndicator("SPD", Colors.yellow, 0.1),
    ]);
  }

  Widget _specialStatus() {
    return SizedBox(
        child: Column(
      children: [
        _percentIndicator(" HP", Colors.green, 0.5),
        _percentIndicator("ATK", Colors.blue.shade300, 0.2),
      ],
    ));
  }

  Widget _actionButtonRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: goBack, icon: const Icon(Icons.arrow_back_ios_new)),
        IconButton(
            onPressed: setFavorite,
            icon: Image.asset('assets/images/estrela.png'))
      ],
    );
  }

  Widget _pokemonAssetsCard() {
    return Card(
      elevation: 5,
      color: Colors.grey.shade300,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Image.asset(
          'assets/images/25.png',
          height: 150,
          width: 150,
        ),
      ),
    );
  }

  Widget _typeRow(List<String> types) {
    List<Widget> typeCards = <Widget>[];
    for (String type in types) {
      typeCards.add(Card(
          elevation: 3,
          color: Colors.grey[300],
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Text(type),
          )));
    }
    return Container(
        padding: const EdgeInsets.only(top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: typeCards,
        ));
  }

  Widget _featuresRow(String weight, String color, String height) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _featureColumn('Weight', weight),
        _featureColumn('Color', color),
        _featureColumn('Height', height),
      ],
    );
  }

  Widget _featureColumn(String columnName, String value) {
    return Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          children: [
            Text(
              columnName,
              style: const TextStyle(fontSize: 15),
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              value,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ],
        ));
  }

  Widget _abilitiesRow(List<String> abilities) {
    List<Widget> abilitiesCards = <Widget>[];
    for (String abilite in abilities) {
      abilitiesCards.add(Card(
          color: Colors.grey[300],
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(abilite),
          )));
    }
    return Row(
      children: abilitiesCards,
    );
  }

  Widget _percentIndicator(
      String statusName, Color color, double percentValue) {
    return LinearPercentIndicator(
      alignment: MainAxisAlignment.center,
      leading: Text(statusName),
      percent: percentValue,
      progressColor: color,
      animation: true,
      animationDuration: 2000,
      barRadius: const Radius.circular(3),
      width: 200.0,
      lineHeight: 12.0,
    );
  }

  Widget _typeFeaturesRow() {
    return Row(
      children: [
        Container(
            padding: EdgeInsets.only(
              left: 3,
              right: 3,
            ),
            child: CircleAvatar(
              backgroundColor: Colors.grey.shade400,
              backgroundImage: AssetImage('assets/images/mew.png'),
              radius: 20,
            )),
        Container(
            padding: EdgeInsets.only(
              left: 3,
              right: 3,
            ),
            child: CircleAvatar(
              backgroundColor: Colors.grey.shade400,
              backgroundImage: AssetImage('assets/images/mew.png'),
              radius: 20,
            )),
        Container(
            padding: EdgeInsets.only(
              left: 3,
              right: 3,
            ),
            child: CircleAvatar(
              backgroundColor: Colors.grey.shade400,
              backgroundImage: AssetImage('assets/images/mew.png'),
              radius: 20,
            )),
      ],
    );
  }

  Widget _formFeaturesRow() {
    return Container(
        padding: EdgeInsets.only(top: 10),
        child: Row(
          children: [
            Column(children: [
              Text('Evolves from:'),
              Card(
                  elevation: 4,
                  color: Colors.grey.shade300,
                  child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Image.asset(
                        'assets/images/mew.png',
                        width: 70,
                        height: 70,
                      ))),
            ]),
            Column(children: [
              Text('Evolves to:'),
              Card(
                  elevation: 4,
                  color: Colors.grey.shade300,
                  child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Image.asset(
                        'assets/images/mew.png',
                        width: 70,
                        height: 70,
                      ))),
            ]),
          ],
        ));
  }

  Widget _featureFieldName(String name) {
    return Padding(
        padding: const EdgeInsets.only(top: 15, bottom: 10), child: Text(name));
  }

  Widget _commonFieldName(String name) {
    return Padding(
        padding: const EdgeInsets.only(top: 10),
        child: SizedBox(width: double.infinity, child: Text(name)));
  }

  fetchAllPokemonInfo(client, id) async {
    var response = await client.get(Uri.parse(host + endAllPokemonInfo + id));
    if (response.statusCode == 200) {
      return jsonDecode(utf8.decode(response.bodyBytes)) as Map;
    } else {
      throw Exception("Error ao conectar-se ao servidor");
    }
  }

  fetchAllWeaknessInfo(client, id) async {
    var response = await client.get(Uri.parse(host + endAllWeaknessInfo + id));
    if (response.statusCode == 200) {
      return jsonDecode(utf8.decode(response.bodyBytes)) as Map;
    } else {
      throw Exception("Error ao conectar-se ao servidor");
    }
  }

  fetchAllAdvantageInfo(client, id) async {
    var response = await client.get(Uri.parse(host + endAllAdvantageInfo + id));
    if (response.statusCode == 200) {
      return jsonDecode(utf8.decode(response.bodyBytes)) as Map;
    } else {
      throw Exception("Error ao conectar-se ao servidor");
    }
  }

  fetch() {
    var client = http.Client;
    String id = widget.pokemonId;
    try {
      allInfoMap = fetchAllPokemonInfo(client, id);
      allAdvantageMap = fetchAllAdvantageInfo(client, id);
      allWeaknessMap = fetchAllWeaknessInfo(client, id);
      return true;
    } catch (e) {
      return false;
    }
  }

  void goBack() {}

  void setFavorite() {}
}
