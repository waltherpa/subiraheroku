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

// desplegable1
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

// tabla de planeamiento
class TatblaPlanner extends StatelessWidget {
  const TatblaPlanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
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
                  label: "7:00-7:10", color: Colors.blue.shade200, altura: 20),
              CardData(slot1: "8630EU", slot2: "2"),
              CardHead(argument: "data 2"),
              CardHead(argument: "data 3"),
              CardHead(argument: "data 4"),
              CardHead(argument: "data 5"),
              CardHead(argument: "data 6"),
            ],
          ),
        ],
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
    return Container(
      width: 150,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.blue.shade100,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.blue.shade400),
      ),
      child: Text(eltexto ?? ""),
    );
  }
}
