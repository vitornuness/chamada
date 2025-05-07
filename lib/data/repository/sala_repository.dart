import 'package:chamada/data/database/dao/sala_dao.dart';
import 'package:chamada/data/model/sala.dart';
import 'package:chamada/data/repository/crud_repository.dart';

class SalaRepository extends CrudRepository<Sala> {
  SalaRepository(): super(SalaDao());
}