import 'package:flutter/material.dart';
import 'package:poke_data/principal.dart';
import 'package:poke_data/versus_page.dart';
import 'main.dart';
import './search_page.dart';

void main() {
  runApp(Navbar());
}

class Navbar extends StatefulWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  final List<Widget> telas = [
    Search(),
    const Principal(),
    const VersusPage(),
  ];
  int indiceAtual = 0;

  @override
  Widget build(BuildContext context) {
    @override
    void initState() {
      // TODO: implement initState
      super.initState();
      indiceAtual = 1;
    }

    void onTabTapped(int index) {
      setState(() {
        indiceAtual = index;
      });
    }

    return MaterialApp(
      home: Scaffold(
          body: telas[indiceAtual],
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
            currentIndex: indiceAtual,
            showUnselectedLabels: false,
            showSelectedLabels: false,
            onTap: onTabTapped,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                  size: 40,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/images/pokebola.png',
                  width: 40,
                  height: 40,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/images/luta.png',
                  width: 40,
                  height: 40,
                ),
                label: '',
              ),
            ],
          )),
    );
  }
}
