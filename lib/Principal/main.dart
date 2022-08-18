import 'package:flutter/material.dart';

void main() {
  runApp(const Main());
}

class PokedexInterface {
  pokedex() {}
}

class TeamsInterface {
  teams() {}
}

class FavInterface {
  fav() {}
}

class SocialInterface {
  social() {}
}

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class Pesquisa extends StatelessWidget {
  const Pesquisa({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Parte da Pesquisa'));
  }
}

class Versus extends StatelessWidget {
  const Versus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Parte do Versus'));
  }
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
              Container(
                  padding: const EdgeInsets.only(left: 21),
                  alignment: Alignment.topLeft,
                  child: TextButton(
                    onPressed: null,
                    child: SizedBox(
                        child: Image.asset(
                      'images/engrenagem.png',
                      width: 32,
                      height: 32,
                    )),
                  )),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                width: 88,
                height: 88,
                child: Image.asset('images/usuario.png'),
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
                  Container(
                    width: 120,
                    child: Column(
                      children: [
                        Card(
                          shadowColor: Colors.blue,
                          child: Image.asset('images/pokedex.png'),
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
                        Card(
                          child: Image.asset('images/teams.png'),
                        ),
                        const SizedBox(
                          child: Text('Teams'),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 120,
                    child: Column(
                      children: [
                        Card(
                          child: Image.asset('images/favoritos.png'),
                        ),
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
                        Card(
                          child: Image.asset('images/social.png'),
                        ),
                        const SizedBox(
                          child: Text('Social'),
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

class _MainState extends State<Main> {
  int indiceAtual = 1;
  final List<Widget> telas = [
    const Pesquisa(),
    const Principal(),
    const Versus()
  ];

  void onTabTapped(int index) {
    setState(() {
      indiceAtual = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Principal',
      home: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color(0xFFD9D9D9),
          currentIndex: indiceAtual,
          onTap: onTabTapped,
          // ignore: prefer_const_literals_to_create_immutables
          items: [
            // ignore: prefer_const_constructors
            BottomNavigationBarItem(
              // ignore: prefer_const_constructors
              icon: Icon(
                Icons.search,
                size: 48,
              ),
              label: '',
            ),
            // ignore: prefer_const_constructors
            BottomNavigationBarItem(
              // ignore: prefer_const_constructors
              icon: Image.asset(
                'images/pokebola.png',
                width: 48,
                height: 48,
              ),
              label: '',
            ),
            // ignore: prefer_const_constructors
            BottomNavigationBarItem(
              // ignore: prefer_const_constructors
              icon: Image.asset(
                'images/versus.png',
                width: 48,
                height: 48,
              ),
              label: '',
            ),
          ],
        ),
        body: telas[indiceAtual],
      ),
    );
  }
}
