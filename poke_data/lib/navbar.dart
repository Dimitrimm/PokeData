import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import './principal.dart';

class Navbar extends StatefulWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {

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
                'images/pokebola.png',
                width: 48,
                height: 48,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'images/versus.png',
                width: 48,
                height: 48,
              ),
              label: '',
            ),
          ],
        );
  }
}