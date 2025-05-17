import 'package:chamada/data/api/usuario_api.dart';
import 'package:chamada/data/model/usuario.dart';

class UsuarioService {
  final _usuarioApi = UsuarioApi();

  Future<Usuario> buscarUsuarioAutenticado() async {
    try {
      final response = await _usuarioApi.buscarUsuarioAutenticado();

      return Usuario.fromMap(response);
    } catch (e) {
      rethrow;
    }
  }
}
