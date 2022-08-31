import 'package:flutter/material.dart';
import 'package:poke_data/login.dart';


void main() {
  runApp(const Cadastro());
}

class Cadastro extends StatelessWidget {
  const Cadastro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cadastro',
      home: Builder(
        builder: (context) => Scaffold(
          body: Container(
              padding: const EdgeInsets.only(
                top: 40,
                left: 40,
                right: 40,
              ),
              color: Colors.white,
              child: ListView(
                children: [
                  Center(
                    child: Text("PokeData", style: TextStyle(fontSize: 32)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 154,
                    height: 154,
                    child: Image.asset('images/pokebola.png'),
                  ),
                  const SizedBox(height: 20),
                  Center(
                      child: Text('Registro', style: TextStyle(fontSize: 24))),
                  const SizedBox(height: 30),
                  TextFormField(
                    autofocus: true,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                        labelText: "Usuario",
                        labelStyle: TextStyle(
                          color: Colors.black38,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        )),
                    style: const TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    autofocus: true,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                        labelText: "Email",
                        labelStyle: TextStyle(
                          color: Colors.black38,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        )),
                    style: const TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    autofocus: true,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                        labelText: "Senha",
                        labelStyle: TextStyle(
                          color: Colors.black38,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        )),
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 30),
                  Column(
                    children: [
                      Container(
                        height: 40,
                        width: 100,
                        // alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: SizedBox.expand(
                          child: TextButton(
                            onPressed: (() => Navigator.push(context, MaterialPageRoute(builder: (context) => Login()))),
                            child: Text(
                              'Sign up',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              )),
        ),
      ),
    );
  }
}
