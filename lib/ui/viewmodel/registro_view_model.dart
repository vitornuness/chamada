import 'package:chamada/data/model/registro.dart';
import 'package:flutter/material.dart';

class RegistroViewModel extends ChangeNotifier {
  final List<Registro> _listaRegistros = [
    Registro(
      id: 1,
      alunoId: 1,
      reservaId: 1,
      data: DateTime.now().toString(),
      situacao: 'PENDENTE',
      tempo: '00:00',
    ),
    Registro(
      id: 2,
      alunoId: 1,
      reservaId: 2,
      data: DateTime.now().toString(),
      situacao: 'PENDENTE',
      tempo: '00:00',
    ),
    Registro(
      id: 3,
      alunoId: 1,
      reservaId: 3,
      data: DateTime.now().toString(),
      situacao: 'PENDENTE',
      tempo: '00:00',
    ),
    Registro(
      id: 4,
      alunoId: 1,
      reservaId: 4,
      data: DateTime.now().toString(),
      situacao: 'PENDENTE',
      tempo: '00:00',
    ),
  ];

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
        .where((r) => r.situacao == 'PENDENTE' && r.reservaId == reservaId)
        .toList();
  }

  List<Registro> getRegistrosAtuaisByAluno(int alunoId) {
    return _listaRegistros
        .where(
          (r) =>
              DateTime.parse(r.data).day == DateTime.now().day &&
              r.alunoId == alunoId,
        )
        .toList();
  }

  bool _validarRegistros(List<Registro> registros) {
    return !registros.any(
      (novoRegistro) => _listaRegistros.any((r) => r.id == novoRegistro.id),
    );
  }
}
