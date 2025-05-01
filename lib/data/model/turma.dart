class Turma {
  final int id;
  final String codigo;

  Turma({required this.id, required this.codigo});

  Turma copyWith({int? id, String? codigo}) {
    return Turma(id: id ?? this.id, codigo: codigo ?? this.codigo);
  }
}
