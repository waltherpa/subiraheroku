import 'package:citas1/provider/globalvariables.dart';
import 'package:citas1/provider/river_clases.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../common/widgets.dart';

class Planner extends ConsumerWidget {
  Planner({Key? key}) : super(key: key);
  TextEditingController placaCtrl = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sede = ref.watch(SedeProv);
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            (sede.sede == "Surquillo") ? Colors.blue : Colors.green,
        title: Text('Planner: ${sede.sede}'),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // botones control
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // boton agendar
                  const Boton(
                    label: "Agendar",
                    width: 150,
                    height: 50,
                    ruta: "/agenda",
                  ),
                  // field placa
                  CampoDeTexto(
                    label: 'Placa',
                    width: 100,
                    height: 50,
                    controlador: placaCtrl,
                  ),
                  // boton buscar
                  Boton(
                    label: "buscar Placa",
                    width: 150,
                    height: 50,
                    ruta: "/",
                    controlador: placaCtrl,
                  ),
                  // boton resumen
                  const Boton(
                    label: "Resumen",
                    width: 150,
                    height: 50,
                    ruta: "/resumen",
                  ),
                  // boton seguiente semana
                  const Boton(
                    label: "<",
                    width: 50,
                    height: 50,
                    ruta: "/",
                  ),
                  BotonCallback(
                    label: ">",
                    width: 50,
                    height: 50,
                    // ruta: "/",
                    callback: () {
                      ref.watch(SedeProv).cambiosede();
                    },
                  ),
                ],
              ),
            ),
            // table time planner
            const Expanded(
              flex: 5,
              child: TatblaPlanner(),
            ),
          ],
        ),
      ),
    );
  }
}
