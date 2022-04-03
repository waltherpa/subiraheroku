import 'package:citas1/model/horas.dart';
import 'package:flutter/material.dart';
import '../function/fbase1.dart';

import '../model/logcitas.dart';

// -----------------------------------------------------
// tabla de planeamiento Automatico
// -----------------------------------------------------

// Crea varias tablas una a lado de otra por cada dia
// dias              : por cada dia
//    Tabla          : crea una tabla
//        Row        : cada fila es uan horario
//            Cell   : cada celda es un par de slots

class TatblaPlanner2 extends StatelessWidget {
  TatblaPlanner2({Key? key, this.datos}) : super(key: key);

  late List<LogCitas>? datos;
  List<String> dias = listadefechas();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: dias.map((e) => mitabla(e, datos!)).toList(),
      ),
    );
  }
}

// crear tablas por cada fecha
SizedBox mitabla(String dias, List<LogCitas> datos) {
  return SizedBox(
    width: 200,
    child: Table(
      children: [
        // Fecha
        TableRow(
          decoration: const BoxDecoration(color: Colors.blue),
          children: [
            TableCell(
              child: SizedBox(
                height: 20,
                width: 50,
                child: Center(child: Text(dias)),
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
        //...items.map((e) => generartablerow(e)).toList(),
      ],
    ),
  );
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
              decoration: const BoxDecoration(color: Colors.blue),
              children: [
                TableCell(
                  child: SizedBox(
                    height: 20,
                    width: 100,
                    child: Center(
                      child: Text('Fechas'),
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
