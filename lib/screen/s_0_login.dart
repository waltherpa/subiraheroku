import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../common/widgets.dart';
import '../functions/f_0_functions.dart';
import '../functions/f_1_clases.dart';
import '../models/horas.dart';
import '../functions/p_3_variable.dart';

class Login extends ConsumerWidget {
  Login({Key? key}) : super(key: key);

  TextEditingController usuarioCtlr = TextEditingController();
  TextEditingController claveCtlr = TextEditingController();
  List? l;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w500, fontSize: 30),
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
            CampoDeTexto(
              label: "nombre usuario",
              width: 300,
              height: 50,
              controlador: usuarioCtlr,
            ),
            // contraseña
            CampoDeTexto(
              label: "contraseña",
              width: 300,
              height: 50,
              controlador: claveCtlr,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(300, 10, 300, 0),
              child: ElevatedButton(
                onPressed: () async {
                  // login
                  l = await identificarusuario(usuario: usuarioCtlr, clave: claveCtlr) as List;
                  if (l![0]['status'] == "ok") {
                    // carga de horarios
                    List<Horas> mishoras = await RangoDeHora().mishoras();
                    ref.read(riverHorasTrabajo).cargadehorarios(mishoras);

                    // ingreso
                    ref.read(riverUsuario).identifyUser(usuarioCtlr.text);
                    Navigator.pushReplacementNamed(context, '/splash');
                  } else {
                    final sanck = SnackBar(
                      content: const Text('Clave o contraseña incorrecta, intente nuevamente'),
                      action: SnackBarAction(
                        label: 'Ok',
                        onPressed: () {},
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(sanck);
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
