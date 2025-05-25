import 'package:chamada/data/api/login_api.dart';
import 'package:chamada/data/api/usuario_api.dart';
import 'package:chamada/data/database/dao/usuario_dao.dart';
import 'package:chamada/data/model/usuario.dart';
import 'package:chamada/data/repository/crud_repository.dart';
import 'package:chamada/data/service/preferences_service.dart';

class UsuarioRepository extends CrudRepository<Usuario> {
  final _usuarioApi = UsuarioApi();
  final _loginApi = LoginApi();
  final _preferenceService = PreferencesService.instance;

  UsuarioRepository() : super(UsuarioDao());

  Future<Usuario?> getUsuarioAutenticado() async {
    try {
      // var response = await _usuarioApi.buscarUsuarioAutenticado();
      final response = {
        'usuario': '1888888',
        'senha': '',
        'nome': 'Fulano',
        'ehAdmin': false,
      };
      return Usuario.fromMap(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> login(String usuario, String senha) async {
    try {
      // var response = await _loginApi.login(usuario, senha);
      final response = {'token': 'HJsdad7a8sdahdsaudhSDads8ad'};
      await _preferenceService.setTokenIdentificacao(response['token']!);
    } catch (e) {
      rethrow;
    }
  }
}
