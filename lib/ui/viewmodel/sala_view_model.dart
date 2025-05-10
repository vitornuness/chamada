import 'package:chamada/data/model/sala.dart';
import 'package:flutter/material.dart';

class SalaViewModel extends ChangeNotifier {
  final List<Sala> _listaSalas = [
    Sala(id: 1, codigo: '428'),
    Sala(id: 2, codigo: '429'),
    Sala(id: 3, codigo: '430'),
  ];

  List<Sala> get getListaSalas {
    return List<Sala>.from(_listaSalas)
      ..sort((a, b) => a.codigo.compareTo(b.codigo));
  }

  Future<bool> adicionarSala(Sala sala) async {
    if (_listaSalas.any((s) => s.id == sala.id)) return false;

    sala = sala.copyWith(
      id: getId(),
      codigo: sala.codigo,
      ipAparelho: sala.ipAparelho,
    );
    _listaSalas.add(sala);
    notifyListeners();
    return true;
  }

  Future<bool> atualizarSala(int id, Sala novaSala) async {
    int? indexParaEditar = _listaSalas.indexWhere((s) => s.id == id);

    if (indexParaEditar == -1) return false;

    _listaSalas[indexParaEditar] = novaSala;
    notifyListeners();
    return true;
  }

  Sala? findSala(int id) {
    return _listaSalas.where((s) => s.id == id).firstOrNull;
  }

  int getId() {
    int id = 1;
    if (_listaSalas.isEmpty) return id;

    for (var s in _listaSalas) {
      if (s.id! >= id) {
        id = s.id! + 1;
      }
    }

    return id;
  }

  Future<void> removerSala(int id) async {
    _listaSalas.removeWhere((s) => s.id == id);
    notifyListeners();
  }
}
