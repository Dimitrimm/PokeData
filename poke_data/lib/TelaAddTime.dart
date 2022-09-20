import 'package:flutter/material.dart';
import './TimeButtonMap.dart';
import './pokemons.dart';
import './search_page.dart';

main() => runApp(NovoTeam());

class NovoTeam extends StatefulWidget {
  const NovoTeam({Key? key}) : super(key: key);

  @override
  State<NovoTeam> createState() => _NovoTeamState();
}

class _NovoTeamState extends State<NovoTeam> {
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
              children: [
                IconButton(
                      onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back_ios_new)
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
              'New Team',
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
                Text("Team name:"),
              ],
            ),
            Column(
              children: [TextField(
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

  _AddPokemonTime(texto) {
    return Padding(
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
    );
  }

  void goBack() {}
}
