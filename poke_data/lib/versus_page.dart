import 'dart:convert';
import 'dart:ffi';

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:http/http.dart' as http;

class VersusPage extends StatefulWidget {
<<<<<<< HEAD
=======
  String firstPokemonId = '742';
  String secondPokemonId = '717';

>>>>>>> efa96b7 (Integração Versus Page)
  VersusPage({Key? key}) : super(key: key);

  @override
  State<VersusPage> createState() => _VersusPageState();
}

class _VersusPageState extends State<VersusPage> {
<<<<<<< HEAD
  String pokemonId = '';
=======
>>>>>>> efa96b7 (Integração Versus Page)
  final String host = 'http://10.0.2.2:5000';
  final String endAllPokemonInfo = '/alldataofpokemon/';
  final String endAllAdvantageInfo = '/alladvantageofpokemon/';
  final String endAllWeaknessInfo = '/allweaknessofpokemon/';
  final String endAllClusterInfo = '/pokemonscluster/';

<<<<<<< HEAD
  late Map allInfoMap;
  late Map allAdvantageMap;
  late List allClusterList;
  late Map allWeaknessMap;

  bool isInitAllInfoMap = false;
  bool isInitAllAdvantageMap = false;
  bool isInitAllClusterMap = false;
  bool isInitAllWeaknessMap = false;
=======
  late Map firstAllInfoMap;
  late Map firstAllAdvantageMap;
  late List firstAllClusterList;
  late Map firstAllWeaknessMap;

  bool isInitFirstAllInfoMap = false;
  bool isInitFirstAllAdvantageMap = false;
  bool isInitFirstAllClusterMap = false;
  bool isInitFirstAllWeaknessMap = false;

  late Map secondAllInfoMap;
  late Map secondAllAdvantageMap;
  late List secondAllClusterList;
  late Map secondAllWeaknessMap;

  bool isInitSecondAllInfoMap = false;
  bool isInitSecondAllAdvantageMap = false;
  bool isInitSecondAllClusterMap = false;
  bool isInitSecondAllWeaknessMap = false;
>>>>>>> efa96b7 (Integração Versus Page)

  bool somtWentWrong = false;

