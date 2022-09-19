import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:poke_data/auth_services.dart';
import 'package:poke_data/usuario.dart';
import 'dart:async';
import 'dart:convert';

class AuthFireBaseService implements AuthService {
  static Usuario? _currentUser;
  
  static final _userStream = Stream<Usuario?>.multi((controller) async {
    final authChanges = FirebaseAuth.instance.authStateChanges();
    await for (final user in authChanges) {
      _currentUser = user == null ? null : _toUsuario(user);
      controller.add(_currentUser);
    }
  });

  Usuario? get currentUser {
    return _currentUser;
  }

  Stream<Usuario?> get userChanges {
    return _userStream;
  }

  Future<void> signup(
    String name,
    String email,
    String password,
  ) async {
    final auth = FirebaseAuth.instance;
    UserCredential credencial = await auth.createUserWithEmailAndPassword(
        email: email, password: password);
    if (credencial.user == null) return;

    credencial.user?.updateDisplayName(name);
    saveUser();
  }

  Future<void> login(
    String email,
    String password,
  ) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    saveUser();
  }

  Future<void> logout() async {
    FirebaseAuth.instance.signOut();
  }

  Future<void> saveUser() async{
    String userUid = _currentUser!.id;
    DatabaseReference ref = FirebaseDatabase.instance.ref("users/$userUid");
    await ref.set({
      "name": _currentUser!.name,
      "img": 1,
      "favorites": '',
    });

    //recuperando dados
    ref.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value;
      final save = data as List;
      print(save);
    });
      // print(userUid);

    
      // final snapshot = await ref.get();
      // if (snapshot.exists) {
      //     print(snapshot.value);
      // } else {
      //     print('No data available.');
      // };

  }

  static Usuario _toUsuario(User user) {
    return Usuario(
      id: user.uid,
      name: user.displayName ?? user.email!.split('@')[0],
      email: user.email!,
    );
  }
}

// class DataBaseUser {
//   uid
//   void Function(){}
// }
