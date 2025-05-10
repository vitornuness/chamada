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

  Future<bool> adicionarAluno(Aluno aluno) async {
    if (findAluno(aluno.id!) != null) {
      return false;
    }

    aluno = aluno.copyWith(
      id: getId(),
      codigoRegistro: aluno.codigoRegistro,
      nome: aluno.nome,
      turmaId: aluno.turmaId,
      usuarioId: aluno.usuarioId,
      aparelho: aluno.aparelho,
    );
    _listaAlunos.add(aluno);
    notifyListeners();
    return true;
  }

  Future<bool> atualizarAluno(int id, Aluno novoAluno) async {
    int? indexParaEditar = _listaAlunos.indexWhere((s) => s.id == id);

    if (indexParaEditar == -1) return false;

    _listaAlunos[indexParaEditar] = novoAluno;
    notifyListeners();
    return true;
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

  int getId() {
    int id = 1;
    if (_listaAlunos.isEmpty) return id;

    for (var s in _listaAlunos) {
      if (s.id! >= id) {
        id = s.id! + 1;
      }
    }

    return id;
  }

  bool possuiAparelhoCadastrado() {
    return _alunoAutenticado?.aparelho != null;
  }

  Future<void> removerAluno(int id) async {
    _listaAlunos.removeWhere((a) => a.id == id);
    notifyListeners();
  }
}
