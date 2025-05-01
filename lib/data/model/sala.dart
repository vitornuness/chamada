class Sala {
  final int id;
  final String codigo;
  final String? ipAparelho;

  Sala({required this.id, required this.codigo, this.ipAparelho});

  Sala copyWith({int? id, String? codigo, String? ipAparelho}) {
    return Sala(
      id: id ?? this.id,
      codigo: codigo ?? this.codigo,
      ipAparelho: ipAparelho ?? this.ipAparelho,
    );
  }
}
