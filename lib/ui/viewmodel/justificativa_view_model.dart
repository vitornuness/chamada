import 'package:chamada/data/model/justificativa.dart';
import 'package:flutter/material.dart';

class JustificativaViewModel extends ChangeNotifier {
  final List<Justificativa> _listaJustificativas = [];

  List<Justificativa> get getListaJustificativas => List<Justificativa>.from(
    _listaJustificativas,
  )..sort((a, b) => DateTime.parse(b.data).compareTo(DateTime.parse(a.data)));

  void adicionarJustificativa(Justificativa justificativa) {
    if (findJustificativa(justificativa.id) != null) {
      return;
    }

    _listaJustificativas.add(justificativa);
    notifyListeners();
  }

  Justificativa? findJustificativa(int id) {
    return _listaJustificativas.where((j) => j.id == id).firstOrNull;
  }
}
