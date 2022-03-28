import 'package:citas1/provider/globalvariables.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import '../model/logcitas.dart';
import '../common/widgets.dart';

class Resumen extends ConsumerWidget {
  const Resumen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resumen de Citas'),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Boton(
                  label: 'Descargar',
                  width: 150,
                  height: 50,
                  ruta: '/descarga',
                ),
              ],
            ),
          ),
          Expanded(
            flex: 5,
            child: Consumer(builder: (((context, ref, child) {
              final resumen = ref.watch(resf);
              return resumen.map(
                error: (_) => Text(_.error.toString()),
                loading: (_) => const LinearProgressIndicator(),
                data: (_) => SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SingleChildScrollView(
                    child: DataTable(
                      columns: const [
                        DataColumn(label: Text('Id'), tooltip: 'Id'),
                        DataColumn(
                            label: Text('Usuario'),
                            tooltip: 'Usuario que registra'),
                        DataColumn(
                            label: Text('Fecha'),
                            tooltip: 'Fecha de la cita acordada'),
                        DataColumn(
                            label: Text('Hora'),
                            tooltip: 'Hora de la cita acordada'),
                        DataColumn(
                            label: Text('Placa'), tooltip: 'Placa de la moto'),
                        DataColumn(
                            label: Text('Modelo'),
                            tooltip: 'Modelo de la moto'),
                        DataColumn(
                            label: Text('N Veh.'), tooltip: 'Numero de serie'),
                        DataColumn(
                            label: Text('Nombre'),
                            tooltip: 'Nombre del cliente'),
                        DataColumn(
                            label: Text('DNI'),
                            tooltip: 'Numero de documento del cliente'),
                        DataColumn(
                            label: Text('Correo'),
                            tooltip: 'Correo electronico'),
                        DataColumn(
                            label: Text('Telefono'),
                            tooltip: 'Telefono/Celular'),
                        DataColumn(
                            label: Text('Tipo Problema'),
                            tooltip: 'Tipo Problema'),
                        DataColumn(
                            label: Text('Sub Tipo'), tooltip: 'Sub Tipo'),
                        DataColumn(label: Text('Llamada'), tooltip: 'Llamada'),
                        DataColumn(label: Text('Sede'), tooltip: 'Sede'),
                        DataColumn(
                            label: Text('Estado'),
                            tooltip: 'Estado de la Cita'),
                      ],
                      rows: _.value
                          .map((e) => DataRow(cells: [
                                DataCell(Text(e.id_lg.toString())),
                                DataCell(Text(e.Usuario)),
                                DataCell(Text(e.Fecha)),
                                DataCell(Text(e.Hora)),
                                DataCell(Text(e.Placa)),
                                DataCell(Text(e.Modelo)),
                                DataCell(Text(e.Nveh)),
                                DataCell(Text(e.Nombre)),
                                DataCell(Text(e.Documento)),
                                DataCell(Text(e.Correo)),
                                DataCell(Text(e.Telefono)),
                                DataCell(Text(e.TipoProblema)),
                                DataCell(Text(e.SuptipoProblema)),
                                DataCell(Text(e.TipoLlamada)),
                                DataCell(Text(e.Sede)),
                                DataCell(Text(e.EstadoCita)),
                              ]))
                          .toList(),
                    ),
                  ),
                ),
              );
            }))),
          ),
        ],
      ),
    );
  }
}
