import 'package:chamada/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EditarTurmasView extends StatefulWidget {
  final String id;

  const EditarTurmasView(this.id, {super.key});

  @override
  State<EditarTurmasView> createState() => _EditarTurmasViewState();
}

class _EditarTurmasViewState extends State<EditarTurmasView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Turma - #${widget.id}'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          tooltip: 'Voltar para lista de turmas',
          onPressed: () => context.go(AppRouter.listaTurmas),
        ),
      ),
      body: Center(
        child: SizedBox(
          width: 320.0,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Spacer(),
                TextFormField(
                  decoration: const InputDecoration(
                    label: Text('Código ou identificador:'),
                    border: OutlineInputBorder(),
                    hintText: 'Ex. A ou 3-C',
                  ),
                ),
                SizedBox(height: 64.0),
                FilledButton(
                  onPressed: () => context.go(AppRouter.listaTurmas),
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
