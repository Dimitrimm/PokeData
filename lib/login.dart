import 'package:flutter/material.dart';
import 'package:telas/cadastro.dart';
import 'package:telas/principal.dart';

void main() {
  runApp(const Login());
}

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _MyAppState();
}

class _MyAppState extends State<Login> {

  body() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 40,
        left: 40,
        right: 40,
      ),
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
          const SizedBox(height: 30),
          TextFormField(
            autofocus: true,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
                labelText: "Email/Usuario",
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
          Column(children: [
            Container(
              height: 40,
              width: 100,
              // alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: SizedBox.expand(
                child: TextButton(
                  onPressed: (() => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Cadastro()))),
                  child: const Text(
                    'Sign in',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Text("Or", style: TextStyle(fontSize: 16)),
            ),
            const SizedBox(height: 10),
            Container(
              width: 100,
              height: 40,
              decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              alignment: Alignment.center,
              child: SizedBox.expand(
                child: TextButton(
                    onPressed: (() => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Main()))),
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )),
              ),
            ),
          ]),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Loading',
      home: Builder(
        builder: (context) => Scaffold(
          body: body()
        ),
      ),
    );
  }
}
