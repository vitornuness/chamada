import 'dart:math';

import 'package:chamada/data/model/aluno.dart';
import 'package:chamada/router.dart';
import 'package:chamada/ui/viewmodel/aluno_view_model.dart';
import 'package:chamada/ui/viewmodel/registro_view_model.dart';
import 'package:chamada/ui/viewmodel/reserva_view_model.dart';
import 'package:chamada/ui/viewmodel/sala_view_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ChamadaView extends StatefulWidget {
  const ChamadaView({super.key});

  @override
  State<ChamadaView> createState() => _ChamadaViewState();
}

class _ChamadaViewState extends State<ChamadaView> {
  @override
  Widget build(BuildContext context) {
    return Selector<AlunoViewModel, Aluno>(
      selector:
          (context, alunoViewModel) => alunoViewModel.getAlunoAutenticado!,
      builder: (context, aluno, child) {
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
          body: Consumer<RegistroViewModel>(
            builder: (context, registroViewModel, child) {
              final registrosAtuais = registroViewModel
                  .getRegistrosAtuaisByAluno(aluno.id);
              return Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 1200.0,
                    maxHeight: 1000.0,
                  ),
                  child: Column(
                    children: List.generate(registrosAtuais.length, (index) {
                      final reserva = context
                          .read<ReservaViewModel>()
                          .findReserva(registrosAtuais[index].reservaId);
                      final sala = context.read<SalaViewModel>().findSala(
                        reserva!.salaId,
                      );
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
              );
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => context.go(AppRouter.justificativa),
            child: const Icon(Icons.edit_note_rounded),
          ),
        );
      },
    );
  }
}
