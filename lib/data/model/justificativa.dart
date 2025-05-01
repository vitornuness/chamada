class Justificativa {
  final int id;
  final int registroId;
  final String texto;
  final String data;

  Justificativa({
    required this.id,
    required this.registroId,
    required this.texto,
    required this.data,
  });

  Justificativa copyWith({
    int? id,
    int? registroId,
    String? texto,
    String? data,
  }) {
    return Justificativa(
      id: id ?? this.id,
      registroId: registroId ?? this.registroId,
      texto: texto ?? this.texto,
      data: data ?? this.data,
    );
  }
}
