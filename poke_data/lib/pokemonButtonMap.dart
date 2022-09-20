import 'package:flutter/material.dart';
import 'package:poke_data/pokemon_info.dart';

class PokemonButtonMap extends StatelessWidget {
  final Map pikomons;

  const PokemonButtonMap(this.pikomons, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:()=> Navigator.of(context).push(
        MaterialPageRoute(builder: (context) =>  PokemonInfo(pokemonId:pikomons['id']),)
       ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
        child: Container(
          height: 80,
          // alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 0,
                    blurRadius: 4,
                    offset: const Offset(0, 4)),
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
                    child: Image.network(
                      'https://raw.githubusercontent.com/Dimitrimm/pokemonAssets/master/${pikomons["img"]}.png',
                      width: 56,
                      height: 56,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        pikomons['name'].toString(),
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        textAlign: TextAlign.left,
                      ),
                      Text(pikomons['typing'].toString(),
                          style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: Colors.black),
                          textAlign: TextAlign.left),
                    ],
                  ),
                ],
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 0.0, 16.0, 0.0),
                  child: Text(
                      '#${_dexNumber(pikomons['pokedex_number'].toString())}')),
            ],
          ),
        ),
      ),
    );
  }

  _dexNumber(String id) {
    if (id.length == 1) {
      id = '00$id';
    } else if (id.length == 2) {
      id = ('0$id');
    }
    return id;
  }
}