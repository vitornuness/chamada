class Reserva {
  final String inicio;
  final String fim;
  final String? diaSemana;
  final String? data;
  final String curso;
  final int salaId;
  final int turmaId;

  const Reserva(
    this.inicio,
    this.fim,
    this.diaSemana,
    this.data,
    this.curso,
    this.salaId,
    this.turmaId,
  );
}
