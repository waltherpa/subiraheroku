import 'package:citas1/provider/globalvariables.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';
import '../common/widgets.dart';
import '../function/mobile.dart' if (dart.library.html) '../function/web.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../function/fbase1.dart';

class Descarga extends ConsumerWidget {
  const Descarga({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.read(resf);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Descarga'),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: Consumer(
        builder: (((context, ref, child) {
          return data.map(
            error: (_) => Text(_.error.toString()),
            loading: (_) => CircularProgressIndicator(),
            data: (_) => Center(
              child: GuardarBoton(
                label: 'Descarga',
                width: 150,
                height: 50,
                agenda: () async {
                  // Create a Excel document.
                  //Creating a workbook.
                  final Workbook workbook = Workbook();
                  //Accessing via index
                  final Worksheet sheet = workbook.worksheets[0];
                  sheet.showGridlines = true;
                  for (int i = 0; i < _.value.length; i++) {
                    sheet
                        .getRangeByIndex(i + 1, 1)
                        .setText(_.value[i].id_lg.toString());
                    sheet.getRangeByIndex(i + 1, 2).setText(_.value[i].Usuario);
                    sheet.getRangeByIndex(i + 1, 3).setText(_.value[i].Fecha);
                    sheet.getRangeByIndex(i + 1, 4).setText(_.value[i].Hora);
                    sheet.getRangeByIndex(i + 1, 5).setText(_.value[i].Placa);
                    sheet.getRangeByIndex(i + 1, 6).setText(_.value[i].Modelo);
                    sheet.getRangeByIndex(i + 1, 7).setText(_.value[i].Nveh);
                    sheet.getRangeByIndex(i + 1, 8).setText(_.value[i].Nombre);
                    sheet
                        .getRangeByIndex(i + 1, 9)
                        .setText(_.value[i].Documento);
                    sheet.getRangeByIndex(i + 1, 10).setText(_.value[i].Correo);
                    sheet
                        .getRangeByIndex(i + 1, 11)
                        .setText(_.value[i].Telefono);
                    sheet
                        .getRangeByIndex(i + 1, 12)
                        .setText(_.value[i].TipoProblema);
                    sheet
                        .getRangeByIndex(i + 1, 13)
                        .setText(_.value[i].SuptipoProblema);
                    sheet
                        .getRangeByIndex(i + 1, 14)
                        .setText(_.value[i].TipoLlamada);
                    sheet.getRangeByIndex(i + 1, 15).setText(_.value[i].Sede);
                    sheet
                        .getRangeByIndex(i + 1, 16)
                        .setText(_.value[i].EstadoCita);
                  }
                  //Save and launch the excel.
                  final List<int> bytes = workbook.saveAsStream();
                  //Dispose the document.
                  workbook.dispose();
                  //Save and launch the file.
                  await saveAndLAunchFile(bytes, 'DataPanaAutos.xlsx');

                  Navigator.pop(context);
                },
              ),
            ),
          );
        })),
      ),
    );
  }
}
