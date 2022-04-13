import 'package:citas_2/functions/p_3_variable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/horas.dart';
import '../models/logcitas.dart';
import '../functions/f_0_functions.dart';
import '../functions/p_2_clases.dart';

class TablaHorarios extends StatelessWidget {
  TablaHorarios({Key? key, this.datos}) : super(key: key);

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
              decoration: BoxDecoration(color: Colors.lightBlueAccent),
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
            child: Text(h.Ri.toString()),
          ),
        ),
      )
    ],
  );
}

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
    final sede = ref.watch(riverSede);
    final ht = ref.read(riverHorasTrabajo);

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
      //  citas por hora
      ...l2.map((e) => generartableplaneamiento(e, sede.sede)).toList(),
    ],
    border: const TableBorder(
        right: BorderSide(width: 0.5, color: Colors.blue, style: BorderStyle.solid),
        left: BorderSide(width: 0.5, color: Colors.blue, style: BorderStyle.solid)),
  );
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
      if ((datos[i].Sede == sede) && (datos[i].Fecha == dias) && (datos[i].Hora == h[a].Ri)) {
        s_coincidencias++;
        l_coincidencias.add(i);
      }
    }

    if (s_coincidencias == 0) {
      listavalidada.add([
        LogCitas(0, '-', dias, h[a].Ri!, '', '', '', '', '', '', '', '', '', '', '', '', ''),
        LogCitas(0, '-', dias, h[a].Ri!, '', '', '', '', '', '', '', '', '', '', '', '', '')
      ]);
    } else if (s_coincidencias == 1) {
      listavalidada.add([
        datos[l_coincidencias[0]],
        LogCitas(0, '-', dias, h[a].Ri!, '', '', '', '', '', '', '', '', '', '', '', '', '')
      ]); // datos[ubicacion de la conincidencia]
    } else if (s_coincidencias == 2) {
      listavalidada.add([datos[l_coincidencias[0]], datos[l_coincidencias[1]]]);
    }
  }
  return listavalidada;
}

// Crea las celdas donde irál los 2 cards de datos con On Tap
TableRow generartableplaneamiento(List<LogCitas> log, String sede) {
  return TableRow(
    children: [
      Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Tablecard(
              log: log[0],
              slot: 'slot 1',
              sede: sede,
            ),
            Tablecard(
              log: log[1],
              slot: 'slot 2',
              sede: sede,
            ),
          ],
        ),
      )
    ],
  );
}

class Tablecard extends StatelessWidget {
  Tablecard({Key? key, this.log, this.slot, required this.sede}) : super(key: key);
  LogCitas? log;
  String? slot;
  Color? color = Colors.greenAccent.shade100;
  String sede;

  Color ColorCard(LogCitas lo, String slot, String m_sede) {
    if ((lo.Usuario == "-") || (lo.Usuario == "")) {
      return ColorAdministrativo(lo.Hora, m_sede);
    } else if (slot == 'slot 1') {
      return color = Colors.blue.shade300;
    } else if (slot == 'slot 2') {
      return color = Colors.green.shade300;
    } else {
      throw color = Colors.greenAccent.shade100;
    }
  }

  Color ColorAdministrativo(String mm_hora, String mm_sede) {
    if ((mm_sede == "Surquillo") &&
        ((mm_hora == '08:00') ||
            (mm_hora == '08:15') ||
            (mm_hora == '08:30') ||
            (mm_hora == '09:00') ||
            (mm_hora == '09:15') ||
            (mm_hora == '09:30') ||
            (mm_hora == '09:45') ||
            (mm_hora == '10:00') ||
            (mm_hora == '11:15'))) {
      return color = Colors.green.shade100;
    } else if ((mm_sede == "San Miguel") &&
        ((mm_hora == '08:00') ||
            (mm_hora == '08:15') ||
            (mm_hora == '08:30') ||
            (mm_hora == '09:00') ||
            (mm_hora == '09:15') ||
            (mm_hora == '09:30') ||
            (mm_hora == '09:45') ||
            (mm_hora == '10:00') ||
            (mm_hora == '11:00') ||
            (mm_hora == '11:15'))) {
      return color = Colors.green.shade100;
    } else {
      return color = Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    // if (log!.Usuario == "-") {
    //   color = Colors.white;
    // } else if (slot == 'slot 1') {
    //   color = Colors.blue.shade300;
    // } else if (slot == 'slot 2') {
    //   color = Colors.green.shade300;
    // }

    return GestureDetector(
      onDoubleTap: () {
        if (log!.Usuario != "-") {
          // si esta lleno
          Navigator.of(context).pushNamed('/editar', arguments: log);
        } else {
          // si está vacio
          Navigator.of(context).pushNamed('/editar', arguments: log);
        }
      },
      child: Card(
        child: SizedBox(
            height: 20,
            width: 50,
            child: Center(
                child: Text(
              log!.Placa,
              style: const TextStyle(fontSize: 10),
            ))),
        color: ColorCard(log!, slot!, sede),
        // color: color,
        margin: const EdgeInsets.all(0),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(5),
            bottomRight: Radius.circular(5),
          ),
        ),
      ),
    );
  }
}
