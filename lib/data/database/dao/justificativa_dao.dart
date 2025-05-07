import 'package:chamada/data/database/dao/base_dao.dart';
import 'package:chamada/data/model/justificativa.dart';

class JustificativaDao extends BaseDao<Justificativa> {
  JustificativaDao() : super('justificativa', Justificativa.fromMap);
}