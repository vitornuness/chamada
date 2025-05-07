import 'package:chamada/data/database/dao/registro_dao.dart';
import 'package:chamada/data/model/registro.dart';
import 'package:chamada/data/repository/crud_repository.dart';

class RegistroRepository extends CrudRepository<Registro> {
  RegistroRepository(): super(RegistroDao());
}