  @override
  void initState() {
    super.initState();
<<<<<<< HEAD
    fetch();
=======
    firstFetch();
    secondFetch();
>>>>>>> efa96b7 (Integração Versus Page)
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
<<<<<<< HEAD
  // Widget _body(context) {
  //   String pokemonName = allInfoMap['name'];
  //   String pokemonType = allInfoMap['genus'];
  //   String weight = allInfoMap['weight'] + " " + "KG";
  //   String color = allInfoMap['primary_color'];
  //   String height = allInfoMap['height'] + 'M';
  //   List<String> types = allInfoMap['typing'].toString().split('~');
  //   List<String> abilities = allInfoMap['abilities'].toString().split('~');

  //   String hp = allInfoMap['hp'];
  //   String atk = allInfoMap['attack'];
  //   String def = allInfoMap['defense'];
  //   String speed = allInfoMap['speed'];
  //   String spcAtk = allInfoMap['special_attack'];
  //   String spcDef = allInfoMap['special_defense'];

  //   double hpPercent = (int.parse(hp)) / 255;
  //   double atkPercent = (int.parse(atk)) / 255;
  //   double defPercent = (int.parse(def)) / 255;
  //   double speedPercent = (int.parse(speed)) / 255;

  //   double spcAtkPercent = (int.parse(spcAtk)) / 255;
  //   double spcDefPercent = (int.parse(spcDef)) / 255;

  //   return SingleChildScrollView(
  //       child: Padding(
  //           padding:
  //               const EdgeInsets.only(top: 42, left: 22, right: 22, bottom: 22),
  //           child: Column(
  //             mainAxisAlignment: MainAxisAlignment.start,
  //             children: [
  //               _actionButtonRow(),
  //               Text(
  //                 pokemonName,
  //                 style: const TextStyle(
  //                     fontSize: 25, fontWeight: FontWeight.bold),
  //               ),
  //               Text(
  //                 pokemonType,
  //                 style: const TextStyle(fontSize: 15),
  //               ),
  //               _pokemonAssetsCard(),
  //               _typeRow(types),
  //               _featuresRow(weight, color, height),
  //               _featureFieldName('Base Status'),
  //               _baseStatus(hpPercent, atkPercent, defPercent, speedPercent),
  //               _featureFieldName('Special Status'),
  //               _specialStatus(spcDefPercent, spcAtkPercent),
  //               _commonFieldName('Abilities:'),
  //               _abilitiesRow(abilities),
  //               _commonFieldName('Weakness:'),
  //               _typeFeaturesRow(allWeaknessMap),
  //               _commonFieldName('Advantage:'),
  //               _typeFeaturesRow(allAdvantageMap),
  //               _commonFieldName('Similar:'),
  //               _clusterFeature(allClusterList)
  //             ],
  //           )));
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: _body(context),
  //   );
  // }

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

  fetch() async {
    String id = pokemonId;
    try {
      fetchAllPokemonInfo('80').then((valueInfoMap) {
        allInfoMap = valueInfoMap;
        isInitAllInfoMap = true;
        setState(() {});
      });
      fetchAllWeaknessInfo('80').then((value) {
        allWeaknessMap = value;
        isInitAllWeaknessMap = true;
        setState(() {});
      });
    } catch (e) {
      somtWentWrong = true;
    }
  }

  bool checkfetch() {
    return isInitAllInfoMap && isInitAllWeaknessMap;
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

  _body(context) {
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
=======

  _body(BuildContext context) {
    String firstPokemonName = firstAllInfoMap['name'];
    String firstWeight = firstAllInfoMap['weight'] + " " + "KG";
    String firstColor = firstAllInfoMap['primary_color'];
    String firstHeight = firstAllInfoMap['height'] + 'M';
    List<String> firstTypes = firstAllInfoMap['typing'].toString().split('~');

    String firstHp = firstAllInfoMap['hp'];
    String firstAtk = firstAllInfoMap['attack'];
    String firstDef = firstAllInfoMap['defense'];
    String firstSpeed = firstAllInfoMap['speed'];
    String firstSpcAtk = firstAllInfoMap['special_attack'];
    String firstSpcDef = firstAllInfoMap['special_defense'];

    double firstHpPercent = (int.parse(firstHp)) / 255;
    double firstAtkPercent = (int.parse(firstAtk)) / 255;
    double firstDefPercent = (int.parse(firstDef)) / 255;
    double firstSpeedPercent = (int.parse(firstSpeed)) / 255;

    double firstSpcAtkPercent = (int.parse(firstSpcAtk)) / 255;
    double firstSpcDefPercent = (int.parse(firstSpcDef)) / 255;

    String secondPokemonName = secondAllInfoMap['name'];
    String secondWeight = secondAllInfoMap['weight'] + " " + "KG";
    String secondColor = secondAllInfoMap['primary_color'];
    String secondHeight = secondAllInfoMap['height'] + 'M';
    List<String> secondTypes = secondAllInfoMap['typing'].toString().split('~');

    String secondHp = secondAllInfoMap['hp'];
    String secondAtk = secondAllInfoMap['attack'];
    String secondDef = secondAllInfoMap['defense'];
    String secondSpeed = secondAllInfoMap['speed'];
    String secondSpcAtk = secondAllInfoMap['special_attack'];
    String secondSpcDef = secondAllInfoMap['special_defense'];

    double secondHpPercent = (int.parse(secondHp)) / 255;
    double secondAtkPercent = (int.parse(secondAtk)) / 255;
    double secondDefPercent = (int.parse(secondDef)) / 255;
    double secondSpeedPercent = (int.parse(secondSpeed)) / 255;

    double secondSpcAtkPercent = (int.parse(secondSpcAtk)) / 255;
    double secondSpcDefPercent = (int.parse(secondSpcDef)) / 255;

>>>>>>> efa96b7 (Integração Versus Page)
    return SingleChildScrollView(
        child: Padding(
            padding:
                const EdgeInsets.only(top: 42, left: 22, right: 22, bottom: 22),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _topStack(),
                const Text("Versus",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 20,
                ),
<<<<<<< HEAD
                ElevatedButton(onPressed: () { 
                  _firstPokemonInfo();
                  setState(() {
                    
                  });
                  },
                 child: Text('clique')),
                // _firstPokemonInfo(),
                // _typeRow(types),
                // _featuresRow(weight, color, height),
                // _featureFieldName('Base Status'),

=======
                _firstPokemonInfo(
                    firstTypes,
                    firstAllWeaknessMap,
                    firstPokemonName,
                    firstHpPercent,
                    firstAtkPercent,
                    firstDefPercent,
                    firstSpeedPercent,
                    firstSpcAtkPercent,
                    firstSpcDefPercent),
>>>>>>> efa96b7 (Integração Versus Page)
                const SizedBox(
                    height: 100,
                    child: Center(
                        child: Text("Vs",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 50,
                            )))),
<<<<<<< HEAD
                // ElevatedButton(onPressed: () => _secondPokemonInfo('3'), child: Text('child'))
                _secondPokemonInfo('3'),
=======
                _secondPokemonInfo(
                    secondTypes,
                    secondAllWeaknessMap,
                    secondPokemonName,
                    secondHpPercent,
                    secondAtkPercent,
                    secondDefPercent,
                    secondSpeedPercent,
                    secondSpcAtkPercent,
                    secondSpcDefPercent),
>>>>>>> efa96b7 (Integração Versus Page)
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
              radius: 15,
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
              radius: 15,
            )),
      ],
    );
  }

