import 'package:chamada/router.dart';
import 'package:chamada/ui/viewmodel/reserva_view_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ReservasView extends StatefulWidget {
  final String? salaId;

  const ReservasView(this.salaId, {super.key});

  @override
  State<ReservasView> createState() => _ReservasViewState();
}

class _ReservasViewState extends State<ReservasView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reservas'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          tooltip: 'Voltar para lista de salas',
          onPressed: () => context.go(AppRouter.listaSalas),
        ),
      ),
      body: Consumer<ReservaViewModel>(
        builder: (context, reservaViewmodel, child) {
          var reservas =
              widget.salaId == null
                  ? reservaViewmodel.getListaReservas
                  : reservaViewmodel.getListaReservasPorSala(
                    int.parse(widget.salaId!),
                  );
          return ListView.builder(
            itemCount: reservas.length,
            itemBuilder: (context, index) {
              final reserva = reservas[index];
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
                        '${reserva.diaSemana?.getNome ?? reserva.data} [${reserva.inicio} - ${reserva.fim}]',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(reserva.curso),
                      trailing: Wrap(
                        spacing: 8,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit),
                            tooltip: 'Editar',
                            onPressed:
                                () => context.go(
                                  AppRouter.editarReservas.replaceAll(
                                    ':id',
                                    reserva.id.toString(),
                                  ),
                                ),
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            tooltip: 'Excluir',
                            onPressed: () {
                              context.go(AppRouter.listaSalas);
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
        onPressed: () => context.go(AppRouter.cadastrarReservas),
        child: const Icon(Icons.add),
      ),
    );
  }
}
