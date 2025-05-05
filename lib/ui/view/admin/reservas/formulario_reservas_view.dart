import 'package:chamada/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FormularioReservasView extends StatefulWidget {
  final String? id;

  const FormularioReservasView(this.id, {super.key});

  @override
  State<FormularioReservasView> createState() => _FormularioReservasViewState();
}

class _FormularioReservasViewState extends State<FormularioReservasView> {
  final _formKey = GlobalKey<FormState>();
  final _inicioController = TextEditingController();
  final _terminoController = TextEditingController();
  final _cursoController = TextEditingController();
  bool _carregando = false;

  @override
  void dispose() {
    _inicioController.dispose();
    _terminoController.dispose();
    super.dispose();
  }

  Future<void> _criarReserva(String codigo) async {
    // TODO
    throw UnimplementedError();
  }

  Future<void> _editarReserva(int id, String codigo) async {
    // TODO
    throw UnimplementedError();
  }

  Future<void> _salvar() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _carregando = true;
      });

      try {
        if (widget.id == null || widget.id!.isEmpty) {
          await _criarReserva(_inicioController.text);
        } else {
          await _editarReserva(int.parse(widget.id!), _inicioController.text);
        }

        context.go(AppRouter.reservas);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erro ao salvar reserva: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      } finally {
        if (mounted) {
          setState(() {
            _carregando = false;
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.id != null ? 'Editar Reserva' : 'Cadastrar Reserva'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go(AppRouter.listaSalas),
        ),
      ),
      body: Center(
        child: SizedBox(
          width: 320.0,
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 40.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: 140.0),
                        child: TextFormField(
                          controller: _inicioController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Início',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Obrigatório';
                            }
                            return null;
                          },
                          onTap: () async {
                            TimeOfDay? hora = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            );
                            setState(() {
                              _inicioController.text =
                                  hora != null
                                      ? hora.format(context).split(' ')[0]
                                      : '';
                            });
                          },
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                      Spacer(),
                      ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: 140.0),
                        child: TextFormField(
                          controller: _terminoController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Término',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Obrigatório';
                            }
                            return null;
                          },
                          onTap: () async {
                            TimeOfDay? hora = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            );
                            setState(() {
                              _terminoController.text =
                                  hora != null
                                      ? hora.format(context).split(' ')[0]
                                      : '';
                            });
                          },
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32.0),
                  TextFormField(
                    controller: _cursoController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Curso',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, informe o nome do curso';
                      }
                      return null;
                    },
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 64.0),
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
                          onPressed: _carregando ? null : _salvar,
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
        ),
      ),
    );
  }
}
