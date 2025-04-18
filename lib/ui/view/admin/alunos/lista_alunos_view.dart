import 'package:chamada/data/model/aluno.dart';
import 'package:chamada/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ListaAlunosView extends StatefulWidget {
  final String? turmaId;

  const ListaAlunosView(this.turmaId, {super.key});

  @override
  State<ListaAlunosView> createState() => _ListaAlunosViewState();
}

class _ListaAlunosViewState extends State<ListaAlunosView> {
  final alunos = [
    Aluno('Pedro', null, 1, 1),
    Aluno('Maria', null, 1, 2),
    Aluno('José', null, 2, 3),
    Aluno('Luiz', null, 2, 4),
  ];

  late List<Aluno> alunosExibidos = [];

  List<Aluno> _listarAlunosPorTurma(int turmaId) {
    return alunos.where((aluno) => aluno.turmaId == turmaId).toList();
  }

  @override
  void initState() {
    super.initState();
    alunosExibidos =
        widget.turmaId == null
            ? alunos
            : _listarAlunosPorTurma(int.parse(widget.turmaId!));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alunos'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          tooltip: 'Voltar para lista de turmas',
          onPressed: () => context.go(AppRouter.listaTurmas),
        ),
      ),
      body: ListView.builder(
        itemCount: alunosExibidos.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(4.0),
            height: 80.0,
            child: Center(
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                  side: BorderSide(width: 1.2),
                  minimumSize: Size(400, 100),
                ),
                onPressed: () => {},
                child: Text(alunosExibidos[index].nome),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go(AppRouter.cadastrarAlunos),
        child: const Icon(Icons.add),
      ),
    );
  }
}
