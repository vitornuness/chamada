import 'package:chamada/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PainelAdministradorView extends StatefulWidget {
  const PainelAdministradorView({super.key});

  @override
  State<PainelAdministradorView> createState() =>
      _PainelAdministradorViewState();
}

class _PainelAdministradorViewState extends State<PainelAdministradorView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Painel Administrador'),
        centerTitle: true,
      ),
      body: Center(
        child: SizedBox(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    side: BorderSide(width: 1.2),
                    minimumSize: Size(400, 100),
                  ),
                  onPressed: () => context.go(AppRouter.listaTurmas),
                  child: const Text('Alunos'),
                ),
                SizedBox(height: 32.0),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    side: BorderSide(width: 1.2),
                    minimumSize: Size(400, 100),
                  ),
                  onPressed: () => context.go(AppRouter.listaSalas),
                  child: const Text('Salas'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
