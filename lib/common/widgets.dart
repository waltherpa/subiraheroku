import 'package:citas_2/common/widgets_planner.dart';
import 'package:citas_2/models/logcitas.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../functions/p_3_variable.dart';

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
          decoration: InputDecoration(border: const OutlineInputBorder(), labelText: label),
        ),
      ),
    );
  }
}

// Boton callback
class BotonCallback extends StatelessWidget {
  BotonCallback({
    Key? key,
    this.label = "label",
    this.width = 10,
    this.height = 10,
    this.ruta,
    this.color = Colors.white,
    this.txtcolor = Colors.blue,
    // this.controlador,
    this.callback,
  }) : super(key: key);
  final String label;
  final double width;
  final double height;
  final String? ruta;
  Color color;
  Color txtcolor;
  // final TextEditingController? controlador;
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
            style: TextStyle(
              color: txtcolor,
              fontSize: 15,
            ),
          ),
          style: ElevatedButton.styleFrom(
            primary: color,
          ),
        ),
      ),
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
          decoration: InputDecoration(border: const OutlineInputBorder(), labelText: widget.label),
          controller: widget.controller,
          readOnly: true,
          onTap: widget.myfunction,
        ),
      ),
    );
  }
}

// desplegable 1: tipo de problema
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

// desplegable 3: fechas disponibles
// clase future
// clase seleccionado
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
        onChanged: (String? x) {
          ref.watch(drop3).setop(x!);
        },
      ),
    );
  }
}

// simple card
class SimpleCard extends StatelessWidget {
  SimpleCard({Key? key, this.label, this.width, this.height}) : super(key: key);
  String? label;
  double? width;
  double? height;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        child: Center(
            child: Text(
          label!,
          style: TextStyle(color: Colors.white),
        )),
        width: width,
        height: height,
      ),
      color: Colors.blue,
      margin: const EdgeInsets.only(left: 10, top: 10, right: 10),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
    );
  }
}

//  mis texto - label
class MiTexto extends StatelessWidget {
  MiTexto(
      {Key? key, this.eltexto, this.width, this.height, this.mypadding = const EdgeInsets.all(10)})
      : super(key: key);
  String? eltexto;
  double? width;
  double? height;
  EdgeInsetsGeometry mypadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: mypadding,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.blue.shade200),
        ),
        child: Center(
          child: Text(eltexto ?? ""),
        ),
      ),
    );
  }
}

// simple card 2
class SimpleCard2 extends StatelessWidget {
  SimpleCard2({Key? key, required this.datos, this.width = 500, this.height = 150})
      : super(key: key);
  LogCitas datos;
  double width;
  double height;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        child: Center(
            child: Column(
          children: [
            Row(
              children: [
                MiTexto(
                  eltexto: 'Cliente: ${datos.Nombre}',
                  mypadding: const EdgeInsets.all(3),
                ),
                MiTexto(
                  eltexto: 'Placa: ${datos.Placa}',
                  mypadding: const EdgeInsets.all(3),
                ),
              ],
            ),
            Row(
              children: [
                MiTexto(
                  eltexto: 'Fecha de Cita: ${datos.Fecha}',
                  mypadding: const EdgeInsets.all(3),
                ),
              ],
            ),
            Row(
              children: [
                MiTexto(
                  eltexto: 'Telefono: ${datos.Telefono}',
                  mypadding: const EdgeInsets.all(3),
                ),
                MiTexto(
                  eltexto: 'Correo: ${datos.Correo}',
                  mypadding: const EdgeInsets.all(3),
                ),
              ],
            ),
            Row(
              children: [
                MiTexto(
                  eltexto: 'Comentarios: ${datos.Comentarios}',
                  mypadding: const EdgeInsets.all(3),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                BotonCallback(
                  label: 'Editar',
                  width: 100,
                  height: 20,
                  callback: () {
                    Navigator.of(context).pushNamed('/editar', arguments: datos);
                  },
                )
              ],
            ),
          ],
        )),
        width: width,
        height: height,
      ),
      color: (datos.Sede == 'Surquillo') ? Colors.blue.shade100 : Colors.green.shade100,
      margin: const EdgeInsets.all(5),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
    );
  }
}
