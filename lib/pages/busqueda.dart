import 'package:citas1/model/logcitas.dart';
import 'package:citas1/provider/globalvariables.dart';
import 'package:flutter/material.dart';
import '../common/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Busqueda extends ConsumerWidget {
  const Busqueda({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final datos = ModalRoute.of(context)!.settings.arguments as LogCitas;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Editar de Cliente'),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back)),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.start,
            //   children: [
            //     MiTexto(eltexto: datos.),
            //     MiTexto(eltexto: _.value[0].CLIENTE as String),
            //     MiTexto(eltexto: _.value[0].TELEFONO1 as String),
            //   ],
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.start,
            //   children: [
            //     MiTexto(eltexto: _.value[0].EMAIL as String),
            //     MiTexto(eltexto: _.value[0].COD_CLIENTE as String),
            //     MiTexto(eltexto: _.value[0].PLACA_VEH_TARJETA as String),
            //   ],
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.start,
            //   children: [
            //     MiTexto(eltexto: _.value[0].SERIE as String),
            //     MiTexto(
            //       eltexto: _.value[0].VERSION_MODELO as String,
            //     ),
            //     MiTexto(eltexto: _.value[0].COLOR as String),
            //   ],
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.start,
            //   children: [
            //     MiTexto(eltexto: _.value[0].NROMOTOR_VEH as String),
            //     MiTexto(eltexto: _.value[0].CHASIS_VEH as String),
            //     MiTexto(eltexto: _.value[0].BASE as String),
            //   ],
            // ),
          ],
        ));
  }
}
