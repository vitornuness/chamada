import 'package:chamada/bloc/autenticacao/state/autenticacao_state.dart';
import 'package:chamada/data/model/usuario.dart';

class AutenticacaoAutenticado extends AutenticacaoState {
  final Usuario usuario;

  const AutenticacaoAutenticado(this.usuario);

  @override
  List<Object> get props => [usuario];
}
