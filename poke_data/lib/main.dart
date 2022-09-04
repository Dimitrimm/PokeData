import 'package:flutter/material.dart';
import 'package:poke_data/config_page.dart';
import 'package:poke_data/favorites_page.dart';
import 'package:poke_data/pokedex.dart';
import 'package:poke_data/search_page.dart';
import 'package:poke_data/social_page.dart';
import 'package:poke_data/versus_page.dart';
import './navbar.dart';

void main() {
  runApp(TelaPrincipal(1));
}

class Principal extends StatelessWidget {
  const Principal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(
          top: 60,
        ),
        child: Center(
          child: Column(
            children: [

              const SizedBox(
                height: 16,
              ),
              SizedBox(
                width: 88,
                height: 88,
                child: Image.asset('assets/images/jogador.png'),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                'User',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 120,
                    child: Column(
                      children: [
                        TextButton(
                          onPressed: (() => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Pokedex()))),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 10,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Image.asset('assets/images/pokedex.png'),
                            ),
                          ),
                        ),
                        const SizedBox(
                          child: Text('Pokedex'),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  SizedBox(
                    width: 120,
                    child: Column(
                      children: [
                        TextButton(
                            onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Pokedex())),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 10,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child:
                                    Image.asset('assets/images/pokebolas.png'),
                              ),
                            )),
                        const SizedBox(
                          child: Text('Teams'),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                SizedBox(
                  width: 120,
                  child: Column(
                    children: [
                      TextButton(
                          onPressed: (() => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Favorite()))),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 10,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Image.asset('assets/images/estrela.png'),
                            ),
                          )),
                      const SizedBox(
                        child: Text('Favorites'),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                SizedBox(
                  width: 120,
                  child: Column(
                    children: [
                      TextButton(
                          onPressed: (() => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SocialPage()))),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 10,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Image.asset('assets/images/insignia.png'),
                            ),
                          )),
                      const SizedBox(
                        child: Text('Social'),
                      )
                    ],
                  ),
                ),
              ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      // color: Colors.green,
                    ),
                    width: 120,
                    child: Column(
                      children: [
                        TextButton(
                            onPressed: (() => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => VersusPage()))),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 10,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              // shadowColor: Colors.blue,
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Image.asset('assets/images/luta.png'),
                              ),
                            )),
                        const SizedBox(
                          child: Text('Versus'),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  SizedBox(
                    width: 120,
                    child: Column(
                      children: [
                        TextButton(
                            onPressed: (() => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Config()))),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 10,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child:
                                    Image.asset('assets/images/engrenagem.png'),
                              ),
                            )),
                        const SizedBox(
                          child: Text('Configurações'),
                        )
                      ],
                    ),
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

class TelaPrincipal extends StatelessWidget {
  int indiceAtual;

  TelaPrincipal(this.indiceAtual);

  final List<Widget> telas = [Search(), const Principal(), const VersusPage()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Principal',
      home: Scaffold(
        backgroundColor: Colors.white,
        // bottomNavigationBar: Navbar(),
        body: telas[indiceAtual],
      ),
    );
  }
}
