import 'package:flutter/material.dart';
import './main.dart';

void main() {
  runApp(new Pokedex());
}

class Pokedex extends StatefulWidget {
  const Pokedex({Key? key}) : super(key: key);

  @override
  State<Pokedex> createState() => _PokedexgetState();
}

class _PokedexgetState extends State<Pokedex> {
  final List<int> teste = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 
  20, 21, 22, 23, 24, 25];

  createCard(pokemon){
    return Card(
            child: Column(
              children: [
                ListTile(
                  leading: IconButton(onPressed: (){}, icon: const Icon(Icons.favorite_border)),
                  title: Column(
                    children: <Widget> [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Flexible(child: Text("Pokémon"), )
                          
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("${pokemon}"),
                        ],
                      )
                    
                    
                    ]
                  )
                ),
                Image.asset('assets/images/bullbasaur.png', width: 100, )
              ],
            )
        
          );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
      //   appBar: AppBar(
      //     title: Text('testando'),
      // ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 25.0, 0.0, 8.0),
              child: Image.asset('assets/images/pokedex.png', width: 100, height:100 ,),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Pokedex",
                style:  TextStyle(fontSize: 24, fontWeight: FontWeight.bold)
              )
            ),
            // Expanded(child:buildListView()),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: teste.length,
                itemBuilder: (context, index){
                  final item = teste[index];

                  return createCard(item);
                }
              )
            )
          ],
        ),
      )
    );
    
  }
}


  // buildListView(){
    // return ListView.builder(
      // itemCount: teste.length,
      // itemBuilder: (context, index ){
        // return Card(
          // child: ListTile(
            // title: Text('${teste[index]}'),
          // ),        
        // 
        // ); 
      // },
    // );
  // }



//  buildListView(){
    // return ListView.builder(
      // itemCount: teste.length,
      // itemBuilder: (context, index ){
        // return Card(
          // child: Column(
            // children: [
              // ListTile(
                // leading: Text('Teste'),
                // title: Text('${teste[index]}'),
              // ),
              // Image.asset('assets/img/bullbasaur.png', width: 80, )
            // ],
          // )
        // 
        // ); 
      // },
    // );
  // }


  // buildListView(){
  //   return ListView.builder(
  //     itemCount: teste.length,
  //     itemBuilder: (context, index ){
  //       return SizedBox(
  //         child:  Card(
  //           child: Column(
  //             children: [
  //               ListTile(
  //                 leading: IconButton(onPressed: (){}, icon: const Icon(Icons.favorite_border)),
  //                 title: Column(
  //                   children: <Widget> [
  //                     Row(
  //                       mainAxisAlignment: MainAxisAlignment.end,
  //                       children: [
  //                         Flexible(child: Text("Pokémon"), )
                          
  //                       ],
  //                     ),
  //                     Row(
  //                       mainAxisAlignment: MainAxisAlignment.end,
  //                       children: [
  //                         Text("${teste[index]}"),
  //                       ],
  //                     )
                    
                    
  //                   ]
  //                 )
  //               ),
  //               Image.asset('assets/img/bullbasaur.png', width: 80, )
  //             ],
  //           )
        
  //         ),
  //       );
  //     },
  //   );
  // }