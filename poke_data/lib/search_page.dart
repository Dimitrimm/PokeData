import 'package:flutter/material.dart';
import './pokemonButtonMap.dart';
import './searchBar.dart';
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
  late Future<List> pokemons;

  @override
  void initState() {
    super.initState();
    pokemons = pokemonsApi();
    query = '';
  }

  Future<List> pokemonsApi() async {
    var url = Uri.parse('http://10.0.2.2:5000/allpokemons');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(utf8.decode(response.bodyBytes))
          .map((poke) => poke)
          .toList();
    } else {
      return throw Exception("Error ao conectar-se ao servidor");
    }
  }

  buildPokemons() {
    return FutureBuilder<List>(
                future: pokemons,
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
                          if (searchPokemonApi(item)) {
                            return PokemonButtonMap(item);
                          } else {
                            return Container();
                          }
                        });
                  }

                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              );
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
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    Icons.arrow_back_ios_outlined,
                    size: 18.0,
                  ),
                ),
              ],
            ),
            buildSearch(),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: buildPokemons(),
            ),
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
    setState(() {
      this.query = query;
    });
  }

  searchPokemonApi(dynamic item) {
    final nameLower = item['name'].toString().toLowerCase();
    final typeLower = item['type'].toString().toLowerCase();
    final id = _dexNumber(item['pokedex_number'].toString());
    final searchLower = query.toLowerCase();

    if (query != '') {
      return nameLower.contains(searchLower) ||
          typeLower.contains(searchLower) ||
          id.contains(searchLower);
    } else {
      return true;
    }
  }
}
