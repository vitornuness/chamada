import 'package:chamada/data/model/aluno.dart';
import 'package:flutter/material.dart';

class AlunoViewModel extends ChangeNotifier {
  final List<Aluno> _listaAlunos = [
    Aluno(id: 1, codigoRegistro: '123456', turmaId: 1, usuarioId: 2),
  ];
  Aluno? _alunoAutenticado;

  List<Aluno> get getListaAlunos => _listaAlunos;

  void adicionarAluno(Aluno aluno) {
    if (findAluno(aluno.id) != null) {
      return;
    }

    _listaAlunos.add(aluno);
    notifyListeners();
  }

  Aluno? findAluno(int id) {
    return _listaAlunos.where((a) => a.id == id).firstOrNull;
  }

  Aluno? getAlunoAutenticado(int usuarioId) {
    return _alunoAutenticado?.usuarioId == usuarioId
        ? _alunoAutenticado
        : _listaAlunos.where((a) => a.usuarioId == usuarioId).firstOrNull;
  }

  List<Aluno> getListaAlunosPorTurma(int turmaId) {
    return _listaAlunos.where((a) => a.turmaId == turmaId).toList();
  }

  bool possuiAparelhoCadastrado() {
    return _alunoAutenticado?.aparelho != null;
  }

  void removerAluno(int id) {
    _listaAlunos.removeWhere((a) => a.id == id);
    notifyListeners();
  }
}
