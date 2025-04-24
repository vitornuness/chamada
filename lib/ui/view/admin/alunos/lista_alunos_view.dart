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
          final aluno = alunosExibidos[index];
          return Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 1200.0),
              child: Card(
                margin: EdgeInsets.symmetric(vertical: 6.0, horizontal: 8.0),
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  title: Text(
                    aluno.nome,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  trailing: Wrap(
                    spacing: 8,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        tooltip: 'Editar',
                        onPressed: () => context.go(AppRouter.listaTurmas),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        tooltip: 'Excluir',
                        onPressed: () {
                          context.go(AppRouter.listaTurmas);
                        },
                      ),
                    ],
                  ),
                ),
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
