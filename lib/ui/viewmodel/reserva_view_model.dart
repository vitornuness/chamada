import 'package:chamada/data/model/reserva.dart';
import 'package:flutter/material.dart';

class ReservaViewModel extends ChangeNotifier {
  final List<Reserva> _listaReservas = [];

  List<Reserva> get getListaReservas => _listaReservas;

  void adicionarReserva(Reserva reserva) {
    if (findReserva(reserva.id) != null) {
      return;
    }

    _listaReservas.add(reserva);
    notifyListeners();
  }

  Reserva? findReserva(int id) {
    return _listaReservas.where((r) => r.id == id).firstOrNull;
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

  int _converterHoraParaMinutos(String hora) {
    final partes = hora.split(':');
    final horas = int.parse(partes[0]);
    final minutos = int.parse(partes[1]);
    return horas * 60 + minutos;
  }
}
