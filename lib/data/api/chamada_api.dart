import 'dart:convert';

import 'package:chamada/data/api/api.dart';

class ChamadaApi extends Api {
  Future<Map<String, dynamic>> buscarChamadaAtualAluno(int alunoId) async {
    final uri = 'v1/chamada/aluno/$alunoId/atual';

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

  Future<void> enviarTokenSala(
    int alunoId,
    int reservaId,
    String tokenSala,
    int timestamp,
  ) async {
    final uri = 'v1/chamada/registrar';

    try {
      final response = await post(
        uri,
        jsonEncode({
          'idAluno': alunoId,
          'idHorario': reservaId,
          'tokenSala': tokenSala,
          'timestamp': timestamp,
        }),
      );

      if (response.statusCode != 200) {
        throw Exception(response.body);
      }
    } catch (e) {
      rethrow;
    }
  }
}
