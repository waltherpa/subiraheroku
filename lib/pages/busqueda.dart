import 'package:citas1/model/logcitas.dart';
import 'package:citas1/provider/globalvariables.dart';
import 'package:flutter/material.dart';
import '../common/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Busqueda extends ConsumerWidget {
  const Busqueda({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final datos = ModalRoute.of(context)!.settings.arguments as TextEditingController;
    final busqueda = ref.watch(presf(datos.text));
    final busquedacita = ref.watch(citaf(datos.text));
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
                                    width: 640,
                                    height: 30,
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SimpleCard(
                                    label: 'Cliente',
                                    width: 200,
                                    height: 20,
                                  ),
                                  SimpleCard(
                                    label: 'Email',
                                    width: 200,
                                    height: 20,
                                  ),
                                  SimpleCard(
                                    label: 'Persona Contacto',
                                    width: 200,
                                    height: 20,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  MiTexto(
                                    eltexto: _.value[0].CLIENTE,
                                    width: 200,
                                    height: 30,
                                  ),
                                  MiTexto(
                                    eltexto: _.value[0].EMAIL,
                                    width: 200,
                                    height: 30,
                                  ),
                                  MiTexto(
                                    eltexto: _.value[0].PERSONA_CONTACTO,
                                    width: 200,
                                    height: 30,
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SimpleCard(
                                    label: 'Codigo Cliente',
                                    width: 200,
                                    height: 20,
                                  ),
                                  SimpleCard(
                                    label: 'Telefono',
                                    width: 200,
                                    height: 20,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  MiTexto(
                                    eltexto: _.value[0].COD_CLIENTE,
                                    width: 200,
                                    height: 30,
                                  ),
                                  MiTexto(
                                    eltexto: _.value[0].TELEFONO1,
                                    width: 200,
                                    height: 30,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SimpleCard(
                                    label: 'Placa',
                                    width: 200,
                                    height: 20,
                                  ),
                                  SimpleCard(
                                    label: 'Nro Motor',
                                    width: 200,
                                    height: 20,
                                  ),
                                  SimpleCard(
                                    label: 'Color',
                                    width: 200,
                                    height: 20,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  MiTexto(
                                    eltexto: _.value[0].PLACA_VEH_TARJETA,
                                    width: 200,
                                    height: 30,
                                  ),
                                  MiTexto(
                                    eltexto: _.value[0].NROMOTOR_VEH,
                                    width: 200,
                                    height: 30,
                                  ),
                                  MiTexto(
                                    eltexto: _.value[0].COLOR,
                                    width: 200,
                                    height: 30,
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SimpleCard(
                                    label: 'Modelo',
                                    width: 200,
                                    height: 20,
                                  ),
                                  SimpleCard(
                                    label: 'Serie',
                                    width: 200,
                                    height: 20,
                                  ),
                                  SimpleCard(
                                    label: 'Fuente Información',
                                    width: 200,
                                    height: 20,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  MiTexto(
                                    eltexto: _.value[0].VERSION_MODELO,
                                    width: 200,
                                    height: 30,
                                  ),
                                  MiTexto(
                                    eltexto: _.value[0].SERIE,
                                    width: 200,
                                    height: 30,
                                  ),
                                  MiTexto(
                                    eltexto: _.value[0].BASE,
                                    width: 200,
                                    height: 30,
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
                                    width: 640,
                                    height: 30,
                                  ),
                                  ..._.value.map((e) => Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          MiTexto(
                                            eltexto: e.Placa,
                                            width: 200,
                                            height: 20,
                                          )
                                        ],
                                      ))
                                ],
                              ),
                            ],
                          ));
                }),
              ),
            )
          ],
        ));
  }
}
