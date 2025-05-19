import 'package:chamada/data/api/chamada_api.dart';
import 'package:chamada/data/model/registro.dart';

class ChamadaService {
  final _chamadaApi = ChamadaApi();

  Future<Registro> buscarChamadaAtualAluno(int alunoId) async {
    try {
      final response = await _chamadaApi.buscarChamadaAtualAluno(alunoId);

      return Registro.fromMap(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> enviarTokenSala(
    int alunoId,
    int reservaId,
    String tokenSala,
    int timestamp,
  ) async {
    try {
      await _chamadaApi.enviarTokenSala(
        alunoId,
        reservaId,
        tokenSala,
        timestamp,
      );

      return true;
    } catch (e) {
      rethrow;
    }
  }
}