  Widget _typeRow(List<String> types) {
    List<Widget> typeCards = <Widget>[];
    for (String type in types) {
      typeCards.add(Card(
          elevation: 3,
          color: Colors.grey[300],
          child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
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
        // padding: const EdgeInsets.only(top: 10),
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

  Widget _featureFieldName(String name) {
    return Padding(
        padding: const EdgeInsets.only(top: 15, bottom: 10), child: Text(name));
  }

  _topStack() {
    return Stack(
      children: [
        IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios_outlined,
              size: 18.0,
            )),
        Center(
          child: Image.asset(
            height: 100,
            width: 100,
            "assets/images/luta.png",
          ),
        ),
      ],
    );
  }

  _firstPokemonInfo(types, weak, name, hp, atk, def, spd, spcatk, spcdef) {
    return SizedBox(
        height: 264,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _pokemonBasic(
                "https://raw.githubusercontent.com/Dimitrimm/pokemonAssets/master/${firstAllInfoMap['id']}.png",
                types,
                weak),
            _pokemonStatus(name, hp, atk, def, spd, spcatk, spcdef),
          ],
        ));
  }

<<<<<<< HEAD
  _secondPokemonInfo(id) {
    pokemonId = id;
    fetchAllPokemonInfo(id);
=======
  _secondPokemonInfo(types, weak, name, hp, atk, def, spd, spcatk, spcdef) {
>>>>>>> efa96b7 (Integração Versus Page)
    return SizedBox(
        height: 264,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _pokemonStatus(name, hp, atk, def, spd, spcatk, spcdef),
            _pokemonBasic(
                "https://raw.githubusercontent.com/Dimitrimm/pokemonAssets/master/${secondAllInfoMap['id']}.png",
                types,
                weak),
          ],
        ));
  }

<<<<<<< HEAD
  _pokemonBasic(
      String asset, String tipo1, String tipo2, String weak1, String weak2) {
    List<String> types = allInfoMap['typing'].toString().split('~');
=======
  _pokemonBasic(String asset, List<String> types, weak) {
    String type1 = weak['type1'];
    String type2 = weak['type2'];
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
>>>>>>> efa96b7 (Integração Versus Page)
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Card(
        color: Colors.grey.shade300,
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Image.network(
            height: 120,
            width: 120,
            asset,
          ),
        ),
      ),
      const Text(
        "Type",
        style: TextStyle(
          fontSize: 12,
          color: Colors.black,
        ),
      ),
      Row(
<<<<<<< HEAD
        children: [
          // Card(
          //     color: Colors.grey[300],
          //     child: Padding(
          //       padding: const EdgeInsets.all(5),
          //       child: Text(tipo1),
          //     )),
          // Card(
          //     color: Colors.grey[300],
          //     child: Padding(
          //       padding: const EdgeInsets.all(5),
          //       child: Text(tipo2),
          //     )),
          _typeRow(types)
        ],
=======
        children: typeCards,
>>>>>>> efa96b7 (Integração Versus Page)
      ),
      const SizedBox(
        height: 10,
      ),
      const Text(
        "Weakness:",
        style: TextStyle(
          fontSize: 12,
          color: Colors.black,
        ),
      ),
      Row(
        children: [
<<<<<<< HEAD
          // Card(
          //     color: Colors.grey[300],
          //     child: Padding(
          //       padding: const EdgeInsets.all(5),
          //       child: Text(weak1),
          //     )),
          // Card(
          //     color: Colors.grey[300],
          //     child: Padding(
          //       padding: const EdgeInsets.all(5),
          //       child: Text(weak2),
          //     )),
          _typeFeaturesRow(allWeaknessMap)
=======
          Card(
              elevation: 3,
              color: Colors.grey[300],
              child: Padding(
                  padding: const EdgeInsets.only(left: 2, right: 10, top: 5),
                  child: Row(children: [
                    Container(
                        padding: const EdgeInsets.only(
                          right: 3,
                        ),
                        child: CircleAvatar(
                          backgroundColor: Colors.grey.shade400,
                          backgroundImage: AssetImage(
                              'assets/images/${type1}_type_icon.png'),
                          radius: 7,
                        )),
                    Text(type1),
                  ]))),
          Card(
              elevation: 3,
              color: Colors.grey[300],
              child: Padding(
                  padding: const EdgeInsets.only(left: 2, right: 10, top: 5),
                  child: Row(children: [
                    Container(
                        padding: const EdgeInsets.only(
                          right: 3,
                        ),
                        child: CircleAvatar(
                          backgroundColor: Colors.grey.shade400,
                          backgroundImage: AssetImage(
                              'assets/images/${type2}_type_icon.png'),
                          radius: 7,
                        )),
                    Text(type2),
                  ])))
>>>>>>> efa96b7 (Integração Versus Page)
        ],
      )
    ]);
  }

