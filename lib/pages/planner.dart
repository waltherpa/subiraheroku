import 'package:citas1/provider/globalvariables.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../common/widgets.dart';
import '../common/widgetplanner.dart';

class Planner extends ConsumerWidget {
  Planner({Key? key}) : super(key: key);
  TextEditingController placaCtrl = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sede = ref.watch(SedeProv);
    // final resumen = ref.watch(resf);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: (sede.sede == "Surquillo") ? Colors.blue : Colors.green,
        title: Text('Planner: ${sede.sede}'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
            onPressed: () {
              ref.watch(SedeProv).cambiosede();
            },
            icon: const Icon(Icons.home),
          )
        ],
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
                  Boton(
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
                    ruta: "/busqueda",
                    controlador: placaCtrl,
                  ),
                  // boton resumen
                  Boton(
                    label: "Resumen",
                    width: 150,
                    height: 50,
                    ruta: "/resumen",
                  ),
                  // boton seguiente semana
                ],
              ),
            ),
            // table time planner
            Expanded(
              flex: 5,
              child: SingleChildScrollView(
                child: Row(
                  children: [
                    // table fixed part: horarios
                    Consumer(builder: (((context, ref, child) {
                      final horarios = ref.watch(horasf);
                      return horarios.map(
                          error: (_) => Text(_.error.toString()),
                          loading: (_) => Container(
                                width: 100,
                                child: const LinearProgressIndicator(),
                              ),
                          data: (_) => TatblaHorarios(
                                datos: _.value,
                              ));
                    }))),
                    // table moving part: planeamiento
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Container(
                          child: Consumer(
                            builder: (((context, ref, child) {
                              final resumen = ref.watch(resf);
                              return resumen.map(
                                error: (_) => Text(_.error.toString()),
                                loading: (_) => Container(
                                  child: const LinearProgressIndicator(),
                                  width: 100,
                                ),
                                data: (_) => TatblaPlanner2(
                                  datos: _.value,
                                ),
                              );
                            })),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
