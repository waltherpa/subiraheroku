import 'package:citas_2/models/base1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../common/widgets.dart';
import '../functions/p_3_variable.dart';

class Busqueda extends ConsumerWidget {
  const Busqueda({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final datos = ModalRoute.of(context)!.settings.arguments as TextEditingController;
    final busqueda = ref.watch(riverPlaca(datos.text));
    final busquedacita = ref.watch(riverCita(datos.text));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Datos del Cliente'),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Consumer(
              builder: ((context, ref, child) {
                return busqueda.map(
                    error: (_) => Text(_.error.toString()),
                    loading: (_) => const LinearProgressIndicator(),
                    data: (_) => Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SimpleCard(
                                  label: 'Datos del cliente',
                                  width: 500,
                                  height: 30,
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SimpleCard(
                                  label: 'Cliente',
                                  width: 160,
                                  height: 20,
                                ),
                                SimpleCard(
                                  label: 'Email',
                                  width: 160,
                                  height: 20,
                                ),
                                SimpleCard(
                                  label: 'Persona Contacto',
                                  width: 160,
                                  height: 20,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                MiTexto(
                                  eltexto: _.value[0].CLIENTE,
                                  width: 160,
                                  height: 30,
                                ),
                                MiTexto(
                                  eltexto: _.value[0].EMAIL,
                                  width: 160,
                                  height: 30,
                                ),
                                MiTexto(
                                  eltexto: _.value[0].PERSONA_CONTACTO,
                                  width: 160,
                                  height: 30,
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SimpleCard(
                                  label: 'Codigo Cliente',
                                  width: 160,
                                  height: 20,
                                ),
                                SimpleCard(
                                  label: 'Telefono',
                                  width: 160,
                                  height: 20,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                MiTexto(
                                  eltexto: _.value[0].COD_CLIENTE,
                                  width: 160,
                                  height: 30,
                                ),
                                MiTexto(
                                  eltexto: _.value[0].TELEFONO1,
                                  width: 160,
                                  height: 30,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SimpleCard(
                                  label: 'Placa',
                                  width: 160,
                                  height: 20,
                                ),
                                SimpleCard(
                                  label: 'Nro Motor',
                                  width: 160,
                                  height: 20,
                                ),
                                SimpleCard(
                                  label: 'Color',
                                  width: 160,
                                  height: 20,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                MiTexto(
                                  eltexto: _.value[0].PLACA_VEH_TARJETA,
                                  width: 160,
                                  height: 30,
                                ),
                                MiTexto(
                                  eltexto: _.value[0].NROMOTOR_VEH,
                                  width: 160,
                                  height: 30,
                                ),
                                MiTexto(
                                  eltexto: _.value[0].COLOR,
                                  width: 160,
                                  height: 30,
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SimpleCard(
                                  label: 'Modelo',
                                  width: 160,
                                  height: 20,
                                ),
                                SimpleCard(
                                  label: 'Serie',
                                  width: 160,
                                  height: 20,
                                ),
                                SimpleCard(
                                  label: 'Fuente Información',
                                  width: 160,
                                  height: 20,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                MiTexto(
                                  eltexto: _.value[0].VERSION_MODELO,
                                  width: 160,
                                  height: 30,
                                ),
                                MiTexto(
                                  eltexto: _.value[0].SERIE,
                                  width: 160,
                                  height: 30,
                                ),
                                MiTexto(
                                  eltexto: _.value[0].BASE,
                                  width: 160,
                                  height: 30,
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                BotonCallback(
                                  label: 'Agendar',
                                  width: 150,
                                  height: 50,
                                  callback: () {
                                    if ((_.value[0].CLIENTE != "-") && (_.value[0].CLIENTE != "")) {
                                      Navigator.of(context)
                                          .pushNamed('/agenda', arguments: _.value[0]);
                                    } else {
                                      Navigator.of(context).pushNamed('/agendar',
                                          arguments: Base1(
                                              0, '', '', '', '', '', '', '', '', '', '', '', ''));
                                    }
                                  },
                                )
                              ],
                            )
                          ],
                        ));
              }),
            ),
          ),
          Expanded(
            flex: 1,
            child: Consumer(
              builder: ((context, ref, child) {
                return busquedacita.map(
                  error: (_) => Text(_.error.toString()),
                  loading: (_) => LinearProgressIndicator(),
                  data: (_) => Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SimpleCard(
                            label: 'Datos de Citas',
                            width: 500,
                            height: 30,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                              children: [
                                ..._.value.map(
                                  (e) => Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [SimpleCard2(datos: e)],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}
