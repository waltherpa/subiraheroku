import 'dart:async';

import 'package:citas1/provider/globalvariables.dart';
import 'package:citas1/provider/river_clases.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Boton
class Boton extends StatelessWidget {
  const Boton({
    Key? key,
    this.label = "label",
    this.width = 10,
    this.height = 10,
    this.ruta,
    this.controlador,
    this.funcion,
  }) : super(key: key);
  final String label;
  final double width;
  final double height;
  final String? ruta;
  final TextEditingController? controlador;
  final void Function()? funcion;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: SizedBox(
        width: width,
        height: height,
        child: ElevatedButton(
          onPressed: () {
            if (ruta != null) {
              Navigator.pushNamed(context, ruta!);
            }
          },
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.blue,
              fontSize: 15,
            ),
          ),
          style: ElevatedButton.styleFrom(
            primary: Colors.white,
          ),
        ),
      ),
    );
  }
}

// campo de texto
class CampoDeTexto extends StatelessWidget {
  const CampoDeTexto({
    Key? key,
    this.label = "label",
    this.width = 10,
    this.height = 10,
    this.controlador,
    this.funcion,
  }) : super(key: key);
  final String label;
  final double width;
  final double height;
  final TextEditingController? controlador;
  final VoidCallback? funcion;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: SizedBox(
        width: width,
        height: height,
        child: TextField(
          controller: controlador,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: label,
          ),
          onTap: () {
            if (funcion != null) {
              funcion;
            }
          },
        ),
      ),
    );
  }
}

// comentarios
class Comentarios extends StatelessWidget {
  const Comentarios({
    Key? key,
    this.label = "label",
    this.width = 10,
    this.height = 10,
    this.controller,
  }) : super(key: key);
  final String label;
  final double width;
  final double height;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: SizedBox(
        width: width,
        height: height,
        child: TextField(
          controller: controller,
          maxLines: 4,
          keyboardType: TextInputType.multiline,
          decoration: InputDecoration(
              border: const OutlineInputBorder(), labelText: label),
        ),
      ),
    );
  }
}

// desplegable1
class Desplegable extends ConsumerWidget {
  Desplegable({
    Key? key,
    required this.opciones,
    required this.opcioninicial,
  }) : super(key: key);
  late List opciones;
  late String opcioninicial;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButton(
        value: opcioninicial,
        items: opciones
            .map<DropdownMenuItem<String>>(
              (e) => DropdownMenuItem<String>(
                child: Text(e),
                value: e,
              ),
            )
            .toList(),
        onChanged: (String? y) {
          ref.watch(drop1).setOptions(y!);
        },
      ),
    );
  }
}

// desplegable2
class Desplegable2 extends ConsumerWidget {
  Desplegable2({
    Key? key,
    required this.opciones,
    required this.opcioninicial,
  }) : super(key: key);
  late List opciones;
  late String opcioninicial;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButton(
        value: opcioninicial,
        items: opciones
            .map<DropdownMenuItem<String>>(
              (e) => DropdownMenuItem<String>(
                child: Text(e),
                value: e,
              ),
            )
            .toList(),
        onChanged: (String? y) {
          ref.watch(drop2).setop(y!);
        },
      ),
    );
  }
}

// desplegable 3: fechas disponibles
class Desplegable3 extends ConsumerWidget {
  Desplegable3({
    Key? key,
    required this.opciones,
    required this.opcioninicial,
  }) : super(key: key);
  late List opciones;
  late String opcioninicial;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButton(
        value: opcioninicial,
        items: opciones
            .map<DropdownMenuItem<String>>(
              (e) => DropdownMenuItem<String>(
                child: Text(e),
                value: e,
              ),
            )
            .toList(),
        onChanged: (String? y) {
          ref.watch(drop2).setop(y!);
        },
      ),
    );
  }
}

