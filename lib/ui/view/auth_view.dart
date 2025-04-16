import 'package:chamada/data/service/auth_service.dart';
import 'package:chamada/router.dart';
import 'package:chamada/ui/view/chamada_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AuthView extends StatefulWidget {
  const AuthView({super.key});

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  final _formKey = GlobalKey<FormState>();
  final _usuarioController = TextEditingController();
  final _senhaController = TextEditingController();
  bool _carregando = false;
  bool _esconderSenha = true;

  @override
  void dispose() {
    _usuarioController.dispose();
    _senhaController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _carregando = true;
      });

      try {
        final sucesso = await context.read<AuthService>().login(
          _usuarioController.text,
          _senhaController.text,
        );

        if (sucesso) {
          context.go(AppRouter.chamada);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Usuário ou senha inválidos'),
              backgroundColor: Colors.red,
            ),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erro ao fazer login: ${e.toString()}'),
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
      body: Center(
        child: SizedBox(
          width: 320.0,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Spacer(),
                TextFormField(
                  controller: _usuarioController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'RA/Usuário',
                    hintText: 'Ex. 1234567 OU seu_usuario',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, digite seu usuário ou RA';
                    }

                    return null;
                  },
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(height: 32.0),
                TextFormField(
                  controller: _senhaController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Senha',
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _esconderSenha = !_esconderSenha;
                        });
                      },
                      icon: Icon(
                        _esconderSenha
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    ),
                  ),
                  obscureText: _esconderSenha,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, digite sua senha';
                    }

                    if (value.length < 6) {
                      return 'A senha deve possuir mais de 6 caracteres';
                    }

                    return null;
                  },
                  textInputAction: TextInputAction.done,
                  onFieldSubmitted: (_) => _login(),
                ),
                SizedBox(height: 64.0),
                FilledButton(
                  onPressed: _carregando ? null : _login,
                  child:
                      _carregando
                          ? SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.white,
                              ),
                            ),
                          )
                          : Text('Acessar'),
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
