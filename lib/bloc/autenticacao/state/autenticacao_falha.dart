import 'package:chamada/bloc/autenticacao/state/autenticacao_state.dart';

class AutenticacaoFalha extends AutenticacaoState {
  final String mensagem;

  const AutenticacaoFalha(this.mensagem);

  @override
  List<Object> get props => [mensagem];
}
