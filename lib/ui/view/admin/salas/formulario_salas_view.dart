import 'package:chamada/data/service/sala_service.dart';
import 'package:chamada/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class FormularioSalasView extends StatefulWidget {
  final String? id;
  const FormularioSalasView(this.id, {super.key});

  @override
  State<FormularioSalasView> createState() => _FormularioSalasViewState();
}

class _FormularioSalasViewState extends State<FormularioSalasView> {
  final _formKey = GlobalKey<FormState>();
  final _codigoController = TextEditingController();
  bool _carregando = false;

  @override
  void dispose() {
    _codigoController.dispose();
    super.dispose();
  }

  Future<void> _criarSala(String codigo) async {
    await context.read<SalaService>().criar(_codigoController.text);
  }

  Future<void> _editarSala(int id, String codigo) async {
    await context.read<SalaService>().editar(id, _codigoController.text);
  }

  Future<void> _salvar() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _carregando = true;
      });

      try {
        if (widget.id == null || widget.id!.isEmpty) {
          await _criarSala(_codigoController.text);
        } else {
          await _editarSala(int.parse(widget.id!), _codigoController.text);
        }

        context.go(AppRouter.listaSalas);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erro ao salvar sala: ${e.toString()}'),
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
        title: Text(widget.id != null ? 'Editar Sala' : 'Cadastrar Sala'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed:
              () =>
                  context.canPop()
                      ? context.pop()
                      : context.go(AppRouter.listaSalas),
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
                  TextFormField(
                    controller: _codigoController,
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
                    textInputAction: TextInputAction.done,
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
                                      : context.go(AppRouter.listaSalas),
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
