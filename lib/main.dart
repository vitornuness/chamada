import 'package:chamada/bloc/autenticacao/autenticacao_bloc.dart';
import 'package:chamada/bloc/autenticacao/event/checar_autenticacao.dart';
import 'package:chamada/bloc/autenticacao/state/autenticacao_autenticado.dart';
import 'package:chamada/bloc/autenticacao/state/autenticacao_inicial.dart';
import 'package:chamada/bloc/autenticacao/state/autenticacao_state.dart';
import 'package:chamada/data/repository/usuario_repository.dart';
import 'package:chamada/data/service/preferences_service.dart';
import 'package:chamada/ui/view/auth_view.dart';
import 'package:chamada/ui/view/chamada_view.dart';
import 'package:chamada/ui/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:chamada/router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await PreferencesService.init();

  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [RepositoryProvider(create: (context) => UsuarioRepository())],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create:
                (context) => AutenticacaoBloc(
                  usuarioRepository: context.read<UsuarioRepository>(),
                )..add(ChecarAutenticacao()),
          ),
        ],
        child: MaterialApp(
          home: BlocBuilder<AutenticacaoBloc, AutenticacaoState>(
            builder: (context, state) {
              if (state is AutenticacaoInicial) {
                return SplashScreen();
              } else if (state is AutenticacaoAutenticado) {
                return ChamadaView();
              } else {
                return AuthView();
              }
            },
          ),
          routes: {
            AppRouter.login: (context) => AuthView(),
            AppRouter.chamada: (context) => ChamadaView(),
          },
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
