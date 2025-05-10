import 'package:chamada/data/model/turma.dart';
import 'package:chamada/router.dart';
import 'package:chamada/ui/components/turma/formulario_turma.dart';
import 'package:chamada/ui/viewmodel/turma_view_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class TurmasView extends StatefulWidget {
  const TurmasView({super.key});

  @override
  State<TurmasView> createState() => _TurmasViewState();
}

class _TurmasViewState extends State<TurmasView> {
  void _abrirFormulario(Turma? turmaParaEditar) async {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return FormularioTurma(
          turma: turmaParaEditar,
          onSave: (novaTurma) async {
            final sucesso =
                novaTurma.id == null
                    ? await context.read<TurmaViewModel>().adicionarTurma(
                      novaTurma,
                    )
                    : await context.read<TurmaViewModel>().atualizarTurma(
                      novaTurma.id!,
                      novaTurma,
                    );

            if (!mounted) return;

            if (sucesso) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Turma salva com sucesso')),
              );
              Navigator.of(context).pop();
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Erro ao salvar turma')),
              );
            }
          },
        );
      },
    );
  }

  void _alertaConfirmarRemocao(int id) async {
    if (!mounted) return;

    bool? confirmado = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmar Remoção'),
          content: const Text('Tem certeza que deseja remover esta turma?'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('Remover'),
            ),
          ],
        );
      },
    );

    if (confirmado == true) {
      await context.read<TurmaViewModel>().removerTurma(id);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Turma com ID $id removida com sucesso.')),
      );
    }
  }

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
      body: Consumer<TurmaViewModel>(
        builder: (context, turmaViewModel, child) {
          return ListView.builder(
            itemCount: turmaViewModel.getListaTurmas.length,
            itemBuilder: (context, index) {
              final Turma turma = turmaViewModel.getListaTurmas[index];
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
                        'Turma ${turma.codigo}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: Wrap(
                        spacing: 8,
                        children: [
                          IconButton(
                            icon: Icon(Icons.delete),
                            tooltip: 'Remover',
                            onPressed: () => _alertaConfirmarRemocao(turma.id!),
                          ),
                          IconButton(
                            icon: Icon(Icons.edit),
                            tooltip: 'Editar',
                            onPressed: () => _abrirFormulario(turma),
                          ),
                          IconButton(
                            icon: Icon(Icons.group),
                            tooltip: 'Alunos',
                            onPressed: () {
                              context.go(
                                '${AppRouter.listaAlunos}?turmaId=${turma.id}',
                              );
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.checklist_rounded),
                            tooltip: 'Chamada',
                            onPressed: () {
                              context.go(
                                '${AppRouter.chamadaAdmin}?turmaId=${turma.id}',
                              );
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
        onPressed: () => _abrirFormulario(null),
        child: const Icon(Icons.add),
      ),
    );
  }
}
