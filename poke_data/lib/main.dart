import 'package:flutter/material.dart';
import './navbar.dart';

void main() {
  runApp(const Main());
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
                      'assets/images/engrenagem.png',
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
                  Container(
                    width: 120,
                    child: Column(
                      children: [
                        Card(
                          shadowColor: Colors.blue,
                          child: Image.asset('assets/images/pokedex.png'),
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
                          child: Image.asset('assets/images/pokebolas.png'),
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
                          child: Image.asset('assets/images/estrela.png'),
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
                          child: Image.asset('assets/images/insignia.png'),
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

  navbar(){
    return BottomNavigationBar(
          backgroundColor: Color(0xFFD9D9D9),
          currentIndex: indiceAtual,
          onTap: onTabTapped,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                size: 48,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/pokebola.png',
                width: 48,
                height: 48,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/luta.png',
                width: 48,
                height: 48,
              ),
              label: '',
            ),
          ],
        );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Principal',
      home: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: navbar(),
        body: telas[indiceAtual],
      ),
    );
  }
}

