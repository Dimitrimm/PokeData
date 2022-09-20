import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:poke_data/addButtonMap.dart';
import 'package:poke_data/pokemonButtonMap.dart';
import 'package:poke_data/searchBar.dart';
import 'package:poke_data/search_page.dart';
import './pokemons.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

main() => runApp(NovoTeam());

class NovoTeam extends StatefulWidget {
  const NovoTeam({Key? key}) : super(key: key);

  @override
  State<NovoTeam> createState() => _NovoTeamState();
}

class _NovoTeamState extends State<NovoTeam> {
  
  String query = '';
  late List pikomons;
  late Future<List> pokemons;
  var name;
  var times = 1;
  var userID;

  @override
  void initState() {
    super.initState();
    pokemons = pokemonsApi();
    query = '';
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        userID = user.uid;
      }
    });
  }

    salvar(id) {
    final ref = FirebaseDatabase.instance.ref('users/${id}/teams/teams$times');
    ref.update(
      {
        "nome": name,
      },
    );
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
                  return AddButtonMap(item);
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

    _dexNumber(String id) {
    if (id.length == 1) {
      id = '00$id';
    } else if (id.length == 2) {
      id = ('0$id');
    }
    return id;
  }

  search(){
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(top: 42, left: 22, right: 22, bottom: 22),
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
    ));
  }
  
  
  Widget buildSearch() => SearchWidget(
        text: query,
        onChanged: searchPokemon,
        hintText: 'Pokemon, tipo ou número na Pokedex',
      );

void searchPokemon(String query) {
    setState(() {
      this.query = query;
    });
  }


  // final time = pokemons;

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
      padding: const EdgeInsets.only(top: 42, left: 22, right: 22, bottom: 22),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back_ios_new)),
            ],
          ),
          Image.asset(
            'assets/images/pokebolas.png',
            width: 110,
            height: 110,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            'New Team',
            style: const TextStyle(
                fontSize: 26, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          const SizedBox(
            height: 32,
          ),
          Row(
            children: [
              Text("Team name:"),
            ],
          ),
          Column(
            children: [
              TextField(
                onChanged: (user) => name = user,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter a Team name',
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Text("Members:"),
            ],
          ),
          _AddPokemonTime('Add'),
          buildSearch(),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: buildPokemons(),
          ),
          // Expanded(
          //   child: ListView.builder(
          //     itemCount: time.length,
          //     itemBuilder: (context, index) {
          //       return PokemonButtonMap(time[index]);
          //     },
          //   ),
          // )
        ],
      ),
    ));
  }

  selectPoke() {}

  _AddPokemonTime(texto) {
    return TextButton(
      onPressed: ()=>salvar(userID),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
        child: Container(
          height: 65,
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                child: Text(
                  texto,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
