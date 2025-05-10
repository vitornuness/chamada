import 'package:chamada/data/model/sala.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FormularioSala extends StatefulWidget {
  final Function(Sala) onSave;
  final Sala? sala;

  const FormularioSala({super.key, required this.onSave, this.sala});

  @override
  State<FormularioSala> createState() => _FormularioSalaState();
}

class _FormularioSalaState extends State<FormularioSala> {
  final _formKey = GlobalKey<FormState>();
  bool _carregando = false;

  String? codigo;
  String? ipAparelho;

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
                  labelText: 'Código ou identificador',
                  hintText: 'Ex. 101 OU 101-A',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, digite um código ou número para a sala';
                  }
                  return null;
                },
                onSaved: (value) => codigo = value,
                textInputAction: TextInputAction.next,
                initialValue: widget.sala?.codigo,
              ),
              SizedBox(height: 24.0),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'IP do roteador',
                  hintText: 'Ex. ',
                ),
                onSaved: (value) => ipAparelho = value,
                textInputAction: TextInputAction.done,
                initialValue: widget.sala?.ipAparelho,
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
                        final novaSala = Sala(
                          id: widget.sala?.id,
                          codigo: codigo!,
                          ipAparelho: ipAparelho,
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
