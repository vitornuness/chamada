import 'package:chamada/data/model/reserva.dart';
import 'package:chamada/shared/dia_semana_enum.dart';
import 'package:flutter/material.dart';

class ReservaViewModel extends ChangeNotifier {
  final List<Reserva> _listaReservas = [
    Reserva(
      id: 1,
      inicio: '19:25',
      fim: '21:00',
      curso: 'Banco de Dados',
      salaId: 1,
      turmaId: 1,
      usuarioId: 1,
      diaSemana: DiaSemanaEnum.segunda,
    ),
    Reserva(
      id: 2,
      inicio: '21:20',
      fim: '22:45',
      curso: 'Banco de Dados',
      salaId: 1,
      turmaId: 1,
      usuarioId: 1,
      diaSemana: DiaSemanaEnum.segunda,
    ),
    Reserva(
      id: 3,
      inicio: '19:25',
      fim: '21:00',
      curso: 'Lógica',
      salaId: 1,
      turmaId: 1,
      usuarioId: 1,
      diaSemana: DiaSemanaEnum.terca,
    ),
    Reserva(
      id: 4,
      inicio: '21:50',
      fim: '22:45',
      curso: 'Lógica',
      salaId: 1,
      turmaId: 1,
      usuarioId: 1,
      diaSemana: DiaSemanaEnum.terca,
    ),
    Reserva(
      id: 5,
      inicio: '19:25',
      fim: '21:00',
      curso: 'Lógica',
      salaId: 2,
      turmaId: 2,
      usuarioId: 1,
      diaSemana: DiaSemanaEnum.segunda,
    ),
    Reserva(
      id: 6,
      inicio: '21:50',
      fim: '22:45',
      curso: 'Lógica',
      salaId: 2,
      turmaId: 2,
      usuarioId: 1,
      diaSemana: DiaSemanaEnum.segunda,
    ),
  ];

  List<Reserva> get getListaReservas => _listaReservas;

  void adicionarReserva(Reserva reserva) {
    if (findReserva(reserva.id!) != null) {
      return;
    }

    _listaReservas.add(reserva);
    notifyListeners();
  }

  Reserva? findReserva(int id) {
    return _listaReservas.where((r) => r.id == id).firstOrNull;
  }

  List<Reserva> getListaReservasPorSala(int salaId) {
    return _listaReservas.where((r) => r.salaId == salaId).toList();
  }

  List<Reserva> getListaReservasDoDiaPorTurma(int turmaId) {
    return _listaReservas
        .where((r) => r.turmaId == turmaId && _validarDataOuDiaSemana(r))
        .toList();
  }

  void removerReserva(int id) {
    _listaReservas.removeWhere((r) => r.id == id);
    notifyListeners();
  }

  bool _validarReserva(Reserva novaReserva) {
    // TODO
    final novaInicio = _converterHoraParaMinutos(novaReserva.inicio);
    final novaFim = _converterHoraParaMinutos(novaReserva.fim);
    return true;
  }

  bool _validarDataOuDiaSemana(Reserva reserva) {
    if (reserva.data != null) {
      return DateTime.now().day == DateTime.parse(reserva.data!).day;
    }
    if (reserva.diaSemana != null) {
      return DateTime.monday == reserva.diaSemana!.index + 1;
    }
    return false;
  }

  int _converterHoraParaMinutos(String hora) {
    final partes = hora.split(':');
    final horas = int.parse(partes[0]);
    final minutos = int.parse(partes[1]);
    return horas * 60 + minutos;
  }
}
