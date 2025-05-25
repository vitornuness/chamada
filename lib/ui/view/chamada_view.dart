import 'dart:math';

import 'package:chamada/data/model/aluno.dart';
import 'package:chamada/data/model/sala.dart';
import 'package:chamada/router.dart';
import 'package:chamada/ui/viewmodel/registro_view_model.dart';
import 'package:chamada/ui/viewmodel/reserva_view_model.dart';
import 'package:chamada/ui/viewmodel/sala_view_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ChamadaView extends StatelessWidget {
  ChamadaView({super.key});

  final aluno = Aluno(
    id: 1,
    codigoRegistro: '1888888',
    nome: 'Fulano',
    turmaId: 1,
    usuarioId: 1,
  );

  final registrosAtuais = [];

  final sala = Sala(codigo: '1');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chamada'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              aluno.aparelho != null
                  ? Icons.signal_wifi_statusbar_connected_no_internet_4
                  : Icons.security_update_warning,
            ),
            tooltip: 'Dispositivo desconectado',
            onPressed: () {
              if (aluno.aparelho != null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Você deve ir para a sala 000.'),
                  ),
                );
              } else {
                context.go(AppRouter.cadastrarAparelho);
              }
            },
          ),
        ],
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 1200.0, maxHeight: 1000.0),
          child: Column(
            children: List.generate(registrosAtuais.length, (index) {
              return Column(
                children: [
                  LinearProgressIndicator(value: Random().nextDouble()),
                  Row(
                    children: [
                      Text('Sala ${sala?.codigo}'),
                      Spacer(),
                      Text(registrosAtuais[index].tempo),
                    ],
                  ),
                  SizedBox(height: 140.0),
                ],
              );
            }),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go(AppRouter.justificativa),
        child: const Icon(Icons.edit_note_rounded),
      ),
    );
  }
}
