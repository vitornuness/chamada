import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const String _dbPath = 'database.db';
  static const int _dbVersion = 1;

  static DatabaseHelper? _instace;
  static Database? _database;

  DatabaseHelper._internal();

  static DatabaseHelper get instance {
    _instace ??= DatabaseHelper._internal();
    return _instace!;
  }

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final path = join(await getDatabasesPath(), _dbPath);

    return await openDatabase(
      path,
      version: _dbVersion,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute("""
      CREATE TABLE aluno (
        aluno_id INT AUTO_INCREMENT,
        codigo_registro VARCHAR(10) NOT NULL,
        nome VARCHAR(50) NOT NULL,
        turma_id INT NOT NULL,
        usuario_id INT NOT NULL,
        aparelho VARCHAR(30),
        PRIMARY KEY (aluno_id),
        FOREIGN KEY (turma_id) REFERENCES turma(turma_id),
        FOREIGN KEY (usuario_id) REFERENCES usuario(usuario_id)
      );
    """);

    await db.execute("""
      CREATE TABLE usuario (
        usuario_id INT AUTO_INCREMENT,
        usuario VARCHAR(64) NOT NULL,
        senha VARCHAR(20) NOT NULL,
        nome VARCHAR(50) NOT NULL,
        ehAdmin BOOL NOT NULL,    
        PRIMARY KEY (usuario_id)
      );
    """);

    await db.execute("""
      CREATE TABLE justificativa (
        justificativa_id INT AUTO_INCREMENT,
        registro_id INT NOT NULL,
        texto CHAR NOT NULL,
        data DATETIME NOT NULL,
        PRIMARY KEY (justificativa_id),
        FOREIGN KEY (registro_id) REFERENCES registro(registro_id)
      );
    """);

    await db.execute("""
      CREATE TABLE registro (
        registro_id INT AUTO_INCREMENT,
        aluno_id INT NOT NULL,
        reserva_id INT NOT NULL,
        data DATETIME NOT NULL,
        situacao VARCHAR(10) NOT NULL,
        tempo TIME NOT NULL,
        PRIMARY KEY (registro_id),
        FOREIGN KEY (reserva_id) REFERENCES reserva(reserva_id),
        FOREIGN KEY (aluno_id) REFERENCES aluno(aluno_id)
      );
    """);

    await db.execute("""
      CREATE TABLE reserva (
        reserva_id INT AUTO_INCREMENT,
        inicio DATETIME NOT NULL,
        fim DATETIME NOT NULL,
        curso VARCHAR(30) NOT NULL,
        sala_id INT NOT NULL,
        turma_id INT NOT NULL,
        usuario_id INT NOT NULL,
        dia_semana VARCHAR(3),
        data DATETIME,
        PRIMARY KEY (reserva_id),
        FOREIGN KEY (sala_id) REFERENCES sala(sala_id),
        FOREIGN KEY (turma_id) REFERENCES turma(turma_id),
        FOREIGN KEY (usuario_id) REFERENCES usuario(usuario_id)
      );
    """);

    await db.execute("""
      CREATE TABLE sala (
        sala_id INT AUTO_INCREMENT,
        codigo VARCHAR(35) NOT NULL,
        ip_aparelho VARCHAR(30),
        PRIMARY KEY (sala_id)
      );
    """);

    await db.execute("""
      CREATE TABLE  turma (
        turma_id INT AUTO_INCREMENT,
        codigo VARCHAR(15),
        PRIMARY KEY (turma_id)
      );
    """);
  }

  Future _onUpgrade(Database db, int oldVersion, int newVersion) async {
    // TODO atualizar tabelas necessárias
  }

  Future<void> closeDatabase() async {
    final db = await database;
    await db.close();
  }
}
