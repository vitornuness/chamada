import 'dart:convert';

import 'package:chamada/data/api/api.dart';

class UsuarioApi extends Api {
  Future<Map<String, dynamic>> buscarUsuarioAutenticado() async {
    final uri = 'v1/usuario';

    try {
      final response = await get(uri);

      if (response.statusCode != 200) {
        throw Exception(response.body);
      }

      return jsonDecode(response.body);
    } catch (e) {
      rethrow;
    }
  }
}
