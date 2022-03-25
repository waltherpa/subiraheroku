import 'package:citas1/provider/globalvariables.dart';
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
  final VoidCallback? funcion;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: SizedBox(
        width: width,
        height: height,
        child: ElevatedButton(
          onPressed: () {
            if (funcion != null) {
              funcion;
            }
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

// desplegable
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
        border: TableBorder.all(),
        children: [
          TableRow(
            children: [
              CardHead(argument: "Hora"),
              CardHead(argument: "Lunes"),
              CardHead(argument: "Martes"),
              CardHead(argument: "Miercoles"),
              CardHead(argument: "Jueves"),
              CardHead(argument: "Viernes"),
              CardHead(argument: "Sabado"),
            ],
          ),
          TableRow(
            children: [
              CardHead(argument: "----"),
              CardHead(argument: "1/4/22"),
              CardHead(argument: "2/4/22"),
              CardHead(argument: "3/4/22"),
              CardHead(argument: "4/4/22"),
              CardHead(argument: "5/4/22"),
              CardHead(argument: "6/4/22"),
            ],
          ),
          TableRow(
            children: [
              CardHead(argument: "7:00-7:10"),
              CardHead(argument: "data 1"),
              CardHead(argument: "data 2"),
              CardHead(argument: "data 3"),
              CardHead(argument: "data 4"),
              CardHead(argument: "data 5"),
              CardHead(argument: "data 6"),
            ],
          ),
          TableRow(
            children: [
              CardHead(argument: "7:10-7:20"),
              CardHead(argument: "data 1"),
              CardHead(argument: "data 2"),
              CardHead(argument: "data 3"),
              CardHead(argument: "data 4"),
              CardHead(argument: "data 5"),
              CardHead(argument: "data 6"),
            ],
          ),
          TableRow(
            children: [
              CardHead(argument: "7:20-7:30"),
              CardHead(argument: "data 1"),
              CardHead(argument: "data 2"),
              CardHead(argument: "data 3"),
              CardHead(argument: "data 4"),
              CardHead(argument: "data 5"),
              CardHead(argument: "data 6"),
            ],
          ),
          TableRow(
            children: [
              CardHead(argument: "7:30-7:40"),
              CardHead(argument: "data 1"),
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
