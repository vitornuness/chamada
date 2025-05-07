import 'package:chamada/data/database/dao/base_dao.dart';
import 'package:chamada/data/model/sala.dart';

class SalaDao extends BaseDao<Sala> {
  SalaDao() : super('sala', Sala.fromMap);
}
