import 'package:chamada/data/model/turma.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FormularioTurma extends StatefulWidget {
  final Function(Turma) onSave;
  final Turma? turma;

  const FormularioTurma({super.key, required this.onSave, this.turma});

  @override
  State<FormularioTurma> createState() => _FormularioTurmaState();
}

class _FormularioTurmaState extends State<FormularioTurma> {
  final _formKey = GlobalKey<FormState>();
  bool _carregando = false;

  String? codigo;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Código ou identificador da turma',
                  hintText: 'Ex. B OU 1',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, digite um código ou número para a turma';
                  }
                  return null;
                },
                onSaved: (value) => codigo = value,
                textInputAction: TextInputAction.done,
                initialValue: widget.turma?.codigo,
              ),
              const SizedBox(height: 64.0),
              Row(
                spacing: 12.0,
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => context.pop(),
                      child:
                          _carregando
                              ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.white,
                                  ),
                                ),
                              )
                              : const Text('Cancelar'),
                    ),
                  ),
                  Expanded(
                    child: FilledButton(
                      onPressed: () {
                        if (_carregando || !_formKey.currentState!.validate()) {
                          return;
                        }
                        _formKey.currentState!.save();
                        final novaSala = Turma(
                          id: widget.turma?.id,
                          codigo: codigo!,
                        );

                        widget.onSave(novaSala);
                      },
                      child:
                          _carregando
                              ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.white,
                                  ),
                                ),
                              )
                              : const Text('Salvar'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
