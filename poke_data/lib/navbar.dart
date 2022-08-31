import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'main.dart';

class Navbar extends StatefulWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {

  final List<Widget> telas = [
    const Pesquisa(),
    const Principal(),
    const Versus()
  ];
  
  @override
  Widget build(BuildContext context) {

  int indiceAtual = 1;
  
  void onTabTapped(int index) {
    setState(() {
      indiceAtual = index;
    });
  }
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
}