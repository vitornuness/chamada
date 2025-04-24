import 'package:chamada/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ListaTurmasView extends StatefulWidget {
  const ListaTurmasView({super.key});

  @override
  State<ListaTurmasView> createState() => _ListaTurmasViewState();
}

class _ListaTurmasViewState extends State<ListaTurmasView> {
  final turmas = ['A', 'B', 'C'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Turmas'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          tooltip: 'Voltar para o painel administrador',
          onPressed: () => context.go(AppRouter.painelAdmin),
        ),
      ),
      body: ListView.builder(
        itemCount: turmas.length,
        itemBuilder: (context, index) {
          final turma = turmas[index];
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
                    'Turma $turma',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  trailing: Wrap(
                    spacing: 8,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        tooltip: 'Editar',
                        onPressed: () {
                          context.go(
                            AppRouter.editarTurmas.replaceAll(
                              ':id',
                              index.toString(),
                            ),
                          );
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.group),
                        tooltip: 'Alunos',
                        onPressed: () {
                          context.go('${AppRouter.listaAlunos}?turmaId=$index');
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
        onPressed: () => context.go(AppRouter.cadastrarTurmas),
        child: const Icon(Icons.add),
      ),
    );
  }
}
