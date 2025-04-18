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
          return Container(
            padding: EdgeInsets.all(4.0),
            height: 80.0,
            child: Center(
              child: SizedBox(
                width: 400.0,
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1.2, color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Turma ${turmas[index]}'),
                      Row(
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
                              context.go(
                                '${AppRouter.listaAlunos}?turmaId=$index',
                              );
                            },
                          ),
                        ],
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
