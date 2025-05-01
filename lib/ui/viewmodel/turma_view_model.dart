import 'package:chamada/data/model/turma.dart';
import 'package:flutter/material.dart';

class TurmaViewModel extends ChangeNotifier {
  final List<Turma> _listaTurmas = [];

  List<Turma> get getListaTurmas {
    return List<Turma>.from(_listaTurmas)
      ..sort((a, b) => a.codigo.compareTo(b.codigo));
  }

  void adicionarTurma(Turma turma) {
    if (_listaTurmas.any((t) => t.id == turma.id || t.codigo == turma.codigo)) {
      return;
    }

    _listaTurmas.add(turma);
    notifyListeners();
  }

  Turma? findTurma(int id) {
    return _listaTurmas.where((t) => t.id == id).firstOrNull;
  }

  void removerTurma(int id) {
    _listaTurmas.removeWhere((t) => t.id == id);
    notifyListeners();
  }
}
