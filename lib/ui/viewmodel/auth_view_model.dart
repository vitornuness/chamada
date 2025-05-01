import 'package:chamada/data/model/usuario.dart';
import 'package:flutter/material.dart';

class AuthViewModel extends ChangeNotifier {
  final List<Usuario> _listaUsuarios = [
    Usuario(
      id: 1,
      usuario: 'admin',
      senha: 'admin123',
      nome: 'Administrador',
      ehAdmin: true,
    ),
    Usuario(
      id: 2,
      usuario: '123456',
      senha: 'aluno123456',
      nome: 'Aluno',
      ehAdmin: false,
    ),
  ];
  Usuario? _usuarioAutenticado;

  List<Usuario> get getListaUsuarios => _listaUsuarios;
  Usuario? get getUsuarioAutenticado => _usuarioAutenticado;

  Future<bool> login(String usuario, String senha) async {
    if (usuario.isEmpty || senha.length < 5) {
      return false;
    }

    _usuarioAutenticado =
        _listaUsuarios
            .where((u) => u.usuario == usuario && u.senha == senha)
            .firstOrNull;

    return _usuarioAutenticado != null;
  }
}
