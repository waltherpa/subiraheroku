import 'package:flutter/material.dart';
import 'package:citas1/pages/agenda.dart';
import 'package:citas1/pages/planner.dart';
import 'package:citas1/pages/busqueda.dart';
import 'package:citas1/pages/resumen.dart';
import 'package:citas1/utilities/buttons.dart';
import 'package:citas1/function/fbase1.dart';

void main() {
  runApp(const MisCitas());
}

class MisCitas extends StatelessWidget {
  const MisCitas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mis Citas',
      initialRoute: '/',
      routes: {
        '/': (context) => const LandingScreen(),
        '/planner': (context) => const Planner(),
        '/agenda': (context) => const Agenda(),
        '/busqueda': (context) => const Busqueda(),
        '/resumen': (context) => const Resumen(),
      },
    );
  }
}

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  TextEditingController usuarioCtlr = TextEditingController();
  TextEditingController claveCtlr = TextEditingController();
  List? l;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: const Text(
                'CITAS DE MOTOS',
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                    fontSize: 30),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: const Text(
                'ingreso',
                style: TextStyle(fontSize: 20),
              ),
            ),
            // nombre usuario
            CampodeTexto(
              label: "nombre usuario",
              width: 300,
              height: 50,
              controller: usuarioCtlr,
            ),
            // contraseña
            CampodeTexto(
              label: "contraseña",
              width: 300,
              height: 50,
              controller: claveCtlr,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(300, 10, 300, 0),
              child: ElevatedButton(
                onPressed: () async {
                  l = await identificarusuario(
                      usuario: usuarioCtlr, clave: claveCtlr) as List;
                  if (l![0]['status'] == "ok") {
                    Navigator.pushNamed(context, '/planner');
                  }
                },
                child: const Text('ingresar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
