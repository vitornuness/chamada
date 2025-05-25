import 'package:chamada/bloc/autenticacao/event/autenticacao_event.dart';

class LoginSolicitado extends AutenticacaoEvent {
  final String usuario;
  final String senha;

  const LoginSolicitado({required this.usuario, required this.senha});

  @override
  List<Object> get props => [usuario, senha];
}
