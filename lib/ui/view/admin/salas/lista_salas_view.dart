import 'package:flutter/material.dart';

class ListaSalasView extends StatefulWidget {
  const ListaSalasView({super.key});

  @override
  State<ListaSalasView> createState() => _ListaSalasViewState();
}

class _ListaSalasViewState extends State<ListaSalasView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: const Text("Lista Salas View"));
  }
}
