import 'package:chamada/data/database/dao/usuario_dao.dart';
import 'package:chamada/data/model/usuario.dart';
import 'package:chamada/data/repository/crud_repository.dart';

class UsuarioRepository extends CrudRepository<Usuario> {
  UsuarioRepository(): super(UsuarioDao());
}