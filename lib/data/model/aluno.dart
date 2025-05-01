class Aluno {
  final int id;
  final String codigoRegistro;
  final int turmaId;
  final int usuarioId;
  final String? aparelho;

  Aluno({
    required this.id,
    required this.codigoRegistro,
    required this.turmaId,
    required this.usuarioId,
    this.aparelho,
  });

  Aluno copyWith({
    int? id,
    String? codigoRegistro,
    int? turmaId,
    int? usuarioId,
    String? aparelho,
  }) {
    return Aluno(
      id: id ?? this.id,
      codigoRegistro: codigoRegistro ?? this.codigoRegistro,
      turmaId: turmaId ?? this.turmaId,
      usuarioId: usuarioId ?? this.usuarioId,
    );
  }
}
