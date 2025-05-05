import 'package:chamada/router.dart';
import 'package:chamada/ui/viewmodel/sala_view_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ListaSalasView extends StatefulWidget {
  const ListaSalasView({super.key});

  @override
  State<ListaSalasView> createState() => _ListaSalasViewState();
}

class _ListaSalasViewState extends State<ListaSalasView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Salas'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed:
              () =>
                  context.canPop()
                      ? context.pop()
                      : context.go(AppRouter.painelAdmin),
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
                            icon: Icon(Icons.edit),
                            tooltip: 'Editar',
                            onPressed:
                                () => context.go(
                                  AppRouter.editarSalas.replaceAll(
                                    ':id',
                                    sala.id.toString(),
                                  ),
                                ),
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
        onPressed: () => context.go(AppRouter.cadastrarSalas),
        child: const Icon(Icons.add),
      ),
    );
  }
}
