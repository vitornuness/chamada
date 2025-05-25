import 'package:chamada/data/database/dao/base_dao.dart';
import 'package:chamada/data/model/usuario.dart';

class UsuarioDao extends BaseDao<Usuario> {
 UsuarioDao(): super('usuario', Usuario.fromMap);
}
