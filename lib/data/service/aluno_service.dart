import 'package:chamada/data/api/aluno_api.dart';
import 'package:chamada/data/model/aluno.dart';

class AlunoService {
  final _alunoApi = AlunoApi();

  Future<Aluno> buscarAlunoPorUsuario(int usuarioId) async {
    try {
      final response = await _alunoApi.buscarAlunoPorUsuario(usuarioId);

      return Aluno.fromMap(response);
    } catch (e) {
      rethrow;
    }
  }
}
