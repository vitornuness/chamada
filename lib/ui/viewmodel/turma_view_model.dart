import 'package:chamada/data/model/turma.dart';
import 'package:flutter/material.dart';

class TurmaViewModel extends ChangeNotifier {
  final List<Turma> _listaTurmas = [
    Turma(id: 1, codigo: 'A'),
    Turma(id: 2, codigo: 'B'),
    Turma(id: 3, codigo: 'C'),
  ];

  List<Turma> get getListaTurmas {
    return List<Turma>.from(_listaTurmas)
      ..sort((a, b) => a.codigo.compareTo(b.codigo));
  }

  Future<bool> adicionarTurma(Turma turma) async {
    if (_listaTurmas.any((t) => t.id == turma.id || t.codigo == turma.codigo)) {
      return false;
    }

    turma = turma.copyWith(id: getId(), codigo: turma.codigo);
    _listaTurmas.add(turma);
    notifyListeners();
    return true;
  }

  Future<bool> atualizarTurma(int id, Turma novaTurma) async {
    int? indexParaEditar = _listaTurmas.indexWhere((s) => s.id == id);

    if (indexParaEditar == -1) return false;

    _listaTurmas[indexParaEditar] = novaTurma;
    notifyListeners();
    return true;
  }

  Turma? findTurma(int id) {
    return _listaTurmas.where((t) => t.id == id).firstOrNull;
  }

  int getId() {
    int id = 1;
    if (_listaTurmas.isEmpty) return id;

    for (var s in _listaTurmas) {
      if (s.id! >= id) {
        id = s.id! + 1;
      }
    }

    return id;
  }

  Future<void> removerTurma(int id) async {
    _listaTurmas.removeWhere((t) => t.id == id);
    notifyListeners();
  }
}