<<<<<<< HEAD
  _pokemonStatus() {
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
=======
  _pokemonStatus(name, hp, atk, def, spd, spcatk, spcdef) {
>>>>>>> efa96b7 (Integração Versus Page)
    return Column(children: [
      _pokemonName(name),
      const Text(
        "Base Status",
        style: TextStyle(fontSize: 15),
      ),
      Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
<<<<<<< HEAD
        // _percentIndicator("HP", Colors.green, 0.5),
        // _percentIndicator("ATK", Colors.blue.shade300, 0.2),
        // _percentIndicator("DEF", Colors.red.shade700, 0.8),
        // _percentIndicator("SPD", Colors.yellow, 0.1),
        _baseStatus(hpPercent, atkPercent, defPercent, speedPercent),
=======
        _percentIndicator("HP", Colors.green, hp),
        _percentIndicator("ATK", Colors.blue.shade300, atk),
        _percentIndicator("DEF", Colors.red.shade700, def),
        _percentIndicator("SPD", Colors.yellow, spd)
>>>>>>> efa96b7 (Integração Versus Page)
      ]),
      const SizedBox(
        height: 15,
      ),
      const Text(
        "Special Status",
        style: TextStyle(fontSize: 15),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
<<<<<<< HEAD
          // _percentIndicator("SATK", Colors.blue.shade300, 0.2),
          // _percentIndicator("SDEF", Colors.red.shade700, 0.8),
          _specialStatus(spcDefPercent, spcAtkPercent),
=======
          _percentIndicator("SATK", Colors.blue.shade300, spcatk),
          _percentIndicator("SDEF", Colors.red.shade700, spcdef),
>>>>>>> efa96b7 (Integração Versus Page)
        ],
      )
    ]);
  }

<<<<<<< HEAD
  _pokemonName() {
    String pokemonName = allInfoMap['name'];
=======
  _pokemonName(name) {
>>>>>>> efa96b7 (Integração Versus Page)
    return Expanded(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
<<<<<<< HEAD
          pokemonName,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        // Text("#01"),
=======
          name,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )
>>>>>>> efa96b7 (Integração Versus Page)
      ],
    ));
  }

  _percentIndicator(String statusName, Color color, double percentValue) {
    return LinearPercentIndicator(
      leading: Text(statusName),
      percent: percentValue,
      progressColor: color,
      animation: true,
      animationDuration: 2000,
      barRadius: const Radius.circular(3),
      width: 100.0,
      lineHeight: 8.0,
    );
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
    return isInitFirstAllAdvantageMap &&
        isInitFirstAllClusterMap &&
        isInitFirstAllInfoMap &&
        isInitSecondAllAdvantageMap &&
        isInitSecondAllClusterMap &&
        isInitSecondAllInfoMap &&
        isInitSecondAllWeaknessMap;
  }

  firstFetch() async {
    String id = widget.firstPokemonId;
    try {
      fetchAllPokemonInfo(id).then((valueInfoMap) {
        firstAllInfoMap = valueInfoMap;
        isInitFirstAllInfoMap = true;
        setState(() {});
      });
      fetchAllAdvantageInfo(id).then((value) {
        firstAllAdvantageMap = value;
        isInitFirstAllAdvantageMap = true;
        setState(() {});
      });
      fetchAllWeaknessInfo(id).then((value) {
        firstAllWeaknessMap = value;
        isInitFirstAllWeaknessMap = true;
        setState(() {});
      });
      fetchAllClusterPokemons(id).then((value) {
        firstAllClusterList = value;
        isInitFirstAllClusterMap = true;
        setState(() {});
      });
    } catch (e) {
      somtWentWrong = true;
    }
  }

  secondFetch() async {
    String id = widget.secondPokemonId;
    try {
      fetchAllPokemonInfo(id).then((valueInfoMap) {
        secondAllInfoMap = valueInfoMap;
        isInitSecondAllInfoMap = true;
        setState(() {});
      });
      fetchAllAdvantageInfo(id).then((value) {
        secondAllAdvantageMap = value;
        isInitSecondAllAdvantageMap = true;
        setState(() {});
      });
      fetchAllWeaknessInfo(id).then((value) {
        secondAllWeaknessMap = value;
        isInitSecondAllWeaknessMap = true;
        setState(() {});
      });
      fetchAllClusterPokemons(id).then((value) {
        secondAllClusterList = value;
        isInitSecondAllClusterMap = true;
        setState(() {});
      });
    } catch (e) {
      somtWentWrong = true;
    }
  }
}
