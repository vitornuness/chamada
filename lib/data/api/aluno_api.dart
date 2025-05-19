import 'dart:convert';

import 'package:chamada/data/api/api.dart';

class AlunoApi extends Api {
  Future<Map<String, dynamic>> buscarAlunoPorUsuario(int usuarioId) async {
    final uri = 'v1/aluno';

    try {
      final response = await get(uri, params: {'usuarioId': usuarioId});

      if (response.statusCode != 200) {
        throw Exception(response.body);
      }

      return jsonDecode(response.body);
    } catch (e) {
      rethrow;
    }
  }
}
