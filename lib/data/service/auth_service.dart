import 'package:flutter/material.dart';

class AuthService extends ChangeNotifier {
  bool isAuthenticated = true;
  bool isAdmin = true;

  Future<bool> login(String usuario, String senha) async {
    if (usuario.isNotEmpty || senha.length > 5) {
      isAuthenticated = true;
    }

    if (usuario == 'admin' && senha == 'admin123') {
      isAdmin = true;
    }

    return isAuthenticated;
  }
}
