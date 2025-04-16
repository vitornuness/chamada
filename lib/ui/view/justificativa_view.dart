import 'package:flutter/material.dart';

class JustificativaView extends StatefulWidget {
  const JustificativaView({super.key});

  @override
  State<StatefulWidget> createState() => _JustificativaViewState();
}

class _JustificativaViewState extends State<JustificativaView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
      body: Center(
        child: SizedBox(
          width: 320.0,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Spacer(),
                Text(
                  'Selecione abaixo, as aulas que deseja enviar sua justificativa:',
                  style: TextStyle(fontSize: 20.0),
                ),
                Row(
                  children: [
                    Checkbox(value: false, onChanged: (bool? value) {}),
                    const Text('01/01/2025 - Aula 2'),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(value: false, onChanged: (bool? value) {}),
                    const Text('02/01/2025 - Aula 3'),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(value: false, onChanged: (bool? value) {}),
                    const Text('02/01/2025 - Aula 4'),
                  ],
                ),
                SizedBox(height: 32.0),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Digite sua mensagem',
                  ),
                  maxLines: 10,
                ),
                SizedBox(height: 64.0),
                FilledButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Enviar'),
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
