import 'package:citas1/model/horas.dart';
import 'package:citas1/model/sedes.dart';
import 'package:citas1/provider/river_clases.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../function/fbase1.dart';
import '../model/horas.dart';
import '../model/logcitas.dart';
import '../provider/globalvariables.dart';

// -----------------------------------------------------
// tabla de planeamiento Automatico
// -----------------------------------------------------
// Crea varias tablas una a lado de otra por cada dia
// dias              : por cada dia
//    Tabla          : crea una tabla
//        Row        : cada fila es uan horario
//            Cell   : cada celda es un par de slots

class TatblaPlanner2 extends ConsumerWidget {
  TatblaPlanner2({Key? key, this.datos}) : super(key: key);

  late List<LogCitas>? datos;
  List<String> dias = listadefechas();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sede = ref.watch(SedeProv);
    final ht = ref.read(horastrabajo);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: dias.map((e) => mitabla(e, datos!, sede, ht.horarios)).toList(),
      ),
    );
  }
}

// crear tablas por cada fecha
Table mitabla(String dias, List<LogCitas> datos, MiSede sede, List<Horas> horarios) {
  List<List<LogCitas>> l2 = filtrodatos(
      dias, datos, sede.sede, horarios); // acomoda la lista con los horarios libres y vacios
  return Table(
    columnWidths: const {0: FixedColumnWidth(100)},
    children: [
      // Fecha
      TableRow(
        decoration: const BoxDecoration(color: Colors.blue),
        children: [
          TableCell(
            child: Card(
              margin: EdgeInsets.all(0),
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              color: Colors.blue,
              child: SizedBox(
                height: 20,
                // width: 20,
                child: Center(
                  child: Text(dias),
                ),
              ),
            ),
            verticalAlignment: TableCellVerticalAlignment.middle,
          ),
        ],
      ),
      // Dia de la Semana
      TableRow(
        decoration: const BoxDecoration(color: Colors.lightBlueAccent),
        children: [
          TableCell(
            child: SizedBox(
              height: 20,
              width: 50,
              child: Center(child: Text(diadelasemana(dias))),
            ),
            verticalAlignment: TableCellVerticalAlignment.middle,
          ),
        ],
      ),
      ...l2.map((e) => generartableplaneamiento(e)).toList(),
    ],
  );
}

// Crea las celdas donde irál los 2 cards de datos con On Tap
TableRow generartableplaneamiento(List<LogCitas> log) {
  return TableRow(children: [
    Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Tablecard(log: log[0], slot: 'slot 1'),
          Tablecard(log: log[1], slot: 'slot 2'),
        ],
      ),
    )
  ]);
}

class Tablecard extends StatelessWidget {
  Tablecard({Key? key, this.log, this.slot}) : super(key: key);
  LogCitas? log;
  String? slot;
  Color? color = Colors.greenAccent.shade100;

  @override
  Widget build(BuildContext context) {
    if (log!.Usuario == "-") {
      color = Colors.white;
    } else if (slot == 'slot 1') {
      color = Colors.blue.shade200;
    } else if (slot == 'slot 2') {
      color = Colors.green.shade200;
    }

    return Card(
      child: SizedBox(height: 20, width: 50, child: Center(child: Text(log!.Placa))),
      color: color,
      margin: const EdgeInsets.all(0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(5),
          bottomRight: Radius.circular(5),
        ),
      ),
    );
  }
}

// acomoda la lista de LogCitas para ingresarlo en la tabla
List<List<LogCitas>> filtrodatos(String dias, List<LogCitas> datos, String sede, List<Horas> h) {
  List<List<LogCitas>> listavalidada = [];
  int i;
  int a;

  for (a = 0; a < h.length; a++) {
    List<int> l_coincidencias = [];
    int s_coincidencias = 0;

    for (i = 0; i < datos.length; i++) {
      if ((datos[i].Sede == sede) && (datos[i].Fecha == dias) && (datos[i].Hora == h[a].Rh)) {
        s_coincidencias++;
        l_coincidencias.add(i);
      }
    }

    if (s_coincidencias == 0) {
      listavalidada.add([
        LogCitas(
            0, '-', '-', h[a].Rh!, '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-'),
        LogCitas(
            0, '-', '-', h[a].Rh!, '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-')
      ]);
    } else if (s_coincidencias == 1) {
      listavalidada.add([
        datos[l_coincidencias[0]],
        LogCitas(
            0, '-', '-', h[a].Rh!, '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-')
      ]); // datos[ubicacion de la conincidencia]
    } else if (s_coincidencias == 2) {
      listavalidada.add([datos[l_coincidencias[0]], datos[l_coincidencias[1]]]);
    }
  }
  return listavalidada;
}

// -----------------------------------------------------
// tabla de horarios
// -----------------------------------------------------
// Crea una sola  tabla
// tabla        : una tabla
//    row       : un horario
//        cell  : una sola columna

class TatblaHorarios extends StatelessWidget {
  TatblaHorarios({Key? key, this.datos}) : super(key: key);

  List<Horas>? datos;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        width: 100,
        child: Table(
          children: [
            // fechas
            const TableRow(
              children: [
                TableCell(
                  child: Card(
                    margin: EdgeInsets.all(0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                      ),
                    ),
                    color: Colors.blue,
                    child: SizedBox(
                      height: 20,
                      width: 100,
                      child: Center(
                        child: Text('Fechas'),
                      ),
                    ),
                  ),
                )
              ],
            ),
            // dia de la semana
            const TableRow(
              decoration: const BoxDecoration(color: Colors.lightBlueAccent),
              children: [
                TableCell(
                  child: SizedBox(
                    height: 20,
                    width: 100,
                    child: Center(
                      child: Text('Dia'),
                    ),
                  ),
                ),
              ],
            ),
            ...datos!.map((e) => generartable2row(e)).toList(),
          ],
        ),
      ),
    );
  }
}

TableRow generartable2row(Horas h) {
  return TableRow(
    decoration: BoxDecoration(color: Colors.blueGrey.shade100),
    children: [
      TableCell(
        child: SizedBox(
          height: 20,
          child: Center(
            child: Text(h.Rh.toString()),
          ),
        ),
      )
    ],
  );
}
