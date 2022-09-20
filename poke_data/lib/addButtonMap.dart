import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:poke_data/pokemon_info.dart';

class AddButtonMap extends StatefulWidget {
  final Map pikomons;

  const AddButtonMap(this.pikomons, {Key? key}) : super(key: key);

  @override
  State<AddButtonMap> createState() => _AddButtonMapState();
}

class _AddButtonMapState extends State<AddButtonMap> {
  var userID;
  var times = 1;


  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        userID = user.uid;
      }
    });
  }

  salvar(pokemon, id) {
    final ref = FirebaseDatabase.instance.ref('users/${id}/teams/teams$times');
    ref.update(
      {
        pokemon['id']: pokemon['name'],
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => salvar(widget.pikomons, userID),
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
                      'https://raw.githubusercontent.com/Dimitrimm/pokemonAssets/master/${widget.pikomons["img"]}.png',
                      width: 56,
                      height: 56,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.pikomons['name'].toString(),
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        textAlign: TextAlign.left,
                      ),
                      Text(widget.pikomons['typing'].toString(),
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
                      '#${_dexNumber(widget.pikomons['pokedex_number'].toString())}')),
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
