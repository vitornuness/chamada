import 'package:chamada/data/model/aluno.dart';
import 'package:chamada/ui/viewmodel/turma_view_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class FormularioAluno extends StatefulWidget {
  final Function(Aluno) onSave;
  final Aluno? aluno;

  const FormularioAluno({super.key, required this.onSave, this.aluno});

  @override
  State<FormularioAluno> createState() => _FormularioAlunoState();
}

class _FormularioAlunoState extends State<FormularioAluno> {
  final _formKey = GlobalKey<FormState>();
  bool _carregando = false;

  String? codigoRegistro;
  String? nome;
  String? aparelho;
  int? turmaId;
  int? usuarioId;

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
                  labelText: 'Código de registro do aluno',
                  hintText: 'Ex. 1876631',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, digite um código para o aluno';
                  }
                  return null;
                },
                onSaved: (value) => codigoRegistro = value,
                textInputAction: TextInputAction.next,
                initialValue: widget.aluno?.codigoRegistro,
              ),
              const SizedBox(height: 32.0),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nome do aluno',
                  hintText: 'Ex. Nome do Aluno',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, digite um nome para o aluno';
                  }
                  return null;
                },
                onSaved: (value) => nome = value,
                textInputAction: TextInputAction.next,
                initialValue: widget.aluno?.nome,
              ),
              const SizedBox(height: 32.0),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'MAC do aparelho',
                  hintText: 'Ex. 00:19:B9:FB:E2:58',
                ),
                onSaved: (value) => aparelho = value,
                textInputAction: TextInputAction.next,
                initialValue: widget.aluno?.aparelho,
              ),
              const SizedBox(height: 32.0),
              Text('Selecione a turma:', style: TextStyle(fontSize: 16.0)),
              SizedBox(height: 24.0),
              DropdownButton(
                onChanged:
                    (value) => setState(() {
                      turmaId = value;
                    }),
                value: turmaId ?? widget.aluno?.turmaId,
                items:
                    context
                        .read<TurmaViewModel>()
                        .getListaTurmas
                        .map(
                          (t) => DropdownMenuItem(
                            value: t.id!,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20.0,
                                vertical: 12.0,
                              ),
                              child: Text(t.codigo),
                            ),
                          ),
                        )
                        .toList(),
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
                        final novoAluno = Aluno(
                          id: widget.aluno?.id,
                          codigoRegistro: codigoRegistro!,
                          nome: nome!,
                          turmaId: turmaId!,
                          usuarioId: usuarioId!,
                          aparelho: aparelho,
                        );

                        widget.onSave(novoAluno);
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
