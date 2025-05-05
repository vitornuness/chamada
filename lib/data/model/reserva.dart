import 'package:chamada/shared/dia_semana_enum.dart';

class Reserva {
  final int id;
  final String inicio;
  final String fim;
  final String curso;
  final int salaId;
  final int turmaId;
  final int usuarioId;
  final DiaSemanaEnum? diaSemana;
  final String? data;

  Reserva({
    required this.id,
    required this.inicio,
    required this.fim,
    required this.curso,
    required this.salaId,
    required this.turmaId,
    required this.usuarioId,
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
    int? usuarioId,
    DiaSemanaEnum? diaSemana,
    String? data,
  }) {
    return Reserva(
      id: id ?? this.id,
      inicio: inicio ?? this.inicio,
      fim: fim ?? this.fim,
      curso: curso ?? this.curso,
      salaId: salaId ?? this.salaId,
      turmaId: turmaId ?? this.turmaId,
      usuarioId: usuarioId ?? this.usuarioId,
      diaSemana: diaSemana ?? this.diaSemana,
      data: data ?? this.data,
    );
  }
}
