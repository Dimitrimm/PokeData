import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import './favButtonMap.dart';
import './pokemons.dart';

main() => runApp(const FavoritesPage());

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Favorite(),
    );
  }
}

class Favorite extends StatefulWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  var userData;
  var userID;

  
  @override
  void initState() {
    // request = fetch();
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
    final ref = FirebaseDatabase.instance.ref('users/${id}/favorites');
    final snapshot = await ref.get();
    if (snapshot.exists) {
      setState(() {
        userData = snapshot.value;
      });
    } else {
      print('No data available.');
    }
  }

  final pikomons = pokemons;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.only(top: 42, left: 22, right: 22),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _favoritesLogo(),
                _pokemonsListView(),
                const SizedBox(
                  height: 20,
                ),
              ],
            )));
  }

  _favoritesLogo() {
    // List lista = [];
    // var teste = Map<String, dynamic>.from(userData);
    // teste.forEach((key, value) { 
    //   if (key != "idP")
    //     lista.add(key);
    // });
    // var t = teste.toString();
    // l = t.split(':');
    // print(lista);

    // for(var i in userData){
    //   print(userData[i]);
    // }
    return Stack(children: [
      SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 60,
              ),
              Image.asset(
                "assets/images/estrela.png",
                height: 100,
                width: 100,
              ),
              const Text(
                "Favoritos",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              )
            ],
          )),
      IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_outlined,
            size: 18.0,
          ))
    ]);
  }

  _pokemonsListView() {
    List lista = [];
    var teste;
    if(userData != null){
      teste = Map<dynamic, dynamic>.from(userData);
      teste.forEach((key, value) { 
        if (key != "idP")
          lista.add(key);
      });
    }
    return Expanded(
      child: ListView.builder(
          itemCount: lista.length,
          itemBuilder: (context, index) {
            // print(lista[index]);
            // print(userData['1'].runtimeType);
            // print(pokemons[1]);
            return FavButtonMap(userData[lista[index]], lista[index]);
          }),
    );
  }
}
