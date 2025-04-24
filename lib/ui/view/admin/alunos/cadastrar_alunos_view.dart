import 'package:chamada/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CadastrarAlunosView extends StatefulWidget {
  const CadastrarAlunosView({super.key});

  @override
  State<CadastrarAlunosView> createState() => _CadastrarAlunosViewState();
}

class _CadastrarAlunosViewState extends State<CadastrarAlunosView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro Alunos'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          tooltip: 'Voltar para a lista de alunos',
          onPressed: () => context.go(AppRouter.listaAlunos),
        ),
      ),
      body: Center(
        child: SizedBox(
          width: 320.0,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Text('Nome completo:', style: TextStyle(fontSize: 20.0)),
                SizedBox(height: 24.0),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Ex. Nome Completo do Aluno',
                  ),
                ),
                SizedBox(height: 32.0),
                Text('RA:', style: TextStyle(fontSize: 20.0)),
                SizedBox(height: 24.0),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Ex. 2013458',
                  ),
                ),

                Text('Selecione a turma:', style: TextStyle(fontSize: 20.0)),
                SizedBox(height: 24.0),
                DropdownButton(
                  onChanged: (value) => value,
                  items: [
                    DropdownMenuItem(value: 1, child: const Text("Turma A")),
                    DropdownMenuItem(value: 2, child: const Text("Turma B")),
                    DropdownMenuItem(value: 3, child: const Text("Turma C")),
                  ],
                ),
                SizedBox(height: 64.0),
                SizedBox(height: 64.0),
                Row(
                  spacing: 12.0,
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed:
                            () =>
                                context.canPop()
                                    ? context.pop()
                                    : context.go(AppRouter.reservas),
                        child: const Text('Cancelar'),
                      ),
                    ),
                    Expanded(
                      child: FilledButton(
                        onPressed: () => context.go(AppRouter.listaAlunos),
                        child: const Text('Salvar'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
