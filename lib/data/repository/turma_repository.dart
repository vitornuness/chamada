import 'package:chamada/data/database/dao/turma_dao.dart';
import 'package:chamada/data/model/turma.dart';
import 'package:chamada/data/repository/crud_repository.dart';

class TurmaRepository extends CrudRepository<Turma> {
  TurmaRepository() : super(TurmaDao());
}
