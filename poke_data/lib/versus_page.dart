import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class VersusPage extends StatefulWidget {
  const VersusPage({Key? key}) : super(key: key);

  @override
  State<VersusPage> createState() => _VersusPageState();
}

class _VersusPageState extends State<VersusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
    );
  }

  _body(BuildContext context) {
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
                _firstPokemonInfo(),
                const SizedBox(
                    height: 100,
                    child: Center(
                        child: Text("Vs",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 50,
                            )))),
                _secondPokemonInfo(),
              ],
            )));
  }

  _topStack() {
    return Stack(
      children: [
        Center(
          child: Image.asset(
            height: 100,
            width: 100,
            "assets/images/luta.png",
          ),
        ),
        Positioned(
          top: 20,
          right: 20,
          child: Image.asset(
            height: 45,
            width: 35,
            "assets/images/estrela.png",
          ),
        )
      ],
    );
  }

  _firstPokemonInfo() {
    return SizedBox(
        height: 264,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _pokemonBasic(
                "https://raw.githubusercontent.com/Dimitrimm/pokemonAssets/master/101.png",
                "Eletrico",
                "Magnético",
                "Agua",
                "Fogo"),
            _pokemonStatus(),
          ],
        ));
  }

  _secondPokemonInfo() {
    return SizedBox(
        height: 264,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _pokemonStatus(),
            _pokemonBasic(
                "https://raw.githubusercontent.com/Dimitrimm/pokemonAssets/master/111.png",
                "Poison",
                "Flying",
                "Redondo",
                "Brabo"),
          ],
        ));
  }

  _pokemonBasic(
      String asset, String tipo1, String tipo2, String weak1, String weak2) {
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
        children: [
          Card(
              color: Colors.grey[300],
              child: Padding(
                padding: EdgeInsets.all(5),
                child: Text(tipo1),
              )),
          Card(
              color: Colors.grey[300],
              child: Padding(
                padding: EdgeInsets.all(5),
                child: Text(tipo2),
              )),
        ],
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
          Card(
              color: Colors.grey[300],
              child: Padding(
                padding: EdgeInsets.all(5),
                child: Text(weak1),
              )),
          Card(
              color: Colors.grey[300],
              child: Padding(
                padding: EdgeInsets.all(5),
                child: Text(weak2),
              )),
        ],
      )
    ]);
  }

  _pokemonStatus() {
    return Column(children: [
      _pokemonName(),
      Text(
        "Base Status",
        style: TextStyle(fontSize: 15),
      ),
      Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
        _percentIndicator("HP", Colors.green, 0.5),
        _percentIndicator("ATK", Colors.blue.shade300, 0.2),
        _percentIndicator("DEF", Colors.red.shade700, 0.8),
        _percentIndicator("SPD", Colors.yellow, 0.1)
      ]),
      SizedBox(
        height: 15,
      ),
      Text(
        "Special Status",
        style: TextStyle(fontSize: 15),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _percentIndicator("SATK", Colors.blue.shade300, 0.2),
          _percentIndicator("SDEF", Colors.red.shade700, 0.8),
        ],
      )
    ]);
  }

  _pokemonName() {
    return Expanded(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "Snorlax",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text("#01"),
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
}