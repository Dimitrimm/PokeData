import 'package:flutter/material.dart';
import 'package:poke_data/auth_tela_app.dart';

void main(){;
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AuthOrAppPage(),
    );
  }
}