import 'package:chamada/data/database/dao/aluno_dao.dart';
import 'package:chamada/data/model/aluno.dart';
import 'package:chamada/data/repository/crud_repository.dart';

class AlunoRepository extends CrudRepository<Aluno> {
  AlunoRepository() : super(AlunoDao());
}