// tabla de planeamiento
class TatblaPlanner extends StatelessWidget {
  const TatblaPlanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          // defaultColumnWidth: const FixedColumnWidth(60),
          // columnWidths: const {
          //   0: FractionColumnWidth(0.4),
          //   2: FractionColumnWidth(0.3),
          // },
          border: TableBorder(
            verticalInside: BorderSide(color: Colors.blue.shade200),
            horizontalInside: BorderSide(color: Colors.blue.shade200),
          ),
          children: [
            TableRow(
              children: [
                const Card(
                  margin: EdgeInsets.all(0),
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(10))),
                  color: Colors.blue,
                  child: SizedBox(
                    height: 30,
                    child: Center(
                      child: Text(
                        '----',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                CardHeader(label: 'Lunes', color: Colors.blue),
                CardHeader(label: 'Martes', color: Colors.blue),
                CardHeader(label: 'Miercoles', color: Colors.blue),
                CardHeader(label: 'Jueves', color: Colors.blue),
                CardHeader(label: 'Viernes', color: Colors.blue),
                const Card(
                  margin: EdgeInsets.all(0),
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.only(topRight: Radius.circular(10))),
                  color: Colors.blue,
                  child: SizedBox(
                    height: 30,
                    child: Center(
                      child: Text(
                        'Sabado',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                CardHeader(label: '-', color: Colors.blue.shade200),
                CardHeader(label: '28/03/2022', color: Colors.blue.shade200),
                CardHeader(label: '29/03/2022', color: Colors.blue.shade200),
                CardHeader(label: '30/03/2022', color: Colors.blue.shade200),
                CardHeader(label: '31/03/2022', color: Colors.blue.shade200),
                CardHeader(label: '01/04/2022', color: Colors.blue.shade200),
                CardHeader(label: '02/04/2022', color: Colors.blue.shade200),
              ],
            ),
            TableRow(
              children: [
                CardHeader(
                    label: "7:00-7:10",
                    color: Colors.blue.shade200,
                    altura: 20),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "354765", slot2: "-"),
                CardData(slot1: "-", slot2: "7980TB"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
              ],
            ),
            TableRow(
              children: [
                CardHeader(
                    label: "7:00-7:10",
                    color: Colors.blue.shade200,
                    altura: 20),
                CardData(slot1: "4331TB", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
              ],
            ),
            TableRow(
              children: [
                CardHeader(
                    label: "7:10-7:20",
                    color: Colors.blue.shade200,
                    altura: 20),
                CardData(slot1: "2824JB", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
              ],
            ),
            TableRow(
              children: [
                CardHeader(
                    label: "7:20-7:30",
                    color: Colors.blue.shade200,
                    altura: 20),
                CardData(slot1: "3305QB", slot2: "4586DB"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "3444AB"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
              ],
            ),
            TableRow(
              children: [
                CardHeader(
                    label: "7:30-7:40",
                    color: Colors.blue.shade200,
                    altura: 20),
                CardData(slot1: "6073MB", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "4944TB", slot2: "7356KB"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "9452RB", slot2: "-"),
              ],
            ),
            TableRow(
              children: [
                CardHeader(
                    label: "7:40-7:50",
                    color: Colors.blue.shade200,
                    altura: 20),
                CardData(slot1: "7183EA", slot2: "2423RB"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
              ],
            ),
            TableRow(
              children: [
                CardHeader(
                    label: "7:50-8:00",
                    color: Colors.blue.shade200,
                    altura: 20),
                CardData(slot1: "1379QB", slot2: "6662TB"),
                CardData(slot1: "8357TB", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
              ],
            ),
            TableRow(
              children: [
                CardHeader(
                    label: "8:00-8:10",
                    color: Colors.blue.shade200,
                    altura: 20),
                CardData(slot1: "1970TB", slot2: "5798PB"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "650203", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
              ],
            ),
            TableRow(
              children: [
                CardHeader(
                    label: "8:10-8:20",
                    color: Colors.blue.shade200,
                    altura: 20),
                CardData(slot1: "-", slot2: "9586TB"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
              ],
            ),
            TableRow(
              children: [
                CardHeader(
                    label: "8:20-8:30",
                    color: Colors.blue.shade200,
                    altura: 20),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "8977QB", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "8132SB"),
                CardData(slot1: "-", slot2: "-"),
              ],
            ),
            TableRow(
              children: [
                CardHeader(
                    label: "8:30-8:40",
                    color: Colors.blue.shade200,
                    altura: 20),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "0586RB", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
              ],
            ),
            TableRow(
              children: [
                CardHeader(
                    label: "8:40-8:50",
                    color: Colors.blue.shade200,
                    altura: 20),
                CardData(slot1: "-", slot2: "1699VB"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
              ],
            ),
            TableRow(
              children: [
                CardHeader(
                    label: "8:50-9:00",
                    color: Colors.blue.shade200,
                    altura: 20),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
              ],
            ),
            TableRow(
              children: [
                CardHeader(
                    label: "9:00-9:10",
                    color: Colors.blue.shade200,
                    altura: 20),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
              ],
            ),
            TableRow(
              children: [
                CardHeader(
                    label: "9:10-9:20",
                    color: Colors.blue.shade200,
                    altura: 20),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
              ],
            ),
            TableRow(
              children: [
                CardHeader(
                    label: "9:20-9:30",
                    color: Colors.blue.shade200,
                    altura: 20),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
              ],
            ),
            TableRow(
              children: [
                CardHeader(
                    label: "9:30-9:40",
                    color: Colors.blue.shade200,
                    altura: 20),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
              ],
            ),
            TableRow(
              children: [
                CardHeader(
                    label: "9:40-9:50",
                    color: Colors.blue.shade200,
                    altura: 20),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
              ],
            ),
            TableRow(
              children: [
                CardHeader(
                    label: "9:50-10:00",
                    color: Colors.blue.shade200,
                    altura: 20),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
              ],
            ),
            TableRow(
              children: [
                CardHeader(
                    label: "10:00-10:10",
                    color: Colors.blue.shade200,
                    altura: 20),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
              ],
            ),
            TableRow(
              children: [
                CardHeader(
                    label: "10:10-10:20",
                    color: Colors.blue.shade200,
                    altura: 20),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
              ],
            ),
            TableRow(
              children: [
                CardHeader(
                    label: "10:20-10:30",
                    color: Colors.blue.shade200,
                    altura: 20),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
              ],
            ),
            TableRow(
              children: [
                CardHeader(
                    label: "10:30-10:40",
                    color: Colors.blue.shade200,
                    altura: 20),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
              ],
            ),
            TableRow(
              children: [
                CardHeader(
                    label: "10:40-10:50",
                    color: Colors.blue.shade200,
                    altura: 20),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
              ],
            ),
            TableRow(
              children: [
                CardHeader(
                    label: "10:50-11:00",
                    color: Colors.blue.shade200,
                    altura: 20),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
              ],
            ),
            TableRow(
              children: [
                CardHeader(
                    label: "11:00-11:10",
                    color: Colors.blue.shade200,
                    altura: 20),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
              ],
            ),
            TableRow(
              children: [
                CardHeader(
                    label: "11:10-11:20",
                    color: Colors.blue.shade200,
                    altura: 20),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
              ],
            ),
            TableRow(
              children: [
                CardHeader(
                    label: "11:20-11:30",
                    color: Colors.blue.shade200,
                    altura: 20),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
              ],
            ),
            TableRow(
              children: [
                CardHeader(
                    label: "11:30-11:40",
                    color: Colors.blue.shade200,
                    altura: 20),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
              ],
            ),
            TableRow(
              children: [
                CardHeader(
                    label: "11:40-11:50",
                    color: Colors.blue.shade200,
                    altura: 20),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
              ],
            ),
            TableRow(
              children: [
                CardHeader(
                    label: "11:50-12:00",
                    color: Colors.blue.shade200,
                    altura: 20),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
              ],
            ),
            TableRow(
              children: [
                CardHeader(
                    label: "12:00-12:10",
                    color: Colors.blue.shade200,
                    altura: 20),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
              ],
            ),
            TableRow(
              children: [
                CardHeader(
                    label: "12:10-12:20",
                    color: Colors.blue.shade200,
                    altura: 20),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
              ],
            ),
            TableRow(
              children: [
                CardHeader(
                    label: "12:20-12:30",
                    color: Colors.blue.shade200,
                    altura: 20),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
              ],
            ),
            TableRow(
              children: [
                CardHeader(
                    label: "12:30-12:40",
                    color: Colors.blue.shade200,
                    altura: 20),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
              ],
            ),
            TableRow(
              children: [
                CardHeader(
                    label: "12:40-12:50",
                    color: Colors.blue.shade200,
                    altura: 20),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
              ],
            ),
            TableRow(
              children: [
                CardHeader(
                    label: "12:50-13:00",
                    color: Colors.blue.shade200,
                    altura: 20),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
              ],
            ),
            TableRow(
              children: [
                CardHeader(
                    label: "13:00-13:10",
                    color: Colors.blue.shade200,
                    altura: 20),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
              ],
            ),
            TableRow(
              children: [
                CardHeader(
                    label: "13:10-13:20",
                    color: Colors.blue.shade200,
                    altura: 20),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
              ],
            ),
            TableRow(
              children: [
                CardHeader(
                    label: "13:20-13:30",
                    color: Colors.blue.shade200,
                    altura: 20),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
                CardData(slot1: "-", slot2: "-"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CardHeader extends StatelessWidget {
  CardHeader({Key? key, required this.label, this.color, this.altura = 30})
      : super(key: key);
  String label;
  Color? color;
  double altura;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      margin: EdgeInsets.only(left: 0, right: 0, top: 0),
      color: color,
      child: SizedBox(
        height: altura,
        child: Center(
          child: Text(
            label,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class CardData extends StatelessWidget {
  CardData({Key? key, this.slot1, this.slot2}) : super(key: key);
  String? slot1;
  String? slot2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: GestureDetector(
            onDoubleTap: () {
              Navigator.pushNamed(context, '/busqueda', arguments: slot1);
            },
            child: Card(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(2),
                      bottomLeft: Radius.circular(2))),
              margin: const EdgeInsets.only(left: 0, right: 0, top: 0),
              color: (slot1 != '-') ? Colors.grey.shade300 : Colors.white,
              child: Center(
                child: Text(
                  slot1 ?? "",
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: GestureDetector(
            onDoubleTap: () {
              Navigator.pushNamed(context, '/busqueda', arguments: slot2);
            },
            child: Card(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(2),
                      bottomLeft: Radius.circular(2))),
              margin: const EdgeInsets.only(left: 0, right: 0, top: 0),
              color: (slot2 != '-') ? Colors.green.shade300 : Colors.white,
              child: Center(
                child: Text(
                  slot2 ?? "",
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class CardHead extends StatelessWidget {
  CardHead({Key? key, required this.argument}) : super(key: key);
  String argument;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Text(argument),
      elevation: 2,
      shadowColor: Colors.green,
      margin: const EdgeInsets.all(2),
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.green)),
    );
  }
}

// campo de texto para fecha y hora
class CampoFechaHora extends StatefulWidget {
  final String label;
  final double width;
  final double height;
  final TextEditingController? controller;
  final VoidCallback myfunction;

  const CampoFechaHora({
    Key? key,
    this.label = "label",
    this.width = 10,
    this.height = 10,
    this.controller,
    required this.myfunction,
  }) : super(key: key);

  @override
  State<CampoFechaHora> createState() => _CampoFechaHoraState();
}

class _CampoFechaHoraState extends State<CampoFechaHora> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: SizedBox(
        width: widget.width,
        height: widget.height,
        child: TextField(
          decoration: InputDecoration(
              border: const OutlineInputBorder(), labelText: widget.label),
          controller: widget.controller,
          readOnly: true,
          onTap: widget.myfunction,
        ),
      ),
    );
  }
}

// Boton con funcion
class GuardarBoton extends ConsumerWidget {
  const GuardarBoton(
      {Key? key,
      this.label = "label",
      this.width = 10,
      this.height = 10,
      this.ruta,
      this.agenda})
      : super(key: key);
  final String label;
  final double width;
  final double height;
  final String? ruta;
  final VoidCallback? agenda;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final miagenda = ref.read(agen);

    return Padding(
      padding: const EdgeInsets.all(5),
      child: SizedBox(
        width: width,
        height: height,
        child: ElevatedButton(
          onPressed: agenda,
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.blue,
              fontSize: 15,
            ),
          ),
          style: ElevatedButton.styleFrom(
            primary: Colors.white,
          ),
        ),
      ),
    );
  }
}

//  mis text formes
class MiTexto extends StatelessWidget {
  MiTexto({Key? key, this.eltexto}) : super(key: key);
  String? eltexto;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: 250,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.blue.shade300),
        ),
        child: Center(
          child: Text(eltexto ?? ""),
        ),
      ),
    );
  }
}

// Boton callback
class BotonCallback extends StatelessWidget {
  const BotonCallback({
    Key? key,
    this.label = "label",
    this.width = 10,
    this.height = 10,
    this.ruta,
    this.controlador,
    this.callback,
  }) : super(key: key);
  final String label;
  final double width;
  final double height;
  final String? ruta;
  final TextEditingController? controlador;
  final VoidCallback? callback;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: SizedBox(
        width: width,
        height: height,
        child: ElevatedButton(
          onPressed: callback,
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.blue,
              fontSize: 15,
            ),
          ),
          style: ElevatedButton.styleFrom(
            primary: Colors.white,
          ),
        ),
      ),
    );
  }
}
