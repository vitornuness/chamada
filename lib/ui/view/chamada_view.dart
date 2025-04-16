import 'package:chamada/ui/view/justificativa_view.dart';
import 'package:flutter/material.dart';

class ChamadaView extends StatefulWidget {
  const ChamadaView({super.key});

  @override
  State<ChamadaView> createState() => _ChamadaViewState();
}

class _ChamadaViewState extends State<ChamadaView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chamada'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.signal_wifi_statusbar_connected_no_internet_4,
            ),
            tooltip: 'Dispositivo desconectado',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Você deve ir para a sala 000.')),
              );
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
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const JustificativaView()),
          );
        },
        child: const Icon(Icons.edit_note_rounded),
      ),
    );
  }
}
