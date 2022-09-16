import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:poke_data/auth_page.dart';
import 'package:poke_data/auth_services.dart';
import 'package:poke_data/cadastro.dart';
import 'package:poke_data/form_data.dart';
import 'package:poke_data/main.dart';

void main() {
  runApp(AuthPage());
}

class Login extends StatefulWidget {
  final void Function(FormData) onSubmit;

  const Login({
    Key? key,
    required this.onSubmit,
    }) : super(key: key);

  @override
  State<Login> createState() => _MyAppState();
}

class _MyAppState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _formData = FormData();

  void _submit(){
    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) return;

    widget.onSubmit(_formData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            body: ListView(
          children: [
            SizedBox(height: 10),
            body(),
            Column(children: [
              if (_formData.isSignup)
                Padding(
                  padding: const EdgeInsets.only(
                    left: 40,
                    right: 40,
                  ),
                  child: Text(
                    'Choice your avatar:',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              if (_formData.isSignup) avatar(),
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
                    onPressed: (() {
                      _submit();
                    }),
                    child: Text(
                      _formData.isLogin ? 'Sign in' : 'Sign up',
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
                      onPressed: (() => setState(() {
                            _formData.toggleMode();
                          })),
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => Cadastro()))),
                      child: Text(
                        _formData.isLogin ? 'Sign up' : 'Login page',
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

  avatar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
            onPressed: () {},
            child: Container(
                width: 80, child: Image.asset('assets/images/jogador.png'))),
        TextButton(
            onPressed: () {},
            child: Container(
                width: 80, child: Image.asset('assets/images/jogadora.png')))
      ],
    );
  }

  user_emailField() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 40,
        right: 40,
      ),
      child: TextFormField(
        key: ValueKey('user/email'),
        onChanged: (email) => _formData.email = email,
        autofocus: true,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            labelText: _formData.isLogin ? "User/Email" : "Email",
            labelStyle: TextStyle(
              color: Colors.black38,
              fontWeight: FontWeight.w400,
              fontSize: 16,
            )),
        validator: (_email) {
          final email = _email ?? '';
          if (!email.contains('@')){
            return 'This is not a valid email address';
          }
          return null;
        },
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
        onChanged: (pass) => _formData.password = pass,
        key: ValueKey('password'),
        obscureText: true,
        autofocus: true,
        initialValue: _formData.password,
        decoration: const InputDecoration(
            labelText: "Password",
            labelStyle: TextStyle(
              color: Colors.black38,
              fontWeight: FontWeight.w400,
              fontSize: 16,
            )),
        validator: (_password) {
          final password = _password ?? '';
          if (password.length < 6){
            return 'Pasword must be at least 6 characters long';
          }
          return null;
        },
        style: const TextStyle(fontSize: 16),
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
        onChanged: (user) => _formData.name = user,
        key: ValueKey('user'),
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
        const SizedBox(height: 10),
        Form(
          key: _formKey,
          child: Column(
            children: [
        if (_formData.isSignup) userField(),
        SizedBox(height: 10),
        user_emailField(),
        SizedBox(
          height: 10,
        ),
        passwordField(),
        const SizedBox(height: 30),

            ],
        ),)
      ],
    );
  }
}
