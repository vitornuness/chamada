import 'package:chamada/data/model/model.dart';

class Aluno extends Model<Aluno> {
  final String codigoRegistro;
  final String nome;
  final int turmaId;
  final int usuarioId;
  final String? aparelho;

  Aluno({
    required super.id,
    required this.codigoRegistro,
    required this.nome,
    required this.turmaId,
    required this.usuarioId,
    this.aparelho,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'codigoRegistro': codigoRegistro,
      'nome': nome,
      'turmaId': turmaId,
      'usuarioId': usuarioId,
      'aparelho': aparelho,
    };
  }

  static Aluno fromMap(Map<String, dynamic> map) {
    return Aluno(
      id: map['id'],
      codigoRegistro: map['codigoRegistro'],
      nome: map['nome'],
      turmaId: map['turmaId'],
      usuarioId: map['usuarioId'],
      aparelho: map['aparelho'],
    );
  }

  @override
  Aluno copyWith({
    int? id,
    String? codigoRegistro,
    String? nome,
    int? turmaId,
    int? usuarioId,
    String? aparelho,
  }) {
    return Aluno(
      id: id ?? this.id,
      codigoRegistro: codigoRegistro ?? this.codigoRegistro,
      nome: nome ?? this.nome,
      turmaId: turmaId ?? this.turmaId,
      usuarioId: usuarioId ?? this.usuarioId,
    );
  }
}
