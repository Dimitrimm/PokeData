import 'package:flutter/material.dart';

void main() {
  runApp(const Loading());
}

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Loading',
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("PokeData", style: TextStyle(fontSize: 36),),
              const SizedBox(height: 10,),
              Image.asset('assets/images/pokebola.png', width: 300,)
          ],)
        ),
      ),
    );
    
  }
}

