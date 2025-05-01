import 'package:chamada/data/model/registro.dart';
import 'package:flutter/material.dart';

class RegistroViewModel extends ChangeNotifier {
  final List<Registro> _listaRegistros = [];

  List<Registro> get getListaRegistros => _listaRegistros;

  void adicionarRegistros(List<Registro> novosRegistros) {
    if (_validarRegistros(novosRegistros)) {
      return;
    }

    _listaRegistros.addAll(novosRegistros);
    notifyListeners();
  }

  List<Registro> getRegistrosAtuaisByReserva(int reservaId) {
    return _listaRegistros
        .where(
          (r) =>
              DateTime.parse(r.data) == DateTime.now() &&
              r.reservaId == reservaId,
        )
        .toList();
  }

  List<Registro> getRegistrosAtuaisByAluno(int alunoId) {
    return _listaRegistros
        .where(
          (r) =>
              DateTime.parse(r.data) == DateTime.now() && r.alunoId == alunoId,
        )
        .toList();
  }

  bool _validarRegistros(List<Registro> registros) {
    return !registros.any(
      (novoRegistro) => _listaRegistros.any((r) => r.id == novoRegistro.id),
    );
  }
}
