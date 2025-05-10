import 'package:chamada/data/model/usuario.dart';
import 'package:chamada/data/service/preferences_service.dart';
import 'package:flutter/material.dart';

class AuthViewModel extends ChangeNotifier {
  final _preferencesService = PreferencesService.instance;
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
      nome: 'Vitor',
      ehAdmin: false,
    ),
    Usuario(
      id: 3,
      usuario: '654321',
      senha: 'aluno654321',
      nome: 'Maycon',
      ehAdmin: false,
    ),
  ];
  Usuario? _usuarioAutenticado;

  List<Usuario> get getListaUsuarios => _listaUsuarios;

  Usuario? get getUsuarioAutenticado {
    return _usuarioAutenticado ??
        _listaUsuarios
            .where((u) => u.id == (_preferencesService.getTokenUsuario()))
            .firstOrNull;
  }

  Future<bool> adicionarUsuario(Usuario novoUsuario) async {
    if (await findUsuario(novoUsuario.id!) != null) {
      return false;
    }

    novoUsuario = novoUsuario.copyWith(
      id: getId(),
      usuario: novoUsuario.usuario,
      senha: novoUsuario.senha,
      nome: novoUsuario.nome,
      ehAdmin: novoUsuario.ehAdmin,
    );
    _listaUsuarios.add(novoUsuario);
    notifyListeners();
    return true;
  }

  Future<bool> login(String usuario, String senha) async {
    if (usuario.isEmpty || senha.length < 5) {
      return false;
    }

    _usuarioAutenticado =
        _listaUsuarios
            .where((u) => u.usuario == usuario && u.senha == senha)
            .firstOrNull;

    if (_usuarioAutenticado != null) {
      _preferencesService.setTokenUsuario(_usuarioAutenticado!.id!);
    }

    return _usuarioAutenticado != null;
  }

  Future<Usuario?> findUsuario(int id) async {
    return _listaUsuarios.where((u) => u.id == id).firstOrNull;
  }

  int getId() {
    int id = 1;
    if (_listaUsuarios.isEmpty) return id;

    for (var s in _listaUsuarios) {
      if (s.id! >= id) {
        id = s.id! + 1;
      }
    }

    return id;
  }
}
