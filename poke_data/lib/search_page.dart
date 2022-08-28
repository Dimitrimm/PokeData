import 'package:flutter/material.dart';
import './pokemonButtonMap.dart';
import './searchBar.dart';
import './pokemons.dart';

main() => runApp(Search());

class Search extends StatefulWidget {
  _SearchState createState() {
    return _SearchState();
  }
}

class _SearchState extends State<Search> {
  String query = '';
  late List pikomons;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    pikomons = pokemons;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Padding(
        padding:
            const EdgeInsets.only(top: 42, left: 22, right: 22, bottom: 22),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            buildSearch(),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: pikomons.length,
                itemBuilder: (context, index) {
                  return PokemonButtonMap(pikomons[index]);
                },
              ),
            )
          ],
        ),
      )),
    );
  }

  Widget buildSearch() => SearchWidget(
        text: query,
        onChanged: searchPokemon,
        hintText: 'Pokemon, tipo ou número na Pokedex',
      );

  _dexNumber(String id) {
    if (id.length == 1) {
      id = '00$id';
    } else if (id.length == 2) {
      id = ('0$id');
    }
    return id;
  }

  void searchPokemon(String query) {
    final pikomons = pokemons.where((pokemon) {
      final nameLower = pokemon['name'].toString().toLowerCase();
      final typeLower = pokemon['type'].toString().toLowerCase();
      final id = _dexNumber(pokemon['pokedexNumber'].toString());
      final searchLower = query.toLowerCase();

      return nameLower.contains(searchLower) ||
          typeLower.contains(searchLower) ||
          id.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this.pikomons = pikomons;
    });
  }
}
