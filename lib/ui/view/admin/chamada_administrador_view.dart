import 'package:chamada/router.dart';
import 'package:chamada/ui/viewmodel/aluno_view_model.dart';
import 'package:chamada/ui/viewmodel/registro_view_model.dart';
import 'package:chamada/ui/viewmodel/reserva_view_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ChamadaAdministradorView extends StatelessWidget {
  final String turmaId;

  const ChamadaAdministradorView(this.turmaId, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chamada'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          tooltip: 'Voltar para lista de turmas',
          onPressed: () => context.go(AppRouter.listaTurmas),
        ),
      ),
      body: Consumer<RegistroViewModel>(
        builder: (context, registroViewModel, child) {
          final reserva = context
              .read<ReservaViewModel>()
              .getListaReservasDoDiaPorTurma(int.parse(turmaId));
          return ListView.builder(
            itemCount:
                registroViewModel
                    .getRegistrosAtuaisByReserva(reserva[0].id!)
                    .length,
            itemBuilder: (context, index) {
              final registro =
                  registroViewModel.getRegistrosAtuaisByReserva(
                    reserva[0].id!,
                  )[index];
              final aluno =
                  context.read<AlunoViewModel>().findAluno(registro.alunoId)!;
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
                            icon: Icon(Icons.check),
                            tooltip: 'Marcar presença',
                            onPressed: () {
                              // TODO
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.close),
                            tooltip: 'Marcar falta',
                            onPressed: () {
                              // TODO
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
    );
  }
}
