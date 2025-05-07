import 'package:chamada/data/database/dao/base_dao.dart';
import 'package:chamada/data/model/aluno.dart';

class AlunoDao extends BaseDao<Aluno> {
  AlunoDao() : super('aluno', Aluno.fromMap);
}
