import 'package:chamada/data/database/database_helper.dart';
import 'package:chamada/data/model/model.dart';

typedef FromMap<T> = T Function(Map<String, dynamic> map);

class BaseDao<T extends Model<T>> {
  final String tableName;
  final FromMap<T> fromMap;
  final DatabaseHelper _databaseHelper = DatabaseHelper.instance;

  BaseDao(this.tableName, this.fromMap);

  Future<int> atualizar(int id, T novoObjeto) async {
    final db = await _databaseHelper.database;
    return await db.update(
      tableName,
      novoObjeto.toMap(),
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<T?> buscarPorId(int id) async {
    final db = await _databaseHelper.database;
    final maps = await db.query(tableName, where: 'id = ?', whereArgs: [id]);

    return maps.map(fromMap).firstOrNull;
  }

  Future<List<T>> buscarTodos() async {
    final db = await _databaseHelper.database;
    final maps = await db.query(tableName);
    return maps.map(fromMap).toList();
  }

  Future<int> remover(int id) async {
    final db = await _databaseHelper.database;
    return await db.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> salvar(T objeto) async {
    final db = await _databaseHelper.database;
    return await db.insert(tableName, objeto.toMap());
  }
}
