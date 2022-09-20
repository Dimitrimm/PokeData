import 'dart:convert';
import 'dart:ffi';

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
  final String host = 'http://10.0.2.2:5000';
  final String endAllPokemonInfo = '/alldataofpokemon/';
  final String endAllAdvantageInfo = '/alladvantageofpokemon/';
  final String endAllWeaknessInfo = '/allweaknessofpokemon/';
  final String endAllClusterInfo = '/pokemonscluster/';

  late Map allInfoMap;
  late Map allAdvantageMap;
  late List allClusterList;
  late Map allWeaknessMap;

  bool isInitAllInfoMap = false;
  bool isInitAllAdvantageMap = false;
  bool isInitAllClusterMap = false;
  bool isInitAllWeaknessMap = false;

  bool somtWentWrong = false;

  @override
  void initState() {
    super.initState();
    fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: checkfetch() ? _body(context) : _loadingOverlay(context),
    );
  }

  Widget _loadingOverlay(context) {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _body(context) {
    String pokemonName = allInfoMap['name'];
    String pokemonType = allInfoMap['genus'];
    String weight = allInfoMap['weight'] + " " + "KG";
    String color = allInfoMap['primary_color'];
    String height = allInfoMap['height'] + 'M';
    List<String> types = allInfoMap['typing'].toString().split('~');
    List<String> abilities = allInfoMap['abilities'].toString().split('~');

    String hp = allInfoMap['hp'];
    String atk = allInfoMap['attack'];
    String def = allInfoMap['defense'];
    String speed = allInfoMap['speed'];
    String spcAtk = allInfoMap['special_attack'];
    String spcDef = allInfoMap['special_defense'];

    double hpPercent = (int.parse(hp)) / 255;
    double atkPercent = (int.parse(atk)) / 255;
    double defPercent = (int.parse(def)) / 255;
    double speedPercent = (int.parse(speed)) / 255;

    double spcAtkPercent = (int.parse(spcAtk)) / 255;
    double spcDefPercent = (int.parse(spcDef)) / 255;

    return SingleChildScrollView(
        child: Padding(
            padding:
                const EdgeInsets.only(top: 42, left: 22, right: 22, bottom: 22),
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
                _baseStatus(hpPercent, atkPercent, defPercent, speedPercent),
                _featureFieldName('Special Status'),
                _specialStatus(spcDefPercent, spcAtkPercent),
                _commonFieldName('Abilities:'),
                _abilitiesRow(abilities),
                _commonFieldName('Weakness:'),
                _typeFeaturesRow(allWeaknessMap),
                _commonFieldName('Advantage:'),
                _typeFeaturesRow(allAdvantageMap),
                _commonFieldName('Similar:'),
                _clusterFeature(allClusterList)
              ],
            )));
  }

  Widget _baseStatus(hpPercent, atkPercent, defPercent, speedPercent) {
    return Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
      _percentIndicator(" HP", Colors.green, hpPercent),
      _percentIndicator("ATK", Colors.blue.shade300, atkPercent),
      _percentIndicator("DEF", Colors.red.shade700, defPercent),
      _percentIndicator("SPD", Colors.yellow, speedPercent),
    ]);
  }

  Widget _specialStatus(spcDefPercent, spcAtkPercent) {
    return SizedBox(
        child: Column(
      children: [
        _percentIndicator("DEF", Colors.green, spcDefPercent),
        _percentIndicator("ATK", Colors.blue.shade300, spcAtkPercent),
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
        child: Image.network(
          'https://raw.githubusercontent.com/Dimitrimm/pokemonAssets/master/${allInfoMap['id']}.png',
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

  Widget _typeFeaturesRow(typeFeature) {
    String type1 = typeFeature['type1'];
    String type2 = typeFeature['type2'];
    return Row(
      children: [
        Container(
            padding: const EdgeInsets.only(
              left: 3,
              right: 3,
            ),
            child: CircleAvatar(
              backgroundColor: Colors.grey.shade400,
              backgroundImage:
                  AssetImage('assets/images/${type1}_type_icon.png'),
              radius: 20,
            )),
        Container(
            padding: const EdgeInsets.only(
              left: 3,
              right: 3,
            ),
            child: CircleAvatar(
              backgroundColor: Colors.grey.shade400,
              backgroundImage:
                  AssetImage('assets/images/${type2}_type_icon.png'),
              radius: 20,
            )),
      ],
    );
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

  Widget _clusterFeature(clusterList) {
    List<Widget> pokAvatar = <Widget>[];
    for (Map<String, dynamic> pok in allClusterList.sublist(0, 15)) {
      pokAvatar.add(Container(
          padding: const EdgeInsets.only(
            left: 3,
            right: 3,
          ),
          child: CircleAvatar(
            backgroundColor: Colors.grey.shade400,
            backgroundImage: NetworkImage(
                'https://raw.githubusercontent.com/Dimitrimm/pokemonAssets/master/${pok['id']}.png'),
            radius: 30,
          )));
    }
    pokAvatar.add(IconButton(
        onPressed: () => goBack(),
        icon: const Icon(Icons.arrow_forward_ios_rounded)));
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: pokAvatar,
        ));
  }

  Future<Map> fetchAllPokemonInfo(id) async {
    var response = await http.get(Uri.parse(host + endAllPokemonInfo + id));
    if (response.statusCode == 200) {
      return jsonDecode(response.body)[0];
    } else {
      throw Exception("Error ao conectar-se ao servidor");
    }
  }

  Future<Map> fetchAllWeaknessInfo(id) async {
    var response = await http.get(Uri.parse(host + endAllWeaknessInfo + id));
    if (response.statusCode == 200) {
      return jsonDecode(response.body)[0];
    } else {
      throw Exception("Error ao conectar-se ao servidor");
    }
  }

  Future<Map> fetchAllAdvantageInfo(id) async {
    var response = await http.get(Uri.parse(host + endAllAdvantageInfo + id));
    if (response.statusCode == 200) {
      return jsonDecode(response.body)[0];
    } else {
      throw Exception("Error ao conectar-se ao servidor");
    }
  }

  Future<List> fetchAllClusterPokemons(id) async {
    var response = await http.get(Uri.parse(host + endAllClusterInfo + id));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Error ao conectar-se ao servidor");
    }
  }

  bool checkfetch() {
    return isInitAllAdvantageMap &&
        isInitAllClusterMap &&
        isInitAllInfoMap &&
        isInitAllWeaknessMap;
  }

  fetch() async {
    String id = widget.pokemonId;
    try {
      fetchAllPokemonInfo(id).then((valueInfoMap) {
        allInfoMap = valueInfoMap;
        isInitAllInfoMap = true;
        setState(() {});
      });
      fetchAllAdvantageInfo(id).then((value) {
        allAdvantageMap = value;
        isInitAllAdvantageMap = true;
        setState(() {});
      });
      fetchAllWeaknessInfo(id).then((value) {
        allWeaknessMap = value;
        isInitAllWeaknessMap = true;
        setState(() {});
      });
      fetchAllClusterPokemons(id).then((value) {
        allClusterList = value;
        isInitAllClusterMap = true;
        setState(() {});
      });
    } catch (e) {
      somtWentWrong = true;
    }
  }

  void goBack() {
    Navigator.of(context).pop();
  }

  void setFavorite() {}
}
