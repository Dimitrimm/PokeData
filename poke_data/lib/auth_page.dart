import 'package:flutter/material.dart';
import 'package:poke_data/auth_services.dart';
import 'package:poke_data/form_data.dart';
import 'package:poke_data/loading.dart';
import 'package:poke_data/login.dart';
import 'package:poke_data/main.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool _isLoading = false;

  Future<void> handleSubmit(FormData formData) async{
    try {
      setState(() => _isLoading = true);

      if(formData.isLogin){
        await AuthService().login(formData.email, formData.password);
      }else{
        await AuthService().signup(formData.name, formData.email, formData.password);
      }
    } catch(error){
      
    } finally{
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Center(
          child: Login(onSubmit: handleSubmit),
        ),
        if (_isLoading)
          Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(0, 0, 0, 0.5)
            ),
            child: Center(
              child: CircularProgressIndicator()),
          )
      ]),
    );
  }
}
