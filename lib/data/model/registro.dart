class Registro {
  final int id;
  final int alunoId;
  final int reservaId;
  final String data;
  final String situacao;
  final String tempo;

  Registro({
    required this.id,
    required this.alunoId,
    required this.reservaId,
    required this.data,
    required this.situacao,
    required this.tempo,
  });

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
