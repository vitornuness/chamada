import 'package:chamada/ui/viewmodel/aluno_view_model.dart';
import 'package:chamada/ui/viewmodel/auth_view_model.dart';
import 'package:chamada/ui/viewmodel/justificativa_view_model.dart';
import 'package:chamada/ui/viewmodel/registro_view_model.dart';
import 'package:chamada/ui/viewmodel/reserva_view_model.dart';
import 'package:chamada/ui/viewmodel/sala_view_model.dart';
import 'package:chamada/ui/viewmodel/turma_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chamada/router.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthViewModel()),
        ChangeNotifierProvider(create: (context) => AlunoViewModel()),
        ChangeNotifierProvider(create: (context) => JustificativaViewModel()),
        ChangeNotifierProvider(create: (context) => RegistroViewModel()),
        ChangeNotifierProvider(create: (context) => ReservaViewModel()),
        ChangeNotifierProvider(create: (context) => SalaViewModel()),
        ChangeNotifierProvider(create: (context) => TurmaViewModel()),
      ],
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
    );
  }
}
