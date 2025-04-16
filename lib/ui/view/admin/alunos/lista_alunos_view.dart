import 'package:flutter/material.dart';

class ListaAlunosView extends StatefulWidget {
  const ListaAlunosView({super.key});

  @override
  State<ListaAlunosView> createState() => _ListaAlunosViewState();
}

class _ListaAlunosViewState extends State<ListaAlunosView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: const Text("Lista Alunos View"));
  }
}
