import 'package:chamada/data/model/reserva.dart';
import 'package:chamada/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EditarSalasView extends StatefulWidget {
  final String id;

  const EditarSalasView(this.id, {super.key});

  @override
  State<EditarSalasView> createState() => _EditarSalasViewState();
}

class _EditarSalasViewState extends State<EditarSalasView> {
  final reservas = [
    Reserva('19:20', '21:00', 'SEGUNDA', null, 'Lógica de Programação', 1),
    Reserva('21:20', '23:00', 'SEGUNDA', null, 'Banco de Dados', 1),
    Reserva('19:20', '21:00', 'TERÇA', null, 'Lógica de Programação', 1),
    Reserva('21:20', '23:00', 'TERÇA', null, 'Banco de Dados', 1),
  ];

  late List<Reserva> reservasExibidas = [];

  List<Reserva> _listarReservasPorSala(int salaId) {
    return reservas.where((reserva) => reserva.salaId == salaId).toList();
  }

  @override
  void initState() {
    super.initState();
    reservasExibidas = _listarReservasPorSala(int.parse(widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sala - #${widget.id}'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          tooltip: 'Voltar para lista de salas',
          onPressed: () => context.go(AppRouter.listaSalas),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 80.0),
        itemCount: reservasExibidas.length,
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
                onPressed: () => {},
                child: Row(
                  children: [
                    SizedBox(width: 40.0),
                    Text(reservasExibidas[index].inicio),
                    SizedBox(width: 40.0),
                    Text(reservasExibidas[index].fim),
                    SizedBox(width: 120.0),
                    Text(reservasExibidas[index].diaSemana ?? ''),
                    SizedBox(width: 120.0),
                    Text(reservasExibidas[index].data ?? ''),
                    Spacer(),
                    Text(reservasExibidas[index].curso),
                    SizedBox(width: 40.0),
                  ],
                ),
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
