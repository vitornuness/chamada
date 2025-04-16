import 'package:flutter/material.dart';

class EditarSalasView extends StatefulWidget {
  final String id;

  const EditarSalasView(this.id, {super.key});

  @override
  State<EditarSalasView> createState() => _EditarSalasViewState();
}

class _EditarSalasViewState extends State<EditarSalasView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: const Text("Editar Salas View"));
  }
}
