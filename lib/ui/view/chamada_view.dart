import 'package:chamada/data/model/aluno.dart';
import 'package:chamada/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ChamadaView extends StatefulWidget {
  const ChamadaView({super.key});

  @override
  State<ChamadaView> createState() => _ChamadaViewState();
}

class _ChamadaViewState extends State<ChamadaView> {
  final aluno = Aluno('Vitor', null, 1, 5);

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
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            LinearProgressIndicator(value: 0.2),
            Row(children: [Text('Sala 000'), Spacer(), Text('00:00')]),
            Spacer(),
            LinearProgressIndicator(value: 0.2),
            Row(children: [Text('Sala 000'), Spacer(), Text('00:00')]),
            Spacer(),
            LinearProgressIndicator(value: 0.2),
            Row(children: [Text('Sala 000'), Spacer(), Text('00:00')]),
            Spacer(),
            LinearProgressIndicator(value: 0.2),
            Row(children: [Text('Sala 000'), Spacer(), Text('00:00')]),
            Spacer(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go(AppRouter.justificativa),
        child: const Icon(Icons.edit_note_rounded),
      ),
    );
  }
}
