import 'package:chamada/router.dart';
import 'package:chamada/ui/viewmodel/aluno_view_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ListaAlunosView extends StatefulWidget {
  final String? turmaId;

  const ListaAlunosView(this.turmaId, {super.key});

  @override
  State<ListaAlunosView> createState() => _ListaAlunosViewState();
}

class _ListaAlunosViewState extends State<ListaAlunosView> {

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
      body: Consumer<AlunoViewModel>(
        builder: (context, alunosViewModel, child) {
          return ListView.builder(
            itemCount:
                alunosViewModel
                    .getListaAlunosPorTurma(int.parse(widget.turmaId!))
                    .length,
            itemBuilder: (context, index) {
              final aluno = alunosViewModel.getListaAlunos[index];
              return Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 1200.0),
                  child: Card(
                    margin: EdgeInsets.symmetric(
                      vertical: 6.0,
                      horizontal: 8.0,
                    ),
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
                      subtitle: Text(aluno.codigoRegistro),
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
