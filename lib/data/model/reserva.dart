class Reserva {
  final int id;
  final String inicio;
  final String fim;
  final String curso;
  final int salaId;
  final int turmaId;
  final String? diaSemana;
  final String? data;

  Reserva({
    required this.id,
    required this.inicio,
    required this.fim,
    required this.curso,
    required this.salaId,
    required this.turmaId,
    this.diaSemana,
    this.data,
  });

  Reserva copyWith({
    int? id,
    String? inicio,
    String? fim,
    String? curso,
    int? salaId,
    int? turmaId,
    String? diaSemana,
    String? data,
  }) {
    return Reserva(
      id: id ?? this.id,
      inicio: inicio ?? this.inicio,
      fim: fim ?? this.fim,
      curso: curso ?? this.curso,
      salaId: salaId ?? this.salaId,
      turmaId: turmaId ?? this.turmaId,
    );
  }
}
