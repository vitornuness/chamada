import 'package:chamada/data/database/dao/base_dao.dart';
import 'package:chamada/data/model/model.dart';

class CrudRepository<T extends Model<T>> {
  final BaseDao<T> _dao;

  CrudRepository(this._dao);

  Future<int> adicionar(T objeto) async {
    return await _dao.salvar(objeto);
  }

  Future<int> atualizar(int id, T novoObjeto) async {
    return await _dao.atualizar(id, novoObjeto);
  }

  Future<T?> buscarPorId(int id) async {
    return await _dao.buscarPorId(id);
  }

  Future<List<T>> buscarTodos() async {
    return await _dao.buscarTodos();
  }

  Future<int> remover(int id) async {
    return await _dao.remover(id);
  }
}
