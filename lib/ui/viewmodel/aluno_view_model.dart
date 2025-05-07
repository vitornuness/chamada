import 'package:chamada/data/model/aluno.dart';
import 'package:chamada/data/service/preferences_service.dart';
import 'package:flutter/material.dart';

class AlunoViewModel extends ChangeNotifier {
  final _preferencesService = PreferencesService.instance;
  final List<Aluno> _listaAlunos = [
    Aluno(
      id: 1,
      codigoRegistro: '123456',
      nome: 'Vitor',
      turmaId: 1,
      usuarioId: 2,
    ),
    Aluno(
      id: 2,
      codigoRegistro: '654321',
      nome: 'Maycon',
      turmaId: 1,
      usuarioId: 3,
      aparelho: 'APARELHODOMAYCON',
    ),
  ];
  Aluno? _alunoAutenticado;

  List<Aluno> get getListaAlunos => _listaAlunos;
  Aluno? get getAlunoAutenticado {
    return _alunoAutenticado ??
        findAlunoByUsuario(_preferencesService.getTokenUsuario() ?? 0);
  }

  void adicionarAluno(Aluno aluno) {
    if (findAluno(aluno.id) != null) {
      return;
    }

    _listaAlunos.add(aluno);
    notifyListeners();
  }

  void autenticarAluno(int usuarioId) {
    _alunoAutenticado = findAlunoByUsuario(usuarioId);
  }

  Aluno? findAluno(int id) {
    return _listaAlunos.where((a) => a.id == id).firstOrNull;
  }

  Aluno? findAlunoByUsuario(int usuarioId) {
    return _listaAlunos.where((a) => a.usuarioId == usuarioId).firstOrNull;
  }

  Aluno? getAlunoAutenticadoByUsuario(int usuarioId) {
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
