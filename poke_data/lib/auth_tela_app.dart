import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:poke_data/auth_firebase_services.dart';
import 'package:poke_data/auth_page.dart';
import 'package:poke_data/auth_services.dart';
import 'package:poke_data/loading.dart';
import 'package:poke_data/principal.dart';
import 'package:poke_data/usuario.dart';

class AuthOrAppPage extends StatelessWidget {
  const AuthOrAppPage({Key? key}) : super(key: key);

  Future<void> init(BuildContext context) async{
    await Firebase.initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: init(context),
      builder: (ctx, snapshot){
         if(snapshot.connectionState == ConnectionState.waiting){
              return const Loading();
            }else{
              return StreamBuilder<Usuario?>(
                stream: AuthService().userChanges,
                builder: (ctx, snapshot){
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return const Loading();
                  }else{
                    return snapshot.hasData ? TelaPrincipal() : const AuthPage();
                  }
                },
              );

            }
      },
    );
  }
}