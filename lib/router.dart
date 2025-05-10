import 'package:chamada/ui/view/admin/alunos_view.dart';
import 'package:chamada/ui/view/admin/chamada_administrador_view.dart';
import 'package:chamada/ui/view/admin/justificativas_administrador_view.dart';
import 'package:chamada/ui/view/admin/painel_administrador_view.dart';
import 'package:chamada/ui/view/admin/reservas/formulario_reservas_view.dart';
import 'package:chamada/ui/view/admin/reservas/reservas_view.dart';
import 'package:chamada/ui/view/admin/salas_view.dart';
import 'package:chamada/ui/view/admin/turmas_view.dart';
import 'package:chamada/ui/view/cadastrar_aparelho_view.dart';
import 'package:chamada/ui/view/justificativa_view.dart';
import 'package:chamada/ui/viewmodel/auth_view_model.dart';
import 'package:go_router/go_router.dart';

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
  static const String chamadaAdmin = '/admin/chamada';
  static const String justificativasAdmin = '/admin/justificativas';
  static const String listaAlunos = '/admin/alunos';
  static const String cadastrarReservas = '/admin/reservas/cadastro';
  static const String editarReservas = '/admin/reservas/:id/editar';
  static const String reservas = '/admin/reservas';
  static const String listaSalas = '/admin/salas';
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
        path: AppRouter.listaAlunos,
        builder:
            (context, state) =>
                AlunosView(state.uri.queryParameters['turmaId']),
      ),
      GoRoute(
        path: AppRouter.cadastrarReservas,
        builder: (context, state) => FormularioReservasView(null),
      ),
      GoRoute(
        path: AppRouter.editarReservas,
        builder:
            (context, state) =>
                FormularioReservasView(state.pathParameters['id']!),
      ),
      GoRoute(
        path: AppRouter.reservas,
        builder:
            (context, state) =>
                ReservasView(state.uri.queryParameters['salaId']),
      ),
      GoRoute(
        path: AppRouter.listaSalas,
        builder: (context, state) => SalasView(),
      ),
      GoRoute(
        path: AppRouter.listaTurmas,
        builder: (context, state) => TurmasView(),
      ),
      GoRoute(
        path: AppRouter.painelAdmin,
        builder: (context, state) => PainelAdministradorView(),
      ),
      GoRoute(
        path: AppRouter.chamadaAdmin,
        builder:
            (context, state) =>
                ChamadaAdministradorView(state.uri.queryParameters['turmaId']!),
      ),
      GoRoute(
        path: AppRouter.justificativasAdmin,
        builder: (context, state) => JustificativasAdministradorView(),
      ),
    ],
    redirect: (context, state) {
      final isAuthenticated =
          context.read<AuthViewModel>().getUsuarioAutenticado != null;
      final isAdmin =
          context.read<AuthViewModel>().getUsuarioAutenticado?.ehAdmin ?? false;

      final publicRoutes = [AppRouter.splash, AppRouter.login];
      final adminRoutes = [
        AppRouter.painelAdmin,
        AppRouter.chamadaAdmin,
        AppRouter.justificativasAdmin,
        AppRouter.listaAlunos,
        AppRouter.listaSalas,
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
