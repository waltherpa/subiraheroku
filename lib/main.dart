import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import './screen/s_0_login.dart';
import './screen/s_1_splash.dart';
import './screen/s_2_planner.dart';
import './screen/s_3_agenda.dart';
import './screen/s_4_busqueda.dart';
import './screen/s_5_editar.dart';
import './screen/s_6_resumen.dart';
import './screen/s_7_descarga.dart';

void main() {
  runApp(const ProviderScope(child: MisCitas()));
}

class MisCitas extends StatelessWidget {
  const MisCitas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Citas Pana Autos',
      initialRoute: '/login',
      routes: {
        '/login': ((context) => Login()),
        '/splash': ((context) => const Splash()),
        '/planner': ((context) => Planner()),
        '/agenda': ((context) => const Agenda()),
        '/editar': ((context) => Editar()),
        '/busqueda': ((context) => const Busqueda()),
        '/resumen': ((context) => const Resumen()),
        '/descarga': ((context) => const Descarga()),
      },
    );
  }
}
