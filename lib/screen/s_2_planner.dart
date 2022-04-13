import 'package:citas_2/common/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../functions/p_3_variable.dart';
import '../common/widgets_planner.dart';
import '../models/base1.dart';

class Planner extends ConsumerWidget {
  Planner({Key? key}) : super(key: key);

  TextEditingController placaCtrl = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sede = ref.watch(riverSede);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: (sede.sede == "Surquillo") ? Colors.blue : Colors.green,
        title: Text('Planner: Sede ${sede.sede}'),
        actions: [
          IconButton(
            onPressed: () {
              ref.watch(riverSede).cambiosede();
            },
            icon: const Icon(Icons.home),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // agendar
                  BotonCallback(
                    label: 'Agendar',
                    width: 150,
                    height: 50,
                    callback: () {
                      Navigator.of(context).pushNamed('/agenda',
                          arguments: Base1(0, '', '', '', '', '', '', '', '', '', '', '', ''));
                    },
                  ),
                  // campo de placa
                  CampoDeTexto(
                    label: 'Placa',
                    width: 100,
                    height: 50,
                    controlador: placaCtrl,
                  ),
                  // buscar
                  BotonCallback(
                    label: 'Buscar',
                    width: 150,
                    height: 50,
                    callback: () {
                      if (placaCtrl.text != '') {
                        Navigator.pushNamed(context, '/busqueda', arguments: placaCtrl);
                      }
                    },
                  ),
                  // resumen
                  BotonCallback(
                    label: 'Resumen',
                    width: 150,
                    height: 50,
                    callback: () {
                      Navigator.pushNamed(context, '/resumen');
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: SingleChildScrollView(
                child: Row(
                  children: [
                    // Tabla de horarios
                    Consumer(builder: (((context, ref, child) {
                      final horarios = ref.watch(riverHoras);
                      return horarios.map(
                        error: (_) => Text(_.error.toString()),
                        loading: (_) => Container(
                          width: 100,
                          child: LinearProgressIndicator(),
                        ),
                        data: (_) => TablaHorarios(
                          datos: _.value,
                        ),
                      );
                    }))),
                    // Tablas de dias
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Container(
                          child: Consumer(
                            builder: (((context, ref, child) {
                              final resumen = ref.watch(riverResumen);
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
