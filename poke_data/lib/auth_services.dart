import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:poke_data/auth_firebase_services.dart';
import 'package:poke_data/usuario.dart';

abstract class AuthService {
  Usuario? get currentUser;

  Stream<Usuario?> get userChanges;

  Future<void> signup(
    String name,
    String email,
    String password,
  );

  Future<void> login(
    String email,
    String password,
  );
  Future<void> logout();

  factory AuthService() {
    return AuthFireBaseService();
  }
}