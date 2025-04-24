import 'package:chamada/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CadastrarAparelhoView extends StatefulWidget {
  const CadastrarAparelhoView({super.key});

  @override
  State<CadastrarAparelhoView> createState() => _CadastrarAparelhoViewState();
}

class _CadastrarAparelhoViewState extends State<CadastrarAparelhoView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chamada'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          tooltip: 'Voltar para a chamada',
          onPressed: () => context.go(AppRouter.chamada),
        ),
      ),
      body: Center(
        child: SizedBox(
          width: 320.0,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Text(
                  'Informe o endereço MAC do seu aparelho:',
                  style: TextStyle(fontSize: 20.0),
                ),
                SizedBox(height: 24.0),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Ex. 00:19:B9:FB:E2:58',
                  ),
                ),
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
                        onPressed: () => context.go(AppRouter.chamada),
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
