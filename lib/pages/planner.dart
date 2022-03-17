import 'package:flutter/material.dart';
import 'package:citas1/utilities/buttons.dart';

// planner page
class Planner extends StatefulWidget {
  const Planner({Key? key}) : super(key: key);

  @override
  _PlannerState createState() => _PlannerState();
}

class _PlannerState extends State<Planner> {
  final placaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextEditingController user =
        ModalRoute.of(context)!.settings.arguments as TextEditingController;

    return Scaffold(
      appBar: AppBar(
        title: const Text('PLANNER'),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.menu)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            // botones de control
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Boton Agendar
                  Boton(
                    label: "Agendar",
                    width: 150,
                    height: 50,
                    ruta: "/agenda",
                    operacion: "op2",
                    informacion: user,
                  ),
                  // Text Field Placa
                  CampodeTexto(
                    label: "placa",
                    width: 100,
                    height: 50,
                    controller: placaController,
                  ),
                  // Botton Buscar por Placa
                  Boton(
                    label: "Buscar Placa",
                    width: 150,
                    height: 50,
                    ruta: "/busqueda",
                    operacion: "op1",
                    informacion: placaController,
                  ),
                  // Botton Resumen
                  const Boton(
                    label: "Resumen",
                    width: 150,
                    height: 50,
                    ruta: "/resumen",
                  ),
                  // Botton Siguiente Semana
                  const Boton(
                    label: "siguiente semana",
                    width: 200,
                    height: 50,
                  )
                ],
              ),
            ),
            // Table time planner
            Expanded(
              flex: 5,
              child: Center(
                child: Table(
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  // defaultColumnWidth: const FixedColumnWidth(60),
                  // columnWidths: const {
                  //   0: FractionColumnWidth(0.4),
                  //   2: FractionColumnWidth(0.3),
                  // },
                  border: TableBorder.all(),
                  children: const [
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// green empty card widgets:

class CardHead extends StatefulWidget {
  // const CardHead({Key? key}) : super(key: key);
  final String argument;
  const CardHead({Key? key, required this.argument}) : super(key: key);

  @override
  State<CardHead> createState() => _CardHeadState();
}

class _CardHeadState extends State<CardHead> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Text(widget.argument),
      elevation: 2,
      shadowColor: Colors.green,
      margin: const EdgeInsets.all(2),
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.green)),
    );
  }
}
