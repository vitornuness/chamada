import 'package:chamada/data/model/sala.dart';
import 'package:chamada/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ListaSalasView extends StatefulWidget {
  const ListaSalasView({super.key});

  @override
  State<ListaSalasView> createState() => _ListaSalasViewState();
}

class _ListaSalasViewState extends State<ListaSalasView> {
  final salas = [Sala("427"), Sala("428")];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Salas'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          tooltip: 'Voltar para o painel administrador',
          onPressed: () => context.go(AppRouter.painelAdmin),
        ),
      ),
      body: ListView.builder(
        itemCount: salas.length,
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
                onPressed:
                    () => context.go(
                      AppRouter.editarSalas.replaceAll(':id', index.toString()),
                    ),
                child: Text('Sala ${salas[index].codigo}'),
              ),
            ),
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
