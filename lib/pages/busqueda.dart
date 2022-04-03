import 'package:citas1/provider/globalvariables.dart';
import 'package:flutter/material.dart';
import '../common/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Busqueda extends ConsumerWidget {
  const Busqueda({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final placa = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Editar de Cliente'),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back)),
        ),
        body: Consumer(builder: (context, ref, _) {
          final respuesta = ref.watch(presf(placa));
          return respuesta.map(
              error: (_) => Text(_.error.toString()),
              loading: (_) => const CircularProgressIndicator(),
              data: (_) => Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          MiTexto(
                              eltexto: _.value[0].PERSONA_CONTACTO as String),
                          MiTexto(eltexto: _.value[0].CLIENTE as String),
                          MiTexto(eltexto: _.value[0].TELEFONO1 as String),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          MiTexto(eltexto: _.value[0].EMAIL as String),
                          MiTexto(eltexto: _.value[0].COD_CLIENTE as String),
                          MiTexto(
                              eltexto: _.value[0].PLACA_VEH_TARJETA as String),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          MiTexto(eltexto: _.value[0].SERIE as String),
                          MiTexto(
                            eltexto: _.value[0].VERSION_MODELO as String,
                          ),
                          MiTexto(eltexto: _.value[0].COLOR as String),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          MiTexto(eltexto: _.value[0].NROMOTOR_VEH as String),
                          MiTexto(eltexto: _.value[0].CHASIS_VEH as String),
                          MiTexto(eltexto: _.value[0].BASE as String),
                        ],
                      ),
                    ],
                  ));
        }));
  }
}
