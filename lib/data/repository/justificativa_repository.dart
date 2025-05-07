import 'package:chamada/data/database/dao/justificativa_dao.dart';
import 'package:chamada/data/model/justificativa.dart';
import 'package:chamada/data/repository/crud_repository.dart';

class JustificativaRepository extends CrudRepository<Justificativa> {
  JustificativaRepository() : super(JustificativaDao());
}
