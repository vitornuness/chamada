import 'package:bloc/bloc.dart';
import 'package:chamada/bloc/autenticacao/event/autenticacao_event.dart';
import 'package:chamada/bloc/autenticacao/event/checar_autenticacao.dart';
import 'package:chamada/bloc/autenticacao/event/login_solicitado.dart';
import 'package:chamada/bloc/autenticacao/state/autenticacao_autenticado.dart';
import 'package:chamada/bloc/autenticacao/state/autenticacao_carregando.dart';
import 'package:chamada/bloc/autenticacao/state/autenticacao_falha.dart';
import 'package:chamada/bloc/autenticacao/state/autenticacao_inicial.dart';
import 'package:chamada/bloc/autenticacao/state/autenticacao_nao_autenticado.dart';
import 'package:chamada/bloc/autenticacao/state/autenticacao_state.dart';
import 'package:chamada/data/repository/usuario_repository.dart';

class AutenticacaoBloc extends Bloc<AutenticacaoEvent, AutenticacaoState> {
  final UsuarioRepository usuarioRepository;

  AutenticacaoBloc({required this.usuarioRepository})
    : super(AutenticacaoInicial()) {
    on<ChecarAutenticacao>(_onChecharAutenticacao);
    on<LoginSolicitado>(_onLoginSolicitado);
  }

  Future<void> _onChecharAutenticacao(
    ChecarAutenticacao event,
    Emitter<AutenticacaoState> emit,
  ) async {
    emit(AutenticacaoCarregando());
    try {
      final usuarioAutenticado =
          await usuarioRepository.getUsuarioAutenticado();
      if (usuarioAutenticado != null) {
        emit(AutenticacaoAutenticado(usuarioAutenticado));
      }
    } catch (e) {
      emit(AutenticacaoFalha(e.toString()));
    }
  }

  Future<void> _onLoginSolicitado(
    LoginSolicitado event,
    Emitter<AutenticacaoState> emit,
  ) async {
    emit(AutenticacaoCarregando());
    try {
      await usuarioRepository.login(event.usuario, event.senha);
      final usuario = await usuarioRepository.getUsuarioAutenticado();
      emit(AutenticacaoAutenticado(usuario!));
    } catch (e) {
      emit(AutenticacaoFalha(e.toString()));
    }
  }
}
