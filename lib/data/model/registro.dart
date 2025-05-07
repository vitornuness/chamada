import 'package:chamada/data/model/model.dart';

class Registro extends Model<Registro> {
  final int alunoId;
  final int reservaId;
  final String data;
  final String situacao;
  final String tempo;

  Registro({
    required super.id,
    required this.alunoId,
    required this.reservaId,
    required this.data,
    required this.situacao,
    required this.tempo,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'alunoId': alunoId,
      'reservaId': reservaId,
      'data': data,
      'situacao': situacao,
      'tempo': tempo,
    };
  }

  static Registro fromMap(Map<String, dynamic> map) {
    return Registro(
      id: map['id'],
      alunoId: map['alunoId'],
      reservaId: map['reservaId'],
      data: map['data'],
      situacao: map['situacao'],
      tempo: map['tempo'],
    );
  }

  @override
  Registro copyWith({
    int? id,
    int? alunoId,
    int? reservaId,
    String? data,
    String? situacao,
    String? tempo,
  }) {
    return Registro(
      id: id ?? this.id,
      alunoId: alunoId ?? this.alunoId,
      reservaId: reservaId ?? this.reservaId,
      data: data ?? this.data,
      situacao: situacao ?? this.situacao,
      tempo: tempo ?? this.tempo,
    );
  }
}
