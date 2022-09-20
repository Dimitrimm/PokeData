import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:poke_data/principal.dart';
import 'package:poke_data/search_page.dart';
import 'main.dart';
import 'versus_page.dart';


class Navbar extends StatefulWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {

  final List<Widget> telas = [
    Search(),
    const Principal(),
    const VersusPage()
  ];
  
  @override
  Widget build(BuildContext context) {

  int indiceAtual = 1;
  
  void onTabTapped(int index) {
    setState(() {
      Navigator.push(context, MaterialPageRoute(builder: (context) => TelaPrincipal()));

    });
  }
    return BottomNavigationBar(
          backgroundColor: Color(0xFFD9D9D9),
          showUnselectedLabels: false,
          showSelectedLabels: false,
          currentIndex: indiceAtual,
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
        );
  }
}