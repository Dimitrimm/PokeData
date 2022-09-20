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
                      onPressed: goBack, icon: const Icon(Icons.arrow_back_ios_new)
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
                    child: Text("Seus times:"),
                  ),
                ],
              ),

              Expanded(
                child: ListView.builder(
                  itemCount: time.length,
                  itemBuilder: (context, index) {
                    return TimeButtonMap(time[index]);
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
          child: RaisedButton(
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

 void goBack() {}
 void goAddTimes() {}
 void goTime() {}
}
