import 'package:flutter/material.dart';
import 'package:poke_data/login.dart';

void main() {
  runApp(const Cadastro());
}

class Cadastro extends StatefulWidget {
  const Cadastro({Key? key}) : super(key: key);

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.white,
          child: ListView(
            children: [
              Stack(
                children: [
                  const Center(
                    child: Text("PokeData", style: TextStyle(fontSize: 32)),
                  ),
                  IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(
                        Icons.arrow_back_ios_outlined,
                        size: 18.0,
                      ))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 154,
                height: 154,
                child: Image.asset('assets/images/pokebola.png'),
              ),
              const SizedBox(height: 20),
              const Center(child: Text('Register', style: TextStyle(fontSize: 24))),
              const SizedBox(height: 5),
              userField(),
              const SizedBox(
                height: 10,
              ),
              emailField(),
              const SizedBox(
                height: 10,
              ),
              passwordField(),
              const SizedBox(height: 30),
              const Padding(
                padding: EdgeInsets.only(
                  left: 40,
                  right: 40,
                ),
                child: Text(
                  'Choice your avatar:',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Container(
                          width: 80,
                          child: Image.asset('assets/images/jogador.png'))),
                  TextButton(
                      onPressed: () {},
                      child: Container(
                          width: 80,
                          child: Image.asset('assets/images/jogadora.png')))
                ],
              ),
              const SizedBox(height: 10),
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
                        onPressed: (() => Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Login(onSubmit: (_){},)))),
                        child: const Text(
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
            ],
          )),
    );
  }

  body() {
    return Container(
      color: Colors.white,
      child: ListView(children: [
        Stack(
          children: [
            const Center(
              child: Text("PokeData", style: TextStyle(fontSize: 32)),
            ),
            IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.arrow_back_ios_outlined,
                  size: 18.0,
                ))
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: 154,
          height: 154,
          child: Image.asset('assets/images/pokebola.png'),
        ),
        const SizedBox(height: 20),
        const Center(child: Text('Register', style: TextStyle(fontSize: 24))),
        const SizedBox(height: 5),
      ]),
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
            labelText: "User",
            labelStyle: TextStyle(
              color: Colors.black38,
              fontWeight: FontWeight.w400,
              fontSize: 16,
            )),
        style: const TextStyle(fontSize: 16),
      ),
    );
  }

  emailField() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 40,
        right: 40,
      ),
      child: TextFormField(
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
}
