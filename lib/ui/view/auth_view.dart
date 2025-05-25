import 'package:chamada/bloc/autenticacao/autenticacao_bloc.dart';
import 'package:chamada/bloc/autenticacao/event/login_solicitado.dart';
import 'package:chamada/bloc/autenticacao/state/autenticacao_autenticado.dart';
import 'package:chamada/bloc/autenticacao/state/autenticacao_carregando.dart';
import 'package:chamada/bloc/autenticacao/state/autenticacao_falha.dart';
import 'package:chamada/bloc/autenticacao/state/autenticacao_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthView extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _usuarioController = TextEditingController();
  final _senhaController = TextEditingController();

  AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AutenticacaoBloc, AutenticacaoState>(
        listener: (context, state) {
          if (state is AutenticacaoAutenticado) {
            Navigator.of(context).pushReplacementNamed('/chamada');
          } else if (state is AutenticacaoFalha) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.mensagem)));
          }
        },
        child: Center(
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
                    ),
                    obscureText: true,
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
                  ),
                  SizedBox(height: 64.0),
                  BlocBuilder<AutenticacaoBloc, AutenticacaoState>(
                    builder: (context, state) {
                      return FilledButton(
                        onPressed:
                            state is AutenticacaoCarregando
                                ? null
                                : () {
                                  context.read<AutenticacaoBloc>().add(
                                    LoginSolicitado(
                                      usuario: _usuarioController.text,
                                      senha: _senhaController.text,
                                    ),
                                  );
                                },
                        child:
                            state is AutenticacaoCarregando
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
                      );
                    },
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
