import 'package:chamada/data/database/dao/base_dao.dart';
import 'package:chamada/data/model/turma.dart';

class TurmaDao extends BaseDao<Turma> {
 TurmaDao(): super('turma', Turma.fromMap); 
}