import 'package:chamada/data/model/reserva.dart';
import 'package:chamada/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ReservasView extends StatefulWidget {
  final String? salaId;

  const ReservasView(this.salaId, {super.key});

  @override
  State<ReservasView> createState() => _ReservasViewState();
}

class _ReservasViewState extends State<ReservasView> {
  final reservas = [
    Reserva('19:20', '21:00', 'SEGUNDA', null, 'Lógica de Programação', 1, 1),
    Reserva('21:20', '23:00', 'SEGUNDA', null, 'Banco de Dados', 1, 1),
    Reserva('19:20', '21:00', 'TERÇA', null, 'Lógica de Programação', 1, 1),
    Reserva('21:20', '23:00', 'TERÇA', null, 'Banco de Dados', 1, 1),
  ];

  late List<Reserva> reservasExibidas = [];

  List<Reserva> _listarReservasPorSala(int salaId) {
    return reservas.where((reserva) => reserva.salaId == salaId).toList();
  }

  @override
  void initState() {
    super.initState();
    reservasExibidas =
        widget.salaId == null || widget.salaId!.isEmpty
            ? reservas
            : _listarReservasPorSala(int.parse(widget.salaId!));
  }

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
      body: ListView.builder(
        itemCount: reservasExibidas.length,
        itemBuilder: (context, index) {
          final reserva = reservasExibidas[index];
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
                    '${reserva.diaSemana ?? reserva.data} [${reserva.inicio} - ${reserva.fim}]',
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
                                index.toString(),
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go(AppRouter.cadastrarReservas),
        child: const Icon(Icons.add),
      ),
    );
  }
}
