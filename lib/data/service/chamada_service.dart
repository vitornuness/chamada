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
}
