import 'package:flutter/material.dart';

class EditarTurmasView extends StatefulWidget {
  final String id;

  const EditarTurmasView(this.id, {super.key});

  @override
  State<EditarTurmasView> createState() => _EditarTurmasViewState();
}

class _EditarTurmasViewState extends State<EditarTurmasView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: const Text("Editar Turmas View"));
  }
}
