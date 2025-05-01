import 'package:chamada/data/model/sala.dart';
import 'package:flutter/material.dart';

class SalaViewModel extends ChangeNotifier {
  final List<Sala> _listaSalas = [];

  List<Sala> get getListaSalas {
    return List<Sala>.from(_listaSalas)
      ..sort((a, b) => a.codigo.compareTo(b.codigo));
  }

  void adicionarSala(Sala sala) {
    if (_listaSalas.any((s) => s.id == sala.id)) return;

    _listaSalas.add(sala);
    notifyListeners();
  }

  Sala? findSala(int id) {
    return _listaSalas.where((s) => s.id == id).firstOrNull;
  }

  void removerSala(int id) {
    _listaSalas.removeWhere((s) => s.id == id);
    notifyListeners();
  }
}
