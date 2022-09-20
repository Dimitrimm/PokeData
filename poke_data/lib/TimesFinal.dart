import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import './TimeButtonMap.dart';
import './pokemons.dart';
import './search_page.dart';
import './TelaAddTime.dart';

main() => runApp(ViewTimes());

class ViewTimes extends StatefulWidget {
  const ViewTimes({Key? key}) : super(key: key);

  @override
  State<ViewTimes> createState() => _ViewTimesState();
}

class _ViewTimesState extends State<ViewTimes> {
  final time = pokemons;
  var userID;
  var userData;
  var times = 1;

   @override
  void initState() {
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
    final ref = FirebaseDatabase.instance.ref('users/${id}/teams/teams$times');
    final snapshot = await ref.get();
    if (snapshot.exists) {
      setState(() {
        userData = snapshot.value;
      });
    } else {
      print('No data available.');
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back_ios_new)
                      ),
                    IconButton(
                      onPressed: (() => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NovoTeam()))), icon: const Icon(Icons.add_sharp),
                    ),
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
                'Teams',
                style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),

              const SizedBox(
                height: 32,
              ),


              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Text("Seus times:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                  ),
                ],
              ),

              Expanded(
                child: ListView.builder(
                  itemCount: times,
                  itemBuilder: (context, index) {
                    return body();
                  },
                ),
              )
            ],
          ),
        )
    );
  }

 CreateCardTime(texto) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 200, 
          height: 200, 
          child: ElevatedButton(
            child: Padding(
              padding: const EdgeInsets.only(left: 16, top: 8, right: 16, bottom: 8),
                child: Column(  
                  children: [
                    Text(texto),
                    ],
                  ),
                ),
            onPressed: (){})),
      ),
    );
 }

 body(){
  List lista = [];
    var teste;
    if(userData != null){
      teste = Map<dynamic, dynamic>.from(userData);
      teste.forEach((key, value) { 
        if (key == "nome")
          lista.add(value);
      });
    }
  return GestureDetector(
      onTap: () {
        print('oi');
      },
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
                    child: Image.asset(
                      'assets/images/valentia.png',
                      width: 56,
                      height: 56,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        lista[0],
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
 }

}
