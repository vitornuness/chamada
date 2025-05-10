import 'package:chamada/data/model/sala.dart';
import 'package:chamada/router.dart';
import 'package:chamada/ui/components/sala/formulario_sala.dart';
import 'package:chamada/ui/viewmodel/sala_view_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SalasView extends StatefulWidget {
  const SalasView({super.key});

  @override
  State<SalasView> createState() => _SalasViewState();
}

class _SalasViewState extends State<SalasView> {
  void _abrirFormularioSala(Sala? salaParaEditar) async {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return FormularioSala(
          sala: salaParaEditar,
          onSave: (novaSala) async {
            final sucesso =
                novaSala.id == null
                    ? await context.read<SalaViewModel>().adicionarSala(
                      novaSala,
                    )
                    : await context.read<SalaViewModel>().atualizarSala(
                      novaSala.id!,
                      novaSala,
                    );

            if (!mounted) return;

            if (sucesso) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Sala salva com sucesso')),
              );
              Navigator.of(context).pop();
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Erro ao salvar sala')),
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
          content: const Text('Tem certeza que deseja remover esta sala?'),
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
      await context.read<SalaViewModel>().removerSala(id);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Sala com ID $id removida com sucesso.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Salas'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go(AppRouter.painelAdmin),
        ),
      ),
      body: Consumer<SalaViewModel>(
        builder: (context, salaViewModel, child) {
          return ListView.builder(
            itemCount: salaViewModel.getListaSalas.length,
            itemBuilder: (context, index) {
              final sala = salaViewModel.getListaSalas[index];
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
                        'Sala ${sala.codigo}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: Wrap(
                        spacing: 8,
                        children: [
                          IconButton(
                            icon: Icon(Icons.delete),
                            tooltip: 'Remover',
                            onPressed: () => _alertaConfirmarRemocao(sala.id!),
                          ),
                          IconButton(
                            icon: Icon(Icons.edit),
                            tooltip: 'Editar',
                            onPressed: () => _abrirFormularioSala(sala),
                          ),
                          IconButton(
                            icon: Icon(Icons.alarm),
                            tooltip: 'Reservas',
                            onPressed: () {
                              context.go(
                                '${AppRouter.reservas}?salaId=${sala.id}',
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
        onPressed: () => _abrirFormularioSala(null),
        child: const Icon(Icons.add),
      ),
    );
  }
}
