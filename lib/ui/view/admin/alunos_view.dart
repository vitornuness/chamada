import 'package:chamada/data/model/aluno.dart';
import 'package:chamada/router.dart';
import 'package:chamada/ui/components/aluno/formulario_aluno.dart';
import 'package:chamada/ui/viewmodel/aluno_view_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AlunosView extends StatefulWidget {
  final String? turmaId;

  const AlunosView(this.turmaId, {super.key});

  @override
  State<AlunosView> createState() => _AlunosViewState();
}

class _AlunosViewState extends State<AlunosView> {
  void _abrirFormulario(Aluno? alunoParaEditar) async {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return FormularioAluno(
          aluno: alunoParaEditar,
          onSave: (novoAluno) async {
            final sucesso =
                novoAluno.id == null
                    ? await context.read<AlunoViewModel>().adicionarAluno(
                      novoAluno,
                    )
                    : await context.read<AlunoViewModel>().atualizarAluno(
                      novoAluno.id!,
                      novoAluno,
                    );

            if (!mounted) return;

            if (sucesso) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Aluno salvo com sucesso')),
              );
              Navigator.of(context).pop();
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Erro ao salvar aluno')),
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
          content: const Text('Tem certeza que deseja remover este aluno?'),
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
      await context.read<AlunoViewModel>().removerAluno(id);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Aluno com ID $id removido com sucesso.')),
      );
    }
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
                            onPressed: () => _abrirFormulario(aluno),
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            tooltip: 'Excluir',
                            onPressed: () => _alertaConfirmarRemocao(aluno.id!),
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
