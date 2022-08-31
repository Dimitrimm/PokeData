import 'package:flutter/material.dart';
import './search_page.dart';

main() => runApp(const Config());

class Config extends StatefulWidget {
  const Config({Key? key}) : super(key: key);

  @override
  State<Config> createState() => _ConfigState();
}

class _ConfigState extends State<Config> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding:
              const EdgeInsets.only(top: 42, left: 22, right: 22, bottom: 22),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.keyboard_arrow_left),
                    onPressed: () {},
                  ),
                ],
              ),
              Image.asset(
                'assets/images/engrenagem.png',
                width: 110,
                height: 110,
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                'Configurações',
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 26,
              ),
              Expanded(
                child: ListView(
                  children: [
                    Button('Alterar apelido', Search()),
                    Button('Alterar email', Search()),
                    Button('Alterar senha', Search()),
                    ButtonT('Versão', '4.3.3'),
                    Button('Logout', Search()),
                  ],
                ),
              )

              /* Expanded(
              child: ListView.builder(
                itemCount: pikomons.length,
                itemBuilder: (context, index) {
                  return PokemonButtonMap(pikomons[index]);
                },
              ),
            ) */
            ],
          ),
        ),
      ),
    );
  }
}

class Button extends StatelessWidget {
  final String texto;
  final Widget onPress;

  Button(this.texto, this.onPress);

  @override
  Widget build(BuildContext context) {
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
              child: Text(
                texto,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 16.0, 0.0),
              child: IconButton(
                icon: const Icon(Icons.keyboard_arrow_right),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => onPress),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonT extends StatelessWidget {
  final String texto;
  final String texte;

  ButtonT(this.texto, this.texte);

  @override
  Widget build(BuildContext context) {
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
              child: Text(
                texto,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 26.0, 0.0),
              child: Text(
                texte,
                style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
