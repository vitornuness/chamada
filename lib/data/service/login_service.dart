import 'package:chamada/data/api/login_api.dart';
import 'package:chamada/data/model/usuario.dart';
import 'package:chamada/data/repository/usuario_repository.dart';
import 'package:chamada/data/service/preferences_service.dart';
import 'package:flutter/material.dart';

class LoginService extends ChangeNotifier {
  final _preferencesService = PreferencesService.instance;
  final _loginApi = LoginApi();
  final _usuarioRepository = UsuarioRepository();
  bool isAuthenticated = false;
  bool isAdmin = false;

  Future<bool> login(String usuario, String senha) async {
    if (usuario.isNotEmpty || senha.length > 5) {
      isAuthenticated = true;
    }

    final response = await _loginApi.login(usuario, senha);
    final token = response['token'];

    if (token == null) return false;

    await _salvarToken(token);
    await _salvarDadosLogin(usuario, senha);

    return true;
  }

  Future<void> _salvarToken(String token) async {
    await _preferencesService.setTokenIdentificacao(token);
  }

  Future<void> _salvarDadosLogin(String usuario, String senha) async {
    final dadosUsuario = Usuario(
      id: 1,
      usuario: usuario,
      senha: senha,
      nome: '',
      ehAdmin: false,
    );
    await _usuarioRepository.adicionar(dadosUsuario);
  }
}
