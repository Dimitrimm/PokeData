import 'package:flutter/material.dart';
import 'package:poke_data/cadastro.dart';
import 'package:poke_data/main.dart';

void main() {
  runApp(const Login());
}

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _MyAppState();
}

class _MyAppState extends State<Login> {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Loading',
      home: Builder(
        builder: (context) => Scaffold(
            body: ListView(
          children: [
            SizedBox(height: 50),
            body(),
            Column(children: [
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
                    onPressed: (() => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TelaPrincipal(1)))),
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
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                alignment: Alignment.center,
                child: SizedBox.expand(
                  child: TextButton(
                      onPressed: (() => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Cadastro()))),
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
        )),
      ),
    );
  }

  userField() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 40,
        right: 40,
      ),
      child: TextFormField(
        autofocus: true,
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
            labelText: "User/Email",
            labelStyle: TextStyle(
              color: Colors.black38,
              fontWeight: FontWeight.w400,
              fontSize: 16,
            )),
        style: const TextStyle(fontSize: 16),
      ),
    );
  }

  passwordField() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 40,
        right: 40,
      ),
      child: TextFormField(
        autofocus: true,
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
            labelText: "Password",
            labelStyle: TextStyle(
              color: Colors.black38,
              fontWeight: FontWeight.w400,
              fontSize: 16,
            )),
        style: const TextStyle(fontSize: 16),
      ),
    );
  }

  body() {
    return Column(
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
          child: Image.asset('assets/images/pokebola.png'),
        ),
        const SizedBox(height: 30),
        userField(),
        SizedBox(
          height: 10,
        ),
        passwordField(),
        const SizedBox(height: 30),
      ],
    );
  }
}
