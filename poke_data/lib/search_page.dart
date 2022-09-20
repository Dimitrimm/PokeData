import 'package:flutter/material.dart';
import './pokemonButtonMap.dart';
import './searchBar.dart';
import './pokemons.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

main() => runApp(const Search());

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() {
    return _SearchState();
  }
}

class _SearchState extends State<Search> {
  String query = '';
  late List pikomons;

  @override
  void initState() {
    super.initState();

    pikomons = pokemons;
  }

  Future<List> fetch() async {
    var url = Uri.parse('http://10.0.2.2:5000/allpokemons');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(utf8.decode(response.bodyBytes));
    } else {
      return throw Exception("Error ao conectar-se ao servidor");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Padding(
        padding:
            const EdgeInsets.only(top: 42, left: 22, right: 22, bottom: 22),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.arrow_back_ios_outlined,
                      size: 18.0,
                    )),
              ],
            ),
            buildSearch(),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              // child: ListView.builder(
              //   itemCount: pikomons.length,
              //   itemBuilder: (context, index) {
              //     return PokemonButtonMap(pikomons[index]);
              //   },
              child: FutureBuilder<List>(
                future: fetch(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Center(
                      child: Text("Erro ao carregar os pokémons"),
                    );
                  }

                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          final item = snapshot.data![index];

                          return PokemonButtonMap(item);
                        });
                  }

                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ],
        ),
      )
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
