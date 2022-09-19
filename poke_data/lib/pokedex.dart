import 'dart:convert';
import 'dart:io';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:poke_data/pokemon_info.dart';
import 'package:poke_data/principal.dart';
import 'package:poke_data/search_page.dart';
import 'package:poke_data/similar.dart';
import 'package:http/http.dart' as http;
import 'package:poke_data/principal.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() {
  runApp(const MaterialApp(
    home: Pokedex(),
  ));
}

class Pokedex extends StatefulWidget {
  const Pokedex({Key? key}) : super(key: key);

  @override
  State<Pokedex> createState() => _PokedexgetState();
}

class _PokedexgetState extends State<Pokedex> {
  var userID;
  var userData;
  var request;

  @override
  void initState() {
    request = fetch();
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        userID = user.uid;
        _getUserData(user.uid);
      }
    });
  }

  _getUserData(id) async {
    print('gfetUserData USerID' + userID);
    final ref = FirebaseDatabase.instance.ref('users/${id}');
    final snapshot = await ref.get();
    if (snapshot.exists) {
      setState(() {
        userData = snapshot.value;
      });
    } else {
      print('No data available.');
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

  Future<List> fetch() async {
    var url = Uri.parse('http://10.0.2.2:5000/allpokemons');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(utf8.decode(response.bodyBytes));
    } else {
      return throw Exception("Error ao conectar-se ao servidor");
    }
  }

  salvar(pokemon, id) {
    print(pokemon['name']);
    print(id);
    final ref = FirebaseDatabase.instance.ref('users/${id}/favorites');
    ref.update(
      {
        pokemon['id']: pokemon['name'],
      },
    );
  }

  desfavoritar(pokemon, id) {
    final ref = FirebaseDatabase.instance.ref('users/${id}/favorites');
    ref.update(
      {
        pokemon['id']: null,
      },
    );
  }
  
  //CARD
  Widget createCard(pokemon, favorites) {
    var favStatus;

    var teste = Map<dynamic, dynamic>.from(userData['favorites']);
    print(teste);

    
    // setState(() {
      // _getUserData(userID);
      // print(userData);
      // if(userData['favorites'][pokemon['id']] != null){
        // favStatus = true;
      // }else{
        // favStatus = false;
      // }
    // });


    return InkWell(
      onTap: () => Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => PokemonInfo(pokemonId: pokemon['id']),
      )),
      child: Card(
        child: Column(
          children: [
            ListTile(
              title: Ink(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {
                        if(userData['favorites'][pokemon['id']] == null){
                          print("salvando pokémon");
                          salvar(pokemon, userID);
                          _getUserData(userID);
                          setState(() {
                            favStatus = true;
                          });
                        }else{
                          print("Removendo pokémon");
                          desfavoritar(pokemon, userID);
                          _getUserData(userID);
                          setState(() {
                            favStatus = false;
                          });
                        }
                      },
                      icon: Icon(
                        Icons.star_border,
                        color: teste.containsKey(pokemon['id']) ? Colors.yellow : null ,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(pokemon['name']),
                        Text(
                            "#${_dexNumber(pokemon['pokedex_number'].toString())}"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Image.network(
              'https://raw.githubusercontent.com/Dimitrimm/pokemonAssets/master/${pokemon["img"]}.png',
              width: 100,
              height: 100,
            )
          ],
        ),
      ),
    );
  }

  Widget _body(context) {
    return Column(
      children: [
        _topButtons(),
        _pokedexIcon(),
        _futureBuilder(),
      ],
    );
  }

  Widget _topButtons() {
    return Padding(
      padding: const EdgeInsets.only(top: 60),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 21),
            alignment: Alignment.topLeft,
            child: IconButton(
              onPressed: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const Principal()),
              ),
              icon: const Icon(
                Icons.arrow_back_ios_outlined,
                size: 18.0,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(right: 21),
            alignment: Alignment.topRight,
            child: IconButton(
              icon: const Icon(
                Icons.search,
                size: 35,
              ),
              onPressed: (() => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Search()))),
            ),
          )
        ],
      ),
    );
  }

  Widget _pokedexIcon() {
    return Container(
      child: Column(
        children: [
          Image.asset(
            'assets/images/pokedex.png',
            width: 100,
            height: 100,
          ),
          const Padding(
            padding: EdgeInsets.all(5.0),
            child: Text(
              "Pokedex",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget _futureBuilder() {
    return Expanded(
      child: FutureBuilder<List>(
        future: request,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text("Erro ao carregar os pokémons"),
            );
          }

          if (snapshot.hasData) {
            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final item = snapshot.data![index];

                  return createCard(item, userData);
                });
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
    );
  }
}
