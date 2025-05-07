import 'package:chamada/data/database/dao/base_dao.dart';
import 'package:chamada/data/model/registro.dart';

class RegistroDao extends BaseDao<Registro> {
  RegistroDao() : super('registro', Registro.fromMap);
}