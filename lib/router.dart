import 'package:chamada/ui/view/admin/alunos/cadastrar_alunos_view.dart';
import 'package:chamada/ui/view/admin/alunos/lista_alunos_view.dart';
import 'package:chamada/ui/view/admin/painel_administrador_view.dart';
import 'package:chamada/ui/view/admin/salas/cadastrar_salas_view.dart';
import 'package:chamada/ui/view/admin/salas/editar_salas_view.dart';
import 'package:chamada/ui/view/admin/salas/lista_salas_view.dart';
import 'package:chamada/ui/view/admin/turmas/cadastrar_turmas_view.dart';
import 'package:chamada/ui/view/admin/turmas/editar_turmas_view.dart';
import 'package:chamada/ui/view/admin/turmas/lista_turmas_view.dart';
import 'package:chamada/ui/view/cadastrar_aparelho_view.dart';
import 'package:chamada/ui/view/justificativa_view.dart';
import 'package:go_router/go_router.dart';

import 'package:chamada/data/service/auth_service.dart';
import 'package:chamada/ui/view/auth_view.dart';
import 'package:chamada/ui/view/chamada_view.dart';
import 'package:provider/provider.dart';

class AppRouter {
  static const String splash = '/';
  static const String login = '/login';

  static const String chamada = '/chamada';
  static const String justificativa = '/justificativa';
  static const String cadastrarAparelho = '/aparelho/cadastro';

  static const String painelAdmin = '/admin/painel';
  static const String cadastrarAlunos = '/admin/alunos/cadastro';
  static const String listaAlunos = '/admin/alunos';
  static const String cadastrarSalas = '/admin/salas/cadastro';
  static const String editarSalas = '/admin/salas/:id/editar';
  static const String listaSalas = '/admin/salas';
  static const String cadastrarTurmas = '/admin/turmas/cadastro';
  static const String editarTurmas = '/admin/turmas/:id/editar';
  static const String listaTurmas = '/admin/turmas';

  static final GoRouter router = GoRouter(
    initialLocation: AppRouter.chamada,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(path: AppRouter.login, builder: (context, state) => AuthView()),
      GoRoute(
        path: AppRouter.chamada,
        builder: (context, state) => ChamadaView(),
      ),
      GoRoute(
        path: AppRouter.justificativa,
        builder: (context, state) => JustificativaView(),
      ),
      GoRoute(
        path: AppRouter.cadastrarAparelho,
        builder: (context, state) => CadastrarAparelhoView(),
      ),
      GoRoute(
        path: AppRouter.cadastrarAlunos,
        builder: (context, state) => CadastrarAlunosView(),
      ),
      GoRoute(
        path: AppRouter.listaAlunos,
        builder:
            (context, state) =>
                ListaAlunosView(state.uri.queryParameters['turmaId']),
      ),
      GoRoute(
        path: AppRouter.cadastrarSalas,
        builder: (context, state) => CadastrarSalasView(),
      ),
      GoRoute(
        path: AppRouter.editarSalas,
        builder:
            (context, state) => EditarSalasView(state.pathParameters['id']!),
      ),
      GoRoute(
        path: AppRouter.listaSalas,
        builder: (context, state) => ListaSalasView(),
      ),
      GoRoute(
        path: AppRouter.cadastrarTurmas,
        builder: (context, state) => CadastrarTurmasView(),
      ),
      GoRoute(
        path: AppRouter.editarTurmas,
        builder:
            (context, state) => EditarTurmasView(state.pathParameters['id']!),
      ),
      GoRoute(
        path: AppRouter.listaTurmas,
        builder: (context, state) => ListaTurmasView(),
      ),
      GoRoute(
        path: AppRouter.painelAdmin,
        builder: (context, state) => PainelAdministradorView(),
      ),
    ],
    redirect: (context, state) {
      final isAuthenticated = context.read<AuthService>().isAuthenticated;
      final isAdmin = context.read<AuthService>().isAdmin;

      final publicRoutes = [AppRouter.splash, AppRouter.login];
      final adminRoutes = [
        AppRouter.painelAdmin,
        AppRouter.cadastrarAlunos,
        AppRouter.listaAlunos,
        AppRouter.cadastrarSalas,
        AppRouter.editarSalas,
        AppRouter.listaSalas,
        AppRouter.cadastrarTurmas,
        AppRouter.editarTurmas,
        AppRouter.listaTurmas,
      ];

      if (!isAuthenticated && !publicRoutes.contains(state.matchedLocation)) {
        return AppRouter.login;
      }

      if (!isAdmin && adminRoutes.contains(state.matchedLocation)) {
        return AppRouter.chamada;
      }

      if (isAdmin && state.matchedLocation == AppRouter.chamada) {
        return AppRouter.painelAdmin;
      }

      if (isAuthenticated && state.matchedLocation == AppRouter.login) {
        return AppRouter.chamada;
      }

      return null;
    },
  );
}
